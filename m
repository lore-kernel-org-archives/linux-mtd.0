Received: from dialup.rama.com.au ([202.0.186.166] helo=gateway.perth.rama.com.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UKz7-0000CR-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2001 05:30:23 +0100
Received: from willhart-tech.com (IDENT:alex@[192.156.249.82])
	by gateway.perth.rama.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id NAA21574
	for <linux-mtd@lists.infradead.org>; Wed, 8 Aug 2001 13:55:10 +0800
Message-ID: <3B70C06D.5908CAC8@willhart-tech.com>
Date: Wed, 08 Aug 2001 12:30:37 +0800
From: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
MIME-Version: 1.0
To: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC 2000 driver (NFTL) in kernel 2.4.7
References: <3B677B90.B2E244BD@cvs.anu.edu.au>  <E15RXGo-00058Q-00@pentafluge.infradead.org> <30960.997176999@redhat.com>
Content-Type: text/plain; charset=us-ascii
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

Hi, 

I updated to the lastest CVS, and moved the driver code into the 2.4.7
kernel source.

At boot I get the following messages (debug verbosity was set to 3):

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xC8000
Flash chip found: Manufacturer ID: 98, Chip ID: 6B (Toshiba TC5832DC)
3 flash chips found. Total DiskOnChip size: 12 MiB
mtd: Giving out device 0 to DiskOnChip 2000
NFTL driver: nftlcore.c $Revision: 1.77 $, nftlmount.c $Revision: 1.20 $
NFTL_notify_add for DiskOnChip 2000
mtd->read = c0181a20, size = 12582912, erasesize = 8192
NFTL_setup
_DoC_WaitReady called for out-of-line wait
ANAND header found at 0xc000 in mtd0, but ECC read failed (err 1)
_DoC_WaitReady called for out-of-line wait
ANAND header found at 0xe000 in mtd0, but ECC read failed (err 1)
Could not find valid boot record
Could not mount NFTL device

----------

It seems to me that there's an ECC error when reading the DOC. With the
M-Systems provided driver, the chip works fine, so I suspect there's a
problem at the ECC computation. That would explain why, when formating
the chip with the linux-mtd tools it works (as Saul Thurrowgood
<saul@cvs.anu.edu.au> reported)

It would be interesting to test whether a chip formated with linux-mtd
tools works with the M-System provided driver. 

My DOC was formated using M-Systems tools and the partitions on it are
MS-DOS. For non-technical reasons I cannot reformat the chip.

Best Regards,
Alex.


David Woodhouse wrote:
> 
> saul@cvs.anu.edu.au said:
> >  I fixed it by formatting with nftl_format (also comes with MTD
> > source), providing it a 240k offset so it would not trash the BIOS at
> > the beginning of the chip (Ampro specific).
> 
> That's normally 48KiB for the standard on-device firmware, I think.
> 
> > Works fine! So, what's the difference between the two formats?!? Both
> > start at the exact same place on the DOC, as seen by running nftldump
> > before and after.
> 
> Please upgrade to the latest version from CVS (nftlmount.c v1.20). It'll be
> a lot more explicit about its reasons for rejecting any media headers which
> it finds.
> 
> --
> dwmw2
