Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AD3FED9E8
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UJbWSgZ9D3GgWu+rzY2JpUaroj93ma9r3ty85yqZxnk=; b=42aNNgvYJnGFzX
	MIQuDvHAHU/giu/ISICukJ6BrXs3nPLmA+hjcWxLboxAhEqAZrt5HsWUuQQjmExkfUX/tmKkFOdiq
	RlycnC8FGjd2eFIupeo0nw7f3Jv2piO/EiKqJ3teANjxVNs4MjkVrrEVoH0hqc2fU4S7tm6u6MX23
	N3EjHl2bCdfum3BbmAxKq5is2VX8mc+gOnI13MD5S/XvMLRBsrAZzurCWb2RxwR9oVtT6WgTj49+2
	nhZuk2mAD0dPBIB4n8655q6hkCLZ+Wvs9MmViFaMtBYjFF0rp+iaTikNcVODrKwoUZzdifgP8ZfvD
	DGpBZbtq/m30jVQNBXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XlM-00000006sTc-0N4v;
	Tue, 17 Mar 2026 16:59:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XlJ-00000006sRi-1hN6
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 16:59:22 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-356337f058aso3884416a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773766760; x=1774371560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLGrFq7YBQDBnONt65n6ShanougI911NrCNpM+pAujI=;
        b=bgSYqSlkKbrnmwcNGJMl41nzh/xB9WebbMkNiqc2Y2e8dC6+RccX4KrI0gcEPtyXQ+
         7ERY3Tdp++9uwyGPWAxr2oUWtsYPyCDOFNm6eR5BlB8iaU3QbyvHFaJvTGJimCIwSM5I
         pqgbgl7GXE49f93zh+5qC0AeeNc8KE0QHtM1Y6kxTrfuI9SVVGVElLGruEtL5wiU6lNI
         ccEGv8kjCr3HdcDu9JGyoh45CzdL4Y6LjPi3G0qUm2RTMsGWUJkuUtSwX/nFdtTZk9Zf
         qHsgZ37Q1J7/CW4z9gAlw8jAivR67+3jFrdqVCn6X8LEW0nfSkv9iK+opoXMhO42ufMJ
         qWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773766760; x=1774371560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLGrFq7YBQDBnONt65n6ShanougI911NrCNpM+pAujI=;
        b=SivZtWIZpVAObUD2xoWGJDkO+boLGJNtYepdS8Yo+AAyRgY3897nm1QK8mdcnm0SN1
         iWJEHsNTJri7EKCi0mJjhCcsxZ01RHoXZ8oeICZWxiHCB6OhP8FxvNaTZ8bt99UilogU
         hsDLE+PcZ1uQOZxiGthvUV7mcBZ0lan8qxFyPThI7Frihj7jC1JIQa8jL5Z+rpNvA2ar
         1jLFj9Ag+L26sgWaXX3PzVGIgKytnB6t/02VwCgt8OstHmqdN/g+PXfJH7EDfWZSLR5B
         T79oDGS5H8WwtRyKzPRspJmQMBX/WNHrh9o8HocRio0riWs8VQnWlwXOH6ZP8ZdWiOqB
         fI4w==
X-Forwarded-Encrypted: i=1; AJvYcCXEAUr57rkqf7ncRV6dLdHQqjHEoQ/QareE88xzLYWdKGfgWkJy6kpfvb1s5HqMNNb4fgJc7UwJpUc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYMsxbhf7F0rL+FNUCgpH0ajtnH8eq3i7Q+KtFqbllP2NFdCxT
	jJXaCbzv+YjWSkpxRBD8JzO6pbmDPRUoDYTqviG5MDNTCnruBM56qCXYxDMmzA==
X-Gm-Gg: ATEYQzwVQEpOvisBDi1fvtp8LY0hceDmw32k5SOI/O5NJu5NOodwdX4sDJa1iQFXHMn
	EY5IX9NBT6/R2DG3QMZfIEfF6wppbDorKoLaL3E+YstjM4xqUsJpS7R0g+5b76n+S9S+uAsRmIE
	P2glk5AcHEOtZYvSScaeFuyuPJydytrqCWrXmF0QACPvxR4D3ro2qkxVafaw43KYxn/CY18hytc
	dH6qxfzWaM5U1vDe4LmbCIsGHX0nmHPb0PdOwdQ1jgUY6LzCpgakJBWFm2UTJ17NJcPIrRRXhVD
	IbXsilSLsRhBd1S2DhatPOCoHBNwUEAEL7dEYFLmYCM4LTSbPCOPuKh9/pT+JJAwbNw2XIZW5Uf
	uW7NA5WM1n2QKeGR2Bl3UkIi4/HhgO97sMw8o2f9Q0vfLoIat4vvZPL1kBiSz3ehkjIoW3XQP9l
	5O/nH8TD39H4WoaDZXi6OwdntSIhZ2HyeoCPvtukEMoz3ADjvwrnRSQpKUyIGjbCzdD1X4RWbYd
	zInOPy3/ZiwoVK1EGXNdyjmB85ZFULQo4wr
X-Received: by 2002:a17:90b:2692:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35bb9ef60d0mr136595a91.16.1773766760241;
        Tue, 17 Mar 2026 09:59:20 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcda60sm3555383a91.14.2026.03.17.09.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:59:19 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: richard@nod.at,
	akpm@linux-foundation.org
Cc: chengzhihao1@huawei.com,
	hch@infradead.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2] lib/list_sort: introduce list_sort_nonatomic() and clean up scheduling workarounds
Date: Tue, 17 Mar 2026 16:59:05 +0000
Message-ID: <20260317165905.1482256-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_095921_455470_BB10B09A 
X-CRM114-Status: GOOD (  28.29  )
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

Historically, list_sort() implemented a hack in merge_final():
    if (unlikely(!++count))
        cmp(priv, b, b);

This was designed specifically so that callers could periodically
invoke cond_resched() within their comparison functions when merging
highly unbalanced lists.

However, an audit of the kernel tree reveals that only fs/ubifs/ relies
on this mechanism. For the vast majority of list_sort() users (such as
block layer IO schedulers and file systems), this results in completely
wasted function calls. In the worst-case scenario (merging an already
sorted list where 'a' is exhausted quickly), it results in
approximately (N/2)/256 unnecessary cmp() calls.

To clean up this API, eliminate the overhead for generic users, and
consolidate the scheduling logic:
1. Introduce list_sort_nonatomic(), which explicitly calls
   cond_resched() within its inner merge loops.
2. Remove the dummy cmp(priv, b, b) fallback from standard list_sort(),
   saving unnecessary function calls and improving determinism for all
   other subsystems.
3. Convert the sole user (fs/ubifs/) to the new API and completely
   remove cond_resched() from UBIFS's comparison callbacks, unpolluting
   its comparison logic.

This change leaves the generic list_sort() completely free of
scheduling hacks, simplifies UBIFS's callbacks, and ensures that legacy
long-list sorting workloads remain safe from soft lockups on
non-preemptible kernels.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Drop the 'count' rate-limiter for cond_resched().
- Remove cond_resched() from UBIFS comparison callbacks.

 fs/ubifs/gc.c             |   6 +-
 fs/ubifs/replay.c         |   3 +-
 include/linux/list_sort.h |   3 +
 lib/list_sort.c           | 174 ++++++++++++++++++++++----------------
 4 files changed, 106 insertions(+), 80 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 0bf08b7755b8..54fac33224fa 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -109,7 +109,6 @@ static int data_nodes_cmp(void *priv, const struct list_head *a,
 	struct ubifs_info *c = priv;
 	struct ubifs_scan_node *sa, *sb;
 
-	cond_resched();
 	if (a == b)
 		return 0;
 
@@ -153,7 +152,6 @@ static int nondata_nodes_cmp(void *priv, const struct list_head *a,
 	struct ubifs_info *c = priv;
 	struct ubifs_scan_node *sa, *sb;
 
-	cond_resched();
 	if (a == b)
 		return 0;
 
@@ -277,8 +275,8 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	}
 
 	/* Sort data and non-data nodes */
-	list_sort(c, &sleb->nodes, &data_nodes_cmp);
-	list_sort(c, nondata, &nondata_nodes_cmp);
+	list_sort_nonatomic(c, &sleb->nodes, &data_nodes_cmp);
+	list_sort_nonatomic(c, nondata, &nondata_nodes_cmp);
 
 	err = dbg_check_data_nodes_order(c, &sleb->nodes);
 	if (err)
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index a9a568f4a868..c639394e60ac 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -305,7 +305,6 @@ static int replay_entries_cmp(void *priv, const struct list_head *a,
 	struct ubifs_info *c = priv;
 	struct replay_entry *ra, *rb;
 
-	cond_resched();
 	if (a == b)
 		return 0;
 
@@ -329,7 +328,7 @@ static int apply_replay_list(struct ubifs_info *c)
 	struct replay_entry *r;
 	int err;
 
-	list_sort(c, &c->replay_list, &replay_entries_cmp);
+	list_sort_nonatomic(c, &c->replay_list, &replay_entries_cmp);
 
 	list_for_each_entry(r, &c->replay_list, list) {
 		cond_resched();
diff --git a/include/linux/list_sort.h b/include/linux/list_sort.h
index 453105f74e05..f7af29073d48 100644
--- a/include/linux/list_sort.h
+++ b/include/linux/list_sort.h
@@ -11,4 +11,7 @@ typedef int __attribute__((nonnull(2,3))) (*list_cmp_func_t)(void *,
 
 __attribute__((nonnull(2,3)))
 void list_sort(void *priv, struct list_head *head, list_cmp_func_t cmp);
+
+__attribute__((nonnull(2, 3)))
+void list_sort_nonatomic(void *priv, struct list_head *head, list_cmp_func_t cmp);
 #endif
diff --git a/lib/list_sort.c b/lib/list_sort.c
index a310ecb7ccc0..9f9d12ae23ab 100644
--- a/lib/list_sort.c
+++ b/lib/list_sort.c
@@ -3,6 +3,7 @@
 #include <linux/export.h>
 #include <linux/list_sort.h>
 #include <linux/list.h>
+#include <linux/sched.h>
 
 /*
  * Returns a list organized in an intermediate format suited
@@ -11,11 +12,14 @@
  */
 __attribute__((nonnull(2,3,4)))
 static struct list_head *merge(void *priv, list_cmp_func_t cmp,
-				struct list_head *a, struct list_head *b)
+				struct list_head *a, struct list_head *b,
+				bool may_schedule)
 {
 	struct list_head *head, **tail = &head;
 
 	for (;;) {
+		if (may_schedule)
+			cond_resched();
 		/* if equal, take 'a' -- important for sort stability */
 		if (cmp(priv, a, b) <= 0) {
 			*tail = a;
@@ -47,12 +51,13 @@ static struct list_head *merge(void *priv, list_cmp_func_t cmp,
  */
 __attribute__((nonnull(2,3,4,5)))
 static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
-			struct list_head *a, struct list_head *b)
+			struct list_head *a, struct list_head *b, bool may_schedule)
 {
 	struct list_head *tail = head;
-	u8 count = 0;
 
 	for (;;) {
+		if (may_schedule)
+			cond_resched();
 		/* if equal, take 'a' -- important for sort stability */
 		if (cmp(priv, a, b) <= 0) {
 			tail->next = a;
@@ -79,12 +84,11 @@ static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
 		/*
 		 * If the merge is highly unbalanced (e.g. the input is
 		 * already sorted), this loop may run many iterations.
-		 * Continue callbacks to the client even though no
-		 * element comparison is needed, so the client's cmp()
-		 * routine can invoke cond_resched() periodically.
+		 * If may_schedule is true, invoke cond_resched() to
+		 * avoid soft lockups.
 		 */
-		if (unlikely(!++count))
-			cmp(priv, b, b);
+		if (may_schedule)
+			cond_resched();
 		b->prev = tail;
 		tail = b;
 		b = b->next;
@@ -95,6 +99,75 @@ static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
 	head->prev = tail;
 }
 
+static void __list_sort(void *priv, struct list_head *head, list_cmp_func_t cmp, bool may_schedule)
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
+		if (likely(bits)) {
+			struct list_head *a = *tail, *b = a->prev;
+
+			a = merge(priv, cmp, b, a, may_schedule);
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
+		list = merge(priv, cmp, pending, list, may_schedule);
+		pending = next;
+	}
+	/* The final merge, rebuilding prev links */
+	merge_final(priv, cmp, head, pending, list, may_schedule);
+}
+
 /**
  * list_sort - sort a list
  * @priv: private data, opaque to list_sort(), passed to @cmp
@@ -185,73 +258,26 @@ static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
  * of size 2^k varies from 2^(k-1) (cases 3 and 5 when x == 0) to
  * 2^(k+1) - 1 (second merge of case 5 when x == 2^(k-1) - 1).
  */
-__attribute__((nonnull(2,3)))
+__attribute__((nonnull(2, 3)))
 void list_sort(void *priv, struct list_head *head, list_cmp_func_t cmp)
 {
-	struct list_head *list = head->next, *pending = NULL;
-	size_t count = 0;	/* Count of pending */
-
-	if (list == head->prev)	/* Zero or one elements */
-		return;
-
-	/* Convert to a null-terminated singly-linked list. */
-	head->prev->next = NULL;
-
-	/*
-	 * Data structure invariants:
-	 * - All lists are singly linked and null-terminated; prev
-	 *   pointers are not maintained.
-	 * - pending is a prev-linked "list of lists" of sorted
-	 *   sublists awaiting further merging.
-	 * - Each of the sorted sublists is power-of-two in size.
-	 * - Sublists are sorted by size and age, smallest & newest at front.
-	 * - There are zero to two sublists of each size.
-	 * - A pair of pending sublists are merged as soon as the number
-	 *   of following pending elements equals their size (i.e.
-	 *   each time count reaches an odd multiple of that size).
-	 *   That ensures each later final merge will be at worst 2:1.
-	 * - Each round consists of:
-	 *   - Merging the two sublists selected by the highest bit
-	 *     which flips when count is incremented, and
-	 *   - Adding an element from the input as a size-1 sublist.
-	 */
-	do {
-		size_t bits;
-		struct list_head **tail = &pending;
-
-		/* Find the least-significant clear bit in count */
-		for (bits = count; bits & 1; bits >>= 1)
-			tail = &(*tail)->prev;
-		/* Do the indicated merge */
-		if (likely(bits)) {
-			struct list_head *a = *tail, *b = a->prev;
-
-			a = merge(priv, cmp, b, a);
-			/* Install the merged result in place of the inputs */
-			a->prev = b->prev;
-			*tail = a;
-		}
-
-		/* Move one element from input list to pending */
-		list->prev = pending;
-		pending = list;
-		list = list->next;
-		pending->next = NULL;
-		count++;
-	} while (list);
-
-	/* End of input; merge together all the pending lists. */
-	list = pending;
-	pending = pending->prev;
-	for (;;) {
-		struct list_head *next = pending->prev;
-
-		if (!next)
-			break;
-		list = merge(priv, cmp, pending, list);
-		pending = next;
-	}
-	/* The final merge, rebuilding prev links */
-	merge_final(priv, cmp, head, pending, list);
+	__list_sort(priv, head, cmp, false);
 }
 EXPORT_SYMBOL(list_sort);
+
+/**
+ * list_sort_nonatomic - sort a list with conditional rescheduling
+ * @priv: private data, opaque to list_sort(), passed to @cmp
+ * @head: the list to sort
+ * @cmp: the elements comparison function
+ *
+ * This variant of list_sort() periodically invokes cond_resched()
+ * during the sorting process. It should be used for sorting very
+ * long lists where the operation might otherwise cause soft lockups.
+ */
+__attribute__((nonnull(2, 3)))
+void list_sort_nonatomic(void *priv, struct list_head *head, list_cmp_func_t cmp)
+{
+	__list_sort(priv, head, cmp, true);
+}
+EXPORT_SYMBOL(list_sort_nonatomic);
-- 
2.53.0.851.ga537e3e6e9-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
