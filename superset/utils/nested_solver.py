def flatten_nested_filters(nested_filters):
    """
    Flatten a nested query to a list of filters.
    """
    filters = []

    def flatten_helper(item):
        if isinstance(item, dict):
            if "col" in item:  # Checks if the dictionary is a condition
                filters.append(item)
            else:  # Otherwise, it's a nested logical operator
                for value in item.values():
                    flatten_helper(value)

        elif isinstance(item, list):  # Iterate through the list if the item is a list
            for subitem in item:
                flatten_helper(subitem)

    flatten_helper(nested_filters)
    return filters
