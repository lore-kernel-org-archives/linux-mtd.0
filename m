Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NpqVn-0003PP-2B
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2010 22:05:51 +0000
Message-Id: <201003112205.o2BM5bFt013302@imap1.linux-foundation.org>
Subject: [patch 1/2] jffs2: fix up rb_root initializations to use RB_ROOT
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Thu, 11 Mar 2010 14:05:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org, eparis@redhat.com,
	venkatesh.pallipadi@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: venkatesh.pallipadi@intel.com

jffs2 uses rb_node = NULL; to zero rb_root.

The problem with this is that 17d9ddc72fb8bba0d4f678 ("rbtree: Add support
for augmented rbtrees") in the linux-next tree adds a new field to that
struct which needs to be NULLas well.  This patch uses RB_ROOT as the
intializer so all of the relevant fields will be NULL'd.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: Eric Paris <eparis@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/jffs2/readinode.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN fs/jffs2/readinode.c~jffs2-fixup-rb_root-initializations-to-use-rb_root fs/jffs2/readinode.c
--- a/fs/jffs2/readinode.c~jffs2-fixup-rb_root-initializations-to-use-rb_root
+++ a/fs/jffs2/readinode.c
@@ -567,7 +567,7 @@ static void jffs2_free_tmp_dnode_info_li
 			else BUG();
 		}
 	}
-	list->rb_node = NULL;
+	*list = RB_ROOT;
 }
 
 static void jffs2_free_full_dirent_list(struct jffs2_full_dirent *fd)
_
