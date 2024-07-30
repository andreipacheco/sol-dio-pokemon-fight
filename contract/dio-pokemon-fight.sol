// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract DioPokemonFight is ERC721 {

    struct Pokemon {
        string name;
        uint level;
        string img;
        uint health;
        uint attackPower;
        uint defensePower;
    }

    Pokemon[] public pokemons;
    address public gameOwner;

    constructor () ERC721("DioPokemonFight", "DPF") {
        gameOwner = msg.sender;
    }

    modifier onlyOwnerOf(uint _monsterId) {
        require(ownerOf(_monsterId) == msg.sender, "Apenas o dono pode batalhar com este Pokemon");
        _;
    }

    function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon) {
        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];

        uint attackRoll = random(attacker.attackPower);
        uint defenseRoll = random(defender.defensePower);

        if (attackRoll > defenseRoll) {
            defender.health -= attackRoll - defenseRoll;
            attacker.level += 2;
            if (defender.health <= 0) {
                defender.health = 0;
                // Defender Pokemon is defeated
            }
        } else {
            attacker.health -= defenseRoll - attackRoll;
            defender.level += 2;
            if (attacker.health <= 0) {
                attacker.health = 0;
                // Attacker Pokemon is defeated
            }
        }
    }

    function createNewPokemon(string memory _name, address _to, string memory _img) public {
        require(msg.sender == gameOwner, "Somente o dono do jogo pode criar novos Pokemons!");
        uint id = pokemons.length;
        pokemons.push(Pokemon(_name, 1, _img, 100, random(50), random(50)));
        _safeMint(_to, id);
    }

    function random(uint _max) private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % _max;
    }

    function healPokemon(uint _pokemonId) public onlyOwnerOf(_pokemonId) {
        Pokemon storage myPokemon = pokemons[_pokemonId];
        myPokemon.health = 100; // Restores the Pokemon's health to full
    }

    function boostAttack(uint _pokemonId, uint _amount) public onlyOwnerOf(_pokemonId) {
        Pokemon storage myPokemon = pokemons[_pokemonId];
        myPokemon.attackPower += _amount;
    }

    function boostDefense(uint _pokemonId, uint _amount) public onlyOwnerOf(_pokemonId) {
        Pokemon storage myPokemon = pokemons[_pokemonId];
        myPokemon.defensePower += _amount;
    }
}
