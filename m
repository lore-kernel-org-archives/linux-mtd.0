Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d9UxO-0001Sm-9A
 for linux-mtd@lists.infradead.org; Sat, 13 May 2017 11:11:32 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] mtd: adjust kernel-docs to avoid Sphinx/kerneldoc warnings
Date: Sat, 13 May 2017 08:10:57 -0300
Message-Id: <9e3f71326f92084e2279f2156a8f5f76adcfdd69.1494672881.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494672881.git.mchehab@s-opensource.com>
References: <cover.1494672881.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494672881.git.mchehab@s-opensource.com>
References: <cover.1494672881.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

./drivers/mtd/nand/nand_bbt.c:1: warning: no structured comments found
./include/linux/mtd/nand.h:785: ERROR: Unexpected indentation.
./drivers/mtd/nand/nand_base.c:449: WARNING: Definition list ends without a blank line; unexpected unindent.
./drivers/mtd/nand/nand_base.c:1161: ERROR: Unexpected indentation.
./drivers/mtd/nand/nand_base.c:1162: WARNING: Block quote ends without a blank line; unexpected unindent.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/driver-api/mtdnand.rst | 3 ---
 drivers/mtd/nand/nand_base.c         | 7 +++++--
 include/linux/mtd/nand.h             | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
index e670f8b15a79..4fe3bf00299b 100644
--- a/Documentation/driver-api/mtdnand.rst
+++ b/Documentation/driver-api/mtdnand.rst
@@ -970,9 +970,6 @@ hints" for an explanation.
 .. kernel-doc:: drivers/mtd/nand/nand_base.c
    :export:
 
-.. kernel-doc:: drivers/mtd/nand/nand_bbt.c
-   :export:
-
 .. kernel-doc:: drivers/mtd/nand/nand_ecc.c
    :export:
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b0524f8accb6..c8988c01e0d7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -442,10 +442,12 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
  * specify how to write bad block markers to OOB (chip->block_markbad).
  *
  * We try operations in the following order:
+ *
  *  (1) erase the affected block, to allow OOB marker to be written cleanly
  *  (2) write bad block marker to OOB area of affected block (unless flag
  *      NAND_BBT_NO_OOB_BBM is present)
  *  (3) update the BBT
+ *
  * Note that we retain the first error encountered in (2) or (3), finish the
  * procedures, and dump the error in the end.
 */
@@ -1155,9 +1157,10 @@ int nand_reset(struct nand_chip *chip, int chipnr)
  * @mtd: mtd info
  * @ofs: offset to start unlock from
  * @len: length to unlock
- * @invert: when = 0, unlock the range of blocks within the lower and
+ * @invert:
+ *        - when = 0, unlock the range of blocks within the lower and
  *                    upper boundary address
- *          when = 1, unlock the range of blocks outside the boundaries
+ *        - when = 1, unlock the range of blocks outside the boundaries
  *                    of the lower and upper boundary address
  *
  * Returs unlock status.
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9591e0fbe5bd..3d5b20379ba3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -779,7 +779,7 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  *			Minimum amount of bit errors per @ecc_step_ds guaranteed
  *			to be correctable. If unknown, set to zero.
  * @ecc_step_ds:	[INTERN] ECC step required by the @ecc_strength_ds,
- *                      also from the datasheet. It is the recommended ECC step
+ *			also from the datasheet. It is the recommended ECC step
  *			size, if known; if unknown, set to zero.
  * @onfi_timing_mode_default: [INTERN] default ONFI timing mode. This field is
  *			      set to the actually used ONFI mode if the chip is
-- 
2.9.3
