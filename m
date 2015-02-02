Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIJm5-0002Sg-AW
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 16:22:58 +0000
Received: by mail-la0-f45.google.com with SMTP id gd6so42436953lab.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 08:22:34 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Expose partition offset to the drivers
Date: Mon,  2 Feb 2015 17:22:32 +0100
Message-Id: <1422894152-29362-1-git-send-email-ricardo.ribalda@gmail.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, there is no way to find out the offset of an mtd partition by
a driver. This might be needed by external hardware.

For example, a flash containing the firmware of an external device that
is also accessible by the main cpu/kernel.

The flash is big enough to have two partitions with 2 versions of the
firmware, so we can have a safe upgrade.

Once the flash has been updated we need the real offset, so we can write
it on the external device registers.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/mtdpart.c          | 8 ++++++++
 include/linux/mtd/partitions.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a3e3a7d..8047e74 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -784,3 +784,11 @@ uint64_t mtd_get_device_size(const struct mtd_info *mtd)
 	return PART(mtd)->master->size;
 }
 EXPORT_SYMBOL_GPL(mtd_get_device_size);
+
+uint64_t mtd_get_device_offset(const struct mtd_info *mtd){
+	if (!mtd_is_partition(mtd))
+		return 0;
+
+	return PART(mtd)->offset;
+}
+EXPORT_SYMBOL_GPL(mtd_get_device_offset);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 6a35e6d..2b953b4 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -84,5 +84,6 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
 uint64_t mtd_get_device_size(const struct mtd_info *mtd);
+uint64_t mtd_get_device_offset(const struct mtd_info *mtd);
 
 #endif
-- 
2.1.4
