Received: from web9903.mail.yahoo.com ([216.136.129.246])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A83al-0005Ga-Og
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 21:10:28 +0100
Message-ID: <20031010200928.23462.qmail@web9903.mail.yahoo.com>
Date: Fri, 10 Oct 2003 13:09:28 -0700 (PDT)
From: Slim <slimaffi@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1A7v07-0003hH-Sp@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The problem is elsewhere. Check the driver is loaded and present in
> /proc/devices. Check it's actually detected the NFTL on the
> DiskOnChip

Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
  7 vcs
 10 misc
 29 fb
 36 netlink
 90 mtd
128 ptm
129 ptm
136 pts
137 pts
162 raw

Block devices:
  1 ramdisk
  2 fd
  3 ide0
  9 md
 12 unnamed
 14 unnamed
 31 mtdblock
 38 unnamed
 39 unnamed
 44 ftl
 93 nftl
 94 inftl

> -- what messages did you get at boot or when you loaded the modules?

$Id: ftl.c,v 1.52 2003/08/11 09:00:44 dwmw2 Exp $
NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34
$
INFTL: inftlcore.c $Revision: 1.14 $, inftlmount.c $Revision: 1.12 $
DiskOnChip 2000 found at address 0xC8000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB
3,3V)
3 flash chips found. Total DiskOnChip size: 96 MiB
mtd: Giving out device 0 to DiskOnChip 2000
INFTL: could not find valid boot record?
INFTL: could not mount device
NFTL: add_mtd for DiskOnChip 2000
Could not find valid boot record
NFTL: could not mount device
ftl_cs: FTL header not found.
Ignoring DiskOnChip 2000 at 0xCA000 - already configured
Ignoring DiskOnChip 2000 at 0xCC000 - already configured
Ignoring DiskOnChip 2000 at 0xCE000 - already configured

Is the invalid boot record the problem.  This sequency only happens
after I issue the root/chainloader/boot sequence from grub.

John

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com
