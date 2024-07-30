# DioPokemonFight ⚔️🐉

Este é um contrato inteligente de batalha de Pokémon baseado em NFTs, desenvolvido em Solidity. Ele permite a criação de Pokémons, batalhas entre eles, e a aplicação de melhorias e curas nos Pokémons.

## Funcionalidades Principais 🌟

1. **Criar Novos Pokémons** 🐣
   - Apenas o dono do jogo pode criar novos Pokémons.
   - Cada Pokémon possui atributos: nome, nível, imagem, saúde, poder de ataque e poder de defesa.

2. **Batalhar com Pokémons** ⚔️
   - Proprietários de Pokémons podem fazer batalhas entre eles.
   - A batalha é baseada em valores aleatórios de ataque e defesa.
   - O vencedor ganha mais pontos de nível e o perdedor perde saúde.

3. **Curar Pokémon** ❤️
   - Proprietários podem curar seu Pokémon, restaurando a saúde ao máximo.

4. **Aumentar Poder de Ataque e Defesa** 💪🛡️
   - Proprietários podem aumentar o poder de ataque e defesa de seu Pokémon.

## Estrutura do Contrato 📝

- `struct Pokemon`: Estrutura que define os atributos de um Pokémon.
- `pokemons[]`: Array que armazena todos os Pokémons criados.
- `gameOwner`: Endereço do dono do jogo.
- `constructor()`: Define o dono do jogo e o nome do contrato.
- `onlyOwnerOf(uint _monsterId)`: Modificador que restringe a execução de funções ao dono do Pokémon.
- `battle(uint _attackingPokemon, uint _defendingPokemon)`: Função para realizar batalhas entre Pokémons.
- `createNewPokemon(string memory _name, address _to, string memory _img)`: Função para criar novos Pokémons.
- `random(uint _max)`: Função para gerar números aleatórios.
- `healPokemon(uint _pokemonId)`: Função para curar um Pokémon.
- `boostAttack(uint _pokemonId, uint _amount)`: Função para aumentar o poder de ataque de um Pokémon.
- `boostDefense(uint _pokemonId, uint _amount)`: Função para aumentar o poder de defesa de um Pokémon.
