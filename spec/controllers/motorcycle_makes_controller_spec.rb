require 'rails_helper'

RSpec.describe MotorcycleMakesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # MotorcycleMake. As you add validations to MotorcycleMake, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: 'Honda'}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all motorcycle_makes as @motorcycle_makes' do
      motorcycle_make = MotorcycleMake.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:motorcycle_makes)).to eq([motorcycle_make])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested motorcycle_make as @motorcycle_make' do
      motorcycle_make = MotorcycleMake.create! valid_attributes
      get :show, params: {id: motorcycle_make.to_param}, session: valid_session
      expect(assigns(:motorcycle_make)).to eq(motorcycle_make)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new MotorcycleMake' do
        expect {
          post(:create,
            params: {motorcycle_make: valid_attributes},
            session: valid_session
          )
        }.to change(MotorcycleMake, :count).by(1)
      end

      it 'assigns a newly created motorcycle_make as @motorcycle_make' do
        post(:create,
          params: {motorcycle_make: valid_attributes},
          session: valid_session
        )
        expect(assigns(:motorcycle_make)).to be_a(MotorcycleMake)
        expect(assigns(:motorcycle_make)).to be_persisted
      end

      it 'should create a MotorcycleMake with valid attributes and respond 201' do
        post(:create,
          params: {motorcycle_make: valid_attributes},
          session: valid_session
        )
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'should violate the motorcycle_makes_name_format_check constraint' do
        expect {
          post(:create,
            params: {motorcycle_make: invalid_attributes},
            session: valid_session
          )
        }.to violate_check_constraint(:motorcycle_makes_name_format_check)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {name: 'Kawasaki'}
      }

      it 'updates the requested motorcycle_make' do
        motorcycle_make = MotorcycleMake.create! valid_attributes
        put(:update,
          params: {
            id: motorcycle_make.to_param,
            motorcycle_make: new_attributes
          },
          session: valid_session
        )
        motorcycle_make.reload
        expect(motorcycle_make.name).to eql('Kawasaki')
      end

      it 'assigns the requested motorcycle_make as @motorcycle_make' do
        motorcycle_make = MotorcycleMake.create! valid_attributes
        put(:update,
          params: {
            id: motorcycle_make.to_param,
            motorcycle_make: valid_attributes
          },
          session: valid_session
        )
        expect(assigns(:motorcycle_make)).to eq(motorcycle_make)
      end

      it 'should update a MotorcycleMake with valid attributes and respond 200' do
        motorcycle_make = MotorcycleMake.create! valid_attributes
        put(:update,
          params: {
            id: motorcycle_make.to_param,
            motorcycle_make: valid_attributes
          },
          session: valid_session
        )
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'should violate the motorcycle_makes_name_format_check constraint' do
        motorcycle_make = MotorcycleMake.create! valid_attributes
        expect {
          put(:update,
            params: {
              id: motorcycle_make.to_param,
              motorcycle_make: invalid_attributes
            },
            session: valid_session
          )
        }.to violate_check_constraint(:motorcycle_makes_name_format_check)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested motorcycle_make' do
      motorcycle_make = MotorcycleMake.create! valid_attributes
      expect {
        delete(:destroy,
          params: {id: motorcycle_make.to_param},
          session: valid_session
        )
      }.to change(MotorcycleMake, :count).by(-1)
    end

    it 'should delete a MotorcycleMake and respond 204' do
      motorcycle_make = MotorcycleMake.create! valid_attributes
      delete(:destroy,
        params: {id: motorcycle_make.to_param},
        session: valid_session
      )
      expect(response).to have_http_status(:no_content)
    end
  end

end
