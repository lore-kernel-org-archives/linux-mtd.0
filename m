Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VThBt-0002IU-3E
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 23:59:49 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH/TRIVIAL] mtd: Use MTD_BLOCK_MAJOR instead of the magic number
Date: Tue,  8 Oct 2013 20:59:08 -0300
Message-Id: <1381276748-5426-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: trivial@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/mtdblock.c    | 2 +-
 drivers/mtd/mtdblock_ro.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 2aef5dd..53884cc 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -373,7 +373,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
 
 static struct mtd_blktrans_ops mtdblock_tr = {
 	.name		= "mtdblock",
-	.major		= 31,
+	.major		= MTD_BLOCK_MAJOR,
 	.part_bits	= 0,
 	.blksize 	= 512,
 	.open		= mtdblock_open,
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 92759a9..70d27b4 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -70,7 +70,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
 
 static struct mtd_blktrans_ops mtdblock_tr = {
 	.name		= "mtdblock",
-	.major		= 31,
+	.major		= MTD_BLOCK_MAJOR,
 	.part_bits	= 0,
 	.blksize 	= 512,
 	.readsect	= mtdblock_readsect,
-- 
1.8.1.5
