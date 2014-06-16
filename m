Received: from mailrelay009.isp.belgacom.be ([195.238.6.176])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwbGs-0007ja-FL
 for linux-mtd@lists.infradead.org; Mon, 16 Jun 2014 18:04:43 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] fs/jffs2/xattr.c:  remove null test before kfree
Date: Mon, 16 Jun 2014 20:02:49 +0200
Message-Id: <1402941769-4539-1-git-send-email-fabf@skynet.be>
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

Fix checkpatch warning:
WARNING: kfree(NULL) is safe this check is probably not required

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/jffs2/xattr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index ad0f2e2..d72817a 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -756,8 +756,7 @@ void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c)
 	for (i=0; i < XATTRINDEX_HASHSIZE; i++) {
 		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
 			list_del(&xd->xindex);
-			if (xd->xname)
-				kfree(xd->xname);
+			kfree(xd->xname);
 			jffs2_free_xattr_datum(xd);
 		}
 	}
-- 
1.8.4.5
