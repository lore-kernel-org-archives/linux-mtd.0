Received: from www.ccimackay.com
	([203.52.109.14] helo=mail.ccimackay.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14z3AP-0003xX-00
	for <linux-mtd@lists.infradead.org>; Sun, 13 May 2001 22:12:42 +0100
Message-ID: <003501c0dbf1$cae0b820$8264a8c0@dave>
From: "David Griffith" <dgriffith@ccimackay.com>
To: "Sean Simmons" <ssimmons@rdinstruments.com>
Cc: <linux-mtd@lists.infradead.org>
References: <3AFEEBE4.40007@rdinstruments.com>
Subject: Re: Unable to fdisk DOC2000
Date: Mon, 14 May 2001 07:15:10 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi Sean,
This is exactly what appeared when I first tried the MTD drivers out on my
system (Virgin webplayer hardware - Geode Gxl 200Mhz SBC). I had to modify
the delay in doc2000.c to be 4 times as long before it would work.

There's a post further back in the list that has a little more detail, and a
small patch that does it is at
http://virgin-linux.sourceforge.net/cgi-bin/ax.cgi?/doc2000-patch

Note that this *really* kills DoC read/write performance....  one day I
might see about adjusting all the delays in there.

Hope this helps,
Dave

----- Original Message -----
From: "Sean Simmons" <ssimmons@rdinstruments.com>
To: <linux-mtd@lists.infradead.org>
Sent: Monday, May 14, 2001 6:17 AM
Subject: Unable to fdisk DOC2000


> Hello,
>    I'm using a stock 2.4.4 kernel with the MTD driver
> compiled into the kernel.  I've managed to get the driver to
> recognize the DOC so that it says:
>
> M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
> DiskOnChip 2000 found at address 0xCE000
> Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
> 1 flash chips found. Total DiskOnChip size: 16 Mb
>
> The FTL driver, however gives:
>
> ftl_cs: FTL header not found.
>
> The NFTL driver then says:
>
> M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
> $Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
> Could not find valid boot record
> Could not mount NFTL device
>
> According to a post I saw earlier, this means the DOC is "hosed"
> and needs to be formatted.  When I run nftl_format I get:
>
> Erase size not 8 Kb - I'm confused
>
> I removed the check for the erase size as someone else suggested
> and nftl_format appeared to work okay going through Phase 1, 2a,
> 2b, and 3 with no errors.
>
> However, when I try to fdisk /dev/nftla I get:
>
> Unable to open /dev/nftla
>
> When I cat /proc/mtd I get:
>
> mtd0: 01000000 "DiskOnChip 2000"
>
> which looks different than I expected.
>
> Does anybody have any idea why fdisk won't work?
>
> Thanks,
>
>
> Sean Simmons
> Lead Firmware Engineer                    9855 Businesspark Ave
> RD Instruments                            San Diego, CA 92131
> email:  ssimmons@rdinstruments.com        phone:  (858)693-1178
> web:    http://www.rdinstruments.com      fax:    (858)695-1459
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
