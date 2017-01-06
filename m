Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPZzI-00032X-DJ
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 19:15:42 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/5] mtd: use ONFI bad blocks per LUN to calculate UBI bad
 PEB limit
Date: Fri, 6 Jan 2017 13:14:41 -0600
Message-ID: <1483730086-26706-1-git-send-email-zach.brown@ni.com>
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

v2:
 * Changed commit message to address concerns from v1[1] about this patch set
   making best case assumptions.
v3:
 * Provided helper function for _max_bad_blocks
 * Two new patches
 * First new patch adds bb_per_lun and blocks_per_lun to nand_chip struct
 * Second new patch sets the new fields during nand_flash_detect_onfi
 * Max bad blocks calculation now uses the new nand_chip fields
v4:
 * Changed bb_per_lun and blocks_per_lun to bb_per_die and blocks_per_die
 * Corrected type of bb_per_die and blocks_per_die from little endian to host
   unsigned int
v5:
 * Changed bb_per_die to max_bb_per_die
 * Fixed spacing style issue
v6:
 * Moved bounds checking from "part_max_bad_blocks" to "mtd_max_bad_blocks"
 * Added check for 'ofs < 0' to bounds checking mentioned in change above.
 * Moved assignment of slave->mtd._max_bad_blocks up to be next to the other
   bad-block-related assignments
 * s/lun/die in "nand_max_bad_blocks"
 * Fixed comment style in "nand_max_bad_blocks"
 * In "get_bad_peb_limit" made call to "mtd_max_bad_blocks" occurr only if
   !max_beb_per1024. This makes the ordering the three different ways to set
   the bad_peb_limit: cmdline > Kconfig > automatic with mtd_max_bad_blocks
v7:
 * Moved mtd_max_bad_blocks function to be with other static inline functions
   so it would not look like the odd man out.


Jeff Westfahl (2):
  mtd: introduce function max_bad_blocks
  mtd: ubi: use 'max_bad_blocks' to compute bad_peb_limit if available

Zach Brown (3):
  mtd: nand: Add max_bb_per_die and blocks_per_die fields to nand_chip
  mtd: nand: implement 'max_bad_blocks' mtd function
  mtd: nand: set max_bb_per_die and blocks_per_die for ONFI compliant
    chips

 drivers/mtd/mtdpart.c        | 10 ++++++++++
 drivers/mtd/nand/nand_base.c | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c      | 13 +++++++++++--
 include/linux/mtd/mtd.h      | 13 +++++++++++++
 include/linux/mtd/nand.h     |  5 +++++
 5 files changed, 79 insertions(+), 2 deletions(-)

-- 
2.7.4
