Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeP-0006Sh-Rd
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:47:00 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 35/35] UBI: Fastmap: Add blank line after declarations
Date: Wed, 29 Oct 2014 13:45:58 +0100
Message-Id: <1414586758-9972-36-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
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
index 828ea04..54e31a2 100644
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
