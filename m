Received: from ppp106.spiderweb.com.au ([202.76.149.106] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YCp0-0007nY-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 21:08:13 +0000
Date: Wed, 6 Feb 2002 07:18:51 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <gleixner@autronix.de>
cc: Veli-Pekka =?iso-8859-1?q?Yl=F6nen?= <velpeyl@utu.fi>,
     <linux-mtd@lists.infradead.org>,  <jffs-dev@axis.com>
Subject: Re: NAND flash and JFFS(2)
In-Reply-To: <02020518285202.11497@thomas>
Message-ID: <Pine.LNX.4.44.0202060712480.7493-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 Feb 2002, Thomas Gleixner wrote:

> If you use a SmartMediaCard direct in your hardware as a removable
> NAND-chip with software ECC you can put the ECC data into the spare area
> where you like.

I was assuming the existence of SmartMedia adaptors which do only the ECC, 
allowing you do to the rest of the SmartMedia format in software. In that 
case, it would be best to allow the ECC to go where SmartMedia wants it to 
go, so we don't _have_ to do software ECC.

> I think we can keep the cleanmarker where it is. The code actualy writes the 
> next inode after the cleanmarker, and there is no problem. All NAND devices i 
> reviewed allow min 2 consecutive writes to a page. If we use different 
> writemodes for cleanmarker and full page (what we actually do), we can skip 
> the ECC for cleanmarker writing and write the ECC, when we write the page 
> data. I spent a additional byte in the ECC area, which determines, if ECC is 
> available or not.
> This byte is 0xff, when we have written the cleanmarker, after writing the 
> page data with ECC i write it to 0. On read i check, if the ECC available 
> flag is != 0xff.

This would be feasible. I thought I'd heard of NAND flash devices 
which only allowed one write per page though - and I've already 
written the code to move the cleanmarker.

> > I've done some of the write batching too - we have code to set up a write
> > buffer, flush it when it's full, etc., do the erase_pending_wbuf_list
> > thing, etc.
> I got this out of CVS yesterday and made it running. 

Cool.

> > It doesn't yet deal nicely with write errors, although we know how, 
> That's a bit of headache i don't know exactly how to handle. The only tricky 
> thing is a write error when we flush the buffer and have data of the previous 
> write in the buffer. A write error, which occures on non buffered data can be 
> handled by the existing JFFS2 code already. When we crash in the flush buffer 
> write, then we must return retlen = 0. The upper layer in write.c can then 
> check, if c->wbuf_len is > 0 and start data rescuing.

The comments say what you need to do in that case - still a PITA to 
actually write though.
 
> > and I haven't implemented fsync(). 
> I implemented it basicly and it works.

How did you implement this?

> > > I read also in the archive that JFFS should support NAND. Is this true?
> > JFFS ought to be OK on chips that can take ten write cycles per 512-byte
> > page, because it uses writev to ensure that nodes are written in one go,
> > and no node will be less than 52 bytes.
> > On NAND flash chips which can do fewer than ten writes per page, JFFS
> > probably won't work either.

> I tried it already and it does work, as long you have enough free space on 
> the chip and you don't run into garbage collection. If you do a copy, remove, 
> copy loop, your filesystem is totaly corrupted after the first block 
> wraparound. 

This is JFFS1, yes?

-- 
dwmw2
