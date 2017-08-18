Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dimdm-0004v2-8J
 for linux-mtd@lists.infradead.org; Fri, 18 Aug 2017 19:09:08 +0000
Subject: [PATCH 3/3] jffs2: Adjust a null pointer check in two functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <ec91fdb9-9107-f1a3-3530-b3272ca51da7@users.sourceforge.net>
Message-ID: <7be00642-75c6-f774-49f8-51a264b3404d@users.sourceforge.net>
Date: Fri, 18 Aug 2017 21:08:42 +0200
MIME-Version: 1.0
In-Reply-To: <ec91fdb9-9107-f1a3-3530-b3272ca51da7@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 20:40:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/jffs2/nodemgmt.c | 3 +--
 fs/jffs2/security.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index a7bbe879cfc3..d5346ba782f7 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -242,8 +242,7 @@ int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
 
 static void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
-
-	if (c->nextblock == NULL) {
+	if (!c->nextblock) {
 		jffs2_dbg(1, "%s(): Erase block at 0x%08x has already been placed in a list\n",
 			  __func__, jeb->offset);
 		return;
diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index c2332e30f218..9859b522721f 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -29,7 +29,7 @@ static int jffs2_initxattrs(struct inode *inode,
 	const struct xattr *xattr;
 	int err = 0;
 
-	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
+	for (xattr = xattr_array; xattr->name; xattr++) {
 		err = do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY,
 					xattr->name, xattr->value,
 					xattr->value_len, 0);
-- 
2.14.0
