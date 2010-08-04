Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgjlA-0005Il-Kx
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 19:36:20 +0000
Subject: [PATCH] mtd: cfi_cmdset_0002: fix the check for valid primary
	extension versions
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Wed, 04 Aug 2010 21:36:09 +0200
Message-ID: <20100804193242.10954.14837.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Gernot Hoyler <Gernot.Hoyler@spansion.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4 [1][2][3].
Fix the check in cfi_cmdset_0002 accordingly.

[1] http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19
[2] http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_100_20011201.pdf
[3] http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf

Signed-off-by: Florian Fainelli <florian@openwrt.org>
Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d81079e..16c4eee 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -417,16 +417,26 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			 */
 			cfi_fixup_major_minor(cfi, extp);
 
+			/*
+			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4
+			 * see: http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19
+			 *      http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_100_20011201.pdf
+			 *      http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
+			 */
 			if (extp->MajorVersion != '1' ||
-			    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
+			    (extp->MajorVersion == '1' && ( extp->MinorVersion < '0' || extp->MinorVersion > '4'))) {
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
 
