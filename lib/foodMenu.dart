import 'dart:convert';

Foodmenu foodmenuFromJson(String str) => Foodmenu.fromJson(json.decode(str));

String foodmenuToJson(Foodmenu data) => json.encode(data.toJson());

class Foodmenu {
    List<Category>? categories;
    List<Menu>? menus;

    Foodmenu({
        this.categories,
        this.menus,
    });

    factory Foodmenu.fromJson(Map<String, dynamic> json) => Foodmenu(
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
        menus: json["menus"] == null ? [] : List<Menu>.from(json["menus"]!.map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "menus": menus == null ? [] : List<dynamic>.from(menus!.map((x) => x.toJson())),
    };
}

class Category {
    int? id;
    String? name;
    List<int>? menuIds;

    Category({
        this.id,
        this.name,
        this.menuIds,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        menuIds: json["menu_ids"] == null ? [] : List<int>.from(json["menu_ids"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "menu_ids": menuIds == null ? [] : List<dynamic>.from(menuIds!.map((x) => x)),
    };
}

class Menu {
    int? id;
    String? name;
    List<Ingredient>? ingredients;
    List<String>? steps;

    Menu({
        this.id,
        this.name,
        this.ingredients,
        this.steps,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
        steps: json["steps"] == null ? [] : List<String>.from(json["steps"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x)),
    };
}

class Ingredient {
    String? name;
    String? quantity;

    Ingredient({
        this.name,
        this.quantity,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
    };
}