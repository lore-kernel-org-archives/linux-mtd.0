Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19840g-00080m-72
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 21:04:59 +0100
Message-ID: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: <paul.wong@digitalview.com>
Date: Tue, 22 Apr 2003 13:03:43 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>Next step, I erased the file and copied another 5 MB file to it. The
>device  said " no enough spare.

Yes. You have no all free space immediately after erasing, because garbage
collector
didn't complete his work yet.

>Then I use the "mkyaffs" to format it,
>it is shown  many bad block in the device. I checked the OOB[5] ( bad
>block flag) it is  set to 0x00. Why? Why the yaffs set the health
>block to the bad block after  erase file? Is the YAFFS not support big
>file ?  any ideal?

It's different problem. When you "erase" file it not really erased.
This file just marked for erasing and then GC working in background provede
real erasing.
So, if you erase file and start immediately write new file - you have two
processes which try
access the NAND chip at the same time (Writing and GC). NAND driver has lock
mechanism to prevent problem.
Before each physical access to chip you mast grab the lock (using
nand_get_chip()).
The code look exelent, but ..  it doesn't work! (At least in my 2.4.21-pre2
kernel.
I don't know why. And I had the same problem as you. When lock doesn't work
you can
get unpredictable result including absolutely wrong data in OOB. I quickly
fix this problem using mutex.
I've placed down() before each nand_get_chip() call and up() after
spin_unlock_bh().
It is not very elegant and, probably, not very good for kernel efficiency,
however it works.

Alexander
