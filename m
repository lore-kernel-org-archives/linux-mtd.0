Received: from usausmgw02.spansion.com ([12.110.209.162])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9HxT-00069i-LI
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 14:19:16 +0000
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] cfi_cmdset_0002.c: Add CFI 1.5 support for S29GL-S
Date: Mon, 11 Apr 2011 15:53:35 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <201104111553.35457.Gernot.Hoyler@spansion.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds CFI 1.5 support for the new Spansion S29GL-S device family.
For details, see the data sheet on the Spansion web site: 
http://www.spansion.com/Support/Datasheets/S29GL_128S_01GS_00_02_e.pdf

Signed-off-by: Gernot Hoyler <Gernot.Hoyler@spansion.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index f9a5331..b216510 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -462,13 +462,14 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			cfi_fixup_major_minor(cfi, extp);
 
 			/*
-			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4
+			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4, 1.5
 			 * see: http://cs.ozerki.net/zap/pub/axim-x5/docs/cfi_r20.pdf, page 19 
 			 *      http://www.spansion.com/Support/AppNotes/cfi_100_20011201.pdf
 			 *      http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
+			 *      http://www.spansion.com/Support/Datasheets/S29GL_128S_01GS_00_02_e.pdf
 			 */
 			if (extp->MajorVersion != '1' ||
-			    (extp->MajorVersion == '1' && (extp->MinorVersion < '0' || extp->MinorVersion > '4'))) {
+			    (extp->MajorVersion == '1' && (extp->MinorVersion < '0' || extp->MinorVersion > '5'))) {
 				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
 				       "version %c.%c (%#02x/%#02x).\n",
 				       extp->MajorVersion, extp->MinorVersion,
-- 
1.6.2.2
