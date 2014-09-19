Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUuoa-0004Ph-HQ
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 09:49:21 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/2] UBI: Improve comment on work_sem
Date: Fri, 19 Sep 2014 11:48:47 +0200
Message-Id: <1411120127-18787-2-git-send-email-richard@nod.at>
In-Reply-To: <1411120127-18787-1-git-send-email-richard@nod.at>
References: <1411120127-18787-1-git-send-email-richard@nod.at>
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

Make clear what work_sem really does.

Suggested-by: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 7bf4163..f2933df 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -439,7 +439,8 @@ struct ubi_debug_info {
  *	     @move_to, @move_to_put @erase_pending, @wl_scheduled, @works,
  *	     @erroneous, and @erroneous_peb_count fields
  * @move_mutex: serializes eraseblock moves
- * @work_sem: synchronizes the WL worker with use tasks
+ * @work_sem: used to wait for all the scheduled works to finish and prevent
+ * new works from being submitted
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
  * @lookuptbl: a table to quickly find a &struct ubi_wl_entry object for any
  *             physical eraseblock
-- 
1.8.4.5
