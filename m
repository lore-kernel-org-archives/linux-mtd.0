Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZEL2-0006Cv-8r
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 06:24:08 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH for mtd-utils] flash_erase: check the nand type
Date: Thu, 24 Oct 2013 14:06:06 +0800
Message-ID: <1382594766-27467-1-git-send-email-b32955@freescale.com>
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

This patch checks the right nand type for the MLC and SLC nand.
And if it is a MLC nand, we do not write cleanmarker for it, only print
out a message to warn the user.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 flash_erase.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index 1421cf9..dd75334 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -184,7 +184,8 @@ int main(int argc, char *argv[])
 
 	eb_start = start / mtd.eb_size;
 
-	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;
+	isNAND = (mtd.type == MTD_NANDFLASH || mtd.type == MTD_MLCNANDFLASH)
+			? 1 : 0;
 
 	if (jffs2) {
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
@@ -272,6 +273,12 @@ int main(int argc, char *argv[])
 
 		/* write cleanmarker */
 		if (isNAND) {
+			if (mtd.type == MTD_MLCNANDFLASH) {
+				sys_errmsg("%s: we can't write the cleanmarker "
+					"for the MLC nand.", mtd_device);
+				continue;
+			}
+
 			if (mtd_write_oob(mtd_desc, &mtd, fd, (uint64_t)offset + clmpos, clmlen, &cleanmarker) != 0) {
 				sys_errmsg("%s: MTD writeoob failure", mtd_device);
 				continue;
-- 
1.7.2.rc3
