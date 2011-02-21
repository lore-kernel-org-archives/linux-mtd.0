Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PrWu4-00011S-Fi
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2011 14:38:21 +0000
Received: by iwn38 with SMTP id 38so5971107iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Feb 2011 06:38:19 -0800 (PST)
Date: Mon, 21 Feb 2011 04:39:02 -0500
From: Tracey Dent <tdent48227@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] fs/jffs2/xattr: Fix coding style
Message-ID: <20110221093902.GA4759@linux-rdzc.hsd1.mi.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the trailing white space and get rid of the
unnessary {} on certain statements.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 fs/jffs2/xattr.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 4f9cc04..d66bb03 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -31,7 +31,7 @@
  *   is used to release xattr name/value pair and detach from c->xattrindex.
  * reclaim_xattr_datum(c)
  *   is used to reclaim xattr name/value pairs on the xattr name/value pair cache when
- *   memory usage by cache is over c->xdatum_mem_threshold. Currently, this threshold 
+ *   memory usage by cache is over c->xdatum_mem_threshold. Currently, this threshold
  *   is hard coded as 32KiB.
  * do_verify_xattr_datum(c, xd)
  *   is used to load the xdatum informations without name/value pair from the medium.
@@ -109,11 +109,11 @@ static void reclaim_xattr_datum(struct jffs2_sb_info *c)
 	target = c->xdatum_mem_usage * 4 / 5; /* 20% reduction */
 	for (count = 0; count < XATTRINDEX_HASHSIZE; count++) {
 		list_for_each_entry_safe(xd, _xd, &c->xattrindex[index], xindex) {
-			if (xd->flags & JFFS2_XFLAGS_HOT) {
+			if (xd->flags & JFFS2_XFLAGS_HOT)
 				xd->flags &= ~JFFS2_XFLAGS_HOT;
-			} else if (!(xd->flags & JFFS2_XFLAGS_BIND)) {
+			else if (!(xd->flags & JFFS2_XFLAGS_BIND))
 				unload_xattr_datum(c, xd);
-			}
+
 			if (c->xdatum_mem_usage <= target)
 				goto out;
 		}
@@ -1002,11 +1002,11 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	}
 	rc = len;
  out:
-	if (!retry) {
+	if (!retry)
 		up_read(&c->xattr_sem);
-	} else {
+	else
 		up_write(&c->xattr_sem);
-	}
+
 	return rc;
 }
 
@@ -1053,22 +1053,22 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
 		if (!strcmp(xname, xd->xname)) {
 			rc = xd->value_len;
 			if (buffer) {
-				if (size < rc) {
+				if (size < rc)
 					rc = -ERANGE;
-				} else {
+				else
 					memcpy(buffer, xd->xvalue, rc);
-				}
+
 			}
 			goto out;
 		}
 	}
 	rc = -ENODATA;
  out:
-	if (!retry) {
+	if (!retry)
 		up_read(&c->xattr_sem);
-	} else {
+	else
 		up_write(&c->xattr_sem);
-	}
+
 	return rc;
 }
 
-- 
1.7.4.1.48.g5673d


-- 
