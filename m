Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xv0y-00031q-00
	for mtd-list@infradead.org; Tue, 14 Dec 1999 16:41:28 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xv0w-00031k-00
	for mtd@imladris.mvhi.com; Tue, 14 Dec 1999 16:41:26 +0000
Message-ID: <385673EA.BB0EE434@danielind.com>
Date: Tue, 14 Dec 1999 10:44:26 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: [Fwd: Power Down]]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> vmalik@danielind.com said:
> >  Is ext3 already available in beta form? Is it included in the latest
> > 2.3.x kernels?
> 
> yes, no.
> 
> ftp.uk.linux.org:/pub/linux/sct/fs/jfs/ext3-0.0.2c.tar.gz
Thanks for the link. I checked ext3 out. what I found...
1. It is still in pre form. Not too bad, but probably at least 6 months
(or more) away from being production quality. Not too big a deal for
projects about 1+yr out.

2. This is the big one: It needs 1024 blocks for the journal file. At
1k/block, this translates into 1 meg journal file. This could be a
*significant* overhead for small file systems (<10M).

I'm going to download the pre and play with it for a while to get a
first hand impression of it. But the 1 meg journal file overhead is too
big for medium size embedded systems.

Unfortunately journalling still dosen't solve the problem (that I say
first hand) of one entire (512byte) flash block "go bad". The only
solution I found to recover this block resulted in the erasure of the
ENTIRE block. Now this was at the lowest level (below the file system).
I don't know how even a journaled file system would recover stuff
(inodes etc.) disappearing from under its feet. Dosen't give me a warm
and fuzzy about it.

> 
> > What is the overhead of Journalling? (CPU AND flash space). Of course
> > if that solves the problem, then that is the most important thing (for
> > me at least).
> 
> I don't know - I haven't looked into it much yet.
> 
> vmalik@danielind.com said:
> > One dosen't have to write to the flash every second, even if logs are
> > being generated that fast. You can accumulate writes in RAM (even
> > backud up RAM), and then archive them to FLASH every 5 minutes etc.
> 
> vmalik@danielind.com said:
> >  When I write a log, I want it written and saved. I guess one could do
> > sync() etc. every time but not very elegant.
> 
> Err... which do you want? You can't have both.

LOL :) Actually what I meant was that in the write to RAM and then in
batch mode save to FLASH situation, I meant that when I want to store
the "batch" of logs accumulated in RAM to FLASH I want the thing "done!"
rather than "hang around" in VFS buffers etc.

> 
> --
> dwmw2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
