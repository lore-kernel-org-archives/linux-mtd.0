Received: from mgw2.diku.dk ([130.225.96.92])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7ZLV-0008EY-Ap
	for linux-mtd@lists.infradead.org; Sun, 17 Oct 2010 19:56:42 +0000
Date: Sun, 17 Oct 2010 21:56:15 +0200 (CEST)
From: Julia Lawall <julia@diku.dk>
To: Joe Perches <joe@perches.com>
Subject: [PATCH 3/3] fs/jffs2/dir.c: Use kmemdup
In-Reply-To: <1287341849.20968.62.camel@Joe-Laptop>
Message-ID: <Pine.LNX.4.64.1010172155240.394@ask.diku.dk>
References: <1287341311-11161-1-git-send-email-julia@diku.dk>
	<1287341311-11161-4-git-send-email-julia@diku.dk>
	<1287341849.20968.62.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert a sequence of kmalloc and memcpy to use kmemdup.

The semantic patch that performs this transformation is:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,flag,len;
expression arg,e1,e2;
statement S;
@@

  a =
-  \(kmalloc\|kzalloc\)(len,flag)
+  kmemdup(arg,len,flag)
  <... when != a
  if (a == NULL || ...) S
  ...>
- memcpy(a,arg,len+1);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/jffs2/dir.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/fs/jffs2/dir.c b/fs/jffs2/dir.c
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -367,7 +367,7 @@ static int jffs2_symlink (struct inode *
 	}
 
 	/* We use f->target field to store the target path. */
-	f->target = kmalloc(targetlen + 1, GFP_KERNEL);
+	f->target = kmemdup(target, targetlen + 1, GFP_KERNEL);
 	if (!f->target) {
 		printk(KERN_WARNING "Can't allocate %d bytes of memory\n", targetlen + 1);
 		mutex_unlock(&f->sem);
@@ -376,7 +376,6 @@ static int jffs2_symlink (struct inode *
 		goto fail;
 	}
 
-	memcpy(f->target, target, targetlen + 1);
 	D1(printk(KERN_DEBUG "jffs2_symlink: symlink's target '%s' cached\n", (char *)f->target));
 
 	/* No data here. Only a metadata node, which will be
