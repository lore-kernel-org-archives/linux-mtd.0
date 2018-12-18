Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZC34-0001wv-E7
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2018 09:52:24 +0000
Date: Tue, 18 Dec 2018 10:52:06 +0100
From: Helmut Grohne <helmut.grohne@intenta.de>
To: David Woodhouse <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard.weinberger@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 1/3] jffs2: avoid unnecessarily taking f->sem
Message-ID: <61e099b717000558fec733995211813d1b34b56d.1545126261.git.helmut.grohne@intenta.de>
References: <cover.1545126261.git.helmut.grohne@intenta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1545126261.git.helmut.grohne@intenta.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2_xattr_do_crccheck_inode creates a temporary struct
jffs2_inode_info for handling it to jffs2_do_read_inode_internal.
Formerly, jffs2_do_read_inode_internal released f->sem in the error path
and that was why it had to be initialized, taken and released. As part
of 7aaea7605c0 ("jffs2: fix unbalanced locking") locking was moved out
of it.

In the relevant jffs2_xattr_do_crccheck_inode we own the only reference
to f as we allocate it with kmalloc. Since nothing else has knowledge of
it, there is no need to lock it. In particular, that saves us from
thinking about the correct locking class.

We still need to initialize the mutex as jffs2_do_clear_inode insists on
acquiring it.

Signed-off-by: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 fs/jffs2/readinode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 389ea53ea487..a6718fbfe1fd 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1382,12 +1382,10 @@ int jffs2_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *i
 	if (!f)
 		return -ENOMEM;
 
-	mutex_init(&f->sem);
-	mutex_lock(&f->sem);
 	f->inocache = ic;
 
 	ret = jffs2_do_read_inode_internal(c, f, &n);
-	mutex_unlock(&f->sem);
+	mutex_init(&f->sem);
 	jffs2_do_clear_inode(c, f);
 	jffs2_xattr_do_crccheck_inode(c, ic);
 	kfree (f);
-- 
2.11.0
