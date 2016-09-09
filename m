Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biKYu-00017j-O5
 for linux-mtd@lists.infradead.org; Fri, 09 Sep 2016 12:05:43 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 4/9] mtd: nand: Add function to convert ONFI mode to
 data_interface
Date: Fri,  9 Sep 2016 14:05:07 +0200
Message-Id: <1473422712-12359-5-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1473422712-12359-1-git-send-email-s.hauer@pengutronix.de>
References: <1473422712-12359-1-git-send-email-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

onfi_init_data_interface() initializes a data interface with
values from a given ONFI mode.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/nand_timings.c | 16 ++++++++++++++++
 include/linux/mtd/nand.h        |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index 9af2ebc..ece4ff2 100644
--- a/drivers/mtd/nand/nand_timings.c
+++ b/drivers/mtd/nand/nand_timings.c
@@ -269,3 +269,19 @@ const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode)
 	return &onfi_sdr_timings[mode].timings.sdr;
 }
 EXPORT_SYMBOL(onfi_async_timing_mode_to_sdr_timings);
+
+/**
+ * onfi_init_data_interface - [NAND Interface] Initialize a data interface from
+ * given ONFI mode
+ * @iface: The data interface to be initialized
+ * @mode: The ONFI timing mode
+ */
+int onfi_init_data_interface(struct nand_data_interface *iface, int mode)
+{
+	if (mode < 0 || mode >= ARRAY_SIZE(onfi_sdr_timings))
+		return -EINVAL;
+
+	*iface = onfi_sdr_timings[mode];
+
+	return 0;
+}
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index f305bed..0044fac 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1104,6 +1104,8 @@ static inline int onfi_get_sync_timing_mode(struct nand_chip *chip)
 	return le16_to_cpu(chip->onfi_params.src_sync_timing_mode);
 }
 
+int onfi_init_data_interface(struct nand_data_interface *iface, int onfi_mode);
+
 /*
  * Check if it is a SLC nand.
  * The !nand_is_slc() can be used to check the MLC/TLC nand chips.
-- 
2.8.1
