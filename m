Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNQ3z-0007Mf-2Y
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 18:38:47 +0000
Received: by pawu10 with SMTP id u10so68836220paw.1
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2015 11:38:25 -0700 (PDT)
Received: from [171.71.46.59] (mramach3-lnx001.cisco.com. [171.71.46.59])
 by smtp.gmail.com with ESMTPSA id oh9sm7338651pbb.26.2015.08.06.11.38.23
 for <linux-mtd@lists.infradead.org>
 (version=SSLv3 cipher=RC4-SHA bits=128/128);
 Thu, 06 Aug 2015 11:38:24 -0700 (PDT)
Subject: [PATCH] mtd-utils: Support jffs2 flash-erase for large OOB (>32b)
From: Manikandan Ramachandran <crmanik@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 06 Aug 2015 11:38:14 -0700
Message-ID: <1438886294.23233.6.camel@mramach3-lnx001>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"flash_erase" fails on nand flash with JFFS2 that has OOB size greater than
32 bytes. "flash_erase" uses "MEMGETOOSEL" to determine OOB size. This ioctl
call is obsolete and returns error if OOB size is more than 32 bytes.

This patch fixes this issue by using "mtd_write" to update clean-marker
instead of mtd_oob_write. This fix is based on the discussion:
http://lists.infradead.org/pipermail/linux-mtd/2011-September/037958.html.

>From 0d12dd9eb3053d26e6a3085faf14713d29fcb4ca Mon Sep 17 00:00:00 2001
From: Manikandan <crmanik@gmail.com>
Date: Thu, 6 Aug 2015 11:21:46 -0700
Subject: [PATCH] flash_erase Support for large OOB

---
 flash_erase.c | 38 ++++----------------------------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index 933373a..b567173 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -93,7 +93,7 @@ int main(int argc, char *argv[])
 {
 	libmtd_t mtd_desc;
 	struct mtd_dev_info mtd;
-	int fd, clmpos = 0, clmlen = 8;
+	int fd;
 	unsigned long long start;
 	unsigned int eb, eb_start, eb_cnt;
 	bool isNAND;
@@ -196,37 +196,6 @@ int main(int argc, char *argv[])
 		if (!isNAND)
 			cleanmarker.totlen = cpu_to_je32(sizeof(cleanmarker));
 		else {
-			struct nand_oobinfo oobinfo;
-
-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
-				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
-
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1])
-					return errmsg(" Eeep. Autoplacement selected and no empty space in oob");
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
-			} else {
-				/* Legacy mode */
-				switch (mtd.oob_size) {
-					case 8:
-						clmpos = 6;
-						clmlen = 2;
-						break;
-					case 16:
-						clmpos = 8;
-						clmlen = 8;
-						break;
-					case 64:
-						clmpos = 16;
-						clmlen = 8;
-						break;
-				}
-			}
 			cleanmarker.totlen = cpu_to_je32(8);
 		}
 		cleanmarker.hdr_crc = cpu_to_je32(mtd_crc32(0, &cleanmarker, sizeof(cleanmarker) - 4));
@@ -276,7 +245,8 @@ int main(int argc, char *argv[])
 
 		/* write cleanmarker */
 		if (isNAND) {
-			if (mtd_write_oob(mtd_desc, &mtd, fd, (uint64_t)offset + clmpos, clmlen, &cleanmarker) != 0) {
+			if (mtd_write(mtd_desc, &mtd, fd, eb, 0, NULL, 0, &cleanmarker, 0,
+					MTD_OPS_AUTO_OOB) != 0) {
 				sys_errmsg("%s: MTD writeoob failure", mtd_device);
 				continue;
 			}
@@ -286,7 +256,7 @@ int main(int argc, char *argv[])
 				continue;
 			}
 		}
-		verbose(!quiet, " Cleanmarker written at %"PRIxoff_t, offset);
+		verbose(!quiet, " Cleanmarker Updated.");
 	}
 	show_progress(&mtd, offset, eb, eb_start, eb_cnt);
 	bareverbose(!quiet, "\n");
-- 
2.2.1
