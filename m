Received: from ipmail01.adl6.internode.on.net ([203.16.214.146])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KC7Ir-00040c-7c
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 06:19:25 +0000
Message-ID: <48648662.1050107@call-direct.com.au>
Date: Fri, 27 Jun 2008 16:19:14 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] MTD: NAND: fsl_elbc_nand: fix OOB workability for large
	page NAND chips
References: <20080626184156.GA2356@polina.dev.rtsoft.ru>
In-Reply-To: <20080626184156.GA2356@polina.dev.rtsoft.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> For large page chips, nand_bbt is looking into OOB area, and checking
> for "0xff 0xff" pattern at OOB offset 0. That is, two bytes should be
> reserved for bbt means.
>
> But ELBC driver is specifying ecclayout so that oobfree area starts at
> offset 1, so only one byte left for the bbt purposes.
>
> This causes problems with any OOB users, namely JFFS2: after first mount
> JFFS2 will fill all OOBs with "erased marker", so OOBs will contain:
>
>   OOB Data: ff 19 85 20 03 00 ff ff ff 00 00 08 ff ff ff ff
>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>
> And on the next boot, NAND core will rescan for bad blocks, then will
> see "0xff 0x19" pattern, and will mark all blocks as bad ones.
>
> To fix the issue we should implement our own bad block pattern: just one
> byte at OOB start.
>
>   
Anton,

the problem with bad block markers is that if they are set, _nothing_ is 
guaranteed
to work with that block. You cannot assume that it is possible to 
relocate the BB
marker into the first byte, if the second one is set. If you don't 
relocate it, your
new pattern will fail to find the bad block.

Most manufacturers use the first OOB byte in one of the first two pages 
in a block
as the BB marker. Others use, as you noticed, the first two OOB bytes of 
the first and
possibly second page of a block.

The point is that if  the marker is set, nothing can be done with that 
block. You must
not touch it.

To make things worse, some hardware NAND controllers *require* you to place
the ECC immediately after the data area. That's right, straight over the 
BB marker
locations.

The solution to your and other similar problems is to use a Bad Block 
Table (BBT)
at the end of the NAND. When your device comes up for the first time, it 
must
scan the NAND for bad blocks, and then write this information into the BBT.

In all consecutive boots, the device must always use the BBT and not 
scan again.

The algorithm, as implemented e.g. in U-Boot and the Linux kernel is to look
for a valid BBT first and only go scanning if it doesn't exist. After 
the scan,
the BBT is written and available next time.

You just need to set the correct flags in your low-level NAND driver.

Kind regards,

Iwo
