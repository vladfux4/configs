#include "opencv2/opencv.hpp"
#include "opencv2/highgui/highgui_c.h"
#include <iostream>
#define FRAME_COUNT 3

using namespace cv;

int main(int, char**)
{
    VideoCapture cap(0); // open the default camera
    if(!cap.isOpened())  // check if we succeeded
        return -1;
    
    namedWindow("edges",1);
    uint brightnessInteg = 0;
    for(char i = 0; i < FRAME_COUNT; ++i) {
        Mat frame;
        Mat gray;
        uint  brightness = 0;
        cap >> frame; // get a new frame from camera
        cvtColor(frame, gray, CV_BGR2GRAY);
        for (int y = 0; y < gray.cols; ++y) {
            for(int x = 0; x < gray.rows; ++x) {
                brightness += gray.at<uchar>(x,y);
            }
        }
        brightnessInteg += brightness;
    }
    brightnessInteg = brightnessInteg/FRAME_COUNT/1000000;
    std::cout << brightnessInteg << std::endl;
    return 0;
}
