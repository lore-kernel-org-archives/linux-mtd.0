Received: from dragon.actrix.co.nz ([203.96.16.164] helo=desire.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198R6W-0004xy-PR
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 21:44:33 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Alex Samoutin" <samoutin@hotbox.ru>,
	linux-mtd@lists.infradead.org
Date: Thu, 24 Apr 2003 08:45:37 +1200
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
In-Reply-To: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
MIME-Version: 1.0
Message-Id: <20030423204440.258661528E@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alex

I am unaware of this problem. I would like to understand it better. Could you 
give me more details?

-- CHarles

On Wednesday 23 April 2003 08:03, you wrote:
> >Next step, I erased the file and copied another 5 MB file to it. The
> >device  said " no enough spare.
>
> Yes. You have no all free space immediately after erasing, because garbage
> collector
> didn't complete his work yet.
>
> >Then I use the "mkyaffs" to format it,
> >it is shown  many bad block in the device. I checked the OOB[5] ( bad
> >block flag) it is  set to 0x00. Why? Why the yaffs set the health
> >block to the bad block after  erase file? Is the YAFFS not support big
> >file ?  any ideal?
>
> It's different problem. When you "erase" file it not really erased.
> This file just marked for erasing and then GC working in background provede
> real erasing.

In yaffs this does not really happen. Even though the real deleting is done 
"in background", it is always done in the same thread. ie.  this is done by 
parasitic code of the form:

write_data()
{
     do_background_gc();
    do_actual_write();
}

YAFFS is locked by a semaphore so that only one thread is in any YAFFS 
partition at a time. 

> So, if you erase file and start immediately write new file - you have two
> processes which try
> access the NAND chip at the same time (Writing and GC). NAND driver has
> lock mechanism to prevent problem.
> Before each physical access to chip you mast grab the lock (using
> nand_get_chip()).
> The code look exelent, but ..  it doesn't work! (At least in my 2.4.21-pre2
> kernel.
> I don't know why. And I had the same problem as you. When lock doesn't work
> you can
> get unpredictable result including absolutely wrong data in OOB. I quickly
> fix this problem using mutex.
> I've placed down() before each nand_get_chip() call and up() after
> spin_unlock_bh().
> It is not very elegant and, probably, not very good for kernel efficiency,
> however it works.

I guess there could be a lower-level problem if two or more partitions are in 
use and locking is not working in the mtd code.

So could running mkyaffs while the partitiion is mounted (assuming locking is 
not working).

Comments anyone?

-- Charles
