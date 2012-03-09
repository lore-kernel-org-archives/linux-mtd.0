Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S67qL-0004qo-AM
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 21:59:22 +0000
Message-ID: <1331330354.14442.6.camel@joe2Laptop>
Subject: [PATCH l2-mtd] jffs2: Fix build when CONFIG_JFFS2_FS_DEBUG > 0
From: Joe Perches <joe@perches.com>
To: dedekind1@gmail.com
Date: Fri, 09 Mar 2012 13:59:14 -0800
In-Reply-To: <1331294012.29445.10.camel@sauron.fi.intel.com>
References: <cover.1329349881.git.joe@perches.com>
 <2d68e76db16d42f451370714f03ef952e0839692.1329349881.git.joe@perches.com>
 <1330965033.7220.16.camel@golum> <1330966615.3140.6.camel@joe2Laptop>
 <1331294012.29445.10.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
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

commit c6f6dad20d71 ("jffs2: Standardize JFFS_<LEVEL> uses")
broke the build when CONFIG_JFFS2_FS_DEBUG > 0.  Similarly,
commit 41f75c15285c ("jffs2: Convert printks to pr_<level>")
also broke the build.

Oops.  Insufficient compile testing...

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/jffs2/debug.c |    2 +-
 fs/jffs2/debug.h |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index f8a99a3..1090eb6 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -267,7 +267,7 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 do {									\
 	if (sz != c->sz##_size) {					\
 		pr_warn("%s_size mismatch counted 0x%x, c->%s_size 0x%x\n", \
-			#sz, #sz, sz, c->sz##_size);			\
+			#sz, sz, #sz, c->sz##_size);			\
 		dump = 1;						\
 	}								\
 } while (0)
diff --git a/fs/jffs2/debug.h b/fs/jffs2/debug.h
index b154797..4fd9be4 100644
--- a/fs/jffs2/debug.h
+++ b/fs/jffs2/debug.h
@@ -69,6 +69,11 @@ do {						\
 		pr_debug(fmt, ##__VA_ARGS__);	\
 } while (0)
 
+/* The prefixes of JFFS2 messages */
+#define JFFS2_DBG		KERN_DEBUG
+#define JFFS2_DBG_PREFIX	"[JFFS2 DBG]"
+#define JFFS2_DBG_MSG_PREFIX	JFFS2_DBG JFFS2_DBG_PREFIX
+
 /* JFFS2 message macros */
 #define JFFS2_ERROR(fmt, ...)					\
 	pr_err("error: (%d) %s: " fmt,				\
-- 
1.7.8.111.gad25c.dirty
