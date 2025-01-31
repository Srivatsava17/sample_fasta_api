

from fastapi import APIRouter
from app.services.hello_world_function import hello_world

router = APIRouter()

@router.get("/hello")
async def hello_world_new():
    return hello_world.get_hello_world()