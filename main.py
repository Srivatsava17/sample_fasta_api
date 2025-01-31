from fastapi import FastAPI
from app.router import (
    hello_world_api
)
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Hello-world",
    description="example of hello world",
    debug=True
)

app.include_router(hello_world_api.router)
origins = ["http://localhost.tiangolo.com",
           "https://localhost.tiangolo.com",
           "http://localhost",
           "http://localhost:8080",    
            "http://localhost:3001",  
            "https://localhost:3001",
            "https://localhost:3000",
            "http://localhost:3000",
            "https://dev.d2zudvqxkpyftz.amplifyapp.com"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
