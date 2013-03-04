Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYS2-0004H1-R3
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:27 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 12/12] mtd: nand: provision full ID support
Date: Mon,  4 Mar 2013 18:42:29 +0200
Message-Id: <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/nand.h |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7af6600..951ea0d 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -559,7 +559,9 @@ struct nand_chip {
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
  * @name:	Identify the device type
- * @dev_id:	device ID code
+ * @mfr_id:     manufecturer ID part of the full chip ID array (byte 0)
+ * @dev_id:     device ID part of the full chip ID array (byte 1)
+ * @id:         full device ID array
  * @pagesize:	Pagesize in bytes. Either 256 or 512 or 0
  *		If the pagesize is 0, then the real pagesize
  *		and the eraseize are determined from the
@@ -570,7 +572,13 @@ struct nand_chip {
  */
 struct nand_flash_dev {
 	char *name;
-	int dev_id;
+	union {
+		struct {
+			uint8_t mfr_id;
+			uint8_t dev_id;
+		};
+		uint8_t id[8];
+	};
 	unsigned long pagesize;
 	unsigned long chipsize;
 	unsigned long erasesize;
-- 
1.7.10.4
