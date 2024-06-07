Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598C1C27C6F
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBAUPrZgbisdJ/c6RAamOflpBTnuyPdQ5VTVsPjEOwE=; b=ohWbG8jXb8oJ1u
	zf+gUYoKStdq9uLjJ/8TG6uzFazC61NmQiJ10YJC5sUpAokpzir3uPg/Rzfya8g0hPOMigiC/Zty4
	ca6RaDadjxvhguOheRNUkUu+V3g2rP2Q2EpLuBU3nc6Yl6F8M3ni4ki0p4G9IpBakg8ZFCs9nODhq
	t+ACl38XNGkHOjvjplzBjVK7LZbsdZZONV9BeMlfiv53frwQcXQ4PKRgHQefqbLlFb1BmumEVjjGA
	3+iCGUJrbbSB6XASDs7naXHq8Hd4uwE3q+8GCbm2iTFXOTJ6Ei5o125d9tfu0pqAvICyj9oeCQKTs
	cesz88mJpP4smLgUzwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSD7-0000000CUXx-2Nfu;
	Fri, 07 Jun 2024 05:32:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBk-0000000CG9L-0zPQ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:05 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwShk5frwzmYDj;
	Fri,  7 Jun 2024 12:22:14 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A9F81400D5;
	Fri,  7 Jun 2024 12:26:50 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:39 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 017/110] mtd-utils: Extract list implementation to common lib and add list_sort support
Date: Fri, 7 Jun 2024 12:24:42 +0800
Message-ID: <20240607042615.2069840-18-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212652_973942_2C2A55BD 
X-CRM114-Status: GOOD (  32.75  )
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

Current list implementation code is put under jffs utils, extract it into
common lib, and add more list operations(eg. list_move, list_splice, etc.).
Besides, add list sorting support in new source file lib/list_sort.c.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 include/list.h            | 263 ++++++++++++++++++++++++++++++++++++++++++++++
 jffsX-utils/Makemodule.am |   3 +-
 jffsX-utils/compr.c       |  49 ---------
 jffsX-utils/compr.h       |   5 +-
 lib/Makemodule.am         |   2 +
 lib/list_sort.c           | 246 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 514 insertions(+), 54 deletions(-)
 create mode 100644 include/list.h
 create mode 100644 lib/list_sort.c

diff --git a/include/list.h b/include/list.h
new file mode 100644
index 00000000..d26c9d1c
--- /dev/null
+++ b/include/list.h
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2006 Silicon Graphics, Inc.
+ * All Rights Reserved.
+ */
+#ifndef __LIST_H__
+#define __LIST_H__
+
+#include <stddef.h>
+
+/*
+ * This undef is here because BSD 4.4 added some LIST_ macros into system
+ * header file sys/queue.h. This header is included in many other system
+ * headers and thus causes "macro redefined" warnings.
+ *
+ * As OS X is kind of a derivate of BSD, this affects OS X too.
+ *
+ * To use our own LIST_ macros (copied from kernel code), we have to
+ * at first undefine the conflicting system macros.
+ *
+ */
+#undef LIST_HEAD
+#undef LIST_HEAD_INIT
+
+/*
+ * Simple, generic doubly-linked list implementation.
+ */
+
+struct list_head {
+	struct list_head *next;
+	struct list_head *prev;
+};
+
+#define LIST_HEAD_INIT(name) { &(name), &(name) }
+
+#define LIST_HEAD(name) \
+		struct list_head name = LIST_HEAD_INIT(name)
+
+#define INIT_LIST_HEAD(list) list_head_init(list)
+static inline void list_head_init(struct list_head *list)
+{
+	list->next = list->prev = list;
+}
+
+static inline void list_head_destroy(struct list_head *list)
+{
+	list->next = list->prev = NULL;
+}
+
+static inline void __list_add(struct list_head *add,
+			      struct list_head *prev, struct list_head *next)
+{
+	next->prev = add;
+	add->next = next;
+	add->prev = prev;
+	prev->next = add;
+}
+
+static inline void list_add(struct list_head *add, struct list_head *head)
+{
+	__list_add(add, head, head->next);
+}
+
+static inline void list_add_tail(struct list_head *add, struct list_head *head)
+{
+	__list_add(add, head->prev, head);
+}
+
+static inline void __list_del(struct list_head *prev, struct list_head *next)
+{
+	next->prev = prev;
+	prev->next = next;
+}
+
+static inline void list_del_init(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+	list_head_init(entry);
+}
+
+static inline void list_del(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+}
+
+static inline void list_move(struct list_head *list, struct list_head *head)
+{
+	__list_del(list->prev, list->next);
+	list_add(list, head);
+}
+
+static inline void list_move_tail(struct list_head *list, struct list_head *head)
+{
+	__list_del(list->prev, list->next);
+	list_add_tail(list, head);
+}
+
+/**
+ * list_is_last - tests whether @list is the last entry in list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_last(const struct list_head *list, const struct list_head *head)
+{
+	return list->next == head;
+}
+
+static inline int list_empty(const struct list_head *head)
+{
+	return head->next == head;
+}
+
+static inline void __list_splice(struct list_head *list,
+				 struct list_head *prev,
+				 struct list_head *next)
+{
+	struct list_head *first = list->next;
+	struct list_head *last = list->prev;
+
+	first->prev = prev;
+	prev->next = first;
+
+	last->next = next;
+	next->prev = last;
+}
+
+static inline void list_splice(struct list_head *list, struct list_head *head)
+{
+	if (!list_empty(list))
+		__list_splice(list, head, head->next);
+}
+
+static inline void list_splice_tail(struct list_head *list,
+				    struct list_head *head)
+{
+	if (!list_empty(list))
+		__list_splice(list, head->prev, head);
+}
+
+static inline void list_splice_init(struct list_head *list,
+				    struct list_head *head)
+{
+	if (!list_empty(list)) {
+		__list_splice(list, head, head->next);
+		list_head_init(list);
+	}
+}
+
+#define list_entry(ptr, type, member) ({			\
+	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
+	(type *)( (char *)__mptr - offsetof(type,member) );})
+
+#define list_for_each(pos, head) \
+	for (pos = (head)->next; pos != (head); pos = pos->next)
+
+#define list_for_each_safe(pos, n, head) \
+	for (pos = (head)->next, n = pos->next; pos != (head); \
+		pos = n, n = pos->next)
+
+#define list_for_each_entry(pos, head, member)				\
+	for (pos = list_entry((head)->next, typeof(*pos), member);	\
+	     &pos->member != (head); 	\
+	     pos = list_entry(pos->member.next, typeof(*pos), member))
+
+#define list_for_each_entry_safe(pos, n, head, member)			\
+	for (pos = list_entry((head)->next, typeof(*pos), member),	\
+		n = list_entry(pos->member.next, typeof(*pos), member);	\
+	     &pos->member != (head); 					\
+	     pos = n, n = list_entry(n->member.next, typeof(*n), member))
+
+#define list_first_entry(ptr, type, member) \
+	list_entry((ptr)->next, type, member)
+
+#define container_of(ptr, type, member) ({			\
+	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
+	(type *)( (char *)__mptr - offsetof(type,member) );})
+
+/**
+ * list_entry_is_head - test if the entry points to the head of the list
+ * @pos:	the type * to cursor
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_entry_is_head(pos, head, member)				\
+	(&pos->member == (head))
+
+typedef int __attribute__((nonnull(2,3))) (*list_cmp_func_t)(void *,
+			const struct list_head *, const struct list_head *);
+__attribute__((nonnull(2,3)))
+void list_sort(void *priv, struct list_head *head, list_cmp_func_t cmp);
+
+/**
+ * list_splice_tail_init - join two lists and reinitialise the emptied list
+ * @list: the new list to add.
+ * @head: the place to add it in the first list.
+ *
+ * Each of the lists is a queue.
+ * The list at @list is reinitialised
+ */
+static inline void list_splice_tail_init(struct list_head *list,
+					 struct list_head *head)
+{
+	if (!list_empty(list)) {
+		__list_splice(list, head->prev, head);
+		INIT_LIST_HEAD(list);
+	}
+}
+
+/**
+ * list_replace - replace old entry by new one
+ * @old : the element to be replaced
+ * @new : the new element to insert
+ *
+ * If @old was empty, it will be overwritten.
+ */
+static inline void list_replace(struct list_head *old,
+				struct list_head *new)
+{
+	new->next = old->next;
+	new->next->prev = new;
+	new->prev = old->prev;
+	new->prev->next = new;
+}
+
+/**
+ * list_last_entry - get the last element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note, that list is expected to be not empty.
+ */
+#define list_last_entry(ptr, type, member) \
+	list_entry((ptr)->prev, type, member)
+
+/**
+ * list_prev_entry - get the prev element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_prev_entry(pos, member) \
+	list_entry((pos)->member.prev, typeof(*(pos)), member)
+
+/**
+ * list_next_entry - get the next element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_next_entry(pos, member) \
+	list_entry((pos)->member.next, typeof(*(pos)), member)
+
+/**
+ * list_for_each_entry_reverse - iterate backwards over list of given type.
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_reverse(pos, head, member)			\
+	for (pos = list_last_entry(head, typeof(*pos), member);		\
+	     &pos->member != (head); 					\
+	     pos = list_prev_entry(pos, member))
+
+#endif	/* __LIST_H__ */
diff --git a/jffsX-utils/Makemodule.am b/jffsX-utils/Makemodule.am
index 266c12ef..2374b858 100644
--- a/jffsX-utils/Makemodule.am
+++ b/jffsX-utils/Makemodule.am
@@ -9,7 +9,8 @@ mkfs_jffs2_SOURCES = \
 	jffsX-utils/rbtree.h \
 	jffsX-utils/summary.h \
 	include/linux/jffs2.h \
-	include/mtd/jffs2-user.h
+	include/mtd/jffs2-user.h \
+	include/list.h
 mkfs_jffs2_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
 mkfs_jffs2_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS)
 
diff --git a/jffsX-utils/compr.c b/jffsX-utils/compr.c
index 01176ebe..d408ef8a 100644
--- a/jffsX-utils/compr.c
+++ b/jffsX-utils/compr.c
@@ -17,55 +17,6 @@
 
 extern int page_size;
 
-/* LIST IMPLEMENTATION (from linux/list.h) */
-
-#define LIST_HEAD_INIT(name) { &(name), &(name) }
-
-#define LIST_HEAD(name) \
-	struct list_head name = LIST_HEAD_INIT(name)
-
-static inline void __list_add(struct list_head *new,
-		struct list_head *prev,
-		struct list_head *next)
-{
-	next->prev = new;
-	new->next = next;
-	new->prev = prev;
-	prev->next = new;
-}
-
-static inline void list_add(struct list_head *new, struct list_head *head)
-{
-	__list_add(new, head, head->next);
-}
-
-static inline void list_add_tail(struct list_head *new, struct list_head *head)
-{
-	__list_add(new, head->prev, head);
-}
-
-static inline void __list_del(struct list_head *prev, struct list_head *next)
-{
-	next->prev = prev;
-	prev->next = next;
-}
-
-static inline void list_del(struct list_head *entry)
-{
-	__list_del(entry->prev, entry->next);
-	entry->next = (void *) 0;
-	entry->prev = (void *) 0;
-}
-
-#define list_entry(ptr, type, member) \
-	((type *)((char *)(ptr)-(unsigned long)(&((type *)0)->member)))
-
-#define list_for_each_entry(pos, head, member)                          \
-	for (pos = list_entry((head)->next, typeof(*pos), member);      \
-			&pos->member != (head);                                    \
-			pos = list_entry(pos->member.next, typeof(*pos), member))
-
-
 /* Available compressors are on this list */
 static LIST_HEAD(jffs2_compressor_list);
 
diff --git a/jffsX-utils/compr.h b/jffsX-utils/compr.h
index f1f59758..69699523 100644
--- a/jffsX-utils/compr.h
+++ b/jffsX-utils/compr.h
@@ -15,6 +15,7 @@
 #include <stdlib.h>
 #include <stdint.h>
 #include "linux/jffs2.h"
+#include "list.h"
 
 #define CONFIG_JFFS2_RTIME
 
@@ -49,10 +50,6 @@
 #define KERN_INFO
 #define KERN_DEBUG
 
-struct list_head {
-	struct list_head *next, *prev;
-};
-
 void jffs2_set_compression_mode(int mode);
 int jffs2_get_compression_mode(void);
 int jffs2_set_compression_mode_name(const char *mode_name);
diff --git a/lib/Makemodule.am b/lib/Makemodule.am
index 570896b4..7f890daa 100644
--- a/lib/Makemodule.am
+++ b/lib/Makemodule.am
@@ -5,6 +5,8 @@ libmtd_a_SOURCES = \
 	include/libfec.h \
 	lib/common.c \
 	include/common.h \
+	lib/list_sort.c \
+	include/list.h \
 	lib/libcrc32.c \
 	include/crc32.h \
 	lib/libmtd_legacy.c \
diff --git a/lib/list_sort.c b/lib/list_sort.c
new file mode 100644
index 00000000..d8734389
--- /dev/null
+++ b/lib/list_sort.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "list.h"
+
+/*
+ * Returns a list organized in an intermediate format suited
+ * to chaining of merge() calls: null-terminated, no reserved or
+ * sentinel head node, "prev" links not maintained.
+ */
+__attribute__((nonnull(2,3,4)))
+static struct list_head *merge(void *priv, list_cmp_func_t cmp,
+			       struct list_head *a, struct list_head *b)
+{
+	struct list_head *head, **tail = &head;
+
+	for (;;) {
+		/* if equal, take 'a' -- important for sort stability */
+		if (cmp(priv, a, b) <= 0) {
+			*tail = a;
+			tail = &a->next;
+			a = a->next;
+			if (!a) {
+				*tail = b;
+				break;
+			}
+		} else {
+			*tail = b;
+			tail = &b->next;
+			b = b->next;
+			if (!b) {
+				*tail = a;
+				break;
+			}
+		}
+	}
+	return head;
+}
+
+/*
+ * Combine final list merge with restoration of standard doubly-linked
+ * list structure.  This approach duplicates code from merge(), but
+ * runs faster than the tidier alternatives of either a separate final
+ * prev-link restoration pass, or maintaining the prev links
+ * throughout.
+ */
+__attribute__((nonnull(2,3,4,5)))
+static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
+			struct list_head *a, struct list_head *b)
+{
+	struct list_head *tail = head;
+	unsigned int count = 0;
+
+	for (;;) {
+		/* if equal, take 'a' -- important for sort stability */
+		if (cmp(priv, a, b) <= 0) {
+			tail->next = a;
+			a->prev = tail;
+			tail = a;
+			a = a->next;
+			if (!a)
+				break;
+		} else {
+			tail->next = b;
+			b->prev = tail;
+			tail = b;
+			b = b->next;
+			if (!b) {
+				b = a;
+				break;
+			}
+		}
+	}
+
+	/* Finish linking remainder of list b on to tail */
+	tail->next = b;
+	do {
+		/*
+		 * If the merge is highly unbalanced (e.g. the input is
+		 * already sorted), this loop may run many iterations.
+		 * Continue callbacks to the client even though no
+		 * element comparison is needed, so the client's cmp()
+		 * routine can invoke cond_resched() periodically.
+		 */
+		if (!++count)
+			cmp(priv, b, b);
+		b->prev = tail;
+		tail = b;
+		b = b->next;
+	} while (b);
+
+	/* And the final links to make a circular doubly-linked list */
+	tail->next = head;
+	head->prev = tail;
+}
+
+/**
+ * list_sort - sort a list
+ * @priv: private data, opaque to list_sort(), passed to @cmp
+ * @head: the list to sort
+ * @cmp: the elements comparison function
+ *
+ * The comparison function @cmp must return > 0 if @a should sort after
+ * @b ("@a > @b" if you want an ascending sort), and <= 0 if @a should
+ * sort before @b *or* their original order should be preserved.  It is
+ * always called with the element that came first in the input in @a,
+ * and list_sort is a stable sort, so it is not necessary to distinguish
+ * the @a < @b and @a == @b cases.
+ *
+ * This is compatible with two styles of @cmp function:
+ * - The traditional style which returns <0 / =0 / >0, or
+ * - Returning a boolean 0/1.
+ * The latter offers a chance to save a few cycles in the comparison
+ * (which is used by e.g. plug_ctx_cmp() in block/blk-mq.c).
+ *
+ * A good way to write a multi-word comparison is::
+ *
+ *	if (a->high != b->high)
+ *		return a->high > b->high;
+ *	if (a->middle != b->middle)
+ *		return a->middle > b->middle;
+ *	return a->low > b->low;
+ *
+ *
+ * This mergesort is as eager as possible while always performing at least
+ * 2:1 balanced merges.  Given two pending sublists of size 2^k, they are
+ * merged to a size-2^(k+1) list as soon as we have 2^k following elements.
+ *
+ * Thus, it will avoid cache thrashing as long as 3*2^k elements can
+ * fit into the cache.  Not quite as good as a fully-eager bottom-up
+ * mergesort, but it does use 0.2*n fewer comparisons, so is faster in
+ * the common case that everything fits into L1.
+ *
+ *
+ * The merging is controlled by "count", the number of elements in the
+ * pending lists.  This is beautifully simple code, but rather subtle.
+ *
+ * Each time we increment "count", we set one bit (bit k) and clear
+ * bits k-1 .. 0.  Each time this happens (except the very first time
+ * for each bit, when count increments to 2^k), we merge two lists of
+ * size 2^k into one list of size 2^(k+1).
+ *
+ * This merge happens exactly when the count reaches an odd multiple of
+ * 2^k, which is when we have 2^k elements pending in smaller lists,
+ * so it's safe to merge away two lists of size 2^k.
+ *
+ * After this happens twice, we have created two lists of size 2^(k+1),
+ * which will be merged into a list of size 2^(k+2) before we create
+ * a third list of size 2^(k+1), so there are never more than two pending.
+ *
+ * The number of pending lists of size 2^k is determined by the
+ * state of bit k of "count" plus two extra pieces of information:
+ *
+ * - The state of bit k-1 (when k == 0, consider bit -1 always set), and
+ * - Whether the higher-order bits are zero or non-zero (i.e.
+ *   is count >= 2^(k+1)).
+ *
+ * There are six states we distinguish.  "x" represents some arbitrary
+ * bits, and "y" represents some arbitrary non-zero bits:
+ * 0:  00x: 0 pending of size 2^k;           x pending of sizes < 2^k
+ * 1:  01x: 0 pending of size 2^k; 2^(k-1) + x pending of sizes < 2^k
+ * 2: x10x: 0 pending of size 2^k; 2^k     + x pending of sizes < 2^k
+ * 3: x11x: 1 pending of size 2^k; 2^(k-1) + x pending of sizes < 2^k
+ * 4: y00x: 1 pending of size 2^k; 2^k     + x pending of sizes < 2^k
+ * 5: y01x: 2 pending of size 2^k; 2^(k-1) + x pending of sizes < 2^k
+ * (merge and loop back to state 2)
+ *
+ * We gain lists of size 2^k in the 2->3 and 4->5 transitions (because
+ * bit k-1 is set while the more significant bits are non-zero) and
+ * merge them away in the 5->2 transition.  Note in particular that just
+ * before the 5->2 transition, all lower-order bits are 11 (state 3),
+ * so there is one list of each smaller size.
+ *
+ * When we reach the end of the input, we merge all the pending
+ * lists, from smallest to largest.  If you work through cases 2 to
+ * 5 above, you can see that the number of elements we merge with a list
+ * of size 2^k varies from 2^(k-1) (cases 3 and 5 when x == 0) to
+ * 2^(k+1) - 1 (second merge of case 5 when x == 2^(k-1) - 1).
+ */
+__attribute__((nonnull(2,3)))
+void list_sort(void *priv, struct list_head *head, list_cmp_func_t cmp)
+{
+	struct list_head *list = head->next, *pending = NULL;
+	size_t count = 0;	/* Count of pending */
+
+	if (list == head->prev)	/* Zero or one elements */
+		return;
+
+	/* Convert to a null-terminated singly-linked list. */
+	head->prev->next = NULL;
+
+	/*
+	 * Data structure invariants:
+	 * - All lists are singly linked and null-terminated; prev
+	 *   pointers are not maintained.
+	 * - pending is a prev-linked "list of lists" of sorted
+	 *   sublists awaiting further merging.
+	 * - Each of the sorted sublists is power-of-two in size.
+	 * - Sublists are sorted by size and age, smallest & newest at front.
+	 * - There are zero to two sublists of each size.
+	 * - A pair of pending sublists are merged as soon as the number
+	 *   of following pending elements equals their size (i.e.
+	 *   each time count reaches an odd multiple of that size).
+	 *   That ensures each later final merge will be at worst 2:1.
+	 * - Each round consists of:
+	 *   - Merging the two sublists selected by the highest bit
+	 *     which flips when count is incremented, and
+	 *   - Adding an element from the input as a size-1 sublist.
+	 */
+	do {
+		size_t bits;
+		struct list_head **tail = &pending;
+
+		/* Find the least-significant clear bit in count */
+		for (bits = count; bits & 1; bits >>= 1)
+			tail = &(*tail)->prev;
+		/* Do the indicated merge */
+		if (bits) {
+			struct list_head *a = *tail, *b = a->prev;
+
+			a = merge(priv, cmp, b, a);
+			/* Install the merged result in place of the inputs */
+			a->prev = b->prev;
+			*tail = a;
+		}
+
+		/* Move one element from input list to pending */
+		list->prev = pending;
+		pending = list;
+		list = list->next;
+		pending->next = NULL;
+		count++;
+	} while (list);
+
+	/* End of input; merge together all the pending lists. */
+	list = pending;
+	pending = pending->prev;
+	for (;;) {
+		struct list_head *next = pending->prev;
+
+		if (!next)
+			break;
+		list = merge(priv, cmp, pending, list);
+		pending = next;
+	}
+	/* The final merge, rebuilding prev links */
+	merge_final(priv, cmp, head, pending, list);
+}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
