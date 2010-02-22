Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjdCN-0004EO-1c
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 18:40:09 +0000
Received: by fxm6 with SMTP id 6so5097143fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 10:40:02 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 04/15] MTD: mtdblock: test return value of
	add_mtd_blktrans_dev, because if can fail
Date: Mon, 22 Feb 2010 20:39:31 +0200
Message-Id: <1266863982-5258-5-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Vitaly Wool <vitalywool@gmail.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, stanley.miao@windriver.com,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This prevents a memory leak

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtdblock.c    |    3 ++-
 drivers/mtd/mtdblock_ro.c |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 8e5da1e..7ce30a2 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -348,7 +348,8 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (!(mtd->flags & MTD_WRITEABLE))
 		dev->mbd.readonly = 1;
 
-	add_mtd_blktrans_dev(&dev->mbd);
+	if (add_mtd_blktrans_dev(&dev->mbd))
+		kfree(dev);
 }
 
 static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 54ff288..d0d3f79 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -43,7 +43,8 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	dev->tr = tr;
 	dev->readonly = 1;
 
-	add_mtd_blktrans_dev(dev);
+	if (add_mtd_blktrans_dev(dev))
+		kfree(dev);
 }
 
 static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
-- 
1.6.3.3
