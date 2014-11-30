Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3Wq-0008Nx-4I
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:23:05 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/4] UBI: Fastmap: Add blank line after declarations
Date: Sun, 30 Nov 2014 13:22:34 +0100
Message-Id: <1417350157-9373-2-git-send-email-richard@nod.at>
In-Reply-To: <1417350157-9373-1-git-send-email-richard@nod.at>
References: <1417350157-9373-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Another checkpatch complaint:
WARNING: Missing a blank line after declarations

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap-wl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 7a72af2..067aa90 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -21,6 +21,7 @@
 static void update_fastmap_work_fn(struct work_struct *wrk)
 {
 	struct ubi_device *ubi = container_of(wrk, struct ubi_device, fm_work);
+
 	ubi_update_fastmap(ubi);
 	spin_lock(&ubi->wl_lock);
 	ubi->fm_work_scheduled = 0;
-- 
1.8.4.5
