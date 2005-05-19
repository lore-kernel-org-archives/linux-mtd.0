Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYm9U-0005zo-3L
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 10:37:33 -0400
Date: Thu, 19 May 2005 16:37:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gianluca Moro <giangiammy@yahoo.com>
Message-ID: <20050519143710.GB22174@wohnheim.fh-wedel.de>
References: <20050519103148.2859.qmail@web52709.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050519103148.2859.qmail@web52709.mail.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compute flash life time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 May 2005 03:31:48 -0700, Gianluca Moro wrote:
> 
> and sorry for the obvious question, but I'm trying to
> estimate my flash life, depending on write operation.
> 
> I'm using JFFS2:
> If I have 1 M flash, and write 128byte/s in a circular 
> buffer style: I compute, with 100000 write cycles to
> have a 9000 day flash life (100000 * 1024*1024/128 seconds).

Yes, about 25 years.

> But in this way I suppose that each 128 blob of data
> I write, effectively write 128 bytes of flash: but
> I'm trying to understand:
> 
> - what is the filesystem overhead?
> - when I write 128 bytes, the filesystem writes effectively
>   128 bytes, or writes an entire sector?

If data can be compressed, the 128 byte number goes down a bit.  For
each write, jffs2 adds a struct jffs2_raw_inode.  A little extra for
garbage collection and some wasted bytes at the end of each erase
block, which should leave you between 10 and 20 years, very roughly.

> - to do my computation, is it correct the formula I used,
>   or do I need to substitute the 128 value with the flash
>   sector size?

On NOR flash, you can usually write byte-exact, so above calculation
is correct.

NAND is written in pages of 512 bytes of 2048 bytes.  You'd better
check and test the write buffer functionality, since unbuffered writes
would kill you with above numbers.  But it looks as if you have NOR
anyway, so don't worry.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
