Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7OXZ-00065X-Bm
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:42:33 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Subject: [PATCH 2/2] UBIFS: add a log overlap assertion
Date: Wed, 16 Jul 2014 15:42:08 +0300
Message-Id: <1405514528-14649-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1405514528-14649-1-git-send-email-dedekind1@gmail.com>
References: <1405514528-14649-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add an assertion which checkes that the head of the log never overlaps with the
tail of the log.

Suggested-by: hujianyang <hujianyang@huawei.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/misc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index ee7cb5e..81bbf79 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -297,6 +297,7 @@ static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
 	if (lnum > c->log_last)
 		lnum = UBIFS_LOG_LNUM;
 
+	ubifs_assert(lnum != c->ltail_lnum);
 	return lnum;
 }
 
-- 
1.9.3
