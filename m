Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vofg-0004yY-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 21:30:48 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11voff-0004yS-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 21:30:47 +0000
Message-ID: <384ECE55.83FAD600@danielind.com>
Date: Wed, 08 Dec 1999 15:32:05 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Power Down]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> Orono@m-sys.com said:
> > The only way to be resistant to power failures in the file system
> > level  is to use a log-structured file system.
> 
> > I heard ext3 is log-structured but I am sure one of the Linux guys here
> > knows more about this,
> 
> ext3 is a journalling filesystem. I believe that it's not log-structured.

Is ext3 already available in beta form? Is it included in the latest
2.3.x kernels?


> 
> Journalling is sufficient for protection from power failures. Stephen,
> would you care to elaborate on the difference?

What is the overhead of Journalling? (CPU AND flash space). Of course if
that solves the problem, then that is the most important thing (for me
at least).

> 
> > Any other file system  that takes power failures into account, (I am afraid
> > to guess NFTL ????).
> 
> I believe that NTFS is also journalling but not log-structured.
> 
> > Some of our customers use their own home brewed LFSs and do it successfully.
> 
> Personally, I'm inclined to believe that we should run a filesystem directly
> on the flash device - rather than faking a block device and running a 'normal'
> filesystem on top of that.

I think that would probably be the best idea also, since in repairing
low level partitions vs a higher level f/s, could get really difficult
to prove that it is reliable.

The only problem with this approach is that it is not the usual "linux"
layered approach. But maybe that approach does not work well with
embedded systems and is a hit we are willing to accept?

Another problem with the usual "layered" approach is that the VFS uses a
lot of buffering in its layer. This is usually desirable for read/write
performance, however for logs etc. on FLASH this is probably NOT
desirable.

When I write a log, I want it written and saved. I guess one could do
sync() etc. every time but not very elegant.

> 
> I've been rushed off my feet here with other things for a while, but as soon as
> I get back to it, after I've fixed the NFTL and DiskOnChip Millennium support,
> that's what I'm intending to look at.

Do you have an estimate for the time frame that you are looking at?

I am willing to help out with coding, as I am extremely interested in
this (and
have access to lots of different embedded hardware with FLASH, SRAM etc.
on it, and if needed I could possibly buy more :).


> 
> If you're running ext2 on a DiskOnChip you should mount it with the noatime
> option if you can - this will eliminate a lot of write activity.
> 
> --
> dwmw2
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
