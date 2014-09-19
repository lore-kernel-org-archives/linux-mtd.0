Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XV0GP-0004VQ-NH
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 15:38:26 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: Fix livelock in produce_free_peb()
Date: Fri, 19 Sep 2014 17:37:56 +0200
Message-Id: <1411141076-21489-1-git-send-email-richard@nod.at>
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

The while loop in produce_free_peb() assumes that each work will produce a
free PEB. This is not true.
If ubi->works_count is 1 and the only scheduled work is the
wear_leveling_worker() produce_free_peb() can loop forever in case
nobody schedules an erase work.
Fix this issue by checking in the while loop whether work is scheduled.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0509c8a..6add739 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -272,7 +272,7 @@ static int produce_free_peb(struct ubi_device *ubi)
 {
 	int err;
 
-	while (!ubi->free.rb_node) {
+	while (!ubi->free.rb_node && ubi->works_count) {
 		spin_unlock(&ubi->wl_lock);
 
 		dbg_wl("do one work synchronously");
-- 
1.8.4.5
