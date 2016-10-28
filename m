Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0DlU-0006Qx-3V
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 20:28:38 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/5] mtd: use ONFI bad blocks per LUN to calculate UBI bad
 PEB limit
Date: Fri, 28 Oct 2016 15:27:39 -0500
Message-ID: <1477686464-7437-1-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For ONFI-compliant NAND devices, the ONFI parameters report the maximum number
of bad blocks per LUN that will be encountered over the lifetime of the device,
so we can use that information to get a more accurate (and smaller) value for
the UBI bad PEB limit.

The ONFI parameter "maxiumum number of bad blocks per LUN" is the max number of
bad blocks that each individual LUN will ever ecounter. It is not the number of
bad blocks to reserve for the nand device per LUN in the device.

This means that in the worst case a UBI device spanning X LUNs will encounter
"maximum number of bad blocks per LUN" * X bad blocks. The implementation in
this patch assumes this worst case and allocates bad block accordingly.

These patches are ordered in terms of their dependencies, but ideally, all 5
would need to be applied for this to work as intended.

v1:
 * Changed commit message to address concerns from v1[1] about this patch set
   making best case assumptions.
v2:
 * Provided helper function for _max_bad_blocks
 * Two new patches
 * First new patch adds bb_per_lun and blocks_per_lun to nand_chip struct
 * Second new patch sets the new fields during nand_flash_detect_onfi
 * Max bad blocks calculation now uses the new nand_chip fields

[1]
http://lkml.iu.edu/hypermail/linux/kernel/1505.1/04822.html

Jeff Westfahl (2):
  mtd: introduce function max_bad_blocks
  mtd: ubi: use 'max_bad_blocks' to compute bad_peb_limit if available

Zach Brown (3):
  mtd: nand: Add bb_per_lun and blocks_per_lun fields to nand_chip
  mtd: nand: implement 'max_bad_blocks' mtd function
  mtd: nand: set bb_per_lun and blocks_per_lun for ONFI compliant chips

 drivers/mtd/mtdpart.c        | 13 +++++++++++++
 drivers/mtd/nand/nand_base.c | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c      |  4 ++++
 include/linux/mtd/mtd.h      | 11 +++++++++++
 include/linux/mtd/nand.h     |  5 +++++
 5 files changed, 73 insertions(+)

-- 
2.7.4
