From: dwmw2@infradead.org (David Woodhouse)
Date: 06 Feb 2003 14:58:00 +0000
Subject: Two questions on mtds on x86 platform
In-Reply-To: <3E42748A.D1E17F2A@procsys.com>
References: <3E42748A.D1E17F2A@procsys.com>
Message-ID: <1044543479.2535.8.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 2003-02-06 at 14:43, Somashekara DM wrote:
> Hi,
> 
> We want to mount jffs2 on two mtd partitions as a part of our project.
> Our platform is x86 - kernel version 2.4.13.
> 
> 1. We are using mtdram ("Test driver using RAM") and blkmtd ("MTD
> emulation using block device")
>     to create two mtd's. Our aim is to mount jffs2 on two different
> mtds.

OK. So you have two MTD devices listed in /proc/mtd?

> Here are the steps we have followed.
> 
> Step1 :
>     mknod /dev/mtd0 c 90 0
>     mknod /dev/mtd2 c 90 2

This is incorrect. The MAKEDEV script in CVS is correct. The device
numbers for the character devices alternate between 'normal' and
read-only devices, as follows:

	/dev/mtd0	c 90 0
	/dev/mtdr0	c 90 1
	/dev/mtd1	c 90 2
	/dev/mtdr1	c 90 3
	/dev/mtd2	c 90 4
	/dev/mtdr2	c 90 5

So what you've called '/dev/mtd2' is in fact what _should_ be called
'/dev/mtd1', and is hence the second of the two MTD devices (In fact, 
/dev/mtd2 would be a _third_ device, which does not exist in your
system).

>     and
>     mknod /dev/mtdblock0 b 31 0
>     mknod /dev/mtdblock2 b 31 2

These are correct device numbers and names but as before, /dev/mtdblock2
refers to a third MTD device which does not exist in your system. Make
/dev/mtdblock1 (b 31 1) and use that.

>    mount -t jffs2 /dev/mtdblock2 /mnt/jffs2drive2    //this mount fails
>    error - "mount: fs type jffs2 not supported by kernel"

What it actually means is 'block device /dev/mtdblock2 does not exist'.
But mount(2) doesn't return sensible errors.

> 2. Can we create multiple partitions on the 'mtdram'?
>        Can you give us the procedure for that?

No partitions, but you can load the mtdram module twice (with different
names) so that you get two devices.

-- 
dwmw2
