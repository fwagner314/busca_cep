module Api
	module V1
		class CepApiController < ApplicationController   
			def json
				param = params[:cep]
				param = param.gsub(/[^0-9A-Za-z]/, '')
				address = Address.where(zipcode: param).first
				if !address.nil?
					result = {Endereço: address.address, CEP: address.zipcode, Bairro: address.get_neighborhood,
					Cidade: address.get_city, Estado: address.get_state}
					render json: {status: 'SUCCESS', message:'CEP Encontrado!', data: result}, status: :ok
				else
					render json: {status: 'ERROR', message:'Cep Não Encontrado!', data: result}, status: :ok
				end
			end
		end
	end
end 