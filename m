Received: from mailrelay009.isp.belgacom.be ([195.238.6.176])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwbCR-0004MS-8R
 for linux-mtd@lists.infradead.org; Mon, 16 Jun 2014 18:00:08 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] fs/jffs2/acl.c: remove null test before kfree
Date: Mon, 16 Jun 2014 19:58:07 +0200
Message-Id: <1402941487-3941-1-git-send-email-fabf@skynet.be>
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
 fs/jffs2/acl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
index 009ec0b..2f7a3c0 100644
--- a/fs/jffs2/acl.c
+++ b/fs/jffs2/acl.c
@@ -202,8 +202,7 @@ struct posix_acl *jffs2_get_acl(struct inode *inode, int type)
 	} else {
 		acl = ERR_PTR(rc);
 	}
-	if (value)
-		kfree(value);
+	kfree(value);
 	if (!IS_ERR(acl))
 		set_cached_acl(inode, type, acl);
 	return acl;
-- 
1.8.4.5
