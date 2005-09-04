Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EBqMv-00065N-0d
	for linux-mtd@lists.infradead.org; Sun, 04 Sep 2005 05:00:59 -0400
Date: Sun, 4 Sep 2005 11:00:43 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
Message-ID: <20050904090043.GA9632@wohnheim.fh-wedel.de>
References: <20050901125707.GA1623@wohnheim.fh-wedel.de>
	<1125665087.32593.41.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125665087.32593.41.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 September 2005 14:44:47 +0200, Øyvind Harboe wrote:
>
> To: linux-mtd@lists.infradead.org

Please keep everyone in the thread on Cc:.  Being subscribed to a
dozen mailing lists causes me to miss some things otherwise.

> How about this patch?
> 
> It adds a mount option to allow Write Once Read Many if the disk is too
> small to support read/write many times.
> 
> W.r.t. eCos, I expect the WORM capability to be enabled via a CDL
> option.

I have to admit being clueless about eCos.  For Linux, the parser bits
are still missing.  How about this patch?  The parser stuff is quite
large, as this appears to be the first JFFS2 mount option ever.

Jörn

-- 
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories


Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 fs/jffs2/build.c            |    6 ++++++
 fs/jffs2/fs.c               |   41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/jffs2_fs_sb.h |    7 ++++---
 3 files changed, 51 insertions(+), 3 deletions(-)

--- linux-2.6.13-rc6mtd/fs/jffs2/build.c~jffs2_worm	2005-08-26 17:18:04.000000000 +0200
+++ linux-2.6.13-rc6mtd/fs/jffs2/build.c	2005-09-04 10:29:39.000000000 +0200
@@ -279,6 +279,12 @@ static void jffs2_calc_trigger_levels(st
 
 	c->resv_blocks_write = c->resv_blocks_deletion + (size / c->sector_size);
 
+	/* Allow JFFS2 to run in WORM (write once read many) mode.
+	   This mode makes sense for small flashes with very rare
+	   updates of small amounts of data. */
+	if ((c->flags & JFFS2_SB_FLAG_WORM) && (c->nr_blocks < c->resv_blocks_write))
+		c->resv_blocks_write = 0; 
+
 	/* When do we let the GC thread run in the background */
 
 	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;
--- linux-2.6.13-rc6mtd/fs/jffs2/fs.c~jffs2_worm	2005-09-04 10:15:36.000000000 +0200
+++ linux-2.6.13-rc6mtd/fs/jffs2/fs.c	2005-09-04 10:57:33.000000000 +0200
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 #include <linux/vfs.h>
 #include <linux/crc32.h>
+#include <linux/parser.h>
 #include "nodelist.h"
 
 static int jffs2_flash_setup(struct jffs2_sb_info *c);
@@ -440,6 +441,44 @@ struct inode *jffs2_new_inode (struct in
 }
 
 
+enum {
+	opt_worm,
+};
+
+
+static match_table_t tokens = {
+	{opt_worm,	"worm"},
+};
+
+
+static int jffs2_parse_options(struct jffs2_sb_info *c, void *_data)
+{
+	char *data = _data;
+	char *p;
+	substring_t args[MAX_OPT_ARGS];
+
+	if (!data)
+		return 0;
+
+	while ((p = strsep(&data, ","))) {
+		int token;
+
+		if (!*p)
+			continue;
+		token = match_token(p, tokens, args);
+		switch (token) {
+		case opt_worm:
+			c->flags |= JFFS2_SB_FLAG_WORM;
+			break;
+		default:
+			printk(KERN_ERR"jffs2: unknown mount flag \"%s\"\n", p);
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+
 int jffs2_do_fill_super(struct super_block *sb, void *data, int silent)
 {
 	struct jffs2_sb_info *c;
@@ -459,6 +498,8 @@ int jffs2_do_fill_super(struct super_blo
 		return -EINVAL;
 	}
 #endif
+	if (jffs2_parse_options(c, data))
+		return -EINVAL;
 
 	c->flash_size = c->mtd->size;
 
--- linux-2.6.13-rc6mtd/include/linux/jffs2_fs_sb.h~jffs2_worm	2005-08-17 13:37:29.000000000 +0200
+++ linux-2.6.13-rc6mtd/include/linux/jffs2_fs_sb.h	2005-09-04 10:55:07.000000000 +0200
@@ -13,9 +13,10 @@
 #include <linux/list.h>
 #include <linux/rwsem.h>
 
-#define JFFS2_SB_FLAG_RO 1
-#define JFFS2_SB_FLAG_SCANNING 2 /* Flash scanning is in progress */
-#define JFFS2_SB_FLAG_BUILDING 4 /* File system building is in progress */
+#define JFFS2_SB_FLAG_RO	1
+#define JFFS2_SB_FLAG_SCANNING	2 /* Flash scanning is in progress */
+#define JFFS2_SB_FLAG_BUILDING	4 /* File system building is in progress */
+#define JFFS2_SB_FLAG_WORM	8 /* Write once read many - writes but no GC */
 
 struct jffs2_inodirty;
 
