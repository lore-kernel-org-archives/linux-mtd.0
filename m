Received: from mailrelay101.isp.belgacom.be ([195.238.20.128])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtNPL-0003d0-9N
 for linux-mtd@lists.infradead.org; Fri, 15 May 2015 21:44:40 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/6 linux-next] ubifs: simplify return in shrink_liability()
Date: Fri, 15 May 2015 23:43:56 +0200
Message-Id: <1431726240-4675-2-git-send-email-fabf@skynet.be>
In-Reply-To: <1431726240-4675-1-git-send-email-fabf@skynet.be>
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Directly return ubifs_return_leb()
instead of storing value in err and testing it.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/budget.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index 11a11b3..c07b770 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -77,7 +77,7 @@ static void shrink_liability(struct ubifs_info *c, int nr_to_write)
  */
 static int run_gc(struct ubifs_info *c)
 {
-	int err, lnum;
+	int lnum;
 
 	/* Make some free space by garbage-collecting dirty space */
 	down_read(&c->commit_sem);
@@ -88,10 +88,7 @@ static int run_gc(struct ubifs_info *c)
 
 	/* GC freed one LEB, return it to lprops */
 	dbg_budg("GC freed LEB %d", lnum);
-	err = ubifs_return_leb(c, lnum);
-	if (err)
-		return err;
-	return 0;
+	return ubifs_return_leb(c, lnum);
 }
 
 /**
-- 
2.4.0
