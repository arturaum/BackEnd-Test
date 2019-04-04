class Api::V1::PublishersController < ApiController
  before_action :set_publisher, only: [:show, :update, :destroy]

  # GET /publishers/1
  def show
    shops = Shop.joins(:books)
                 .where(books: { publisher_id: @publisher.id, sold: true })
                 .group(:id, :name)
                 .count

    if shops.present?
      @shops_array = []
      shops.sort_by { |k,v| -v }.each do |shop|
        books = Composition.joins(:books)
            .where(books: {publisher_id: @publisher.id, shop_id: shop[0][0], sold: false})
            .group(:id, :author, :name)
            .count

        books_array = []
        books.each do |k, v|
          books_array << { id: k[0], author: k[1], title: k[2], copies_in_stock: v }
        end

        @shops_array << {
            id: shop[0][0],
            name: shop[0][1],
            books_sold_count: shop[1],
            books_in_stock: books_array
        }
      end

    end
  end

=begin
  # GET /publishers
  def index
    @publishers = Publisher.all

    render json: @publishers
  end

  # POST /publishers
  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      render json: @publisher, status: :created, location: @publisher
    else
      render json: @publisher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publishers/1
  def update
    if @publisher.update(publisher_params)
      render json: @publisher
    else
      render json: @publisher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publishers/1
  def destroy
    @publisher.destroy
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def publisher_params
      params.fetch(:publisher, {})
    end
end
