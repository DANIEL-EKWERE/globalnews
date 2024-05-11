import 'package:globalnews/models/Category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Business';
  categoryModel.image = 'assets/images/bitcoin-3029371-3.jpg';
  category.add(categoryModel);

  CategoryModel categoryModel1 = new CategoryModel();
  categoryModel1.categoryName = 'Entertainment';
  categoryModel1.image = 'assets/images/btc-6272696_1920.jpg';
  category.add(categoryModel1);

  CategoryModel categoryModel2 = new CategoryModel();
  categoryModel2.categoryName = 'General';
  categoryModel2.image = 'assets/images/images.jpg';
  category.add(categoryModel2);

  CategoryModel categoryModel3 = new CategoryModel();
  categoryModel3.categoryName = 'Health';
  categoryModel3.image = 'assets/images/pexels-worldspectrum-844124.jpg';
  category.add(categoryModel3);

  CategoryModel categoryModel4 = new CategoryModel();
  categoryModel4.categoryName = 'Sport';
  categoryModel4.image = 'assets/images/pexels-worldspectrum-844124.jpg';
  category.add(categoryModel4);

  return category;
}
