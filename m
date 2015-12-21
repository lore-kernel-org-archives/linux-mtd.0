Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwBS-0000mf-8C
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:51:22 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 28/38] ubifs: add complete version of list.h
Date: Mon, 21 Dec 2015 16:41:51 +0800
Message-ID: <1450687321-12381-29-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

See http://lists.infradead.org/pipermail/linux-mtd/2015-October/062421.html

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/include/list.h | 305 +++++++++++++++++++++++++++++++--------------
 1 file changed, 213 insertions(+), 92 deletions(-)

diff --git a/ubifs-utils/include/list.h b/ubifs-utils/include/list.h
index 0cffa33..080ea39 100644
--- a/ubifs-utils/include/list.h
+++ b/ubifs-utils/include/list.h
@@ -17,6 +17,10 @@
 #ifndef _LINUX_LIST_H
 #define _LINUX_LIST_H
 
+struct list_head {
+	struct list_head *next, *prev;
+};
+
 #define LIST_POISON1  ((struct list_head *) 0x00100100)
 #define LIST_POISON2  ((struct list_head *) 0x00200200)
 
@@ -30,10 +34,6 @@
  * using the generic single-entry routines.
  */
 
-struct list_head {
-	struct list_head *next, *prev;
-};
-
 #define LIST_HEAD_INIT(name) { &(name), &(name) }
 
 #define LIST_HEAD(name) \
@@ -52,17 +52,17 @@ static inline void INIT_LIST_HEAD(struct list_head *list)
  * the prev/next entries already!
  */
 #ifndef CONFIG_DEBUG_LIST
-static inline void __list_add(struct list_head *xnew,
+static inline void __list_add(struct list_head *new,
 			      struct list_head *prev,
 			      struct list_head *next)
 {
-	next->prev = xnew;
-	xnew->next = next;
-	xnew->prev = prev;
-	prev->next = xnew;
+	next->prev = new;
+	new->next = next;
+	new->prev = prev;
+	prev->next = new;
 }
 #else
-extern void __list_add(struct list_head *xnew,
+extern void __list_add(struct list_head *new,
 			      struct list_head *prev,
 			      struct list_head *next);
 #endif
@@ -75,14 +75,10 @@ extern void __list_add(struct list_head *xnew,
  * Insert a new entry after the specified head.
  * This is good for implementing stacks.
  */
-#ifndef CONFIG_DEBUG_LIST
-static inline void list_add(struct list_head *xnew, struct list_head *head)
+static inline void list_add(struct list_head *new, struct list_head *head)
 {
-	__list_add(xnew, head, head->next);
+	__list_add(new, head, head->next);
 }
-#else
-extern void list_add(struct list_head *xnew, struct list_head *head);
-#endif
 
 
 /**
@@ -93,9 +89,9 @@ extern void list_add(struct list_head *xnew, struct list_head *head);
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
-static inline void list_add_tail(struct list_head *xnew, struct list_head *head)
+static inline void list_add_tail(struct list_head *new, struct list_head *head)
 {
-	__list_add(xnew, head->prev, head);
+	__list_add(new, head->prev, head);
 }
 
 /*
@@ -114,10 +110,15 @@ static inline void __list_del(struct list_head * prev, struct list_head * next)
 /**
  * list_del - deletes entry from list.
  * @entry: the element to delete from the list.
- * Note: list_empty on entry does not return true after this, the entry is
+ * Note: list_empty() on entry does not return true after this, the entry is
  * in an undefined state.
  */
 #ifndef CONFIG_DEBUG_LIST
+static inline void __list_del_entry(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+}
+
 static inline void list_del(struct list_head *entry)
 {
 	__list_del(entry->prev, entry->next);
@@ -125,6 +126,7 @@ static inline void list_del(struct list_head *entry)
 	entry->prev = LIST_POISON2;
 }
 #else
+extern void __list_del_entry(struct list_head *entry);
 extern void list_del(struct list_head *entry);
 #endif
 
@@ -132,30 +134,32 @@ extern void list_del(struct list_head *entry);
  * list_replace - replace old entry by new one
  * @old : the element to be replaced
  * @new : the new element to insert
- * Note: if 'old' was empty, it will be overwritten.
+ *
+ * If @old was empty, it will be overwritten.
  */
 static inline void list_replace(struct list_head *old,
-				struct list_head *xnew)
+				struct list_head *new)
 {
-	xnew->next = old->next;
-	xnew->next->prev = xnew;
-	xnew->prev = old->prev;
-	xnew->prev->next = xnew;
+	new->next = old->next;
+	new->next->prev = new;
+	new->prev = old->prev;
+	new->prev->next = new;
 }
 
 static inline void list_replace_init(struct list_head *old,
-					struct list_head *xnew)
+					struct list_head *new)
 {
-	list_replace(old, xnew);
+	list_replace(old, new);
 	INIT_LIST_HEAD(old);
 }
+
 /**
  * list_del_init - deletes entry from list and reinitialize it.
  * @entry: the element to delete from the list.
  */
 static inline void list_del_init(struct list_head *entry)
 {
-	__list_del(entry->prev, entry->next);
+	__list_del_entry(entry);
 	INIT_LIST_HEAD(entry);
 }
 
@@ -166,8 +170,8 @@ static inline void list_del_init(struct list_head *entry)
  */
 static inline void list_move(struct list_head *list, struct list_head *head)
 {
-        __list_del(list->prev, list->next);
-        list_add(list, head);
+	__list_del_entry(list);
+	list_add(list, head);
 }
 
 /**
@@ -178,8 +182,8 @@ static inline void list_move(struct list_head *list, struct list_head *head)
 static inline void list_move_tail(struct list_head *list,
 				  struct list_head *head)
 {
-        __list_del(list->prev, list->next);
-        list_add_tail(list, head);
+	__list_del_entry(list);
+	list_add_tail(list, head);
 }
 
 /**
@@ -221,6 +225,69 @@ static inline int list_empty_careful(const struct list_head *head)
 	return (next == head) && (next == head->prev);
 }
 
+/**
+ * list_rotate_left - rotate the list to the left
+ * @head: the head of the list
+ */
+static inline void list_rotate_left(struct list_head *head)
+{
+	struct list_head *first;
+
+	if (!list_empty(head)) {
+		first = head->next;
+		list_move_tail(first, head);
+	}
+}
+
+/**
+ * list_is_singular - tests whether a list has just one entry.
+ * @head: the list to test.
+ */
+static inline int list_is_singular(const struct list_head *head)
+{
+	return !list_empty(head) && (head->next == head->prev);
+}
+
+static inline void __list_cut_position(struct list_head *list,
+		struct list_head *head, struct list_head *entry)
+{
+	struct list_head *new_first = entry->next;
+	list->next = head->next;
+	list->next->prev = list;
+	list->prev = entry;
+	entry->next = list;
+	head->next = new_first;
+	new_first->prev = head;
+}
+
+/**
+ * list_cut_position - cut a list into two
+ * @list: a new list to add all removed entries
+ * @head: a list with entries
+ * @entry: an entry within head, could be the head itself
+ *	and if so we won't cut the list
+ *
+ * This helper moves the initial part of @head, up to and
+ * including @entry, from @head to @list. You should
+ * pass on @entry an element you know is on @head. @list
+ * should be an empty list or a list you do not care about
+ * losing its data.
+ *
+ */
+static inline void list_cut_position(struct list_head *list,
+		struct list_head *head, struct list_head *entry)
+{
+	if (list_empty(head))
+		return;
+	if (list_is_singular(head) &&
+		(head->next != entry && head != entry))
+		return;
+	if (entry == head)
+		INIT_LIST_HEAD(list);
+	else
+		__list_cut_position(list, head, entry);
+}
+
 static inline void __list_splice(const struct list_head *list,
 				 struct list_head *prev,
 				 struct list_head *next)
@@ -236,11 +303,12 @@ static inline void __list_splice(const struct list_head *list,
 }
 
 /**
- * list_splice - join two lists
+ * list_splice - join two lists, this is designed for stacks
  * @list: the new list to add.
  * @head: the place to add it in the first list.
  */
-static inline void list_splice(struct list_head *list, struct list_head *head)
+static inline void list_splice(const struct list_head *list,
+				struct list_head *head)
 {
 	if (!list_empty(list))
 		__list_splice(list, head, head->next);
@@ -295,7 +363,7 @@ static inline void list_splice_tail_init(struct list_head *list,
  * list_entry - get the struct for this entry
  * @ptr:	the &struct list_head pointer.
  * @type:	the type of the struct this is embedded in.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_entry(ptr, type, member) \
 	container_of(ptr, type, member)
@@ -304,7 +372,7 @@ static inline void list_splice_tail_init(struct list_head *list,
  * list_first_entry - get the first element from a list
  * @ptr:	the list head to take the element from.
  * @type:	the type of the struct this is embedded in.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  *
  * Note, that list is expected to be not empty.
  */
@@ -312,35 +380,49 @@ static inline void list_splice_tail_init(struct list_head *list,
 	list_entry((ptr)->next, type, member)
 
 /**
- * list_next_entry - get the next element from a list
+ * list_last_entry - get the last element from a list
  * @ptr:	the list head to take the element from.
- * @member:	the name of the list_struct within the struct.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
  *
- * Note, that next is expected to be not null.
+ * Note, that list is expected to be not empty.
  */
-#define list_next_entry(ptr, member) \
-	list_entry((ptr)->member.next, typeof(*ptr), member)
+#define list_last_entry(ptr, type, member) \
+	list_entry((ptr)->prev, type, member)
 
 /**
- * list_for_each	-	iterate over a list
- * @pos:	the &struct list_head to use as a loop cursor.
- * @head:	the head for your list.
+ * list_first_entry_or_null - get the first element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note that if the list is empty, it returns NULL.
  */
-#define list_for_each(pos, head) \
-	for (pos = (head)->next; pos != (head); \
-        	pos = pos->next)
+#define list_first_entry_or_null(ptr, type, member) \
+	(!list_empty(ptr) ? list_first_entry(ptr, type, member) : NULL)
+
+/**
+ * list_next_entry - get the next element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_next_entry(pos, member) \
+	list_entry((pos)->member.next, typeof(*(pos)), member)
 
 /**
- * __list_for_each	-	iterate over a list
+ * list_prev_entry - get the prev element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_prev_entry(pos, member) \
+	list_entry((pos)->member.prev, typeof(*(pos)), member)
+
+/**
+ * list_for_each	-	iterate over a list
  * @pos:	the &struct list_head to use as a loop cursor.
  * @head:	the head for your list.
- *
- * This variant differs from list_for_each() in that it's the
- * simplest possible list iteration code, no prefetching is done.
- * Use this for code that knows the list to be very short (empty
- * or 1 entry) most of the time.
  */
-#define __list_for_each(pos, head) \
+#define list_for_each(pos, head) \
 	for (pos = (head)->next; pos != (head); pos = pos->next)
 
 /**
@@ -349,8 +431,7 @@ static inline void list_splice_tail_init(struct list_head *list,
  * @head:	the head for your list.
  */
 #define list_for_each_prev(pos, head) \
-	for (pos = (head)->prev; pos != (head); \
-        	pos = pos->prev)
+	for (pos = (head)->prev; pos != (head); pos = pos->prev)
 
 /**
  * list_for_each_safe - iterate over a list safe against removal of list entry
@@ -363,34 +444,45 @@ static inline void list_splice_tail_init(struct list_head *list,
 		pos = n, n = pos->next)
 
 /**
+ * list_for_each_prev_safe - iterate over a list backwards safe against removal of list entry
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @n:		another &struct list_head to use as temporary storage
+ * @head:	the head for your list.
+ */
+#define list_for_each_prev_safe(pos, n, head) \
+	for (pos = (head)->prev, n = pos->prev; \
+	     pos != (head); \
+	     pos = n, n = pos->prev)
+
+/**
  * list_for_each_entry	-	iterate over list of given type
  * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry(pos, head, member)				\
-	for (pos = list_entry((head)->next, typeof(*pos), member);	\
-	     &pos->member != (head); 	\
-	     pos = list_entry(pos->member.next, typeof(*pos), member))
+	for (pos = list_first_entry(head, typeof(*pos), member);	\
+	     &pos->member != (head);					\
+	     pos = list_next_entry(pos, member))
 
 /**
  * list_for_each_entry_reverse - iterate backwards over list of given type.
  * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry_reverse(pos, head, member)			\
-	for (pos = list_entry((head)->prev, typeof(*pos), member);	\
-	     &pos->member != (head); 	\
-	     pos = list_entry(pos->member.prev, typeof(*pos), member))
+	for (pos = list_last_entry(head, typeof(*pos), member);		\
+	     &pos->member != (head); 					\
+	     pos = list_prev_entry(pos, member))
 
 /**
- * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue
+ * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
  * @pos:	the type * to use as a start point
  * @head:	the head of the list
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  *
- * Prepares a pos entry for use as a start point in list_for_each_entry_continue.
+ * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
  */
 #define list_prepare_entry(pos, head, member) \
 	((pos) ? : list_entry(head, typeof(*pos), member))
@@ -399,86 +491,115 @@ static inline void list_splice_tail_init(struct list_head *list,
  * list_for_each_entry_continue - continue iteration over list of given type
  * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  *
  * Continue to iterate over list of given type, continuing after
  * the current position.
  */
 #define list_for_each_entry_continue(pos, head, member) 		\
-	for (pos = list_entry(pos->member.next, typeof(*pos), member);	\
-	     &pos->member != (head);	\
-	     pos = list_entry(pos->member.next, typeof(*pos), member))
+	for (pos = list_next_entry(pos, member);			\
+	     &pos->member != (head);					\
+	     pos = list_next_entry(pos, member))
+
+/**
+ * list_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Start to iterate over list of given type backwards, continuing after
+ * the current position.
+ */
+#define list_for_each_entry_continue_reverse(pos, head, member)		\
+	for (pos = list_prev_entry(pos, member);			\
+	     &pos->member != (head);					\
+	     pos = list_prev_entry(pos, member))
 
 /**
  * list_for_each_entry_from - iterate over list of given type from the current point
  * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  *
  * Iterate over list of given type, continuing from current position.
  */
 #define list_for_each_entry_from(pos, head, member) 			\
-	for (; &pos->member != (head);	\
-	     pos = list_entry(pos->member.next, typeof(*pos), member))
+	for (; &pos->member != (head);					\
+	     pos = list_next_entry(pos, member))
 
 /**
  * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry_safe(pos, n, head, member)			\
-	for (pos = list_entry((head)->next, typeof(*pos), member),	\
-		n = list_entry(pos->member.next, typeof(*pos), member);	\
+	for (pos = list_first_entry(head, typeof(*pos), member),	\
+		n = list_next_entry(pos, member);			\
 	     &pos->member != (head); 					\
-	     pos = n, n = list_entry(n->member.next, typeof(*n), member))
+	     pos = n, n = list_next_entry(n, member))
 
 /**
- * list_for_each_entry_safe_continue
+ * list_for_each_entry_safe_continue - continue list iteration safe against removal
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  *
  * Iterate over list of given type, continuing after current point,
  * safe against removal of list entry.
  */
 #define list_for_each_entry_safe_continue(pos, n, head, member) 		\
-	for (pos = list_entry(pos->member.next, typeof(*pos), member), 		\
-		n = list_entry(pos->member.next, typeof(*pos), member);		\
+	for (pos = list_next_entry(pos, member), 				\
+		n = list_next_entry(pos, member);				\
 	     &pos->member != (head);						\
-	     pos = n, n = list_entry(n->member.next, typeof(*n), member))
+	     pos = n, n = list_next_entry(n, member))
 
 /**
- * list_for_each_entry_safe_from
+ * list_for_each_entry_safe_from - iterate over list from current point safe against removal
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  *
  * Iterate over list of given type from current point, safe against
  * removal of list entry.
  */
 #define list_for_each_entry_safe_from(pos, n, head, member) 			\
-	for (n = list_entry(pos->member.next, typeof(*pos), member);		\
+	for (n = list_next_entry(pos, member);					\
 	     &pos->member != (head);						\
-	     pos = n, n = list_entry(n->member.next, typeof(*n), member))
+	     pos = n, n = list_next_entry(n, member))
 
 /**
- * list_for_each_entry_safe_reverse
+ * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  *
  * Iterate backwards over list of given type, safe against removal
  * of list entry.
  */
 #define list_for_each_entry_safe_reverse(pos, n, head, member)		\
-	for (pos = list_entry((head)->prev, typeof(*pos), member),	\
-		n = list_entry(pos->member.prev, typeof(*pos), member);	\
+	for (pos = list_last_entry(head, typeof(*pos), member),		\
+		n = list_prev_entry(pos, member);			\
 	     &pos->member != (head); 					\
-	     pos = n, n = list_entry(n->member.prev, typeof(*n), member))
+	     pos = n, n = list_prev_entry(n, member))
+
+/**
+ * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
+ * @pos:	the loop cursor used in the list_for_each_entry_safe loop
+ * @n:		temporary storage used in list_for_each_entry_safe
+ * @member:	the name of the list_head within the struct.
+ *
+ * list_safe_reset_next is not safe to use in general if the list may be
+ * modified concurrently (eg. the lock is dropped in the loop body). An
+ * exception to this is if the cursor element (pos) is pinned in the list,
+ * and list_safe_reset_next is called after re-taking the lock and before
+ * completing the current iteration of the loop body.
+ */
+#define list_safe_reset_next(pos, n, member)				\
+	n = list_next_entry(pos, member)
 
 #endif
-- 
1.8.4.2
