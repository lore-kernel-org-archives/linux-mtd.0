Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRRE8-0005jR-7L
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 16:56:01 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/4] jffs2: remove lock_super
Date: Mon,  7 May 2012 19:56:50 +0300
Message-Id: <1336409813-6365-2-git-send-email-dedekind1@gmail.com>
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

We do not need 'lock_super()'/'unlock_super()' in JFFS2 - kill them.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/jffs2/super.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index f9916f3..3422a2d 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -67,15 +67,12 @@ static void jffs2_write_super(struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 
-	lock_super(sb);
 	sb->s_dirt = 0;
 
 	if (!(sb->s_flags & MS_RDONLY)) {
 		jffs2_dbg(1, "%s()\n", __func__);
 		jffs2_flush_wbuf_gc(c, 0);
 	}
-
-	unlock_super(sb);
 }
 
 static const char *jffs2_compr_name(unsigned int compr)
-- 
1.7.7.6
