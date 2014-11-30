Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2nn-0006rG-8s
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:36:32 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 5/6] UBI: Fastmap: Fix fastmap usage in ubi_volume_notify()
Date: Sun, 30 Nov 2014 12:35:39 +0100
Message-Id: <1417347340-6872-6-git-send-email-richard@nod.at>
In-Reply-To: <1417347340-6872-1-git-send-email-richard@nod.at>
References: <1417347340-6872-1-git-send-email-richard@nod.at>
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

There is no need to switch to ro mode if ubi_update_fastmap() fails.
Also get rid of the ifdef.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3405be4..3152331 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -154,23 +154,22 @@ static struct device_attribute dev_mtd_num =
  */
 int ubi_volume_notify(struct ubi_device *ubi, struct ubi_volume *vol, int ntype)
 {
+	int ret;
 	struct ubi_notification nt;
 
 	ubi_do_get_device_info(ubi, &nt.di);
 	ubi_do_get_volume_info(ubi, vol, &nt.vi);
 
-#ifdef CONFIG_MTD_UBI_FASTMAP
 	switch (ntype) {
 	case UBI_VOLUME_ADDED:
 	case UBI_VOLUME_REMOVED:
 	case UBI_VOLUME_RESIZED:
 	case UBI_VOLUME_RENAMED:
-		if (ubi_update_fastmap(ubi)) {
-			ubi_err(ubi, "Unable to update fastmap!");
-			ubi_ro_mode(ubi);
-		}
+		ret = ubi_update_fastmap(ubi);
+		if (ret)
+			ubi_msg(ubi, "Unable to write a new fastmap: %i", ret);
 	}
-#endif
+
 	return blocking_notifier_call_chain(&ubi_notifiers, ntype, &nt);
 }
 
-- 
1.8.4.5
