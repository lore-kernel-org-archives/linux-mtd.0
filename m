Received: from mlbmx2.corp.harris.com ([137.237.90.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RSGt-0004rI-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 06:40:47 +0100
Message-ID: <8D4C69676E66D511A1CB00508BBBB1921BCE94@ranmx1.ran.harris.com>
From: "Walser, Martin" <mwalser@harris.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: unable to mount Disk on Chip -> unknown partition table
Date: Tue, 31 Jul 2001 01:46:00 -0400
MIME-Version: 1.0
Content-Type: text/plain
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

When booting, the following message is shown:

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0x50000000
DiskOnChip Millennium found at address 0x50000000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 Mb
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
Partition check:
 nftla: unknown partition table
....

That's the result of theses steps:

1.	./nftl_format /dev/mtd0

2.	at startup, th message "unknown partition table" is shown

3.	cfdisk /dev/nftla -> new partition /dev/nftla1

4.	rebooting the system always shows the message "unknown partition table"


mke2fs on /dev/nftla1 results in the following message:

bash# ./mke2fs /dev/nftla1
mke2fs 1.10, 24-Apr-97 for EXT2 FS 0.5b, 95/08/09
/dev/nftla1: Invalid argument while setting up superblock

I don't know what's wrong. Any ideas?

best regards
Martin
