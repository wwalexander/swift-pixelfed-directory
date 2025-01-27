import Yams
import OpenAPIKit
import Foundation

let document = OpenAPI.Document(
    openAPIVersion: .v3_1_1,
    info: .init(title: "Pixelfed", version: "1.0.0"),
    servers: [
        .init(url: .init(string: "https://pixelfed.org/api")!)
    ],
    paths: [
        "/v1/servers/all.json": .init(
            get: .init(
                operationId: "findServers",
                parameters: [
                    .parameter(
                        name: "scope",
                        context: .query(allowEmptyValue: true),
                        schema: .string(defaultValue: "All")
                    ),
                    .parameter(
                        name: "country",
                        context: .query(allowEmptyValue: true),
                        schema: .string(defaultValue: "all")
                    ),
                    .parameter(
                        name: "language",
                        context: .query(allowEmptyValue: true),
                        schema: .string(defaultValue: "en")
                    )
                ],
                responses: [
                    .status(code: 200): .response(
                        description: "OK",
                        content: [
                            .json: .init(schema: .object(properties: [
                                "data": .array(items: .object(
                                    properties: [
                                        "id": .integer(
                                            minimum: (1, exclusive: false),
                                            examples: [1]
                                        ),
                                        "domain": .string(
                                            format: .hostname,
                                            examples: ["pixelfed.social"]
                                        ),
                                        "short_description": .string(
                                            examples: ["The original Pixelfed instance, operated by the main developer @dansup"]
                                        ),
                                        "header_image": .string(
                                            format: .uri,
                                            examples: ["https://pixelfed-web1.nyc3.cdn.digitaloceanspaces.com/assets/servers/1/header/header-tbtrfbsd4fip.jpg"]
                                        ),
                                        "category": .string(
                                            examples: ["General"]
                                        ),
                                        "location": .string(
                                            examples: ["USA"]
                                        ),
                                        "public_email": .string(
                                            format: .email,
                                            examples: ["hello@pixelfed.org"]
                                        ),
                                        "established_since": .string(
                                            format: .date,
                                            examples: ["Jun 2018"]
                                        ),
                                        "stats": .object(properties: [
                                            "user_count": .integer(minimum: (0, exclusive: false)),
                                            "post_count": .integer(minimum: (0, exclusive: false)),
                                        ])
                                    ]
                                )),
                            ]))
                        ]
                    )
                ])
        )
    ],
    components: .init(),
    security: [],
    tags: []
)

let encoder = YAMLEncoder()
let string = try encoder.encode(document)
print(string)
