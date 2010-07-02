Received: from smtp23.services.sfr.fr ([93.17.128.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OUfQm-0004m1-P2
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2010 12:33:21 +0000
Subject: [PATCH] mtd: cfi_cmdset_0002: fix the check for valid primary
	extension versions
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 02 Jul 2010 14:39:10 +0200
Message-ID: <20100702123910.24930.73018.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3 [1][2].
Fix the check in cfi_cmdset_0002 accordingly.

[1] http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19
[2] http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_100_20011201.pdf

Signed-off-by: Florian Fainelli <florian@openwrt.org>
Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d81079e..749203f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -417,16 +417,25 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			 */
 			cfi_fixup_major_minor(cfi, extp);
 
+			/*
+			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3
+			 * see: http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19 and on
+			 *      http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_100_20011201.pdf
+			 */
 			if (extp->MajorVersion != '1' ||
-			    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
+			    (extp->MajorVersion == '1' && ( extp->MinorVersion < '0' || extp->MinorVersion > '3'))) {
 				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
-				       "version %c.%c.\n",  extp->MajorVersion,
-				       extp->MinorVersion);
+				       "version %c.%c (%#02x/%#02x).\n",
+				       extp->MajorVersion, extp->MinorVersion,
+				       extp->MajorVersion, extp->MinorVersion);
 				kfree(extp);
 				kfree(mtd);
 				return NULL;
 			}
 
+			printk(KERN_INFO "  Amd/Fujitsu Extended Query version %c.%c.\n",
+			       extp->MajorVersion, extp->MinorVersion);
+
 			/* Install our own private info structure */
 			cfi->cmdset_priv = extp;
 
