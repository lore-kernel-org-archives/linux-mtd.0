Received: from natwar.webmailer.de ([192.67.198.70] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y9Cp-0007ZS-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 17:16:31 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>,
        Veli-Pekka
 =?iso-8859-1?q?Yl=F6nen?= <velpeyl@utu.fi>
Subject: Re: NAND flash and JFFS(2)
Date: Tue, 5 Feb 2002 18:28:52 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <Pine.LNX.4.44.0202060108320.5284-100000@lapdancer.baythorne.internal>
In-Reply-To: <Pine.LNX.4.44.0202060108320.5284-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Message-Id: <02020518285202.11497@thomas>
Content-Transfer-Encoding: 8bit
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

On Tuesday,  5. February 2002 16:30, David Woodhouse wrote:
> I've had a go at some of these - I got terminally bored on the plane to
> linux.conf.au so 've just checked in code to the experimental
> jffs2-nand-branch in CVS which does the CLEANMARKER bit, although we
> probably want to check where we should put the cleanmarker in NAND flash
> to avoid all the hardware ECC arrangments. I know this one is OK with the
> DiskOnChip but don't remember offhand where SmartMedia puts its ECC data.
The SmartMedia is nothing else than a raw NAND chip assembled into a thin 
plastic card. The "Smart" thing is the adaptor they sell for the PC. This 
adaptor simulates a DOS-FAT filesystem. The filesystem on the SMartCard 
itself is simliar to DOS-FAT with some extensions for bad block management. I 
doubt, if it's possible to put jffs2 on top of this adapters. If you use a 
SmartMediaCard direct in your hardware as a removable NAND-chip with software 
ECC you can put the ECC data into the spare area where you like.

I think we can keep the cleanmarker where it is. The code actualy writes the 
next inode after the cleanmarker, and there is no problem. All NAND devices i 
reviewed allow min 2 consecutive writes to a page. If we use different 
writemodes for cleanmarker and full page (what we actually do), we can skip 
the ECC for cleanmarker writing and write the ECC, when we write the page 
data. I spent a additional byte in the ECC area, which determines, if ECC is 
available or not.
This byte is 0xff, when we have written the cleanmarker, after writing the 
page data with ECC i write it to 0. On read i check, if the ECC available 
flag is != 0xff.

> I've done some of the write batching too - we have code to set up a write
> buffer, flush it when it's full, etc., do the erase_pending_wbuf_list
> thing, etc.
I got this out of CVS yesterday and made it running. 

> It doesn't yet deal nicely with write errors, although we know how, 
That's a bit of headache i don't know exactly how to handle. The only tricky 
thing is a write error when we flush the buffer and have data of the previous 
write in the buffer. A write error, which occures on non buffered data can be 
handled by the existing JFFS2 code already. When we crash in the flush buffer 
write, then we must return retlen = 0. The upper layer in write.c can then 
check, if c->wbuf_len is > 0 and start data rescuing.

> and I haven't implemented fsync(). 
I implemented it basicly and it works.

> > I read also in the archive that JFFS should support NAND. Is this true?
> JFFS ought to be OK on chips that can take ten write cycles per 512-byte
> page, because it uses writev to ensure that nodes are written in one go,
> and no node will be less than 52 bytes.
> On NAND flash chips which can do fewer than ten writes per page, JFFS
> probably won't work either.
I tried it already and it does work, as long you have enough free space on 
the chip and you don't run into garbage collection. If you do a copy, remove, 
copy loop, your filesystem is totaly corrupted after the first block 
wraparound. 
 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
