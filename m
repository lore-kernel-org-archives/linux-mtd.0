Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1qc-0005bM-ME
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 08:57:31 +0000
Received: by mail-ed1-x543.google.com with SMTP id b14so1204379edt.6
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2018 00:57:20 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: improve calculating partition boundaries when checking
 for alignment
Date: Tue, 20 Nov 2018 09:56:12 +0100
Message-Id: <20181120085612.8405-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

When checking for alignment mtd should check absolute offsets. It's
important for subpartitions as it doesn't make sense to check their
relative addresses.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/mtdpart.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 2b6e53af47da..15197d923ec0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -61,6 +61,15 @@ static inline struct mtd_part *mtd_to_part(const struct mtd_info *mtd)
 	return container_of(mtd, struct mtd_part, mtd);
 }
 
+static uint64_t part_absolute_offset(struct mtd_info *mtd)
+{
+	struct mtd_part *part = mtd_to_part(mtd);
+
+	if (!mtd_is_partition(mtd))
+		return 0;
+
+	return part_absolute_offset(part->parent) + part->offset;
+}
 
 /*
  * MTD methods which simply translate the effective address and pass through
@@ -514,7 +523,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 	if (!(slave->mtd.flags & MTD_NO_ERASE))
 		wr_alignment = slave->mtd.erasesize;
 
-	tmp = slave->offset;
+	tmp = part_absolute_offset(parent) + slave->offset;
 	remainder = do_div(tmp, wr_alignment);
 	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
 		/* Doesn't start on a boundary of major erase size */
@@ -525,7 +534,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			part->name);
 	}
 
-	tmp = slave->mtd.size;
+	tmp = part_absolute_offset(parent) + slave->mtd.size;
 	remainder = do_div(tmp, wr_alignment);
 	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
 		slave->mtd.flags &= ~MTD_WRITEABLE;
-- 
2.13.7
