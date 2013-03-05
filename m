Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCt0F-000356-F5
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 14:38:05 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 2/2] mtd: nand: provision full ID support
Date: Tue,  5 Mar 2013 16:39:36 +0200
Message-Id: <1362494376-1588-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362494376-1588-1-git-send-email-dedekind1@gmail.com>
References: <1362494376-1588-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Up until now we identified NAND chips by the 'device ID' part of the full chip
ID array, which is the second full ID array byte. However, the newest flashes
use the same device ID for chips with identical page and eraseblock sizes, but
different OOB sizes. And unfortunately, it is not clear if there is a
"standard" way to fetch the OOB size from chip's full ID array. Here is an
example:

Toshiba TC58NVG2S0F: 0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08
Toshiba TC58NVG3S0F: 0x98, 0xd3, 0x90, 0x26, 0x76, 0x15, 0x02, 0x08

The first one is a 512MiB NAND chip with 4KiB NAND pages, 256KiB eraseblock
size and 224 bytes OOB. The second one is a 1GiB NAND chip with the same page
and eraseblock sizes, but with 232 bytes OOB.

This means that we have to store full ID in our NAND flashes table in order to
distinguish between these 2.

This patch adds the 'id[8]' field to the 'struct nand_flash_dev' structure, and
it makes it to be a part of anonymous union, where the second member is a
structure containing the 'mfr_id' and 'dev_id' bytes. The union makes sure that
'mfr_id' refers the same RAM address as 'id[0]' and 'dev_id' refers the same
RAM address as 'id[1]'. The only motivation for the union is an assumption that
'type->dev_id' is more readable than 'type->id[1]'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/nand.h |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7ecc6d8..370f4f0 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -567,6 +567,11 @@ struct nand_chip {
  * struct nand_flash_dev - NAND Flash Device ID Structure
  * @name: a human-readable name of the NAND chip
  * @dev_id: the device ID (the second byte of the full chip ID array)
+ * @mfr_id: manufecturer ID part of the full chip ID array (refers the same
+ *          memory address as @id[0])
+ * @dev_id: device ID part of the full chip ID array (refers the same memory
+ *          address as @id[0])
+ * @id: full device ID array
  * @pagesize: size of the NAND page in bytes; if 0, then the real page size (as
  *            well as the eraseblock size) is determined from the extended NAND
  *            chip ID array)
@@ -576,7 +581,13 @@ struct nand_chip {
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
