Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkud0-0007a9-My
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 15:00:37 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 16/18] UBI: provide an helper to query LEB information
Date: Fri, 16 Sep 2016 16:59:24 +0200
Message-Id: <1474037966-5524-17-git-send-email-boris.brezillon@free-electrons.com>
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

This is part of our attempt to hide EBA internals from other part of the
implementation in order to easily adapt it to the MLC needs.

Here we are creating an ubi_eba_leb_desc struct to hide the way we keep
track of the LEB to PEB mapping.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/eba.c     | 17 +++++++++++++++++
 drivers/mtd/ubi/fastmap.c |  8 ++++++--
 drivers/mtd/ubi/ubi.h     | 17 +++++++++++++++++
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 32045dd3d1db..f3ff8604b5e5 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -84,6 +84,23 @@ static int ubi_get_compat(const struct ubi_device *ubi, int vol_id)
 }
 
 /**
+ * ubi_eba_get_ldesc - get information about a LEB
+ * @vol: volume description object
+ * @lnum: logical eraseblock number
+ * @ldesc: the LEB descriptor to fill
+ *
+ * Used to query information about a specific LEB.
+ * It is currently only returning the physical position of the LEB, but will be
+ * extended to provide more information.
+ */
+void ubi_eba_get_ldesc(struct ubi_volume *vol, int lnum,
+		       struct ubi_eba_leb_desc *ldesc)
+{
+	ldesc->lnum = lnum;
+	ldesc->pnum = vol->eba_tbl[lnum];
+}
+
+/**
  * ltree_lookup - look up the lock tree.
  * @ubi: UBI device description object
  * @vol_id: volume ID
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 25e80a749a52..27a94f28819b 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1257,8 +1257,12 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		fm_pos += sizeof(*feba) + (sizeof(__be32) * vol->reserved_pebs);
 		ubi_assert(fm_pos <= ubi->fm_size);
 
-		for (j = 0; j < vol->reserved_pebs; j++)
-			feba->pnum[j] = cpu_to_be32(vol->eba_tbl[j]);
+		for (j = 0; j < vol->reserved_pebs; j++) {
+			struct ubi_eba_leb_desc ldesc;
+
+			ubi_eba_get_ldesc(vol, j, &ldesc);
+			feba->pnum[j] = cpu_to_be32(ldesc.pnum);
+		}
 
 		feba->reserved_pebs = cpu_to_be32(j);
 		feba->magic = cpu_to_be32(UBI_FM_EBA_MAGIC);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 37469805591d..98e5dac677ee 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -267,6 +267,21 @@ struct ubi_fm_pool {
 };
 
 /**
+ * struct ubi_eba_leb_desc - EBA logical eraseblock descriptor
+ * @lnum: the logical eraseblock number
+ * @pnum: the physical eraseblock where the LEB can be found
+ *
+ * This structure is here to hide EBA's internal from other part of the
+ * UBI implementation.
+ *
+ * One can query the position of a LEB by calling ubi_eba_get_ldesc().
+ */
+struct ubi_eba_leb_desc {
+	int lnum;
+	int pnum;
+};
+
+/**
  * struct ubi_volume - UBI volume description data structure.
  * @dev: device object to make use of the the Linux device model
  * @cdev: character device object to create character device
@@ -849,6 +864,8 @@ static inline bool ubi_leb_valid(struct ubi_volume *vol, int lnum)
 }
 
 /* eba.c */
+void ubi_eba_get_ldesc(struct ubi_volume *vol, int lnum,
+		       struct ubi_eba_leb_desc *ldesc);
 bool ubi_eba_is_mapped(struct ubi_volume *vol, int lnum);
 int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 		      int lnum);
-- 
2.7.4
