Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwUYp-0001P3-AT
 for linux-mtd@lists.infradead.org; Sun, 02 Sep 2018 15:45:13 +0000
From: Chengguang Xu <cgxu519@gmx.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	Chengguang Xu <cgxu519@gmx.com>
Subject: [PATCH] jffs2: add additinal sanity check for jffs2_acl_from_medium()
Date: Sun,  2 Sep 2018 23:44:43 +0800
Message-Id: <20180902154443.4776-1-cgxu519@gmx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the case ACL_USER and ACL_GROUP we check if value has exceeded end,
add same check in the case ACL_OTHER as well.

Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
---
 fs/jffs2/acl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
index 093ffbd82395..fce32de3a18f 100644
--- a/fs/jffs2/acl.c
+++ b/fs/jffs2/acl.c
@@ -94,6 +94,8 @@ static struct posix_acl *jffs2_acl_from_medium(void *value, size_t size)
 			case ACL_MASK:
 			case ACL_OTHER:
 				value += sizeof(struct jffs2_acl_entry_short);
+				if (value > end)
+					goto fail;
 				break;
 
 			case ACL_USER:
-- 
2.17.1
