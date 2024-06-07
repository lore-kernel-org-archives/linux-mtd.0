Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADEFC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDEcxezS83ia6gFz+TwnBEZUiWEAZ2XPb0FhzfpEAZ0=; b=uHGHGxUVslYSTH
	pVlSFtZNyeMxyOKCGfbl1EJ74bK2/QNUisY+NpCZLaVdtXGIKsMfzHZb3jHSY5S1N1G7STNESJyZd
	cwBlW+0rbfCJE4I2V5aOliead1V+kJtnKKopFrCump7nj3mtXcKQTuOS8EdXPTyfocPM6AjPfJcUm
	/a07BcBgx6ApG9MesEV8v11eOBGCQcH2B1pkgxnDfYZU+AOAdJzg2yHZqvTGGagQhC8sLhbd16KIl
	Fjl76+cTG0JtwDZP2nD6oAUF+a1rp5TS/M5dFFsCZyUZj3cROCxHZoAHkMgGmgvELUzf6rwY0t46m
	JJNbq9XWSUtPWsMz3BKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSD6-0000000CUXj-4348;
	Fri, 07 Jun 2024 05:32:20 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBl-0000000CG9n-0G5z
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:26:59 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSjS4Tqfz1SB59;
	Fri,  7 Jun 2024 12:22:52 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EC5B1400D5;
	Fri,  7 Jun 2024 12:26:51 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:39 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 018/110] mtd-utils: Extract rbtree implementation to common lib
Date: Fri, 7 Jun 2024 12:24:43 +0800
Message-ID: <20240607042615.2069840-19-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212653_608287_911C14B2 
X-CRM114-Status: GOOD (  17.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Current rbtree implementation code is put under jffs utils, extract it
into common lib, and add more rbtree operations(eg. rb_first_postorder,
rb_next_postorder, etc.).

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 {jffsX-utils => include}/rbtree.h | 32 ++++++++++++++++++++++++++++++++
 jffsX-utils/Makemodule.am         |  6 ++----
 lib/Makemodule.am                 |  2 ++
 {jffsX-utils => lib}/rbtree.c     | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+), 4 deletions(-)
 rename {jffsX-utils => include}/rbtree.h (79%)
 rename {jffsX-utils => lib}/rbtree.c (90%)

diff --git a/jffsX-utils/rbtree.h b/include/rbtree.h
similarity index 79%
rename from jffsX-utils/rbtree.h
rename to include/rbtree.h
index 0d77b65f..89926e74 100644
--- a/jffsX-utils/rbtree.h
+++ b/include/rbtree.h
@@ -155,6 +155,38 @@ extern struct rb_node *rb_prev(struct rb_node *);
 extern struct rb_node *rb_first(struct rb_root *);
 extern struct rb_node *rb_last(struct rb_root *);
 
+/* Postorder iteration - always visit the parent after its children */
+extern struct rb_node *rb_first_postorder(const struct rb_root *);
+extern struct rb_node *rb_next_postorder(const struct rb_node *);
+
+#define rb_entry_safe(ptr, type, member) \
+	({ typeof(ptr) ____ptr = (ptr); \
+	   ____ptr ? rb_entry(____ptr, type, member) : NULL; \
+	})
+
+/**
+ * rbtree_postorder_for_each_entry_safe - iterate in post-order over rb_root of
+ * given type allowing the backing memory of @pos to be invalidated
+ *
+ * @pos:	the 'type *' to use as a loop cursor.
+ * @n:		another 'type *' to use as temporary storage
+ * @root:	'rb_root *' of the rbtree.
+ * @field:	the name of the rb_node field within 'type'.
+ *
+ * rbtree_postorder_for_each_entry_safe() provides a similar guarantee as
+ * list_for_each_entry_safe() and allows the iteration to continue independent
+ * of changes to @pos by the body of the loop.
+ *
+ * Note, however, that it cannot handle other modifications that re-order the
+ * rbtree it is iterating over. This includes calling rb_erase() on @pos, as
+ * rb_erase() may rebalance the tree, causing us to miss some nodes.
+ */
+#define rbtree_postorder_for_each_entry_safe(pos, n, root, field) \
+	for (pos = rb_entry_safe(rb_first_postorder(root), typeof(*pos), field); \
+	     pos && ({ n = rb_entry_safe(rb_next_postorder(&pos->field), \
+			typeof(*pos), field); 1; }); \
+	     pos = n)
+
 /* Fast replacement of a single node without remove/rebalance/add/rebalance */
 extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
 			    struct rb_root *root);
diff --git a/jffsX-utils/Makemodule.am b/jffsX-utils/Makemodule.am
index 2374b858..4ae4c57b 100644
--- a/jffsX-utils/Makemodule.am
+++ b/jffsX-utils/Makemodule.am
@@ -1,16 +1,14 @@
 mkfs_jffs2_SOURCES = \
 	jffsX-utils/mkfs.jffs2.c \
-	jffsX-utils/rbtree.h \
 	jffsX-utils/compr.h \
-	jffsX-utils/rbtree.c \
 	jffsX-utils/compr.c \
 	jffsX-utils/compr_rtime.c \
 	jffsX-utils/compr.h \
-	jffsX-utils/rbtree.h \
 	jffsX-utils/summary.h \
 	include/linux/jffs2.h \
 	include/mtd/jffs2-user.h \
-	include/list.h
+	include/list.h \
+	include/rbtree.h
 mkfs_jffs2_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
 mkfs_jffs2_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS)
 
diff --git a/lib/Makemodule.am b/lib/Makemodule.am
index 7f890daa..441532de 100644
--- a/lib/Makemodule.am
+++ b/lib/Makemodule.am
@@ -7,6 +7,8 @@ libmtd_a_SOURCES = \
 	include/common.h \
 	lib/list_sort.c \
 	include/list.h \
+	lib/rbtree.c \
+	include/rbtree.h \
 	lib/libcrc32.c \
 	include/crc32.h \
 	lib/libmtd_legacy.c \
diff --git a/jffsX-utils/rbtree.c b/lib/rbtree.c
similarity index 90%
rename from jffsX-utils/rbtree.c
rename to lib/rbtree.c
index 329e0986..32c87556 100644
--- a/jffsX-utils/rbtree.c
+++ b/lib/rbtree.c
@@ -388,3 +388,41 @@ void rb_replace_node(struct rb_node *victim, struct rb_node *new,
 	/* Copy the pointers/colour from the victim to the replacement */
 	*new = *victim;
 }
+
+static struct rb_node *rb_left_deepest_node(const struct rb_node *node)
+{
+	for (;;) {
+		if (node->rb_left)
+			node = node->rb_left;
+		else if (node->rb_right)
+			node = node->rb_right;
+		else
+			return (struct rb_node *)node;
+	}
+}
+
+struct rb_node *rb_next_postorder(const struct rb_node *node)
+{
+	const struct rb_node *parent;
+	if (!node)
+		return NULL;
+	parent = rb_parent(node);
+
+	/* If we're sitting on node, we've already seen our children */
+	if (parent && node == parent->rb_left && parent->rb_right) {
+		/* If we are the parent's left node, go to the parent's right
+		 * node then all the way down to the left */
+		return rb_left_deepest_node(parent->rb_right);
+	} else
+		/* Otherwise we are the parent's right node, and the parent
+		 * should be next */
+		return (struct rb_node *)parent;
+}
+
+struct rb_node *rb_first_postorder(const struct rb_root *root)
+{
+	if (!root->rb_node)
+		return NULL;
+
+	return rb_left_deepest_node(root->rb_node);
+}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
