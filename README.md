# Chat System

## Setup

1. Run `docker-compose up` to start the application.
2. Access the application at `http://localhost:3000`.

## Endpoints

- **Applications**
  - `GET /applications`
  - `POST /applications`
  - `GET /applications/:token`
- **Chats**
  - `GET /applications/:token/chats`
  - `POST /applications/:token/chats`
  - `GET /chats/:id`
- **Messages**
  - `GET /chats/:chat_id/messages`
  - `POST /chats/:chat_id/messages`
  - `GET /chats/:chat_id/messages/search?query=anything`

## Notes

- The application uses Sidekiq for background processing and Redis for job queuing.
- Elasticsearch is used for searching messages.
- The application is containerized using Docker.
