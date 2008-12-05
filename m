Received: from vps1.tull.net ([66.180.172.116])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8Xo0-0001lG-5N
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 10:21:04 +0000
From: Nick Andrew <nick@nick-andrew.net>
Subject: [PATCH] Fix incorrect use of loose in fs.c
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>, James Morris <jmorris@namei.org>,
	Nick Andrew <nick@nick-andrew.net>, linux-mtd@lists.infradead.org
Date: Fri, 05 Dec 2008 14:08:06 +1100
Message-ID: <20081205030806.32225.66382.stgit@marcab.local.tull.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Nick Andrew <nick@nick-andrew.net>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix incorrect use of loose in fs.c

It should be 'lose', not 'loose'. Also fix a spelling error.

Signed-off-by: Nick Andrew <nick@nick-andrew.net>
---

 fs/jffs2/fs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 249305d..a598de9 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -386,7 +386,7 @@ int jffs2_remount_fs (struct super_block *sb, int *flags, char *data)
 	/* We stop if it was running, then restart if it needs to.
 	   This also catches the case where it was stopped and this
 	   is just a remount to restart it.
-	   Flush the writebuffer, if neccecary, else we loose it */
+	   Flush the writebuffer, if necessary, else we lose it */
 	if (!(sb->s_flags & MS_RDONLY)) {
 		jffs2_stop_garbage_collect_thread(c);
 		mutex_lock(&c->alloc_sem);
