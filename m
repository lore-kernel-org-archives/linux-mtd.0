Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYK7t-0001r5-Dx
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 19:27:22 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH V2 linux-next] jffs2: fix sparse warning: unexpected unlock
Date: Sun, 28 Sep 2014 21:26:32 +0200
Message-Id: <1411932392-7751-1-git-send-email-fabf@skynet.be>
Cc: Josh Triplett <josh@joshtriplett.org>, Fabian Frederick <fabf@skynet.be>,
 linux-sparse@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
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

Suggested-by: Brian Norris <computersforpeace@gmail.com>
Suggested-by: Josh Triplett <josh@joshtriplett.org>
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
V2: use __must_hold instead of __releases / __acquires
(suggested by Brian Norris and Josh Triplett)

 fs/jffs2/summary.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index c522d09..bc53854 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -844,6 +844,7 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
 /* Write out summary information - called from jffs2_do_reserve_space */
 
 int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
+	__must_hold(&c->erase_completion_block)
 {
 	int datasize, infosize, padsize;
 	struct jffs2_eraseblock *jeb;
-- 
1.9.1
