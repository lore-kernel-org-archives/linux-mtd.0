Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF0FF3027F
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Mar 2026 19:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NukHznSpb037u0D2G7tGoQ8PvWCePmE/2wrkvG4Kg0c=; b=fZ1kA9SLFyQxuV
	cVAAgnYlPY4RXCjpsb8Amc1hAnIC8xm7IUSqhs+w9Cv0eZbX8aGoCTE96LCNqtjixIg9eUMHS0ufB
	EzgHH8CMpe8i5TAV5C74QxFzySzbH+ihutT4teCRU3C4fI+MFsKfJI7mKkvwnEjDqvnc2+vYU/xB5
	nnV9iDJjK8dSvYHaMBT/9quMrRciZhoq62MZSrTJpn3VmBTdKP5wriFZ/pUmjAoRD9v3ypQh/N9TS
	pOmofwk+ahrVdWnyJKcjQ3/k103hQRq9BB0+vh/S89xLcO+GhMNiAwfUE4nx1TcuS3uc3VzGUJlxs
	UnDuL8ClTke4xDQ/ri9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rJ1-00000002rtp-2udO;
	Sun, 15 Mar 2026 19:39:19 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rIy-00000002rtN-0aVh
	for linux-mtd@lists.infradead.org;
	Sun, 15 Mar 2026 19:39:17 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso1577837a12.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Mar 2026 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773603555; x=1774208355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pk1dQAopGeigQc+GHRFqNZV2QEU15mijTHh+1XH5bYk=;
        b=dgRoT1tLguZBNomvpmM2m/UMYBKA0ZJdce/pcYvTc6eDMxhuAvOCEMqvbKuNODm/4T
         HgQ6It4mnaAuK9TTCRbfmScDBHYy0kmAALbMjHrBabOigiTOHegqbhwC8YeuMSMfG4wx
         zzhI2AEIROuxNdQJT7kVBnq87QI0Gbms9NBuecDIBAKGmE2Z1llENPZNVNdKdmLC1GZG
         8gg0b/KgPgBtSX2LKiMBZYAgRmS+dGHkn1o94HODh5bjfj4FfRByi6F1Zw5s74E8BiaJ
         idvQOFForJFXdjE07n3n7nkraCGtHK3yp30gZWNeMag3bYCNeE6Eil9w6kyVBgok99gB
         os5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773603555; x=1774208355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk1dQAopGeigQc+GHRFqNZV2QEU15mijTHh+1XH5bYk=;
        b=loWz4ACuUJ6VQU4k8+Ynbual3a3zFVtzq313XHGRCgtThLlpBXJSQtVLIsRx3kpUHa
         HJK2IbwC9sxPtYSF6hW7eTp+0M3b0C6yC+fAfGeT24QYlZHExqFhv0YfVC98Ov/lzI4f
         XIw81XjYxJQTjGisFfo9OGys1dIH62mtuuOSn2RYkx7ZhXpuLL+aTCExjYU7zHMmExld
         p1KvE7mT0C+G8c3lV4YKbZ75IyLhGTmyelbC6AqtCZuG02Y/u9BFa9zYUgOawiLNIqlX
         Hy0pGq35SeWE1mj2+JAOAWYcMNd0HQFcnIchkC5ey+hNMDyAy3CzJo87O2de3drLk4W0
         fuew==
X-Forwarded-Encrypted: i=1; AJvYcCXjHJu5VAMsxtJFbw4KurUHsQdzXnq+DM3WmMT8NDUlMmzumJjvCW5bftZ7E4TFpzobJD1q7nySlmM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAzmb/T9ouUsmF4mgTLSo7Sa8r2AyBamGCtgs/yvzh0LDQtOS+
	1HqmzTTiwI7BTUQQ3ABfKICuEcOsZ+2xRXw9J62qmGFYcOfZS5szjBEk
X-Gm-Gg: ATEYQzwO5s3RMvGdJYodutE/B7liylyUePa62C2dzo714avq2ldNXjsxHDA/1xTzH9F
	QhxmvqzY+in86+LqvutYl2Yi0DmTXNi/CDp0eVP0Oy82AVfzgF631zHE1VA+BOQY6NyDCQ5q2rS
	eEvU+fZSbTSL//be+oUL6ZadXlFHS35c7BoI3r9SY4V2GtvAUBVEL5+tirt0xDbA7ywA0d4Y1S0
	Pnw0xi+4WEgmnDer3T7bbprBCPgtOe/+LwqcyByQfkYAP8Dbsv7LlRa+o1iATamMD95zmAkzQwp
	2TG9mSD9rbUNhdBNmEVrCH/V/GcrFjwrK9msKFRj9Jcu982keCfWK/h+QQyV6CuczD5JBNn9hrn
	vpw1AHy1JfSpD5LvE5Zjw59JXtWm0ubPZInNGHE1jco75XoZWUL7HqVyvGJGL6PzLyoW0P2hCU2
	I8x6FQV2ShN4n6W5SZjX60qf7oMN2N+TIQA28jB8Vci1ORwQges8jKdgzT6Y4Yh1zuwt+N8scSZ
	Qqmy/i/C8F8mX2vQZ0NwU6TrHTGi/DXhsQDCC0uZIaJAbc=
X-Received: by 2002:a17:902:c947:b0:2ae:5763:99c4 with SMTP id d9443c01a7336-2aecaa14cf4mr107591555ad.26.1773603554520;
        Sun, 15 Mar 2026 12:39:14 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed753sm104795755ad.45.2026.03.15.12.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 12:39:14 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: richard@nod.at,
	akpm@linux-foundation.org
Cc: chengzhihao1@huawei.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and remove dummy cmp() calls
Date: Sun, 15 Mar 2026 19:39:00 +0000
Message-ID: <20260315193900.218737-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_123916_211952_D1856526 
X-CRM114-Status: GOOD (  27.88  )
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
sorted list where 'a' is exhausted quickly), this results in
approximately (N/2)/256 unnecessary cmp() calls.

To clean up this API while ensuring behavior compatibility:
1. Introduce list_sort_nonatomic(), which explicitly calls
   cond_resched() internally when count overflows.
2. Remove the dummy cmp(priv, b, b) fallback for standard list_sort(),
   saving unnecessary function calls and improving determinism.
3. Convert the sole user (fs/ubifs/) to the new API.

Note that ubifs still maintains cond_resched() inside its own
comparison functions. This patch does not alter the frequency or timing
of those scheduling points, guaranteeing no regressions for ubifs,
while benefiting all other kernel users.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 fs/ubifs/gc.c             |   4 +-
 fs/ubifs/replay.c         |   2 +-
 include/linux/list_sort.h |   3 +
 lib/list_sort.c           | 166 +++++++++++++++++++++-----------------
 4 files changed, 100 insertions(+), 75 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 0bf08b7755b8..dcc5742210b0 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -277,8 +277,8 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	}
 
 	/* Sort data and non-data nodes */
-	list_sort(c, &sleb->nodes, &data_nodes_cmp);
-	list_sort(c, nondata, &nondata_nodes_cmp);
+	list_sort_nonatomic(c, &sleb->nodes, &data_nodes_cmp);
+	list_sort_nonatomic(c, nondata, &nondata_nodes_cmp);
 
 	err = dbg_check_data_nodes_order(c, &sleb->nodes);
 	if (err)
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index a9a568f4a868..ad03dd106a54 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -329,7 +329,7 @@ static int apply_replay_list(struct ubifs_info *c)
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
index a310ecb7ccc0..788bfc26cf7b 100644
--- a/lib/list_sort.c
+++ b/lib/list_sort.c
@@ -3,6 +3,7 @@
 #include <linux/export.h>
 #include <linux/list_sort.h>
 #include <linux/list.h>
+#include <linux/sched.h>
 
 /*
  * Returns a list organized in an intermediate format suited
@@ -47,7 +48,7 @@ static struct list_head *merge(void *priv, list_cmp_func_t cmp,
  */
 __attribute__((nonnull(2,3,4,5)))
 static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
-			struct list_head *a, struct list_head *b)
+			struct list_head *a, struct list_head *b, bool may_schedule)
 {
 	struct list_head *tail = head;
 	u8 count = 0;
@@ -79,12 +80,11 @@ static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
 		/*
 		 * If the merge is highly unbalanced (e.g. the input is
 		 * already sorted), this loop may run many iterations.
-		 * Continue callbacks to the client even though no
-		 * element comparison is needed, so the client's cmp()
-		 * routine can invoke cond_resched() periodically.
+		 * If may_schedule is true, periodically invoke cond_resched()
+		 * to avoid soft lockups.
 		 */
-		if (unlikely(!++count))
-			cmp(priv, b, b);
+		if (may_schedule && unlikely(!++count))
+			cond_resched();
 		b->prev = tail;
 		tail = b;
 		b = b->next;
@@ -95,6 +95,75 @@ static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
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
+	merge_final(priv, cmp, head, pending, list, may_schedule);
+}
+
 /**
  * list_sort - sort a list
  * @priv: private data, opaque to list_sort(), passed to @cmp
@@ -185,73 +254,26 @@ static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
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
