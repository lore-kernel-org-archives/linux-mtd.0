Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1COblN-0001p1-7O
	for linux-mtd@lists.infradead.org; Mon, 01 Nov 2004 07:58:24 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Dmitry Skorinko <skorinkod@mosk.ru>
In-Reply-To: <200411011218.33494.skorinkod@mosk.ru>
References: <200411011218.33494.skorinkod@mosk.ru>
Content-Type: text/plain
Date: Mon, 01 Nov 2004 13:50:03 +0100
Message-Id: <1099313403.3337.17.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: input/output errors
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-01 at 12:18 +0300, Dmitry Skorinko wrote:
> DiskOnChip found at 0xe0000
> Detected 2 chips per floor.
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,3V 
> 8-bit)
> 2 NAND chips detected
> Bad block table found at page 524256, version 0x55
> Bad block table not found for chip 0
> nand_read_bbt: Reserved block at 0x00000000
> nand_read_bbt: Bad block at 0x00080000
> nand_read_bbt: Bad block at 0x000c4000
> nand_read_bbt: Bad block at 0x000d4000
> nand_read_bbt: Bad block at 0x08080000
> nand_read_bbt: Bad block at 0x08124000
> nand_read_bbt: Bad block at 0x08134000
> nand_read_bbt: Bad block at 0x09600000
> nand_read_bbt: Reserved block at 0x0fffc000
> ECC error scanning DOC at 0x0
> DiskOnChip BNAND Media Header not found.
> Found alias of DOC at 0xe0000 to 0xe2000
> Found alias of DOC at 0xe0000 to 0xe4000
> Found alias of DOC at 0xe0000 to 0xe6000
> 

> mtd.oobsize = 16
> mtd.ecctype = (unknown ECC type - new MTD API maybe?)
> regions = 0
> "new MTD API" ?? Is it dangerous for drivers work?

mtd_debug is outdated. Nothing to worry about.

> Erasing 16 Kibyte @ fffc000 --  3 % complete.
> ./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
> 
> What is it? I don't understand, did programm finish her work?

Look at the bad block output above. Bad blocks cannot be erased.

> #nftl_format /dev/mtd0
> $Id: nftl_format.c,v 1.22 2004/05/05 15:19:57 dwmw2 Exp $

I'm not sure whether nftl_format will work, as I assume, that it must
access at least block 0, which is marked bad to protect the information
there.

> #modprobe inftl
> #dmesg
> --skip--
> INFTL: inftlcore.c $Revision: 1.17 $, inftlmount.c $Revision: 1.14 $
> INFTL: could not find valid boot record?
> INFTL: could not mount device

Can you format the chip from DOS with the M-Sys tools and try again ?

> If I use last cvs - I have not even diskonchip.....  see previous my
> post

That previous post tells me not much. It's not really helpful to mixup
information.
What happens with current CVS code, if you modprobe diskonchip ?

tglx
