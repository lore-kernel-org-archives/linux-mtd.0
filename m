Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTm-0000BU-LP
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:07 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/13] mtd: nand_nase: do not cache pages with uncorrectable
	ECC errors
Date: Mon,  6 Sep 2010 11:54:45 +0300
Message-Id: <1283763293-1882-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
References: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Currently MTD caches the last read NAND page, even if there was an uncorrectable ECC
error. This patch prevents caching in case of uncorrectable ECC errors. The reason
is that we want to allow the user to re-read the NAND page several times. In case of
unstable bits re-trying may help.

Moreover, current behavior is wrong because the first read returns -EBADMSG (correctly)
but the second read succeeds and incorrectly returns 0 (because we read from the cache).

I've pushed these patches to ubi-2.6.git / master.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nand_base.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d551ddd..ddffe76 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1493,7 +1493,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 			/* Transfer not aligned data */
 			if (!aligned) {
-				if (!NAND_SUBPAGE_READ(chip) && !oob)
+				if (!NAND_SUBPAGE_READ(chip) && !oob &&
+				    !(mtd->ecc_stats.failed - stats.failed))
 					chip->pagebuf = realpage;
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
-- 
1.7.1.1
