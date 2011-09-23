Received: from mx09.lb01.inode.at ([62.99.145.9] helo=mx.inode.at)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R74KP-00062N-KR
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2011 11:54:02 +0000
From: Michael Thalmeier <michael.thalmeier@hale.at>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mxc_nand: preset_v1_v2: unlock all NAND flash blocks
Date: Fri, 23 Sep 2011 13:53:44 +0200
Message-Id: <1316778824-12518-1-git-send-email-michael.thalmeier@hale.at>
MIME-Version: 1.0
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wolfram Stering <wolfram.stering@hale.at>

For NFC v1, the unlock end block address was 0x4000, which would only
unlock the first 32 blocks of the NAND flash.  Change that value to
0xffff to unlock all available blocks, as is done for NFC v21 as well.

Signed-off-by: Michael Thalmeier <michael.thalmeier@hale.at>
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 90df34c..5b40786 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -849,7 +849,7 @@ static void preset_v1_v2(struct mtd_info *mtd)
 		writew(0xffff, NFC_V21_UNLOCKEND_BLKADDR3);
 	} else if (nfc_is_v1()) {
 		writew(0x0, NFC_V1_UNLOCKSTART_BLKADDR);
-		writew(0x4000, NFC_V1_UNLOCKEND_BLKADDR);
+		writew(0xffff, NFC_V1_UNLOCKEND_BLKADDR);
 	} else
 		BUG();
 
-- 
1.7.6.2



--
Scanned by MailScanner.
