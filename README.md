# Clase 2 — SimpleStorage con Foundry

Diplomatura Blockchain UNQ — Módulo 2.

## ¿Qué es esto?

El proyecto que vamos a usar en la clase de hoy: un smart contract en Solidity (`SimpleStorage`) con sus tests, listo para compilar, testear y deployar con [Foundry](https://book.getfoundry.sh/).

## Pre-requisitos

- **Foundry** instalado (`forge`, `cast`, `anvil`)
- **VS Code** con extensión **Solidity** (`juanblanco.solidity`)
- **MetaMask** configurada en red **Sepolia** y con saldo (>0.01 ETH de testnet)

Si no tenés Foundry:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

Si no tenés tokens de Sepolia, faucet recomendada: <https://cloud.google.com/application/web3/faucet/ethereum/sepolia>

## Setup

```bash
git clone https://github.com/dpetrocelli/diplo-unq-blockchain-clase2.git
cd diplo-unq-blockchain-clase2
forge install foundry-rs/forge-std --shallow
forge build
forge test
```

Tienen que ver `10 passed; 0 failed`.

## Estructura

```
.
├── foundry.toml          # Configuración del proyecto
├── src/
│   └── SimpleStorage.sol # El contrato
├── test/
│   └── SimpleStorage.t.sol # Los tests
└── script/
    └── Deploy.s.sol       # Script de deploy
```

## Comandos clave

```bash
forge build              # Compilar
forge test               # Correr todos los tests
forge test -vvv          # Tests con output detallado
anvil                    # Levantar blockchain local
```

Deploy local (con anvil corriendo):

```bash
forge create src/SimpleStorage.sol:SimpleStorage \
  --rpc-url http://localhost:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast
```

Deploy a Sepolia:

```bash
cast wallet import dev-wallet --interactive
forge create src/SimpleStorage.sol:SimpleStorage \
  --rpc-url https://ethereum-sepolia-rpc.publicnode.com \
  --account dev-wallet \
  --broadcast
```

## Tarea para la próxima clase

1. Agregar función `decrement()` con `require(favoriteNumber > 0, "underflow")`
2. Escribir test que valide el revert con `vm.expectRevert("underflow")`
3. Hacer deploy a Sepolia y postear el address en el foro del campus

## Recursos

- [Foundry Book](https://book.getfoundry.sh/)
- [Solidity Docs](https://docs.soliditylang.org/)
- [Sepolia Etherscan](https://sepolia.etherscan.io)
