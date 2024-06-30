-include .env

# the :; is for writing the command on the same line (if not just hit enter and tab in the next line)
build:; forge build

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA) --account devwallet1 --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv