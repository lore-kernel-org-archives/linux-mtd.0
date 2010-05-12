Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OCK4v-00030U-C9
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 22:06:58 +0000
From: Peter Huewe <PeterHuewe@gmx.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Ferenc Wagner <wferi@niif.hu>
Subject: [PATCH] mtd: Move function mtd_to_flctl to fix build failure
Date: Thu, 13 May 2010 00:06:54 +0200
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201005130006.54616.PeterHuewe@gmx.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	Magnus Damm <damm@opensource.se>,
	Paul Mundt <lethal@linux-sh.org>, linux-mtd@lists.infradead.org,
	Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Peter Huewe <peterhuewe@gmx.de>

This patch fixes a build failure[1] by simply moving the function mtd_to_flctl
beneath the definition of sh_flctl which it uses.

BF introduced by patch 
'mtd/nand/sh_flctl: Replace the dangerous mtd_to_flctl macro' (67026418)

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
KernelVersion: linux-next of 20100512
References:
[1] http://kisskb.ellerman.id.au/kisskb/buildresult/2601986/

 include/linux/mtd/sh_flctl.h |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index 178b5c2..d7b686a 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -93,11 +93,6 @@
 #define INIT_FL4ECCRESULT_VAL	0x03FF03FF
 #define LOOP_TIMEOUT_MAX	0x00010000
 
-static inline struct sh_flctl *mtd_to_flctl(struct mtd_info *mtdinfo)
-{
-	return container_of(mtdinfo, struct sh_flctl, mtd);
-}
-
 struct sh_flctl {
 	struct mtd_info		mtd;
 	struct nand_chip	chip;
@@ -128,4 +123,9 @@ struct sh_flctl_platform_data {
 	unsigned has_hwecc:1;
 };
 
+static inline struct sh_flctl *mtd_to_flctl(struct mtd_info *mtdinfo)
+{
+	return container_of(mtdinfo, struct sh_flctl, mtd);
+}
+
 #endif	/* __SH_FLCTL_H__ */
-- 
1.6.4.4
