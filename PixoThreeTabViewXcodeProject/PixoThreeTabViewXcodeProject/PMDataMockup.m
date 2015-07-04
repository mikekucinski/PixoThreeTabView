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
                                                 {\"Name\":\"Katie Derthick\"}, \
                                                 {\"Name\":\"Tim Robbins\"}, \
                                                 {\"Name\":\"Michael Jones\"}, \
                                                 {\"Name\":\"Linda Stevens\"}, \
                                        ] \
                                    }, \
                                    { \
                                        \"Name\":\"Current Channel\", \
                                        \"Users\":[ \
                                                  {\"Name\":\"Jessie Spencers\"}, \
                                                  {\"Name\":\"Peyton Cunningham\"}, \
                                                  {\"Name\":\"Roger Ellis\"}, \
                                                  {\"Name\":\"Clinton Rogers\"}, \
                                        ] \
                                    } \
                            ]  \
                        }";
  return dataModel;
}
@end
