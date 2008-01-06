Received: from mgw2.diku.dk ([130.225.96.92])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBYiV-000059-0O
	for linux-mtd@lists.infradead.org; Sun, 06 Jan 2008 16:51:27 +0000
Date: Sun, 6 Jan 2008 17:50:34 +0100 (CET)
From: Julia Lawall <julia@diku.dk>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/jffs2: Add missing call to posix_acl_release
Message-ID: <Pine.LNX.4.64.0801061749490.24950@ask.diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

posix_acl_clone does a memory allocation and sets a reference count, so
posix_acl_release is needed afterwards to free it.


The problem was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
identifier E;
expression E1, E2;
int ret;
statement S;
@@

  T E;
  <+...
(
  E = \(posix_acl_clone\|posix_acl_alloc\|posix_acl_dup\)(...);
  if (E == NULL) S
|
  if ((E = \(posix_acl_clone\|posix_acl_alloc\|posix_acl_dup\)(...)) == NULL) S
)
  ... when != E2 = E
      when strict
(
  posix_acl_release(E);
|
  E1 = E;
|
+ posix_acl_release(E);
  return;
|
+ posix_acl_release(E);
  return ret;
)
  ...+>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/fs/jffs2/acl.c b/fs/jffs2/acl.c
--- a/fs/jffs2/acl.c 2008-01-03 09:49:31.000000000 +0100
+++ b/fs/jffs2/acl.c 2008-01-06 17:38:52.000000000 +0100
@@ -345,8 +345,10 @@ int jffs2_init_acl_pre(struct inode *dir
 		if (!clone)
 			return -ENOMEM;
 		rc = posix_acl_create_masq(clone, (mode_t *)i_mode);
-		if (rc < 0)
+		if (rc < 0) {
+			posix_acl_release(clone);
 			return rc;
+		}
 		if (rc > 0)
 			jffs2_iset_acl(inode, &f->i_acl_access, clone);
 
