# frozen_string_literal: true

module Polygonio
  module Websocket
    class WebsocketEvent < Dry::Struct
      Statuses = Types::String.enum("connected", "successful", "auth_timeout", "auth_success", "success")

      attribute :ev, Types::String
      attribute :status, Statuses
      attribute :message, Types::String
    end

    class ForexQuoteEvent < Dry::Struct
      attribute :ev, Types::String.enum("C")
      attribute :p, Types::String            # Currency pair
      attribute :x, Types::Integer           # FX Exchange ID
      attribute :a, Types::JSON::Decimal     # Ask Price
      attribute :b, Types::JSON::Decimal     # Bid Price
      attribute :t, Types::Integer           # Quote Timestamp ( Unix MS )
    end

    class ForexAggregateEvent < Dry::Struct
      attribute :ev, Types::String.enum("CA")
      attribute :pair, Types::String
      attribute :o, Types::JSON::Decimal     # Open Price
      attribute :c, Types::JSON::Decimal     # Close Price
      attribute :h, Types::JSON::Decimal     # High Price
      attribute :l, Types::JSON::Decimal     # Low Price
      attribute :v, Types::Integer           # Volume ( Quotes during this duration )
      attribute :s, Types::Integer           # Tick Start Timestamp
    end

    class StockAggregatePerSecondEvent < Dry::Struct
      attribute :ev, Types::String.enum("A") # Event Type
      attribute :sym, Types::String          # Symbol
      attribute :v, Types::Integer           # Volume
      attribute :av, Types::Integer          # Accumulated Volume
      attribute :op, Types::JSON::Decimal    # Official Opening Price
      attribute :vw, Types::JSON::Decimal    # Volume Weighted Average Price
      attribute :o, Types::JSON::Decimal     # Opening Price
      attribute :h, Types::JSON::Decimal     # High Price
      attribute :l, Types::JSON::Decimal     # Low Price
      attribute :c, Types::JSON::Decimal     # Close Price
      attribute :a, Types::Integer           # Today's Volume weighted average price
      attribute :z, Types::Integer           # Average trade size
      attribute :s, Types::Integer           # Starting tick timestamp
      attribute :e, Types::Integer           # Ending tick timestamp
      attribute :otc, Types::Boolean         # Whether or not this aggregate is for an OTC ticker.
    end

 
    class StockAggregatePerMinuteEvent < Dry::Struct
      attribute :ev, Types::String.enum("AM") # Event Type
      attribute :sym, Types::String          # Symbol
      attribute :v, Types::Integer           # Volume
      attribute :av, Types::Integer          # Accumulated Volume
      attribute :op, Types::JSON::Decimal    # Official Opening Price
      attribute :vw, Types::JSON::Decimal    # Volume Weighted Average Price
      attribute :o, Types::JSON::Decimal     # Opening Price
      attribute :h, Types::JSON::Decimal     # High Price
      attribute :l, Types::JSON::Decimal     # Low Price
      attribute :c, Types::JSON::Decimal     # Close Price
      attribute :a, Types::Integer           # Today's Volume weighted average price
      attribute :z, Types::Integer           # Average trade size
      attribute :s, Types::Integer           # Starting tick timestamp
      attribute :e, Types::Integer           # Ending tick timestamp
      attribute :otc, Types::Boolean         # Whether or not this aggregate is for an OTC ticker.
    end 

    end

    class StockTradeEvent < Dry::Struct
      attribute :ev, Types::String.enum("T")
      attribute :sym, Types::String
      attribute? :i, Types::String           # Trade ID
      attribute :x, Types::Integer          # Exchange ID
      attribute :p, Types::JSON::Decimal    # Price
      attribute? :c, Types::Array
      attribute :s, Types::Integer   # Size
      attribute :t, Types::Integer          # Exchange Timestamp Unix ( ms )
      attribute :q, Types::Integer          # Exchange ID
      attribute :z, Types::Integer          #(1 = NYSE, 2 = AMEX, 3 = Nasdaq)
      attribute? :trfi, Types::Integer      #(1 = NYSE, 2 = AMEX, 3 = Nasdaq)
      attribute? :trft, Types::Integer      #(1 = NYSE, 2 = AMEX, 3 = Nasdaq)
    end    
    class StockQuoteEvent < Dry::Struct
      attribute :ev, Types::String.enum("Q")
      attribute :sym, Types::String
      attribute? :bx, Types::Integer
      attribute? :bp, Types::JSON::Decimal         # Exchange ID
      attribute? :bs, Types::Integer
      attribute? :ax, Types::Integer
      attribute? :ap, Types::JSON::Decimal
      attribute? :as, Types::Integer
      attribute? :i, Types::Array.of(Types::Integer)
      attribute :t, Types::Integer          # Exchange Timestamp Unix ( ms )
      attribute :q, Types::Integer          # Exchange ID
      attribute :z, Types::Integer          # Exchange ID
    end    

    class CryptoQuoteEvent < Dry::Struct
      attribute :ev, Types::String.enum("XQ")
      attribute :pair, Types::String
      attribute :lp, Types::JSON::Decimal   # Last Trade Price
      attribute :ls, Types::JSON::Decimal   # Last Trade Size
      attribute :bp, Types::JSON::Decimal   # Bid Price
      attribute :bs, Types::JSON::Decimal   # Bid Size
      attribute :ap, Types::JSON::Decimal   # Ask Price
      attribute :as, Types::JSON::Decimal   # Ask Size
      attribute :t, Types::Integer          # Exchange Timestamp Unix ( ms )
      attribute :x, Types::Integer          # Exchange ID
      attribute :r, Types::Integer          # Received @ Polygon Timestamp
    end

    class CryptoTradeEvent < Dry::Struct
      attribute :ev, Types::String.enum("XT")
      attribute :pair, Types::String
      attribute :p, Types::JSON::Decimal    # Price
      attribute :t, Types::Integer          # Timestamp Unix ( ms )
      attribute :s, Types::JSON::Decimal    # Size
      attribute :c, Types::Array.of(Types::Integer) # Condition
      attribute :i, Types::String           # Trade ID ( Optional )
      attribute :x, Types::Integer          # Exchange ID
      attribute :r, Types::Integer          # Received @ Polygon Timestamp
    end

    class CryptoAggregateEvent < Dry::Struct
      attribute :ev, Types::String.enum("XA")
      attribute :pair, Types::String
      attribute :o, Types::JSON::Decimal    # Open Price
      attribute? :ox, Types::Integer        # Open Exchange
      attribute :h, Types::JSON::Decimal    # High Price
      attribute? :hx, Types::Integer        # High Exchange
      attribute :l, Types::JSON::Decimal    # Low Price
      attribute? :lx, Types::Integer        # Low Exchange
      attribute :c, Types::JSON::Decimal    # Close Price
      attribute? :cx, Types::Integer        # Close Exchange
      attribute :v, Types::JSON::Decimal    # Volume of Trades in Tick
      attribute :s, Types::Integer          # Tick Start Timestamp
      attribute :e, Types::Integer          # Tick End Timestamp
    end

    class CryptoSipEvent < Dry::Struct
      attribute :ev, Types::String.enum("XS")
      attribute :pair, Types::String
      attribute :as, Types::JSON::Decimal   # Ask Size
      attribute :ap, Types::JSON::Decimal   # Ask Price
      attribute :ax, Types::Integer         # Ask Exchange
      attribute :bs, Types::JSON::Decimal   # Bid Size
      attribute :bp, Types::JSON::Decimal   # Bid Price
      attribute :bx, Types::Integer         # Bid Exchange
      attribute :t, Types::Integer          # Tick Start Timestamp
    end

    class CryptoLevel2Event < Dry::Struct
      attribute :ev, Types::String.enum("XL2")
      attribute :pair, Types::String
      attribute :b, Types::Array.of(Types::Array.of(Types::JSON::Decimal))
      # Bid Prices ( 100 depth cap )
      # [ Price, Size ]
      attribute :a, Types::Array.of(Types::Array.of(Types::JSON::Decimal))
      # Ask Prices ( 100 depth cap )
      # [ Price, Size ]
      attribute :t, Types::Integer          # Timestamp Unix ( ms )
      attribute :x, Types::Integer          # Exchange ID
      attribute :r, Types::Integer          # Tick Received @ Polygon Timestamp
    end
  end
end
