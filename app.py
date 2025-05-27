import logging
from fastapi import FastAPI

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI()

logger.info("Starting WAN2.1 FastAPI server...")

@app.get("/")
async def root():
    logger.info("Root endpoint called.")
    return {"message": "WAN2.1 API is running"}

@app.post("/generate-video/")
async def generate_video(prompt: str):
    logger.info(f"Received prompt for video generation: {prompt}")
    # Placeholder for real generation logic
    video_url = f"https://example.com/generated_videos/{prompt.replace(' ', '_')}.mp4"
    logger.info(f"Returning video URL: {video_url}")
    return {"prompt": prompt, "video_url": video_url}
