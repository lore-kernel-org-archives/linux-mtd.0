Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSdoP-0002dz-Dr
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 07:34:04 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, juergen.lachmann@harman.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: Initialize Fastmap checkmapping correctly
Date: Tue, 12 Jun 2018 09:33:16 +0200
Message-Id: <20180612073316.7131-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We cannot do it last, otherwithse it will be skipped for dynamic
volumes.

Reported-by: Lachmann, Juergen <juergen.lachmann@harman.com>
Fixes: 34653fd8c46e ("ubi: fastmap: Check each mapping only once")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/vtbl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 94d7a865b135..7504f430c011 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -579,6 +579,16 @@ static int init_volumes(struct ubi_device *ubi,
 		reserved_pebs += vol->reserved_pebs;
 
 		/*
+		 * We use ubi->peb_count and not vol->reserved_pebs because
+		 * we want to keep the code simple. Otherwise we'd have to
+		 * resize/check the bitmap upon volume resize too.
+		 * Allocating a few bytes more does not hurt.
+		 */
+		err = ubi_fastmap_init_checkmap(vol, ubi->peb_count);
+		if (err)
+			return err;
+
+		/*
 		 * In case of dynamic volume UBI knows nothing about how many
 		 * data is stored there. So assume the whole volume is used.
 		 */
@@ -620,16 +630,6 @@ static int init_volumes(struct ubi_device *ubi,
 			(long long)(vol->used_ebs - 1) * vol->usable_leb_size;
 		vol->used_bytes += av->last_data_size;
 		vol->last_eb_bytes = av->last_data_size;
-
-		/*
-		 * We use ubi->peb_count and not vol->reserved_pebs because
-		 * we want to keep the code simple. Otherwise we'd have to
-		 * resize/check the bitmap upon volume resize too.
-		 * Allocating a few bytes more does not hurt.
-		 */
-		err = ubi_fastmap_init_checkmap(vol, ubi->peb_count);
-		if (err)
-			return err;
 	}
 
 	/* And add the layout volume */
-- 
2.13.6
