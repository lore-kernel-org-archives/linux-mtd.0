Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRREB-0005km-7e
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 16:56:04 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 3/4] jffs2: remove unnecessary GC pass on sync
Date: Mon,  7 May 2012 19:56:52 +0300
Message-Id: <1336409813-6365-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1336409813-6365-1-git-send-email-dedekind1@gmail.com>
References: <1336409813-6365-1-git-send-email-dedekind1@gmail.com>
Cc: Linux Kernel Maling List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We do not need to call 'jffs2_write_super()' on sync. This function
causes a GC pass to make sure the current contents is pushed out with
the data which we already have on the media.

But this is not needed on unmount and only slows sync down unnecessarily.
It is enough to just sync the write-buffer.

This call was added by one of the generic VFS rework patch-sets,
see d579ed00aa96a7f7486978540a0d7cecaff742ae.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/jffs2/super.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index d3dc9d8..dc366c0 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -110,8 +110,6 @@ static int jffs2_sync_fs(struct super_block *sb, int wait)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 
-	jffs2_write_super(sb);
-
 	mutex_lock(&c->alloc_sem);
 	jffs2_flush_wbuf_pad(c);
 	mutex_unlock(&c->alloc_sem);
-- 
1.7.7.6
