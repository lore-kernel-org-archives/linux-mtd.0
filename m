Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTri-00070I-4v
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:47:29 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 01/37] mtd: nand: relax ecc.read_page() return value for
 uncorrectable ECC
Date: Thu, 30 Mar 2017 15:45:47 +0900
Message-Id: <1490856383-31560-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comment for ecc.read_page() requires that it should return
"0 if bitflips uncorrectable".

Actually, drivers could return positive values when uncorrectable
bitflips occur.  For example, nand_read_page_swecc() is the case.
If ecc.correct() returns -EBADMSG for the first ECC sector, and
a positive value for the second one, nand_read_page_swecc() returns
a positive max_bitflips and increments ecc_stats.failed for the same
page.

The requirement can be relaxed by tweaking nand_do_read_ops().
Move the max_bitflips calculation below the retry.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---

Changes in v3:
 - Newly added

Changes in v2: None

 drivers/mtd/nand/nand_base.c | 3 +--
 include/linux/mtd/nand.h     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e13f959..f828ad7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1993,8 +1993,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				break;
 			}
 
-			max_bitflips = max_t(unsigned int, max_bitflips, ret);
-
 			/* Transfer not aligned data */
 			if (use_bufpoi) {
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
@@ -2045,6 +2043,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			}
 
 			buf += bytes;
+			max_bitflips = max_t(unsigned int, max_bitflips, ret);
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9591e0f..69cccd1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -525,7 +525,7 @@ static inline void nand_hw_control_init(struct nand_hw_control *nfc)
  *			out-of-band data).
  * @read_page:	function to read a page according to the ECC generator
  *		requirements; returns maximum number of bitflips corrected in
- *		any single ECC step, 0 if bitflips uncorrectable, -EIO hw error
+ *		any single ECC step, -EIO hw error
  * @read_subpage:	function to read parts of the page covered by ECC;
  *			returns same as read_page()
  * @write_subpage:	function to write parts of the page covered by ECC.
-- 
2.7.4
