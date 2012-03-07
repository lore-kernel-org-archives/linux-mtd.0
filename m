Received: from eu1sys200aog106.obsmtp.com ([207.126.144.121])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6X-0006gU-LO
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:27 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/18] fsmc/nand: Access the NAND device word by word whenever
 possible
Date: Wed, 7 Mar 2012 17:01:05 +0530
Message-ID: <c1ffc4b981e17e123239d1f7f779c9e1d6e2a35f.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The default way of accessing nand device is using the nand width. This means
that 8bit devices are using u8 * and 16bit devices are accessed using u16 *.

This results in a non-optimal performance since the FSMC is designed to
translate the normal word accesses into device width based accesses. This patch
implements read_buf and write_buf callbacks using word by word accesses.

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
Reviewed-by: Viresh Kumar <viresh.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   55 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/fsmc.h     |    6 ++++
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1f00b37..3828279 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -692,6 +692,52 @@ static int count_written_bits(uint8_t *buff, int size, int max_bits)
 }
 
 /*
+ * fsmc_write_buf - write buffer to chip
+ * @mtd:	MTD device structure
+ * @buf:	data buffer
+ * @len:	number of bytes to write
+ */
+static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *chip = mtd->priv;
+
+	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
+			IS_ALIGNED(len, sizeof(uint32_t))) {
+		uint32_t *p = (uint32_t *)buf;
+		len = len >> 2;
+		for (i = 0; i < len; i++)
+			writel(p[i], chip->IO_ADDR_W);
+	} else {
+		for (i = 0; i < len; i++)
+			writeb(buf[i], chip->IO_ADDR_W);
+	}
+}
+
+/*
+ * fsmc_read_buf - read chip data into buffer
+ * @mtd:	MTD device structure
+ * @buf:	buffer to store date
+ * @len:	number of bytes to read
+ */
+static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *chip = mtd->priv;
+
+	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
+			IS_ALIGNED(len, sizeof(uint32_t))) {
+		uint32_t *p = (uint32_t *)buf;
+		len = len >> 2;
+		for (i = 0; i < len; i++)
+			p[i] = readl(chip->IO_ADDR_R);
+	} else {
+		for (i = 0; i < len; i++)
+			buf[i] = readb(chip->IO_ADDR_R);
+	}
+}
+
+/*
  * fsmc_read_page_hwecc
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -993,6 +1039,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (pdata->width == FSMC_NAND_BW16)
 		nand->options |= NAND_BUSWIDTH_16;
 
+	/*
+	 * use customized (word by word) version of read_buf, write_buf if
+	 * access_with_dev_width is reset supported
+	 */
+	if (pdata->mode == USE_WORD_ACCESS) {
+		nand->read_buf = fsmc_read_buf;
+		nand->write_buf = fsmc_write_buf;
+	}
+
 	fsmc_nand_setup(regs, host->bank, nand->options & NAND_BUSWIDTH_16,
 			host->dev_timings);
 
diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index c4ac07a..1edd2b3 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -141,6 +141,11 @@ struct fsmc_nand_timings {
 	uint8_t tset;
 };
 
+enum access_mode {
+	USE_DMA_ACCESS = 1,
+	USE_WORD_ACCESS,
+};
+
 /**
  * fsmc_nand_platform_data - platform specific NAND controller config
  * @partitions: partition table for the platform, use a default fallback
@@ -164,6 +169,7 @@ struct fsmc_nand_platform_data {
 	/* CLE, ALE offsets */
 	unsigned long           cle_off;
 	unsigned long           ale_off;
+	enum access_mode	mode;
 
 	void			(*select_bank)(uint32_t bank, uint32_t busw);
 };
-- 
1.7.0.4
