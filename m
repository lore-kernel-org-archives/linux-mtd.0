Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1984LW-0008O6-0b
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 21:26:30 +0100
Date: Tue, 22 Apr 2003 22:26:27 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alex Samoutin <samoutin@hotbox.ru>
Message-ID: <20030422202627.GB662@wohnheim.fh-wedel.de>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: paul.wong@digitalview.com
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Disclaimer: I know nothing about yaffs.

On Tue, 22 April 2003 13:03:43 -0700, Alex Samoutin wrote:
> 
> >Next step, I erased the file and copied another 5 MB file to it. The
> >device  said " no enough spare.
> 
> Yes. You have no all free space immediately after erasing, because garbage
> collector
> didn't complete his work yet.

Doesn't make much sense, see below.

> >Then I use the "mkyaffs" to format it,
> >it is shown  many bad block in the device. I checked the OOB[5] ( bad
> >block flag) it is  set to 0x00. Why? Why the yaffs set the health
> >block to the bad block after  erase file? Is the YAFFS not support big
> >file ?  any ideal?
> 
> It's different problem. When you "erase" file it not really erased.
> This file just marked for erasing and then GC working in background provede
> real erasing.
> So, if you erase file and start immediately write new file - you have two
> processes which try
> access the NAND chip at the same time (Writing and GC). NAND driver has lock
> mechanism to prevent problem.
> Before each physical access to chip you mast grab the lock (using
> nand_get_chip()).

Agreed. But this problem should be handled in kernel. In other words,
the writing process has to trigger GC and continue writing, if GC
managed to free more space. It would make sense to tell GC, how much
space is needed, so it won't work over the whole device, locking the
NAND for a long time.

Anything else is very unintuitive to the user and a plain bug, at
least in my book.

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

A race car can drive at any speed, if it doesn't reach the finish
line, it won't win any races.
Correct code is always faster than incorrect code. ;)

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
