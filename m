Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VFQ1-0004ZH-Aq
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 19:54:57 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HH10076FWJDYS@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 25 Jun 2003 20:54:50 +0200 (MEST)
Date: Wed, 25 Jun 2003 21:52:25 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030625182431.GA15901@rinconnetworks.com>
To: paul.vangool@rinconnetworks.com, Jasmine Strong <jasmine@regolith.co.uk>
Message-id: <200306252152.25576.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <20030625154815.GA15437@rinconnetworks.com>
 <20030625182020.GA15879@rinconnetworks.com>
 <20030625182431.GA15901@rinconnetworks.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: No space left on almost empty JFFS2 filesystem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 25 June 2003 20:24, Paul van Gool wrote:
> Creating am image with '-e 0x10000' and running with it, results in:
>
> # mount -t jffs2 /dev/mtdblock4 /mnt/jffs
> mtdblock_open
> ok
> jffs2_scan_empty(): Empty block at 0x000017ac ends at 0x00010000 (with
> 0x200319y CLEANMARKER node found at 0x00010000, not first node in block
> (0x00000000) jffs2_scan_empty(): Empty block at 0x0002000c ends at
> 0x00030000 (with 0x200319y CLEANMARKER node found at 0x00030000, not first
> node in block (0x00020000) jffs2_scan_empty(): Empty block at 0x0004000c
> ends at 0x00050000 (with 0x200319y CLEANMARKER node found at 0x00050000,
> not first node in block (0x00040000) jffs2_scan_empty(): Empty block at
> 0x0006000c ends at 0x00070000 (with 0x200319y CLEANMARKER node found at
> 0x00070000, not first node in block (0x00060000) jffs2: No clean _or_ dirty
> blocks to GC from! Where are they all?
> jffs2: Couldn't find erase block to garbage collect!
> jffs2: No clean _or_ dirty blocks to GC from! Where are they all?
> jffs2: Couldn't find erase block to garbage collect!
> jffs2: No clean _or_ dirty blocks to GC from! Where are they all?
> jffs2: Couldn't find erase block to garbage collect!
Don't try to betray the pyhsiccal facts. Even if you tell mkfs.jffs2 that your 
eraseblock size is < 128K,  the physical eraseblock size will remain at 128K, 
as this is given by the chip. 

You can only erase eraseblocks and not a quarter of them, as you can't buy a 
1/4 of a beerbottle. You can fill the bottle with 1/4 of the maximum content, 
but the bottle still remains the same size. :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
