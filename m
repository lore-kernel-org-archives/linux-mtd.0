Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTsqZ-0004rz-8X
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 13:31:08 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/2] UBI: Fix trivial typo in __schedule_ubi_work
Date: Tue, 16 Sep 2014 15:30:35 +0200
Message-Id: <1410874236-3125-2-git-send-email-richard@nod.at>
In-Reply-To: <1410874236-3125-1-git-send-email-richard@nod.at>
References: <1410874236-3125-1-git-send-email-richard@nod.at>
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

s/of/if/

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 20f4917..e61d799 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -835,7 +835,7 @@ repeat:
  * @wrk: the work to schedule
  *
  * This function adds a work defined by @wrk to the tail of the pending works
- * list. Can only be used of ubi->work_sem is already held in read mode!
+ * list. Can only be used if ubi->work_sem is already held in read mode!
  */
 static void __schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 {
-- 
1.8.4.5
