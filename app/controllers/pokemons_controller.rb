class PokemonsController < ApplicationController
    def capture
        @pokemon = Pokemon.find(params[:id])
        @pokemon.update_attributes(trainer_id: current_trainer.id)
        @pokemon.save!
        redirect_to root_path
    end

    def damage
        puts params[:id]
        puts 'hello'
        @pokemon = Pokemon.find(params[:id])
        @pokemon.health = @pokemon.health - 10
        if @pokemon.health <= 0
            @pokemon.destroy
        else
            @pokemon.save
        end
        redirect_to trainer_path(current_trainer.id)
    end

    def new
        @pokemon = Pokemon.new
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.level = 1
        @pokemon.health = 100
        @pokemon.trainer_id = current_trainer.id

        if @pokemon.save
            redirect_to trainer_path(current_trainer.id)
        else
            redirect_to new_pokemon_path
            flash[:error] = @pokemon.errors.full_messages.to_sentence
        end
    end

    private
    def pokemon_params
        params.require(:pokemon).permit(:name)
    end
end
