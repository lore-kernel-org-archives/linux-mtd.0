Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SodEF-000845-Gr
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2012 16:24:02 +0000
Received: by weyr3 with SMTP id r3so125688wey.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 09:23:56 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/4] MTD parts: introduce mtd_get_device_size()
Date: Tue, 10 Jul 2012 18:23:40 +0200
Message-Id: <1341937423-16516-3-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_get_device_size() returns the size of the whole MTD device, that is
the mtd_info master size.
This is used by UBI to calculate the maximum number of bad blocks (MBB)
on a MTD device.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/mtdpart.c          |   14 ++++++++++++++
 include/linux/mtd/partitions.h |    1 +
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 8500584..d12f583 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -760,3 +760,17 @@ int mtd_is_partition(const struct mtd_info *mtd)
 	return ispart;
 }
 EXPORT_SYMBOL_GPL(mtd_is_partition);
+
+/* returns the size of an MTD device */
+uint64_t mtd_get_device_size(const struct mtd_info *mtd)
+{
+	struct mtd_part *part;
+
+	if (!mtd_is_partition(mtd))
+		return mtd->size;
+
+	part = PART(mtd);
+
+	return part->master->size;
+}
+EXPORT_SYMBOL_GPL(mtd_get_device_size);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 02a5115..1f8d24b 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -83,5 +83,6 @@ int mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
+uint64_t mtd_get_device_size(const struct mtd_info *mtd);
 
 #endif
-- 
1.7.2.5
