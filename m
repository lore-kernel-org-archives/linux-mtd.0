Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pq2I9-00083R-Q7
	for linux-mtd@lists.infradead.org; Thu, 17 Feb 2011 11:45:03 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: onenand: add new option to control initial onenand
	unlocking
Date: Thu, 17 Feb 2011 13:44:41 +0200
Message-Id: <1297943082-398-2-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1297943082-398-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1297943082-398-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A new option ONENAND_SKIP_INITIAL_UNLOCKING is added. This allows
to disable initial onenand unlocking when the driver is initialized.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    3 ++-
 include/linux/mtd/onenand.h        |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 557a06e..46977bc 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4084,7 +4084,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	mtd->writebufsize = mtd->writesize;
 
 	/* Unlock whole block */
-	this->unlock_all(mtd);
+	if (!(this->options & ONENAND_SKIP_INITIAL_UNLOCKING))
+		this->unlock_all(mtd);
 
 	ret = this->scan_bbt(mtd);
 	if ((!FLEXONENAND(this)) || ret)
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index ae418e4..52b6f18 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -198,6 +198,7 @@ struct onenand_chip {
 #define ONENAND_SKIP_UNLOCK_CHECK	(0x0100)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
+#define ONENAND_SKIP_INITIAL_UNLOCKING	(0x4000)
 
 #define ONENAND_IS_4KB_PAGE(this)					\
 	(this->options & ONENAND_HAS_4KB_PAGE)
-- 
1.7.0.4
