Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1qU-0005au-4A
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 08:57:23 +0000
Received: by mail-ed1-x544.google.com with SMTP id y56so1178474edd.11
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2018 00:57:09 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: keep original flags for every struct mtd_info
Date: Tue, 20 Nov 2018 09:55:45 +0100
Message-Id: <20181120085546.8336-1-zajec5@gmail.com>
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

When allocating a new partition mtd subsystem runs internal tests in the
allocate_partition(). They may result in modifying specified flags (e.g.
dropping some /features/ like write access).

Those constraints don't have to be necessary true for subpartitions. It
may happen parent partition isn't block aligned (effectively disabling
write access) while subpartition may fit blocks nicely. In such case all
checks should be run again (starting with original flags value).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/mtdcore.c   | 2 ++
 drivers/mtd/mtdpart.c   | 3 ++-
 include/linux/mtd/mtd.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 97ac219c082e..2d24701255e5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -665,6 +665,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	} else {
 		pr_debug("mtd device won't show a device symlink in sysfs\n");
 	}
+
+	mtd->orig_flags = mtd->flags;
 }
 
 /**
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 99c460facd5e..2b6e53af47da 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -346,7 +346,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 
 	/* set up the MTD object for this partition */
 	slave->mtd.type = parent->type;
-	slave->mtd.flags = parent->flags & ~part->mask_flags;
+	slave->mtd.flags = parent->orig_flags & ~part->mask_flags;
+	slave->mtd.orig_flags = slave->mtd.flags;
 	slave->mtd.size = part->size;
 	slave->mtd.writesize = parent->writesize;
 	slave->mtd.writebufsize = parent->writebufsize;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd0be91bdefa..b491a08e87e5 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -207,6 +207,7 @@ struct mtd_debug_info {
 struct mtd_info {
 	u_char type;
 	uint32_t flags;
+	uint32_t orig_flags; /* Flags as before running mtd checks */
 	uint64_t size;	 // Total size of the MTD
 
 	/* "Major" erase size for the device. Naïve users may take this
-- 
2.13.7
