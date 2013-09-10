require 'spec_helper'

describe MoviesController do
  it 'When I fill in "Director" with "Ridley Scott", And I press "Update Movie Info", it should save the director' do
      movie = mock('Movie')
      movie.stub!(:update_attributes!)
      movie.stub!(:title)
      movie.stub!(:director)
      movie.stub!(:director)
      
      movie2 = mock('Movie')
      
      Movie.should_receive(:find).with('1').and_return(movie)
      movie.should_receive(:update_attributes!)
      post :update, {:id => '1', :movie => movie2 }
    end
    it 'When I follow "Find Movies With Same Director", I should be on the Similar Movies page for the Movie' do
      movie = mock('Movie')
      movie.stub!(:director).and_return('mock director')
      
      similarMovies = [mock('Movie'), mock('Movie')]
      
      Movie.should_receive(:find).with('1').and_return(movie)
      Movie.should_receive(:find_all_by_director).with(movie.director).and_return(similarMovies)
      get :similar, {:id => '1'}
    end
    it 'should redirect to index if movie does not have a director' do
      mock = mock('Movie')
      mock.stub!(:director).and_return(nil)
      mock.stub!(:title).and_return(nil)
      
      Movie.should_receive(:find).with('1').and_return(mock)
      get :similar, {:id => '1'}
      response.should redirect_to(movies_path)
    end
    it 'should be possible to create movie' do
      movie = mock('Movie')
      movie.stub!(:title)
      
      Movie.should_receive(:create!).and_return(movie)
      post :create, {:movie => movie}
      response.should redirect_to(movies_path)
    end
    it 'should be possible to destroy movie' do
      movie = mock('Movie')
      movie.stub!(:title)
      
      Movie.should_receive(:find).with('13').and_return(movie)
      movie.should_receive(:destroy)
      post :destroy, {:id => '13'}
      response.should redirect_to(movies_path)
    end
    it 'should redirect if sort order has been changed' do
      session[:sort] = 'release_date'
      get :index, {:sort => 'title'}
      response.should redirect_to(movies_path(:sort => 'title'))
    end
    it 'should be possible to order by release date' do
      get :index, {:sort => 'release_date'}
      response.should redirect_to(movies_path(:sort => 'release_date'))
    end
    
end
