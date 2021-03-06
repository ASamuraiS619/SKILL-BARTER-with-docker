require 'rails_helper'

RSpec.describe Proposition, type: :model do
  describe 'バリデーションのテスト' do
    subject { test_proposition.valid? }

    let(:test_proposition) { build(:proposition) }
    let(:user) { create(:user) }

    before do
      test_proposition.user_id = user.id
    end

    context '全ての項目にデータが入っている' do
      it '保存できる' do
        is_expected.to eq true
      end
    end

    context 'user_idカラム' do
      it '空欄でないこと' do
        test_proposition.user_id = ""
        is_expected.to eq false
      end
    end

    context 'titleカラム' do
      it '空欄でないこと' do
        test_proposition.title = ""
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '空欄でないこと' do
        test_proposition.introduction = ""
        is_expected.to eq false
      end
    end

    context 'deadlineカラム' do
      it '空欄でも良い' do
        test_proposition.deadline = ""
        is_expected.to eq true
      end
    end

    context 'barter_statusカラム' do
      it '空欄でないこと' do
        test_proposition.barter_status = ""
        is_expected.to eq false
      end
    end

    context 'rendering_image_idカラム' do
      it '空欄でも良い' do
        test_proposition.rendering_image_id = ""
        is_expected.to eq true
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Proposition.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'PropositionRoomモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:proposition_rooms).macro).to eq :has_many
      end
    end

    context 'Reviewモデルとの関係' do
      it '1:1となっている' do
        expect(Proposition.reflect_on_association(:review).macro).to eq :has_one
      end
    end

    context 'PropositionCategoryモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:proposition_categories).macro).to eq :has_many
      end
    end

    context 'PropositionCategoryTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:proposition_category_tags).macro).to eq :has_many
      end
    end

    context 'RequestCategoryモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:request_categories).macro).to eq :has_many
      end
    end

    context 'RequestCategoryTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:request_category_tags).macro).to eq :has_many
      end
    end

    context 'OfferingRelationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:offering_relationship).macro).to eq :has_one
      end
    end

    context 'OfferedRelationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:offered_relationships).macro).to eq :has_many
      end
    end

    context 'Offeringモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:offering).macro).to eq :has_one
      end
    end

    context 'Offererモデルとの関係' do
      it '1:Nとなっている' do
        expect(Proposition.reflect_on_association(:offerers).macro).to eq :has_many
      end
    end
  end
end
