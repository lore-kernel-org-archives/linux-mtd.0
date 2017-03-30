Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVG5-0003tP-Cb
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:16:43 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 34/37] mtd: nand: allow drivers to request minimum
 alignment for passed buffer
Date: Thu, 30 Mar 2017 17:15:05 +0900
Message-Id: <1490861708-27813-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In some cases, nand_do_{read,write}_ops is passed with unaligned
ops->datbuf.  Drivers using DMA will be unhappy about unaligned
buffer.

The new struct member, buf_align, represents the minimum alignment
the driver require for the buffer.  If the buffer passed from the
upper MTD layer does not have enough alignment, nand_do_*_ops will
use bufpoi.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I was hit by this problem when I ran
  # mount -t jffs2 /dev/mtdblock*  /mnt

The buffer passed to nand_do_*_ops has 4 byte offset.
The Denali IP cannot do DMA to/from this buffer because it
requires 16 byte alignment for DMA.


Changes in v3:
  - Newly added

Changes in v2: None

 drivers/mtd/nand/nand_base.c | 12 ++++++++----
 include/linux/mtd/nand.h     |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e9d3195..b528ffa 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1953,9 +1953,10 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 		if (!aligned)
 			use_bufpoi = 1;
-		else if (chip->options & NAND_USE_BOUNCE_BUFFER)
-			use_bufpoi = !virt_addr_valid(buf);
-		else
+		else if (chip->options & NAND_USE_BOUNCE_BUFFER) {
+			use_bufpoi = !virt_addr_valid(buf) ||
+			       !IS_ALIGNED((unsigned long)buf, chip->buf_align);
+		} else
 			use_bufpoi = 0;
 
 		/* Is the current page in the buffer? */
@@ -2810,7 +2811,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		if (part_pagewr)
 			use_bufpoi = 1;
 		else if (chip->options & NAND_USE_BOUNCE_BUFFER)
-			use_bufpoi = !virt_addr_valid(buf);
+			use_bufpoi = !virt_addr_valid(buf) ||
+			      !IS_ALIGNED((unsigned long)buf, chip->buf_align);
 		else
 			use_bufpoi = 0;
 
@@ -3426,6 +3428,8 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 		nand_hw_control_init(chip->controller);
 	}
 
+	if (!chip->buf_align)
+		chip->buf_align = 1;
 }
 
 /* Sanitize ONFI strings so we can safely print them */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 69cccd1..2ae781e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -750,6 +750,7 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buffers:		buffer structure for read/write
+ * @buf_align:		minimum buffer alignment required by a platform
  * @hwcontrol:		platform-specific hardware control structure
  * @erase:		[REPLACEABLE] erase function
  * @scan_bbt:		[REPLACEABLE] function to scan bad block table
@@ -901,6 +902,7 @@ struct nand_chip {
 
 	struct nand_ecc_ctrl ecc;
 	struct nand_buffers *buffers;
+	unsigned long buf_align;
 	struct nand_hw_control hwcontrol;
 
 	uint8_t *bbt;
-- 
2.7.4
