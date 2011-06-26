Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QasAy-0006bD-MM
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 16:27:14 +0000
Received: by wyf23 with SMTP id 23so3462602wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 09:27:11 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] add NAND_BUSWIDTH_AUTO
Date: Sun, 26 Jun 2011 18:26:56 +0200
Message-Id: <1309105616-3609-6-git-send-email-matthieu.castet@parrot.com>
In-Reply-To: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nand read id and Read Parameter (onfi) return data on low 8 bits.
So if the driver start in 8 bit mode, it is possible to detect nand
buswidth, and configure the controller to the correct buswidth
after nand_scan_ident.

This is a new flag, so only driver that know what there are doing
will use it.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    7 ++++++-
 include/linux/mtd/nand.h     |    5 +++++
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e7c8bdd..34f441e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3096,11 +3096,16 @@ ident_done:
 			break;
 	}
 
+	if (chip->options & NAND_BUSWIDTH_AUTO) {
+		BUG_ON(chip->options & NAND_BUSWIDTH_16);
+		chip->options |= busw;
+		nand_set_defaults(chip, busw);
+	}
 	/*
 	 * Check, if buswidth is correct. Hardware drivers should set
 	 * chip correct !
 	 */
-	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
+	else if (busw != (chip->options & NAND_BUSWIDTH_16)) {
 		printk(KERN_INFO "NAND device: Manufacturer ID:"
 		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
 		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c2b9ac4..cdda28a 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -240,6 +240,11 @@ typedef enum {
 #define NAND_USE_FLASH_BBT_NO_OOB	0x00800000
 /* Create an empty BBT with no vendor information if the BBT is available */
 #define NAND_CREATE_EMPTY_BBT		0x01000000
+/* autodetect nand buswidth with readid. This suppose the driver will
+ * configure the hardware has 8 bit in nand_scan_ident, and update
+ * configuration before calling nand_scan_tail
+ */
+#define NAND_BUSWIDTH_AUTO			0x02000000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.7.5.4
