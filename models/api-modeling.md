# API Modeling

Let's consider example requests and responses, along with how they are represented in SDK models.

## ListItems

### Request

* URI: `GET /items`
* Header Params:
  * `Limit` (optional Integer): `2`
  * `NextToken` (optional String): `1u2u3i4d-5id5-4u3u2i1d`

### Response

```
{
  "item_ids":
    [
      "f1fa69b0-09ab-44c5-bf3f-2f57caab141e",
      "9a289319-1c87-4b70-8936-6ebbe9b760a6",
      "ae7cc46b-e914-4a8c-8f5c-878f23bfb919"
    ],
    "next_token":"ae7cc46b-e914-4a8c-8f5c-878f23bfb919"
}
```

### SDK

```
resp1 = client.list_items(limit: 5)
resp2 = client.list_items(limit: 5, next_token: resp1.next_token)
resp2.item_ids.each { |id| puts id }
```

## CreateItem

### Request

* URI: `POST /items`
* Request Body: `{"body":"Hello, new item!"}`

### Response

```
{
  "item": {
    "uuid": "f1fa69b0-09ab-44c5-bf3f-2f57caab141e",
    "body": "Hello, new item!",
    "created_date": "2017-10-30T17:01:17+00:00",
    "updated_date": "2017-10-30T17:01:17+00:00"
  }
}
```

### SDK

```
resp = client.create_item(body: "Hello, new item!")
resp.item.uuid #=> "f1fa69b0-09ab-44c5-bf3f-2f57caab141e"
resp.item.body #=> "Hello, new item!"
resp.item.created_date #=> "2017-10-30T17:01:17+00:00"
resp.item.updated_date #=> "2017-10-30T17:01:17+00:00"
```

## GetItem

### Request

* URI: `GET /items/{id}`

### Response

```
{
  "item": {
    "uuid": "f1fa69b0-09ab-44c5-bf3f-2f57caab141e",
    "body": "Hello, new item!",
    "created_date": "2017-10-30T17:01:17+00:00",
    "updated_date": "2017-10-30T17:01:17+00:00"
  }
}
```

### SDK

```
resp = client.get_item(uuid: "f1fa69b0-09ab-44c5-bf3f-2f57caab141e")
resp.item.uuid #=> "f1fa69b0-09ab-44c5-bf3f-2f57caab141e"
resp.item.body #=> "Hello, new item!"
resp.item.created_date #=> "2017-10-30T17:01:17+00:00"
resp.item.updated_date #=> "2017-10-30T17:01:17+00:00"
```

## UpdateItem

### Request

* URI: `PATCH /items/{id}`
* Request Body: `{"body":"Hello, updated item!"}`

### Response

```
{
  "item": {
    "uuid": "f1fa69b0-09ab-44c5-bf3f-2f57caab141e",
    "body": "Hello, updated item!",
    "created_date": "2017-10-30T17:01:17+00:00",
    "updated_date": "2017-10-30T20:05:15+00:00"
  }
}
```

### SDK

```
resp = client.update_item(
  uuid: "f1fa69b0-09ab-44c5-bf3f-2f57caab141e",
  body: "Hello, updated item!"
)
resp.item.uuid #=> "f1fa69b0-09ab-44c5-bf3f-2f57caab141e"
resp.item.body #=> "Hello, updated item!"
resp.item.created_date #=> "2017-10-30T17:01:17+00:00"
resp.item.updated_date #=> "2017-10-30T17:01:17+00:00"
```

## DeleteItem

### Request

* URI: `DELETE /items/{id}`

### Response

204

### SDK

```
client.delete_item(uuid: "f1fa69b0-09ab-44c5-bf3f-2f57caab141e")
```
