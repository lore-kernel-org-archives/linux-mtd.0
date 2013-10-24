Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZIvx-0005fQ-8n
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 11:18:34 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2] flash_erase: check the nand type
Date: Thu, 24 Oct 2013 18:59:51 +0800
Message-ID: <1382612391-13036-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now, the MTD_NANDFLASH stands for SLC nand, and the MTD_MLCNANDFLASH
stands for the MLC nand.

This patch includes the stdbool.h, and changes the "isNAND" to boolean type,
and checks the right nand type for the MLC and SLC nand.

If the user wants to format a MLC nand for JFFS2, we will print out a message
to warn him, and exit right now.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 flash_erase.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index 1421cf9..933373a 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -21,6 +21,7 @@
 #define PROGRAM_NAME "flash_erase"
 
 #include <inttypes.h>
+#include <stdbool.h>
 #include <stdio.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -95,7 +96,7 @@ int main(int argc, char *argv[])
 	int fd, clmpos = 0, clmlen = 8;
 	unsigned long long start;
 	unsigned int eb, eb_start, eb_cnt;
-	int isNAND;
+	bool isNAND;
 	int error = 0;
 	off_t offset = 0;
 
@@ -182,9 +183,12 @@ int main(int argc, char *argv[])
 	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
 		return errmsg("mtd_get_dev_info failed");
 
+	if (jffs2 && mtd.type == MTD_MLCNANDFLASH)
+		return errmsg("JFFS2 cannot support MLC NAND.");
+
 	eb_start = start / mtd.eb_size;
 
-	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;
+	isNAND = mtd.type == MTD_NANDFLASH || mtd.type == MTD_MLCNANDFLASH;
 
 	if (jffs2) {
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
-- 
1.7.2.rc3
