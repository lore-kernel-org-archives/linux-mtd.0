Received: from ipmail03.adl6.internode.on.net ([203.16.214.141])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTCEz-0004x0-7B
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 10:38:53 +0000
Message-ID: <4B470B30.6060202@elphinstone.net>
Date: Fri, 08 Jan 2010 21:38:40 +1100
From: Mark Ware <mware@elphinstone.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip recursive lock problem
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to update an old powerpc based board from 2.4.18 to something modern (2.6.31) and I'm having some issues with the diskonchip device (64Mb DOC2000).  After forcing the use of the generic nand_read/write_oob_std functions from nand_base.c instead of nand_read/write_syndrome (as suggested in [1]) the device is detected correctly.

My main problem is a deadlock caused by an attempt to obtain the mtd_table_mutex twice.  I have attached the boot messages, including lockdep output and backtrace below.

The regression appears to be caused by 8022c13c27b822cf22f13df10b42aae89cd56bf0 - "mtd: blkdevs: do not forget to get MTD devices".  Once reverted, the boot is able to continue and the device *appears* to work correctly.  The above commit fixes a real problem though and I'm not familiar enough with the MTD code to know how best to resolve this locking problem.

Any help/suggestions would be appreciated.

Regards,
Mark

[1] http://www.infradead.org/pipermail/linux-mtd/2007-February/017354.html

DOC related boot log:

Using configured DiskOnChip probe address 0xf02c0000
DiskOnChip found at 0xf02c0000
NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MiB 3,3V 8-bit)
2 NAND chips detected
Found DiskOnChip ANAND Media Header at 0xc000
Found DiskOnChip ANAND Media Header at 0x10000
    DataOrgID        = ANAND
    NumEraseUnits    = 4093
    FirstPhysicalEUN = 3
    FormattedSize    = 65683456
    UnitSizeFactor   = 255
NFTL: cannot calculate a geometry to match size of 0x1f520.
NFTL: using C:1002 H:16 S:8 (== 0x1f500 sects)

=============================================
[ INFO: possible recursive locking detected ]
2.6.31 #124
---------------------------------------------
swapper/1 is trying to acquire lock:
 (mtd_table_mutex){+.+.+.}, at: [<c0185b10>] get_mtd_device+0x2c/0x144

but task is already holding lock:
 (mtd_table_mutex){+.+.+.}, at: [<c0185ec8>] add_mtd_device+0x84/0x2b0

other info that might help us debug this:
2 locks held by swapper/1:
 #0:  (mtd_table_mutex){+.+.+.}, at: [<c0185ec8>] add_mtd_device+0x84/0x2b0
 #1:  (&bdev->bd_mutex){+.+...}, at: [<c00ad264>] __blkdev_get+0x50/0x32c

stack backtrace:
Call Trace:
[c3829c80] [c00088cc] show_stack+0x4c/0x14c (unreliable)
[c3829cc0] [c0046b40] __lock_acquire+0x14b0/0x156c
[c3829d20] [c0046c78] lock_acquire+0x7c/0x98
[c3829d50] [c028b754] mutex_lock_nested+0x54/0x2b0
[c3829db0] [c0185b10] get_mtd_device+0x2c/0x144
[c3829dc0] [c0189c9c] blktrans_open+0x30/0xd4
[c3829de0] [c00ad2c0] __blkdev_get+0xac/0x32c
[c3829e20] [c00cba5c] register_disk+0xec/0x16c
[c3829e50] [c012c550] add_disk+0xd0/0x120
[c3829e80] [c0189bdc] add_mtd_blktrans_dev+0x270/0x290
[c3829ea0] [c018a87c] nftl_add_mtd+0x17c/0x1b0
[c3829ec0] [c0189268] blktrans_notify_add+0x40/0x80
[c3829ee0] [c018608c] add_mtd_device+0x248/0x2b0
[c3829f00] [c036f128] nftl_scan_bbt+0x37c/0x3b4
[c3829f70] [c019d524] nand_scan_tail+0x594/0x5a8
[c3829f90] [c036ead0] doc_probe+0x60c/0x660
[c3829fb0] [c036eba4] init_nanddoc+0x80/0xe8
[c3829fc0] [c000391c] do_one_initcall+0x64/0x1fc
[c3829fe0] [c035e1d4] kernel_init+0xb4/0x124
[c3829ff0] [c0010e80] kernel_thread+0x4c/0x68
