Received: from mailrelay007.isp.belgacom.be ([195.238.6.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUgj3-00043b-N7
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 18:46:42 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] jffs2: fix sparse warning: unexpected unlock
Date: Thu, 18 Sep 2014 20:46:16 +0200
Message-Id: <1411065976-20386-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fs/jffs2/summary.c:846:5: warning: context imbalance in 'jffs2_sum_write_sumnode' - unexpected unlock

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/jffs2/summary.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index c522d09..a0bac7b 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -844,6 +844,8 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
 /* Write out summary information - called from jffs2_do_reserve_space */
 
 int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
+	__releases(&c->erase_completion_lock)
+	__acquires(&c->erase_completion_lock)
 {
 	int datasize, infosize, padsize;
 	struct jffs2_eraseblock *jeb;
-- 
1.9.1
