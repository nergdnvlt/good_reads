require 'rails_helper'

describe 'user visits book page to see title and reviews' do
  scenario 'user is able to see the reviews for a book' do
    book = Book.create!(title: 'Fellowship of the Ring')
    user1 = User.create!(name: 'Odin')
    user2 = User.create!(name: 'Thor')
    review1 = book.reviews.create!(body: 'Great', user_id: user1.id, rating: 5)
    review2 = book.reviews.create!(body: 'Ok', user_id: user2.id, rating: 4)

    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review1.body)
    expect(page).to have_content(user1.name)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review2.body)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(review2.rating)
  end
end
