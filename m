Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6450B106ACEC
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LSgHnpPu7/qRClrQHjnIL7bXDv2NC9BzJQ8l/WarbI=; b=sfRvHAVTrhYKl/
	yLx80kNMdEfkf12QcCeWvi8fGm+ciYrIg90HDnJ4vrs9MA4rH1sieRBRpk2e2g3N6bH9rTACRwr6b
	wQ145SYxs3aQ2R/bWlhsoPMZvksLqgWSBmeGD5wFAY3HNF8ns1MLdKd4c1in2+PVSYv0nlrvgJEZk
	xdoBGvIj9wUHDDc920obUnMcuz4zY5UW/4LSZp7cu8FXeWFc+Zua8725ZtenODtwHKki2HHPKVPuW
	jOP01PKucYm8FG8FyFhziwOIo3d+IXz+TQMphjQDpb5bDHnaroyn64AvfND9i5Y1Lo+ykrS8RwmeO
	L/3LelSLcrWJ/8WhZKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdP-0000000FGnI-3h3x;
	Thu, 12 Mar 2026 20:27:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdM-0000000FGkj-32ph;
	Thu, 12 Mar 2026 20:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E5E86183C;
	Thu, 12 Mar 2026 20:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958CEC19425;
	Thu, 12 Mar 2026 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773347271;
	bh=9CXyMSrG8/FD4AuINgpPrcon+rjbR63Da/iaVQSjOAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+W+hMAgWNyLL7NPk7To42xcIroUKg2REEYiZYaz7QFym+OmA8Hy7iEvBOALCB58p
	 MDD1pvdKKChUySFleo/6UvvcMv5jD0TdkLLmyl0BINqpwwfhLWON/4TFjyoxbtvz5K
	 fM6poOal8wAZW8f36jifSl2uKVsDrTbvA7HvU+kvyNuKGBl6ff7YdkKjDcOkJwgzPH
	 eWNQo98O42egDAjgXlIZGnvBva7DendCnA8pEmXazlgOHQnwMP8gEklqWTpkcCBfJl
	 yBSrAVZ2N/VTYycLItHTTzBFrvmjmMSPQ0oScwJj4bNfcwgGDC7xRw+c2PDvkkvYa3
	 O/fMLkERtc++g==
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
Subject: [PATCH 01/15] mm: various small mmap_prepare cleanups
Date: Thu, 12 Mar 2026 20:27:16 +0000
Message-ID: <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773346620.git.ljs@kernel.org>
References: <cover.1773346620.git.ljs@kernel.org>
MIME-Version: 1.0
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

Rather than passing arbitrary fields, pass an mmap_action field directly to
mmap prepare and complete helpers to put all the action-specific logic in
the function actually doing the work.

Additionally, allow mmap prepare functions to return an error so we can
error out as soon as possible if there is something logically incorrect in
the input.

Update remap_pfn_range_prepare() to properly check the input range for the
CoW case.

While we're here, make remap_pfn_range_prepare_vma() a little neater, and
pass mmap_action directly to call_action_complete().

Then, update compat_vma_mmap() to perform its logic directly, as
__compat_vma_map() is not used by anything so we don't need to export it.

Also update compat_vma_mmap() to use vfs_mmap_prepare() rather than calling
the mmap_prepare op directly.

Finally, update the VMA userland tests to reflect the changes.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/fs.h                |   2 -
 include/linux/mm.h                |   8 +--
 mm/internal.h                     |  28 +++++---
 mm/memory.c                       |  45 +++++++-----
 mm/util.c                         | 112 +++++++++++++-----------------
 mm/vma.c                          |  21 +++---
 tools/testing/vma/include/dup.h   |   9 ++-
 tools/testing/vma/include/stubs.h |   9 +--
 8 files changed, 123 insertions(+), 111 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8b3dd145b25e..a2628a12bd2b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2058,8 +2058,6 @@ static inline bool can_mmap_file(struct file *file)
 	return true;
 }
 
-int __compat_vma_mmap(const struct file_operations *f_op,
-		struct file *file, struct vm_area_struct *vma);
 int compat_vma_mmap(struct file *file, struct vm_area_struct *vma);
 
 static inline int vfs_mmap(struct file *file, struct vm_area_struct *vma)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 4c4fd55fc823..cc5960a84382 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4116,10 +4116,10 @@ static inline void mmap_action_ioremap_full(struct vm_area_desc *desc,
 	mmap_action_ioremap(desc, desc->start, start_pfn, vma_desc_size(desc));
 }
 
-void mmap_action_prepare(struct mmap_action *action,
-			 struct vm_area_desc *desc);
-int mmap_action_complete(struct mmap_action *action,
-			 struct vm_area_struct *vma);
+int mmap_action_prepare(struct vm_area_desc *desc,
+			struct mmap_action *action);
+int mmap_action_complete(struct vm_area_struct *vma,
+			 struct mmap_action *action);
 
 /* Look up the first VMA which exactly match the interval vm_start ... vm_end */
 static inline struct vm_area_struct *find_exact_vma(struct mm_struct *mm,
diff --git a/mm/internal.h b/mm/internal.h
index 95b583e7e4f7..7bfa85b5e78b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1775,26 +1775,32 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
 void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm);
 int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm);
 
-void remap_pfn_range_prepare(struct vm_area_desc *desc, unsigned long pfn);
-int remap_pfn_range_complete(struct vm_area_struct *vma, unsigned long addr,
-		unsigned long pfn, unsigned long size, pgprot_t pgprot);
+int remap_pfn_range_prepare(struct vm_area_desc *desc,
+			    struct mmap_action *action);
+int remap_pfn_range_complete(struct vm_area_struct *vma,
+			     struct mmap_action *action);
 
-static inline void io_remap_pfn_range_prepare(struct vm_area_desc *desc,
-		unsigned long orig_pfn, unsigned long size)
+static inline int io_remap_pfn_range_prepare(struct vm_area_desc *desc,
+					     struct mmap_action *action)
 {
+	const unsigned long orig_pfn = action->remap.start_pfn;
+	const unsigned long size = action->remap.size;
 	const unsigned long pfn = io_remap_pfn_range_pfn(orig_pfn, size);
 
-	return remap_pfn_range_prepare(desc, pfn);
+	action->remap.start_pfn = pfn;
+	return remap_pfn_range_prepare(desc, action);
 }
 
 static inline int io_remap_pfn_range_complete(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long orig_pfn, unsigned long size,
-		pgprot_t orig_prot)
+					      struct mmap_action *action)
 {
-	const unsigned long pfn = io_remap_pfn_range_pfn(orig_pfn, size);
-	const pgprot_t prot = pgprot_decrypted(orig_prot);
+	const unsigned long size = action->remap.size;
+	const unsigned long orig_pfn = action->remap.start_pfn;
+	const pgprot_t orig_prot = vma->vm_page_prot;
 
-	return remap_pfn_range_complete(vma, addr, pfn, size, prot);
+	action->remap.pgprot = pgprot_decrypted(orig_prot);
+	action->remap.start_pfn  = io_remap_pfn_range_pfn(orig_pfn, size);
+	return remap_pfn_range_complete(vma, action);
 }
 
 #ifdef CONFIG_MMU_NOTIFIER
diff --git a/mm/memory.c b/mm/memory.c
index 6aa0ea4af1fc..364fa8a45360 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3099,26 +3099,34 @@ static int do_remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 }
 #endif
 
-void remap_pfn_range_prepare(struct vm_area_desc *desc, unsigned long pfn)
+int remap_pfn_range_prepare(struct vm_area_desc *desc,
+			    struct mmap_action *action)
 {
-	/*
-	 * We set addr=VMA start, end=VMA end here, so this won't fail, but we
-	 * check it again on complete and will fail there if specified addr is
-	 * invalid.
-	 */
-	get_remap_pgoff(vma_desc_is_cow_mapping(desc), desc->start, desc->end,
-			desc->start, desc->end, pfn, &desc->pgoff);
+	const unsigned long start = action->remap.start;
+	const unsigned long end = start + action->remap.size;
+	const unsigned long pfn = action->remap.start_pfn;
+	const bool is_cow = vma_desc_is_cow_mapping(desc);
+	int err;
+
+	err = get_remap_pgoff(is_cow, start, end, desc->start, desc->end, pfn,
+			      &desc->pgoff);
+	if (err)
+		return err;
+
 	vma_desc_set_flags_mask(desc, VMA_REMAP_FLAGS);
+	return 0;
 }
 
-static int remap_pfn_range_prepare_vma(struct vm_area_struct *vma, unsigned long addr,
-		unsigned long pfn, unsigned long size)
+static int remap_pfn_range_prepare_vma(struct vm_area_struct *vma,
+				       unsigned long addr, unsigned long pfn,
+				       unsigned long size)
 {
-	unsigned long end = addr + PAGE_ALIGN(size);
+	const unsigned long end = addr + PAGE_ALIGN(size);
+	const bool is_cow = is_cow_mapping(vma->vm_flags);
 	int err;
 
-	err = get_remap_pgoff(is_cow_mapping(vma->vm_flags), addr, end,
-			      vma->vm_start, vma->vm_end, pfn, &vma->vm_pgoff);
+	err = get_remap_pgoff(is_cow, addr, end, vma->vm_start, vma->vm_end,
+			      pfn, &vma->vm_pgoff);
 	if (err)
 		return err;
 
@@ -3151,10 +3159,15 @@ int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(remap_pfn_range);
 
-int remap_pfn_range_complete(struct vm_area_struct *vma, unsigned long addr,
-		unsigned long pfn, unsigned long size, pgprot_t prot)
+int remap_pfn_range_complete(struct vm_area_struct *vma,
+			     struct mmap_action *action)
 {
-	return do_remap_pfn_range(vma, addr, pfn, size, prot);
+	const unsigned long start = action->remap.start;
+	const unsigned long pfn = action->remap.start_pfn;
+	const unsigned long size = action->remap.size;
+	const pgprot_t prot = action->remap.pgprot;
+
+	return do_remap_pfn_range(vma, start, pfn, size, prot);
 }
 
 /**
diff --git a/mm/util.c b/mm/util.c
index ce7ae80047cf..dba1191725b6 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1163,43 +1163,6 @@ void flush_dcache_folio(struct folio *folio)
 EXPORT_SYMBOL(flush_dcache_folio);
 #endif
 
-/**
- * __compat_vma_mmap() - See description for compat_vma_mmap()
- * for details. This is the same operation, only with a specific file operations
- * struct which may or may not be the same as vma->vm_file->f_op.
- * @f_op: The file operations whose .mmap_prepare() hook is specified.
- * @file: The file which backs or will back the mapping.
- * @vma: The VMA to apply the .mmap_prepare() hook to.
- * Returns: 0 on success or error.
- */
-int __compat_vma_mmap(const struct file_operations *f_op,
-		struct file *file, struct vm_area_struct *vma)
-{
-	struct vm_area_desc desc = {
-		.mm = vma->vm_mm,
-		.file = file,
-		.start = vma->vm_start,
-		.end = vma->vm_end,
-
-		.pgoff = vma->vm_pgoff,
-		.vm_file = vma->vm_file,
-		.vma_flags = vma->flags,
-		.page_prot = vma->vm_page_prot,
-
-		.action.type = MMAP_NOTHING, /* Default */
-	};
-	int err;
-
-	err = f_op->mmap_prepare(&desc);
-	if (err)
-		return err;
-
-	mmap_action_prepare(&desc.action, &desc);
-	set_vma_from_desc(vma, &desc);
-	return mmap_action_complete(&desc.action, vma);
-}
-EXPORT_SYMBOL(__compat_vma_mmap);
-
 /**
  * compat_vma_mmap() - Apply the file's .mmap_prepare() hook to an
  * existing VMA and execute any requested actions.
@@ -1228,7 +1191,31 @@ EXPORT_SYMBOL(__compat_vma_mmap);
  */
 int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	return __compat_vma_mmap(file->f_op, file, vma);
+	struct vm_area_desc desc = {
+		.mm = vma->vm_mm,
+		.file = file,
+		.start = vma->vm_start,
+		.end = vma->vm_end,
+
+		.pgoff = vma->vm_pgoff,
+		.vm_file = vma->vm_file,
+		.vma_flags = vma->flags,
+		.page_prot = vma->vm_page_prot,
+
+		.action.type = MMAP_NOTHING, /* Default */
+	};
+	int err;
+
+	err = vfs_mmap_prepare(file, &desc);
+	if (err)
+		return err;
+
+	err = mmap_action_prepare(&desc, &desc.action);
+	if (err)
+		return err;
+
+	set_vma_from_desc(vma, &desc);
+	return mmap_action_complete(vma, &desc.action);
 }
 EXPORT_SYMBOL(compat_vma_mmap);
 
@@ -1320,8 +1307,8 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	}
 }
 
-static int mmap_action_finish(struct mmap_action *action,
-		const struct vm_area_struct *vma, int err)
+static int mmap_action_finish(struct vm_area_struct *vma,
+			      struct mmap_action *action, int err)
 {
 	/*
 	 * If an error occurs, unmap the VMA altogether and return an error. We
@@ -1355,35 +1342,36 @@ static int mmap_action_finish(struct mmap_action *action,
  * action which need to be performed.
  * @desc: The VMA descriptor to prepare for @action.
  * @action: The action to perform.
+ *
+ * Returns: 0 on success, otherwise error.
  */
-void mmap_action_prepare(struct mmap_action *action,
-			 struct vm_area_desc *desc)
+int mmap_action_prepare(struct vm_area_desc *desc,
+			struct mmap_action *action)
+
 {
 	switch (action->type) {
 	case MMAP_NOTHING:
-		break;
+		return 0;
 	case MMAP_REMAP_PFN:
-		remap_pfn_range_prepare(desc, action->remap.start_pfn);
-		break;
+		return remap_pfn_range_prepare(desc, action);
 	case MMAP_IO_REMAP_PFN:
-		io_remap_pfn_range_prepare(desc, action->remap.start_pfn,
-					   action->remap.size);
-		break;
+		return io_remap_pfn_range_prepare(desc, action);
 	}
 }
 EXPORT_SYMBOL(mmap_action_prepare);
 
 /**
  * mmap_action_complete - Execute VMA descriptor action.
- * @action: The action to perform.
  * @vma: The VMA to perform the action upon.
+ * @action: The action to perform.
  *
  * Similar to mmap_action_prepare().
  *
  * Return: 0 on success, or error, at which point the VMA will be unmapped.
  */
-int mmap_action_complete(struct mmap_action *action,
-			 struct vm_area_struct *vma)
+int mmap_action_complete(struct vm_area_struct *vma,
+			 struct mmap_action *action)
+
 {
 	int err = 0;
 
@@ -1391,23 +1379,19 @@ int mmap_action_complete(struct mmap_action *action,
 	case MMAP_NOTHING:
 		break;
 	case MMAP_REMAP_PFN:
-		err = remap_pfn_range_complete(vma, action->remap.start,
-				action->remap.start_pfn, action->remap.size,
-				action->remap.pgprot);
+		err = remap_pfn_range_complete(vma, action);
 		break;
 	case MMAP_IO_REMAP_PFN:
-		err = io_remap_pfn_range_complete(vma, action->remap.start,
-				action->remap.start_pfn, action->remap.size,
-				action->remap.pgprot);
+		err = io_remap_pfn_range_complete(vma, action);
 		break;
 	}
 
-	return mmap_action_finish(action, vma, err);
+	return mmap_action_finish(vma, action, err);
 }
 EXPORT_SYMBOL(mmap_action_complete);
 #else
-void mmap_action_prepare(struct mmap_action *action,
-			struct vm_area_desc *desc)
+int mmap_action_prepare(struct vm_area_desc *desc,
+			struct mmap_action *action)
 {
 	switch (action->type) {
 	case MMAP_NOTHING:
@@ -1417,11 +1401,13 @@ void mmap_action_prepare(struct mmap_action *action,
 		WARN_ON_ONCE(1); /* nommu cannot handle these. */
 		break;
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(mmap_action_prepare);
 
-int mmap_action_complete(struct mmap_action *action,
-			struct vm_area_struct *vma)
+int mmap_action_complete(struct vm_area_struct *vma,
+			 struct mmap_action *action)
 {
 	int err = 0;
 
@@ -1436,7 +1422,7 @@ int mmap_action_complete(struct mmap_action *action,
 		break;
 	}
 
-	return mmap_action_finish(action, vma, err);
+	return mmap_action_finish(vma, action, err);
 }
 EXPORT_SYMBOL(mmap_action_complete);
 #endif
diff --git a/mm/vma.c b/mm/vma.c
index be64f781a3aa..054cf1d262fb 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2613,15 +2613,19 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 	vma_set_page_prot(vma);
 }
 
-static void call_action_prepare(struct mmap_state *map,
-				struct vm_area_desc *desc)
+static int call_action_prepare(struct mmap_state *map,
+			       struct vm_area_desc *desc)
 {
 	struct mmap_action *action = &desc->action;
+	int err;
 
-	mmap_action_prepare(action, desc);
+	err = mmap_action_prepare(desc, action);
+	if (err)
+		return err;
 
 	if (action->hide_from_rmap_until_complete)
 		map->hold_file_rmap_lock = true;
+	return 0;
 }
 
 /*
@@ -2645,7 +2649,9 @@ static int call_mmap_prepare(struct mmap_state *map,
 	if (err)
 		return err;
 
-	call_action_prepare(map, desc);
+	err = call_action_prepare(map, desc);
+	if (err)
+		return err;
 
 	/* Update fields permitted to be changed. */
 	map->pgoff = desc->pgoff;
@@ -2700,13 +2706,12 @@ static bool can_set_ksm_flags_early(struct mmap_state *map)
 }
 
 static int call_action_complete(struct mmap_state *map,
-				struct vm_area_desc *desc,
+				struct mmap_action *action,
 				struct vm_area_struct *vma)
 {
-	struct mmap_action *action = &desc->action;
 	int ret;
 
-	ret = mmap_action_complete(action, vma);
+	ret = mmap_action_complete(vma, action);
 
 	/* If we held the file rmap we need to release it. */
 	if (map->hold_file_rmap_lock) {
@@ -2768,7 +2773,7 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
 	__mmap_complete(&map, vma);
 
 	if (have_mmap_prepare && allocated_new) {
-		error = call_action_complete(&map, &desc, vma);
+		error = call_action_complete(&map, &desc.action, vma);
 
 		if (error)
 			return error;
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 5eb313beb43d..908beb263307 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1106,7 +1106,7 @@ static inline int __compat_vma_mmap(const struct file_operations *f_op,
 
 		.pgoff = vma->vm_pgoff,
 		.vm_file = vma->vm_file,
-		.vm_flags = vma->vm_flags,
+		.vma_flags = vma->flags,
 		.page_prot = vma->vm_page_prot,
 
 		.action.type = MMAP_NOTHING, /* Default */
@@ -1117,9 +1117,12 @@ static inline int __compat_vma_mmap(const struct file_operations *f_op,
 	if (err)
 		return err;
 
-	mmap_action_prepare(&desc.action, &desc);
+	err = mmap_action_prepare(&desc, &desc.action);
+	if (err)
+		return err;
+
 	set_vma_from_desc(vma, &desc);
-	return mmap_action_complete(&desc.action, vma);
+	return mmap_action_complete(vma, &desc.action);
 }
 
 static inline int compat_vma_mmap(struct file *file,
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 947a3a0c2566..76c4b668bc62 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -81,13 +81,14 @@ static inline void free_anon_vma_name(struct vm_area_struct *vma)
 {
 }
 
-static inline void mmap_action_prepare(struct mmap_action *action,
-					   struct vm_area_desc *desc)
+static inline int mmap_action_prepare(struct vm_area_desc *desc,
+				      struct mmap_action *action)
 {
+	return 0;
 }
 
-static inline int mmap_action_complete(struct mmap_action *action,
-					   struct vm_area_struct *vma)
+static inline int mmap_action_complete(struct vm_area_struct *vma,
+				       struct mmap_action *action)
 {
 	return 0;
 }
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
