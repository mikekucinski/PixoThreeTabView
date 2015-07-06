//
//  PMDataMockup.m
//  PixoThreeTabViewXcodeProject
//
//  Created by an lee on 7/3/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import "PMDataMockup.h"

@implementation PMDataMockup
-(NSString*)getJSONData{
  NSString *dataModel = @"{\"CurrentUserInfo\": \
                            {\"Name\":\"Michael Rowe\", \
                              \"Organization\":\"University of Washington\", \
                                 \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\", \
                                 \"Unread Messages\":\"12\", \
                                 \"Messages\":[ \
                                    {\"Msg\":\"Don\'t forget to register\"}, \
                                    {\"Msg\":\"Don\'t forget to register\"}, \
                                    {\"Msg\":\"Don\'t forget to register\"} \
                                 ] \
                            }, \
                            \"GroupSections\":[ \
                                    { \
                                       \"Name\":\"University & Classes\", \
                                       \"Groups\":[ \
                                                 {\"Name\":\"Official Notifications\"}, \
                                                 {\"Name\":\"Computer Sciences\"}, \
                                                 {\"Name\":\"History of Architecture\"}, \
                                                 {\"Name\":\"Survey of Music\"}, \
                                        ] \
                                    }, \
                                    { \
                                        \"Name\":\"Subscribed Channels\", \
                                        \"Groups\":[ \
                                                  {\"Name\":\"Movie Club\"}, \
                                                  {\"Name\":\"Rowing Team\"}, \
                                                  {\"Name\":\"Schedule Bot\"}, \
                                                  {\"Name\":\"TV Trivia\"}, \
                                        ] \
                                    } \
                            ],  \
                            \"UserSections\":[ \
                                    { \
                                       \"Name\":\"Recent Users\", \
                                       \"Users\":[ \
    {\"Name\":\"Katie Derthick\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Tim Robbins\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Michael Jones\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Linda Stevens\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
                                        ] \
                                    }, \
                                    { \
                                        \"Name\":\"Current Channel\", \
                                        \"Users\":[ \
    {\"Name\":\"Jessie Spencers\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Peyton Cunningham\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Roger Ellis\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Clinton Rogers\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Clinton 1\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Clinton 2\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Clinton 3\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
    {\"Name\":\"Clinton 4\",\
    \"ThumbNailURL\":\"http://www.vendease.com/images/bean.jpg\"}, \
                                        ] \
                                    } \
                          ],  \
                          \"Messages\": [ \
                            {\"Message\":\"Some messages here that is loooooooooooooooooooooooooooooooooooooong\"},\
                            {\"Message\":\"Some messages here that is loooooooooooooooooooooooooooooooooooooong\"},\
                            {\"Message\":\"Some messages here that is loooooooooooooooooooooooooooooooooooooong\"},\
                            {\"Message\":\"Some messages here that is loooooooooooooooooooooooooooooooooooooong\"}\
                          ]  \
                        }";
  return dataModel;
}
@end
