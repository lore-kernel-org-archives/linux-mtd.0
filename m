From: RobertS@visi.com (RobertS)
Date: Tue, 11 Mar 2003 17:00:20 -0500
Subject: 2.4.19 rmk4 Jffs2 Performance problems, Upgrade diffulculty.
References: <3E6D1821.3060002@visi.com> <200303110915.48377.tglx@linutronix.de> <3E6DD721.1030501@visi.com> <200303111555.47644.tglx@linutronix.de>
Message-ID: <3E6E5C74.2080201@visi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thomas Gleixner wrote:

>On Tuesday 11 March 2003 13:31, RobertS wrote:
>  
>
>>    Please provide the name and location of the MTD snap shot so I use
>>the correct one.  The  mtd snapshot that I used originally was
>>mtd-snapshot-20030305.tar.gz.  I had numerous problems with this snap
>>shot and 2.4.19. Unfortunately, there was a lot of "pilot" error when I
>>started this upgrade effort. Let me know and I will proceed carefully
>>and capture the results.
>>    
>>
>cvs -d :pserver:anoncvs at cvs.infradead.org:/home/cvs login (password: anoncvs)
>cvs -d :pserver:anoncvs at cvs.infradead.org:/home/cvs co mtd
>
>  
>
>>    The  performance of approximately 4 minutes to copy a 1 meg file was
>>with an almost "pristine" 2.4.19 rmk4 kernel. Does this meet
>>expectations for that iteration of jffs2?
>>    
>>
>I'va never seen such long times
>
>  
>
The update and build went smoothly. Unfortunately,  I still oops in 
exactly the same manner.

What I am doing now is turning on the verbose debug messages and keep 
everything as simple as possible.  I will be performing a series of 
tests and will use this thread either to post my findings or further 
questions.


RobertS.
