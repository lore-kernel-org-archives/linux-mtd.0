Date: Tue, 11 Dec 2007 11:25:53 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dwmw2@infradead.org
Subject: [PATCH] [MTD][OneNAND] Get correct density from device ID
Message-ID: <20071211022553.GA477@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the higher bits for other purpose.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |   20 ++++++++++++++++----
 include/linux/mtd/onenand_regs.h   |    1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index b3ac172..18c79ee 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -170,6 +170,18 @@ static int onenand_buffer_address(int dataram1, int sectors, int count)
 }
 
 /**
+ * onenand_get_density - [DEFAULT] Get OneNAND density
+ * @param dev_id	OneNAND device ID
+ *
+ * Get OneNAND density from device ID
+ */
+static inline int onenand_get_density(int dev_id)
+{
+	int density = dev_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	return (density & ONENAND_DEVICE_DENSITY_MASK);
+}
+
+/**
  * onenand_command - [DEFAULT] Send command to OneNAND device
  * @param mtd		MTD device structure
  * @param cmd		the command to be sent
@@ -2149,7 +2161,7 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 
 	*retlen = 0;
 
-	density = this->device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	density = onenand_get_density(this->device_id);
 	if (density < ONENAND_DEVICE_DENSITY_512Mb)
 		otp_pages = 20;
 	else
@@ -2340,7 +2352,7 @@ static void onenand_check_features(struct mtd_info *mtd)
 	unsigned int density, process;
 
 	/* Lock scheme depends on density and process */
-	density = this->device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	density = onenand_get_density(this->device_id);
 	process = this->version_id >> ONENAND_VERSION_PROCESS_SHIFT;
 
 	/* Lock scheme */
@@ -2389,7 +2401,7 @@ static void onenand_print_device_info(int device, int version)
         vcc = device & ONENAND_DEVICE_VCC_MASK;
         demuxed = device & ONENAND_DEVICE_IS_DEMUX;
         ddp = device & ONENAND_DEVICE_IS_DDP;
-        density = device >> ONENAND_DEVICE_DENSITY_SHIFT;
+        density = onenand_get_density(device);
         printk(KERN_INFO "%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n",
                 demuxed ? "" : "Muxed ",
                 ddp ? "(DDP)" : "",
@@ -2481,7 +2493,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	this->device_id = dev_id;
 	this->version_id = ver_id;
 
-	density = dev_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	density = onenand_get_density(dev_id);
 	this->chipsize = (16 << density) << 20;
 	/* Set density mask. it is used for DDP */
 	if (ONENAND_IS_DDP(this))
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index c46161f..d1b310c 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -67,6 +67,7 @@
 /*
  * Device ID Register F001h (R)
  */
+#define ONENAND_DEVICE_DENSITY_MASK	(0xf)
 #define ONENAND_DEVICE_DENSITY_SHIFT	(4)
 #define ONENAND_DEVICE_IS_DDP		(1 << 3)
 #define ONENAND_DEVICE_IS_DEMUX		(1 << 2)
-- 
1.5.0.6
