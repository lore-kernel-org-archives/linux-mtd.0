Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B331099B4B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqHz2hliDqv+s5PvTVBWlPYkhdIhJ38xL3rPEnC0cEQ=; b=4H7azBA8ntUtEm
	XFthInI9DmucKBt1kSG+IEEnUGS+l4Y4K6JHg2qZPgNj8ol4082zFI0++tBbFJqwAwEeYMrBEObbS
	Gknj46js4wLK4VuyOwEYYMP7BB2GzoUwsQvL4tkTTnyCQNX47ohVQuHjJTJRCA0pEvfOldl7bI2Oj
	5r+50z3K48h9VXNFU/NpNWO4af1BkwzNxqiVY+BTTxLKKUjN1dOjeBqi8hhJRt6xPOWsVRj8R5ImD
	cwOXCWHlsVGB8qvl7BandqTRgl+b4D6YADbzQq5m2tyKtWw3JG0zboe5mIiOv5Qp1PMRkbVKk4npT
	O/krDBqPmaodMo8EGDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWG-0000000Diuh-1ehW;
	Fri, 20 Mar 2026 22:40:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iW9-0000000DijY-3R4T;
	Fri, 20 Mar 2026 22:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5qMJA9d/yWZOkN01hEKCJz4BSYmGZrcC3XcVymSXTW8=; b=le9SmXm9fqbOObXOedz/jCwp1g
	UC2NG2RF09Efyq+hfCvfwJ+M0wcPZHfGMlbyo6uXwEe0aNQBVJawvKNs5AYW0t8bhHmoowZVb9Hp3
	GFYp+Sf/P+1TwM0I942ulcNt/JuC+ypDanmE3G0jm8qOQ/spSrS4efxXUTdP9vociEw2A9mLmIX1h
	j/VN9E5k+FgEUa++XaL514591dXFy8Kf7ZGU/4jEVVn3N6v0ixMsl5DkzlxH3sZNYO6EAEwfD5gSi
	rfIxgz3ZT5kKm60/wT5G/+RXCksQyVGSG87z6jNoC7+qMDgOz5b682wMhN31QCfeAUILRA8nmelTV
	h7HNrEGw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iW4-0000000GaWK-0gOK;
	Fri, 20 Mar 2026 22:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89CAC441B5;
	Fri, 20 Mar 2026 22:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47DEC4CEF7;
	Fri, 20 Mar 2026 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774046426;
	bh=R1lkxijSil+wWCmTaCAVOrSSJhw850u2PwIZedjzsl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i6DKCirEGA6ZKizhrliF1gHxi+wwd3A8ZZ9TJ46wWZGYGTuYJQEieZIrCaNLV0Ceu
	 qrZEFXJM4/VLRUccl/77xdjQ4wRRVkIdtBV+/nu2XvIoRVT8p7pCJLAAVYVeU8/Hzo
	 va/np2+Epr0pid/tAuswDsibpsHEi12de1oz2RUJQlsYB7UdRpwpZlijugUuLtLxrv
	 4x7AWSkBBb4HU+OspbVpMSRtPEJqebIKPtfhisYBdi1CvX+Dm4VvpDRVFl6BpL4tmf
	 qUfrr4IQZoCv3oOucELvpWRO6oesrCrqDegzslK5EFUCjaXz8mFoxvNVfwFeU6XHxl
	 tyaQV5/aT+25w==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v4 07/21] mm: have mmap_action_complete() handle the rmap lock and unmap
Date: Fri, 20 Mar 2026 22:39:33 +0000
Message-ID: <8d1ee8ebd3542d006a47e8382fb80cf5b57ecf10.1774045440.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_224028_795236_A45FAA5A 
X-CRM114-Status: GOOD (  20.97  )
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

Rather than have the callers handle this both the rmap lock release and
unmapping the VMA on error, handle it within the mmap_action_complete()
logic where it makes sense to, being careful not to unlock twice.

This simplifies the logic and makes it harder to make mistake with this,
while retaining correct behaviour with regard to avoiding deadlocks.

Also replace the call_action_complete() function with a direct invocation
of mmap_action_complete() as the abstraction is no longer required.

Also update the VMA tests to reflect this change.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/internal.h                   | 19 +++++++++++++++
 mm/util.c                       | 41 +++++++++++++++------------------
 mm/vma.c                        | 26 +--------------------
 tools/testing/vma/include/dup.h |  8 +------
 4 files changed, 40 insertions(+), 54 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 0256ca44115a..760fbff9c430 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1817,6 +1817,25 @@ static inline int io_remap_pfn_range_prepare(struct vm_area_desc *desc)
 	return 0;
 }

+/*
+ * When we succeed an mmap action or just before we unmap a VMA on error, we
+ * need to ensure any rmap lock held is released. On unmap it's required to
+ * avoid a deadlock.
+ */
+static inline void maybe_rmap_unlock_action(struct vm_area_struct *vma,
+		struct mmap_action *action)
+{
+	struct file *file;
+
+	if (!action->hide_from_rmap_until_complete)
+		return;
+
+	VM_WARN_ON_ONCE(vma_is_anonymous(vma));
+	file = vma->vm_file;
+	i_mmap_unlock_write(file->f_mapping);
+	action->hide_from_rmap_until_complete = false;
+}
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline int clear_flush_young_ptes_notify(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep, unsigned int nr)
diff --git a/mm/util.c b/mm/util.c
index 182f0f5cc400..a187f3ab4437 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1219,13 +1219,7 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 	action->hide_from_rmap_until_complete = false;

 	set_vma_from_desc(vma, &desc);
-	err = mmap_action_complete(vma, action);
-	if (err) {
-		const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-		do_munmap(current->mm, vma->vm_start, len, NULL);
-	}
-	return err;
+	return mmap_action_complete(vma, action);
 }
 EXPORT_SYMBOL(compat_vma_mmap);

@@ -1320,26 +1314,30 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 static int mmap_action_finish(struct vm_area_struct *vma,
 			      struct mmap_action *action, int err)
 {
+	size_t len;
+
+	if (!err && action->success_hook)
+		err = action->success_hook(vma);
+
+	/* do_munmap() might take rmap lock, so release if held. */
+	maybe_rmap_unlock_action(vma, action);
+	if (!err)
+		return 0;
+
 	/*
 	 * If an error occurs, unmap the VMA altogether and return an error. We
 	 * only clear the newly allocated VMA, since this function is only
 	 * invoked if we do NOT merge, so we only clean up the VMA we created.
 	 */
-	if (err) {
-		if (action->error_hook) {
-			/* We may want to filter the error. */
-			err = action->error_hook(err);
-
-			/* The caller should not clear the error. */
-			VM_WARN_ON_ONCE(!err);
-		}
-		return err;
+	len = vma_pages(vma) << PAGE_SHIFT;
+	do_munmap(current->mm, vma->vm_start, len, NULL);
+	if (action->error_hook) {
+		/* We may want to filter the error. */
+		err = action->error_hook(err);
+		/* The caller should not clear the error. */
+		VM_WARN_ON_ONCE(!err);
 	}
-
-	if (action->success_hook)
-		return action->success_hook(vma);
-
-	return 0;
+	return err;
 }

 #ifdef CONFIG_MMU
@@ -1377,7 +1375,6 @@ EXPORT_SYMBOL(mmap_action_prepare);
  */
 int mmap_action_complete(struct vm_area_struct *vma,
 			 struct mmap_action *action)
-
 {
 	int err = 0;

diff --git a/mm/vma.c b/mm/vma.c
index 6105f54cea61..86f947c90442 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2730,30 +2730,6 @@ static bool can_set_ksm_flags_early(struct mmap_state *map)
 	return false;
 }

-static int call_action_complete(struct mmap_state *map,
-				struct mmap_action *action,
-				struct vm_area_struct *vma)
-{
-	int err;
-
-	err = mmap_action_complete(vma, action);
-
-	/* If we held the file rmap we need to release it. */
-	if (action->hide_from_rmap_until_complete) {
-		struct file *file = vma->vm_file;
-
-		i_mmap_unlock_write(file->f_mapping);
-	}
-
-	if (err) {
-		const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-		do_munmap(current->mm, vma->vm_start, len, NULL);
-	}
-
-	return err;
-}
-
 static unsigned long __mmap_region(struct file *file, unsigned long addr,
 		unsigned long len, vma_flags_t vma_flags,
 		unsigned long pgoff, struct list_head *uf)
@@ -2805,7 +2781,7 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
 	__mmap_complete(&map, vma);

 	if (have_mmap_prepare && allocated_new) {
-		error = call_action_complete(&map, &desc.action, vma);
+		error = mmap_action_complete(vma, &desc.action);

 		if (error)
 			return error;
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index c62d3998e922..bf8cffe1ea58 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1296,13 +1296,7 @@ static inline int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 	action->hide_from_rmap_until_complete = false;

 	set_vma_from_desc(vma, &desc);
-	err = mmap_action_complete(vma, action);
-	if (err) {
-		const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-		do_munmap(current->mm, vma->vm_start, len, NULL);
-	}
-	return err;
+	return mmap_action_complete(vma, action);
 }

 static inline void vma_iter_init(struct vma_iterator *vmi,
--
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
