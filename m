Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ROPf5-0000fm-00
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2011 08:07:04 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH v2 14/16] mtd/docg3: add suspend and resume
Date: Thu, 10 Nov 2011 09:05:40 +0100
Message-Id: <1320912342-30147-15-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add functions to powerdown and powerup from suspend, in
order to save power.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   75 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/devices/docg3.h |    6 +++
 2 files changed, 80 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 26cc179..d94c759 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -45,7 +45,6 @@
  * As no specification is available from M-Systems/Sandisk, this drivers lacks
  * several functions available on the chip, as :
  *  - IPL write
- *  - powerdown / powerup
  *
  * The bus data width (8bits versus 16bits) is not handled (if_cfg flag), and
  * the driver assumes a 16bits data bus.
@@ -1756,6 +1755,78 @@ static void doc_release_device(struct mtd_info *mtd)
 }
 
 /**
+ * docg3_resume - Awakens docg3 floor
+ * @pdev: platfrom device
+ *
+ * Returns 0 (always successfull)
+ */
+static int docg3_resume(struct platform_device *pdev)
+{
+	int i;
+	struct mtd_info **docg3_floors, *mtd;
+	struct docg3 *docg3;
+
+	docg3_floors = platform_get_drvdata(pdev);
+	mtd = docg3_floors[0];
+	docg3 = mtd->priv;
+
+	doc_dbg("docg3_resume()\n");
+	for (i = 0; i < 12; i++)
+		doc_readb(docg3, DOC_IOSPACE_IPL);
+	return 0;
+}
+
+/**
+ * docg3_suspend - Put in low power mode the docg3 floor
+ * @pdev: platform device
+ * @state: power state
+ *
+ * Shuts off most of docg3 circuitery to lower power consumption.
+ *
+ * Returns 0 if suspend succeeded, -EIO if chip refused suspend
+ */
+static int docg3_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	int floor, i;
+	struct mtd_info **docg3_floors, *mtd;
+	struct docg3 *docg3;
+	u8 ctrl, pwr_down;
+
+	docg3_floors = platform_get_drvdata(pdev);
+	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
+		mtd = docg3_floors[floor];
+		if (!mtd)
+			continue;
+		docg3 = mtd->priv;
+
+		doc_writeb(docg3, floor, DOC_DEVICESELECT);
+		ctrl = doc_register_readb(docg3, DOC_FLASHCONTROL);
+		ctrl &= ~DOC_CTRL_VIOLATION & ~DOC_CTRL_CE;
+		doc_writeb(docg3, ctrl, DOC_FLASHCONTROL);
+
+		for (i = 0; i < 10; i++) {
+			usleep_range(3000, 4000);
+			pwr_down = doc_register_readb(docg3, DOC_POWERMODE);
+			if (pwr_down & DOC_POWERDOWN_READY)
+				break;
+		}
+		if (pwr_down & DOC_POWERDOWN_READY) {
+			doc_dbg("docg3_suspend(): floor %d powerdown ok\n",
+				floor);
+		} else {
+			doc_err("docg3_suspend(): floor %d powerdown failed\n",
+				floor);
+			return -EIO;
+		}
+	}
+
+	mtd = docg3_floors[0];
+	docg3 = mtd->priv;
+	doc_set_asic_mode(docg3, DOC_ASICMODE_POWERDOWN);
+	return 0;
+}
+
+/**
  * doc_probe - Probe the IO space for a DiskOnChip G3 chip
  * @pdev: platform device
  *
@@ -1860,6 +1931,8 @@ static struct platform_driver g3_driver = {
 		.name	= "docg3",
 		.owner	= THIS_MODULE,
 	},
+	.suspend	= docg3_suspend,
+	.resume		= docg3_resume,
 	.remove		= __exit_p(docg3_release),
 };
 
diff --git a/drivers/mtd/devices/docg3.h b/drivers/mtd/devices/docg3.h
index 33db727..cd70b18 100644
--- a/drivers/mtd/devices/docg3.h
+++ b/drivers/mtd/devices/docg3.h
@@ -127,6 +127,7 @@
 
 #define DOC_ASICMODECONFIRM		0x1072
 #define DOC_CHIPID_INV			0x1074
+#define DOC_POWERMODE			0x107c
 
 /*
  * Flash sequences
@@ -239,6 +240,11 @@
 #define DOC_READADDR_ADDR_MASK		0x1fff
 
 /*
+ * Flash register : DOC_POWERMODE
+ */
+#define DOC_POWERDOWN_READY		0x80
+
+/*
  * Status of erase and write operation
  */
 #define DOC_PLANES_STATUS_FAIL		0x01
-- 
1.7.5.4
