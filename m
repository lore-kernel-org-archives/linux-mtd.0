Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W40F-0000s9-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 22:14:23 +0000
Message-ID: <3A9595A4.D98A5CF@danielind.com>
Date: Thu, 22 Feb 2001 16:41:41 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does not r  
 egister block device!
References: <Pine.LNX.4.30.0102222154410.7303-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> On Thu, 22 Feb 2001, Vipin Malik wrote:
>
> > Success!! Well sort of ;)
> >
> > After a terrible hack of explicitly calling rd_load() again at the end
> > of init_mtdblock(), forces the ramdisk stuff to look for the
> > compressed root file system again. This time it finds it (now that
> > mtdblock has registered the block device) enabling the root file
> > system to be loaded and be mounted!
>
> Heh. Well done.

Thanks.

>
>
> > This proves for sure that that is the only issue left to boot
> > compressed root file systems off raw flash. Once we figure out how to
> > force init_mtdblock() to be linked in before the ram disk stuff, we
> > would be set.
>
> Cool. You'll have to hurry, though -

Are you saying that you'll not fix this "bug" for me ;)
Would saying please help :)

> We'll have JFFS2 (with compression)
>ready to roll out quite soon :)

Well, there still would be reasons to decompress a root file system into
ramdisk and run from there, namely:

1. Processor cache: Most likely you would have turned off the processor
cache on the flash window, to enable writing.
A cached (or possibly even uncached) DRAM would be faster than
FLASH (specially if one saved some money and
bought those 120ns ones :) Additionally many high end embedded processors
have (or will have in the future), write merging and
read ahead that you want turned off again so as not to screw up write and
erase cycles.

2. Reliability: A wayward program is less likely to completely screw up the
system. A reboot would rebuild the root file system
to a pristine state.

3. Compressibility: I would hazard a guess that the compressibility
obtained with compressing an entire file system image would
be better than that obtained with just compressing individual inode data.

4. For faster access times, you want the flash connected across the entire
bus data width. Say using x8 chips with 64KB sectors,
and 2 sectors min erase area, you are looking at 512KBytes of non usable
flash space. This is less of an issue with compressed fs!
One can connect just a x8 chip and have the performance of running out of
dram and the small overhead of 2*64=128KBytes erase
buffer available.

5. Compressed root file systems will cook and do your laundry for you, will
jffs2 do that?

:)

Vipin

>
>
> --
> dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
