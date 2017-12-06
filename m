Received: from mail-co1nam03on0612.outbound.protection.outlook.com
 ([2a01:111:f400:fe48::612]
 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMUss-0001KT-Ve
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:16:52 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [RFC 04/10] mtd: spi-nor: Configure read latency for micron flashes
Date: Wed, 6 Dec 2017 13:45:35 +0530
Message-ID: <1512548141-3319-5-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Volatile Configuration Register[4:7] defines Number of read latency
i.e. dummy clock cycles. This patch program volatile configuration
register using READ VOLATILE CONFIGURATION REGISTER(85h) and
WRITE VOLATILE CONFIGURATION REGISTER(81h) command

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7d94874..dd1a771 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1638,6 +1638,31 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
+static int micron_dummy_config(struct spi_nor *nor, u8 num_wait_states,
+			       const struct flash_info *info)
+{
+	int ret;
+	u8 val;
+
+	ret = nor->read_reg(nor, SPINOR_OP_RD_VCR, &val, 1);
+	if (ret < 0) {
+		dev_err(nor->dev, "error %d reading CR\n", ret);
+		return ret;
+	}
+
+	val &= 0x0F;
+	val |= num_wait_states << 4;
+
+	ret = nor->write_reg(nor, SPINOR_OP_WD_VCR, &val, 1);
+	if (ret < 0) {
+		dev_err(nor->dev,
+			"error while writing configuration register\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
@@ -1772,6 +1797,10 @@ spi_nor_set_read_settings(struct spi_nor_read_command *read,
 	read->proto = proto;
 
 	switch (JEDEC_MFR(info)) {
+	case SNOR_MFR_MICRON:
+		read->dummy_config = micron_dummy_config;
+		break;
+
 	default:
 		read->dummy_config = NULL;
 		break;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 1f0a7fc..6c62aff 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -110,6 +110,8 @@
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
 #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
+#define SPINOR_OP_RD_VCR       0x85     /* Read VCR register */
+#define SPINOR_OP_WD_VCR       0x81     /* Write VCR register */
 
 /* Status Register bits. */
 #define SR_WIP			BIT(0)	/* Write in progress */
-- 
2.7.4
