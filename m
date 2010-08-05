Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogz2v-0007aH-Su
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 11:55:39 +0000
Subject: [PATCH v2] mtd: cfi_cmdset_0002: consider version 1.4 as a valid
	primary extension version
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 05 Aug 2010 13:55:24 +0200
Message-ID: <20100805115524.3098.43107.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Gernot Hoyler <Gernot.Hoyler@spansion.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Spansion S29WS-P device family uses CFI version 1.4 [1].
Consider it as a valid version.

[1] http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 749203f..bd20d1f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -418,12 +418,13 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			cfi_fixup_major_minor(cfi, extp);
 
 			/*
-			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3
-			 * see: http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19 and on
+			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4
+			 * see: http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19
 			 *      http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_100_20011201.pdf
+			 *      http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
 			 */
 			if (extp->MajorVersion != '1' ||
-			    (extp->MajorVersion == '1' && ( extp->MinorVersion < '0' || extp->MinorVersion > '3'))) {
+			    (extp->MajorVersion == '1' && (extp->MinorVersion < '0' || extp->MinorVersion > '4'))) {
 				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
 				       "version %c.%c (%#02x/%#02x).\n",
 				       extp->MajorVersion, extp->MinorVersion,
