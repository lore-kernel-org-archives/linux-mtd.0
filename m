Received: from mail-qg0-f48.google.com ([209.85.192.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMGqB-0002zJ-5Z
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 14:35:47 +0000
Received: by qgeu79 with SMTP id u79so89878894qge.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2015 07:35:24 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: antoine.tenart@free-electrons.com, robert.jarzmik@free.fr,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 2/2] nand: pxa3xx: Increase initial buffer size
Date: Mon,  3 Aug 2015 11:31:26 -0300
Message-Id: <1438612286-16070-3-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The initial buffer is used for the initial commands used to detect
a flash device (STATUS, READID and PARAM).

ONFI param page is 256 bytes, and there are three redundant copies
to be read. JEDEC param page is 512 bytes, and there are also three
redundant copies to be read. Hence this buffer should be at least
512 x 3. This commits rounds the buffer size to 2048.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 0815f11..9dac28d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -45,10 +45,13 @@
 
 /*
  * Define a buffer size for the initial command that detects the flash device:
- * STATUS, READID and PARAM. The largest of these is the PARAM command,
- * needing 256 bytes.
+ * STATUS, READID and PARAM.
+ * ONFI param page is 256 bytes, and there are three redundant copies
+ * to be read. JEDEC param page is 512 bytes, and there are also three
+ * redundant copies to be read.
+ * Hence this buffer should be at least 512 x 3. Let's pick 2048.
  */
-#define INIT_BUFFER_SIZE	256
+#define INIT_BUFFER_SIZE	2048
 
 /* registers and bit definitions */
 #define NDCR		(0x00) /* Control register */
@@ -899,14 +902,14 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 		break;
 
 	case NAND_CMD_PARAM:
-		info->buf_count = 256;
+		info->buf_count = INIT_BUFFER_SIZE;
 		info->ndcb0 |= NDCB0_CMD_TYPE(0)
 				| NDCB0_ADDR_CYC(1)
 				| NDCB0_LEN_OVRD
 				| command;
 		info->ndcb1 = (column & 0xFF);
-		info->ndcb3 = 256;
-		info->data_size = 256;
+		info->ndcb3 = INIT_BUFFER_SIZE;
+		info->data_size = INIT_BUFFER_SIZE;
 		break;
 
 	case NAND_CMD_READID:
-- 
2.4.6
