Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBf1U-0002FH-5q
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 06:02:34 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH for mtd-utils 3/4] Use the mtd_type_is_nand_user() to check
 the nand
Date: Tue, 20 Aug 2013 13:58:36 +0800
Message-ID: <1376978317-28010-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1376978317-28010-1-git-send-email-b32955@freescale.com>
References: <1376978317-28010-1-git-send-email-b32955@freescale.com>
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

Use this helper to check if it is a nand (including the SLC/MLC).

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 flash_otp_write.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/flash_otp_write.c b/flash_otp_write.c
index eaca5e1..111318d 100644
--- a/flash_otp_write.c
+++ b/flash_otp_write.c
@@ -78,7 +78,7 @@ int main(int argc,char *argv[])
 
 	printf("Writing OTP user data on %s at offset 0x%"PRIxoff_t"\n", argv[2], offset);
 
-	if (mtdInfo.type == MTD_NANDFLASH)
+	if (mtd_type_is_nand_user(&mtdInfo))
 		len = mtdInfo.writesize;
 	else
 		len = 256;
@@ -97,7 +97,7 @@ int main(int argc,char *argv[])
 		}
 		p = buf;
 		while (size > 0) {
-			if (mtdInfo.type == MTD_NANDFLASH) {
+			if (mtd_type_is_nand_user(&mtdInfo)) {
 				/* Fill remain buffers with 0xff */
 				memset(buf + size, 0xff, mtdInfo.writesize - size);
 				size = mtdInfo.writesize;
-- 
1.7.1
