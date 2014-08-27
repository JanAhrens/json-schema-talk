class: middle

```json
{
  "title":   "JSON Schema",
  "speaker": "Jan Ahrens",
  "type":    "LIGHTNING_TALK",
  "date": {
    "year": 2014, "month": 8, "day": 26
  },
  "location": {
    "name": "mindmatters",
    "latitude": 53.5625523,
    "longitude": 9.9601225
  }
}
```

---
class: codehighlight, middle

```json
{
*  "title":   "JSON Schema",
*  "speaker": "Jan Ahrens",
  "type":    "LIGHTNING_TALK",
  "date": {
    "year": 2014, "month": 8, "day": 26
  },
  "location": {
    "name": "mindmatters",
    "latitude": 53.5625523,
    "longitude": 9.9601225
  }
}
```

---
class: codehighlight, middle

```json
{
  "title":   "JSON Schema",
  "speaker": "Jan Ahrens",
*  "type":    "LIGHTNING_TALK",
  "date": {
    "year": 2014, "month": 8, "day": 26
  },
  "location": {
    "name": "mindmatters",
    "latitude": 53.5625523,
    "longitude": 9.9601225
  }
}
```
---
class: codehighlight, middle

```json
{
  "title":   "JSON Schema",
  "speaker": "Jan Ahrens",
  "type":    "LIGHTNING_TALK",
  "date": {
*    "year": 2014, "month": 8, "day": 26
  },
  "location": {
    "name": "mindmatters",
    "latitude": 53.5625523,
    "longitude": 9.9601225
  }
}
```
---
class: codehighlight, middle

```json
{
  "title":   "JSON Schema",
  "speaker": "Jan Ahrens",
  "type":    "LIGHTNING_TALK",
  "date": {
    "year": 2014, "month": 8, "day": 26
  },
*  "location": {
*    "name": "mindmatters",
*    "latitude": 53.5625523,
*    "longitude": 9.9601225
*  }
}
```
---
class: middle

```json
{
  "title":   "JSON Schema",
  "speaker": "Jan Ahrens",
  "type":    "LIGHTNING_TALK",
  "date": {
    "year": 2014, "month": 8, "day": 26
  },
  "location": {
    "name": "mindmatters",
    "latitude": 53.5625523,
    "longitude": 9.9601225
  }
}
```
---
class: middle, center

```
application/schema+json
```

---

# talk.json

```json
{
  "type": "object",
  "properties": {
    "title":    { "type": "string" },
    "speaker":  { "type": "string" },
    "type":     { "$ref": "talk_type.json" },
    "date":     { "$ref": "date.json" },
    "location": { "$ref": "location.json" }
  }
}
```

---

# talk.json

```json
{
  "type": "object",
  "properties": {
    "title": {
*      "type": "string",
*      "minLength": 10,
*      "maxLength": 20
    },
    "speaker":  { "type": "string" },
    "type":     { "$ref": "type.json" },
    "date":     { "$ref": "date.json" },
    "location": { "$ref": "location.json" }
  }
```

---

# talk.json

```json
{
  "type": "object",
  "properties": {
    "title": {
      "type": "string",
      "minLength": 10,
      "maxLength": 20
    },
    "speaker": {
*      "type": "string",
*      "pattern": "(Mr.|Mrs.)?[A-Za-z ]+"
    },
```

---


# talk_type.json

```json
{
  "enum": [
    null,
    "KEYNOTE",
    "TALK",
    "LIGHTNING_TALK"
  ]
}
```

---

# date.json

```json
{
  "type": "object",
  "properties": {
    "year": { "type": "integer" },
    "month": { "type": "integer" },
    "day": { "type": "integer" }
  }
}
```
---


# date.json

```json
{
  "type": "object",
  "properties": {
    "year": { "type": "integer" },
    "month": { "type": "integer" },
    "day": { "type": "integer" }
  },
*  "required": ["year", "month", "day"]
}
```
---


# date.json

```json
{
  "type": "object",
  "properties": {
    "year": { "type": "integer" },
    "month": { "type": "integer" },
    "day": { "type": "integer" }
  },
  "required": ["year", "month", "day"],
*  "additionalProperties": false
}
```
---

# date.json

```json
{
  "type": "object",
  "properties": {
    "year": {
*      "type": "integer",
*      "minimum": 1000,
*      "maximum": 9999
    },
    "month": { "type": "integer" },
    "day": { "type": "integer" }
  },
  "required": ["year", "month", "day"],
```

---

# location.json

```json
{
  "type": "object",
  "properties": {
    "name": { "type": "string" },
    "latitude": { "type": "number" },
    "longitude": { "type": "number" }
  },
  "required": ["latitude", "longitude"]
}
```

---

# location.json

```json
{
  "allOf": [
    {
      "type": "object",
      "properties": {
        "name": { "type": "string" }
      },
      "required": []
    },
    { "$ref": "http://json-schema.org/geo" }
  ]
}
```

---

class: middle

```json
{
  "title": "JSON Schema",
  "speaker": "Jan Ahrens",
  "type": "LIGHTNING_TALK",
  "date": {
    "year": 2014, "month": 8, "day": 26
  },
  "location": {
    "name": "mindmatters",
    "latitude": 53.5625523,
    "longitude": 9.9601225
  }
}
```

---

class: middle

```json
{
  "title": "The longest title ..",
  "speaker": "Mr. Doe",
  "type": null,
  "date": {
    "year": 1999, "month": 12, "day": 6
  },
  "location": {
    "latitude":    61.5158997,
    "longitude": -120.8996988
  }
}
```

---
# Why should I care?
--

* Better designed API requests and responses.
--

* Client knows what to expect.
--

* You can automatically check if your API sticks to the defined schema.
--

* Know what changes might break the client.
--

* Document and test your API.

--

* Way simpler than XML Schema/XSD!

---
# Good example: Balanced.

* Cucumber based test suite for their public API.

  * Everyone can execute it.
--

  * JSON Schema for every response/model.
--

* [github.com/balanced/balanced-api](https://github.com/balanced/balanced-api)

---

class: smallerfont

```cucumber
Scenario: Create an order
  Given I have created a customer
  When I make a POST request to /customers/:customer_id/orders
  Then I should get a 201 Created status code
  And the response is valid according to the "orders" schema
```
--
```json
{
  "type": "object",
  "properties": {
    "orders": {
      "type": "array",
      "items": {
        "$ref": "_models/order.json"
      },
      "minItems": 1,
      "uniqueItems": true
    },
    "meta": ...,
    "links": ...
  },
  "required": ["orders"]
}
```

Source: [github.com/balanced/balanced-api](https://github.com/balanced/balanced-api/blob/b88a8bc505fea10a12728321903be273df417449/features/orders.feature)

---
# Further reading

* [json-schema.org](http://json-schema.org)

--
  * The home of JSON Schema

--
  * IETF draft v4 expired on August 3, 2013.

--


* Michael Droettboom, et al:<br>Understanding JSON Schema

--
  * Free ebook at<br> [tinyurl.com/understanding-json-schema](http://spacetelescope.github.io/understanding-json-schema)

---

class: center, middle

# Thanks!

### Slides: [github.com/JanAhrens/json-schema-talk](https://github.com/JanAhrens/json-schema-talk)
