Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OybKT-0001aC-Ma
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 02:14:34 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 9D3D11B4049
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 02:14:28 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] rbtree: avoid redefining offsetof
Date: Wed, 22 Sep 2010 22:13:40 -0400
Message-Id: <1285208020-24905-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Newer versions of gcc will define & export offsetof, so we don't
want to unconditionally define it.  Otherwise we hit:
	In file included from mkfs.jffs2.c:76:0:
	rbtree.h:134:0: warning: "offsetof" redefined
	/usr/lib/gcc/x86_64-pc-linux-gnu/4.5.1/include/stddef.h:411:0: note:
		this is the location of the previous definition

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 rbtree.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/rbtree.h b/rbtree.h
index 9597b10..e64dc9a 100644
--- a/rbtree.h
+++ b/rbtree.h
@@ -131,7 +131,10 @@ static inline void rb_set_color(struct rb_node *rb, int color)
 
 #define RB_ROOT	(struct rb_root) { NULL, }
 
+/* Newer gcc versions take care of exporting this */
+#ifndef offsetof
 #define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
+#endif
 
 #define container_of(ptr, type, member) ({                      \
         const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
-- 
1.7.3
