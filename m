From: RobertS@visi.com (RobertS)
Date: Tue, 11 Mar 2003 07:31:29 -0500
Subject: 2.4.19 rmk4 Jffs2 Performance problems, Upgrade diffulculty.
References: <3E6D1821.3060002@visi.com> <200303110915.48377.tglx@linutronix.de>
Message-ID: <3E6DD721.1030501@visi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thomas Gleixner wrote:

>On Monday 10 March 2003 23:56, RobertS wrote:
>  
>
>>Hello,
>>    I am running an almost pristine copy of 2.4.19 rmk4.
>>    I have applied the patch, linux-2.4.19-pre10-shared-zlib.
>>    I have updated to mtd-snapshot-20030305.tar.
>>    
>>
>Could you please try the following:
>1. Get your almost pristine copy of 2.4.19.rmk4
>2. use latest MTD snapshot and use patchin.sh from patches directory. This 
>will apply zlib patch too
>3. Report results
>
>  
>
Hello Thomas,

    Sure.

    Please provide the name and location of the MTD snap shot so I use 
the correct one.  The  mtd snapshot that I used originally was 
mtd-snapshot-20030305.tar.gz.  I had numerous problems with this snap 
shot and 2.4.19. Unfortunately, there was a lot of "pilot" error when I 
started this upgrade effort. Let me know and I will proceed carefully 
and capture the results.

    The  performance of approximately 4 minutes to copy a 1 meg file was 
with an almost "pristine" 2.4.19 rmk4 kernel. Does this meet 
expectations for that iteration of jffs2?

Robert
