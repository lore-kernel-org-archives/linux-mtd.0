From: vdoukhan@cbnco.com (Vladimir Doukhanine)
Date: Wed, 12 Mar 2003 16:29:46 -0500
Subject: How to fix JFFS2 with some kind of repair tool or manually?
In-Reply-To: <200303122053.12261.tglx@linutronix.de>
References: <oprlxldmqr7bj7b7@cbnsitar.cbnco.com> <200303122053.12261.tglx@linutronix.de>
Message-ID: <oprlxxzwgs7bj7b7@cbnsitar.cbnco.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

For how long I should copy files around? :-)
After two hours of exercising I still have the same entries:

#
# du /garbage
du: /garbage/i2o/hdcr15: Input/output error
0       /garbage/i2o
du: /garbage/hdd7: Input/output error
du: /garbage/input/mouse2: Input/output error
0       /garbage/input
du: /garbage/sdao15: Input/output error
0       /garbage
#
# rm -rf garbage
rm: unable to stat `garbage/i2o/hdcr15': Input/output error
rm: unable to remove `garbage/i2o': Directory not empty
rm: unable to stat `garbage/hdd7': Input/output error
rm: unable to stat `garbage/input/mouse2': Input/output error
rm: unable to remove `garbage/input': Directory not empty
rm: unable to stat `garbage/sdao15': Input/output error
rm: unable to remove `garbage': Directory not empty
#

On Wed, 12 Mar 2003 20:53:12 +0100, Thomas Gleixner <tglx@linutronix.de> 
wrote:

> On Wednesday 12 March 2003 17:57, Vladimir Doukhanine wrote:
>> Hi,
>> I???m just looking for an advice. My JFFS2 FS has some errors and I???d like 
>> to
>> find a way to fix them.
>> An image of the JFFS2 was created on some other platform, which is not
>> accessible anymore. Also I have no more devices to create another FS 
>> except
>> RAM and almost no free space on the JFFS2. How to fix JFFS2 with some 
>> kind
>> of repair tool or manually?
> Just copy a bunch of files around, until all that offending entries are 
> removed by garbage-collect..
>
