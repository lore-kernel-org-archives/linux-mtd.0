Received: from mail-he1eur01on0136.outbound.protection.outlook.com
 ([104.47.0.136] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHTfH-0000mR-Tr
 for linux-mtd@lists.infradead.org; Mon, 27 Jun 2016 10:21:18 +0000
Received: from fihe3nok0735.emea.nsn-net.net (localhost [127.0.0.1])
 by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id u5RAKRXb015148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jun 2016 13:20:27 +0300
Received: from CNU418C7XK.nsn-intra.net ([10.154.155.220])
 by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id u5RAKRIA015081
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jun 2016 13:20:27 +0300
From: <marcin.krzeminski@nokia.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC 2/3] mtd: spi-nor: Read Mode byte implementation
Date: Mon, 27 Jun 2016 12:19:38 +0200
Message-ID: <1467022779-17489-3-git-send-email-marcin.krzeminski@nokia.com>
In-Reply-To: <1467022779-17489-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1467022779-17489-1-git-send-email-marcin.krzeminski@nokia.com>
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

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

DUAL/QUAD I/O modes often need an additional byte at first
read command to configure flash in continuous read mode.
Continuous read mode is not supported, but we need to send this
byte to flash anyway.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |  9 +++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 847db69..026544b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -164,6 +164,34 @@ static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
 	return 0;
 }
 
+#ifdef CONFIG_DUAL_QUAD_IO
+/*
+ * Read mode option, allows to continue
+ * fast reading without sending the command again.
+ * Could be used by the driver or this framework
+ * to speed up reading.
+ */
+static void spi_nor_read_mode(struct spi_nor *nor,
+		const struct flash_info *info)
+{
+	nor->read_mode_size = 0;
+	nor->read_mode_cmd = 0;
+
+	if (nor->flash_read == SPI_NOR_QUADIO
+		|| nor->flash_read == SPI_NOR_DUALIO) {
+
+		switch (JEDEC_MFR(info)) {
+		case SNOR_MFR_SPANSION:
+			nor->read_mode_size = 8;
+			nor->read_mode_cmd = SPANSION_CONTINUOUS_READ_MODE;
+		break;
+		default:
+			break;
+		}
+	}
+}
+#endif
+
 /*
  * Write status register 1 byte
  * Returns negative if error occurred.
@@ -1541,6 +1569,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	}
 
 	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
+#ifdef CONFIG_DUAL_QUAD_IO
+	spi_nor_read_mode(nor, info);
+#endif
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 652a8d2..78196a8 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -108,6 +108,11 @@
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
+#ifdef CONFIG_DUAL_QUAD_IO
+/* Spansion continuous read mode for Quad/Dual I/O reads */
+#define SPANSION_CONTINUOUS_READ_MODE 0xA0
+#endif
+
 enum read_mode {
 	SPI_NOR_NORMAL = 0,
 	SPI_NOR_FAST,
@@ -179,6 +184,10 @@ struct spi_nor {
 	bool			sst_write_second;
 	u32			flags;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
+#ifdef CONFIG_DUAL_QUAD_IO
+	u32			read_mode_size; /*read mode command size in bits */
+	u32			read_mode_cmd; /*read mode command */
+#endif
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-- 
2.7.4
