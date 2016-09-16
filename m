Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkucg-0006wY-BC
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 15:00:22 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 15/18] UBI: provide an helper to check whether a LEB is
 mapped or not
Date: Fri, 16 Sep 2016 16:59:23 +0200
Message-Id: <1474037966-5524-16-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is part of the process of hiding UBI EBA's internal to other part of
the UBI implementation, so that we can add new information to the EBA
table without having to patch different places in the UBI code.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/eba.c  | 12 ++++++++++++
 drivers/mtd/ubi/kapi.c |  4 ++--
 drivers/mtd/ubi/ubi.h  |  1 +
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 180eb006e966..32045dd3d1db 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -312,6 +312,18 @@ static void leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnum)
 }
 
 /**
+ * ubi_eba_is_mapped - check if a LEB is mapped.
+ * @vol: volume description object
+ * @lnum: logical eraseblock number
+ *
+ * This function returns true if the LEB is mapped, false otherwise.
+ */
+bool ubi_eba_is_mapped(struct ubi_volume *vol, int lnum)
+{
+	return vol->eba_tbl[lnum] >= 0;
+}
+
+/**
  * ubi_eba_unmap_leb - un-map logical eraseblock.
  * @ubi: UBI device description object
  * @vol: volume description object
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index cec7f65beb9e..88b1897aeb40 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -722,7 +722,7 @@ int ubi_leb_map(struct ubi_volume_desc *desc, int lnum)
 	if (vol->upd_marker)
 		return -EBADF;
 
-	if (vol->eba_tbl[lnum] >= 0)
+	if (ubi_eba_is_mapped(vol, lnum))
 		return -EBADMSG;
 
 	return ubi_eba_write_leb(ubi, vol, lnum, NULL, 0, 0);
@@ -757,7 +757,7 @@ int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum)
 	if (vol->upd_marker)
 		return -EBADF;
 
-	return vol->eba_tbl[lnum] >= 0;
+	return ubi_eba_is_mapped(vol, lnum);
 }
 EXPORT_SYMBOL_GPL(ubi_is_mapped);
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 23c902e204aa..37469805591d 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -849,6 +849,7 @@ static inline bool ubi_leb_valid(struct ubi_volume *vol, int lnum)
 }
 
 /* eba.c */
+bool ubi_eba_is_mapped(struct ubi_volume *vol, int lnum);
 int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 		      int lnum);
 int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
-- 
2.7.4
