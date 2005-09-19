Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHHoJ-0007wg-B0
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 05:19:55 -0400
Date: Mon, 19 Sep 2005 11:19:17 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Sphinx King <alpharoot@gmail.com>
Message-ID: <20050919091917.GA21380@wohnheim.fh-wedel.de>
References: <5b42f131050917055543f3d84f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b42f131050917055543f3d84f@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ext2 and fat32 can't handle bad block of nand flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 17 September 2005 20:55:05 +0800, Sphinx King wrote:
> 
> Hi all,
> It sounds like we can not use ext2 or fat32 file system on nand flash
> if the nand flash has bad blocks.
> 
> My board has only one bad block which can be handled by mtd driver
> because I saw message like "bad eraseblock ..." during linux booting
> up. I've managed to use mke2fs to format the mtdblock as ext2
> (although it has bad block). When I copy file to this partition, it
> soulds like ext2 still attempts to write data to the bad block
> although this bad block is already put into the mtd bad block table.
> This finally results in I/O error and the write fails. I also tried
> fat32 and got the same result.
> 
> After looking into the mtd code, I found the write request (which is
> from the up layer) to the bad block is transfered to the function
> do_cached_write() in mtdblock.c. In this function mtd might do a
> cached_write after it receives data from up layer, ie., it attempts to
> read out sector data and do buffering, which will be written back to
> the block later. Here the problem comes out. Since the block is bad,
> an ECC error occurs which results in the failure of the read. And the
> do_cached_write() returns error to inform up layer. However it seems
> the up layer will try to write to the bad block again and again
> although the write fails. Finally the copy of file completes but the
> file is corrupt.
> 
> Is my understanding correct? Why ext2 or fat32 trys to write to a bad
> block? Can we use ext2 or fat on nand flash if the flash has bad
> block?
> 
> By reading some doc I was told there is no such problem for jffs2
> because jffs2 can handle bad block info. Is it true? Currently I
> haven't try jffs2 yet. I will try it in some days.
> 
> Can anybody help me on this? Thanks in advance.

You only got what you deserved.  Running a hard disk filesystem on raw
NAND without a sophisticated translation layer will kill your flash
chips in no time.  For an introduction, you might want to read this:
http://www.linux-kongress.org/2005/abstracts.html#4_4_2
http://wh.fh-wedel.de/~joern/logfs.pdf

Then you should rethink your setup and possibly come back.

Jörn

-- 
You can take my soul, but not my lack of enthusiasm.
-- Wally
