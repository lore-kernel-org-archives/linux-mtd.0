Received: from cindrpmx1.corp.harris.com ([137.237.241.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161UjD-0001bD-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 15:34:59 +0000
Message-ID: <8D4C69676E66D511A1CB00508BBBB192157886@ranmx1.ran.harris.com>
From: "Fend, Matthias" <mfend@harris.com>
To: 'linux mtd' <linux-mtd@lists.infradead.org>
Subject: doc 2000 unknown partition table
Date: Wed, 7 Nov 2001 10:43:33 -0500 
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

hello im trying to use a DoC 2000 (16MB) on a MPC860 board running linux (2-4-4)

i did all the nftl-format stuff as advised in older messages / howtos 


but all i get is this ugly message

<snip>

Using configured DiskOnChip probe address 0x50000000
DiskOnChip 2000 found at address 0x50000000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
1 flash chips found. Total DiskOnChip size: 16 MiB
mtd: Giving out device 0 to DiskOnChip 2000
NFTL driver: nftlcore.c $Revision: 1.83 $, nftlmount.c $Revision: 1.23 $
Partition check:
 nftla: unknown partition table

<snap>

also if i try toi use fdisk

<snip>
Calling ioctl() to re-read partition table.
 nftla: unknown partition table
<snap>

any ideas

thx
matthias
