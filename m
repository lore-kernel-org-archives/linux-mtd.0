Received: from m50-138.163.com ([123.125.50.138])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aF0N4-00015B-U6
 for linux-mtd@lists.infradead.org; Fri, 01 Jan 2016 14:08:02 +0000
From: Geliang Tang <geliangtang@163.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Geliang Tang <geliangtang@163.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] jffs2: use to_delayed_work
Date: Fri,  1 Jan 2016 22:06:27 +0800
Message-Id: <87ea17d237ec636e674f8be097a7e65cbce4d252.1451656900.git.geliangtang@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use to_delayed_work() instead of open-coding it.

Signed-off-by: Geliang Tang <geliangtang@163.com>
---
 fs/jffs2/wbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index f3a4857..5a3da3f 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1153,7 +1153,7 @@ static struct jffs2_sb_info *work_to_sb(struct work_struct *work)
 {
 	struct delayed_work *dwork;
 
-	dwork = container_of(work, struct delayed_work, work);
+	dwork = to_delayed_work(work);
 	return container_of(dwork, struct jffs2_sb_info, wbuf_dwork);
 }
 
-- 
2.5.0
