Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCA2F53D9F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 21:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/PkTUbEhqiyefu9d393DHGHGQpK6WiLt7cDzaOaUVY=; b=icEn2cvShD65hS
	/+K1QDoOqc/D+cBewKGPDS25F8liaODvOBuLVouhYAYFz383KFwjBXKKrkEYgy81ODJyx4aRWyL0q
	HtP6wqWjADNYPbEgWIG/4fglh/WS+L626oCwJKZ6RewMR+iNqMjtAyz3izeGGHv52DhXzsIF2yfoz
	rgAUP9Wi6m03oT4YlRtSv1fJ82y/p/2ZGngRUqlC9SobkrZU3r4suE8uh/PRK1ZElQFessDCI4jut
	vSU1R8sTfPu9ADLTIrYmdZSdywQQ9Scbe5/jeYXjmAIYjYfKdpUxwhwC4rRBkC9GRWzP9EVcIuFB6
	vZE4yczHGIE9TFYOFacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FG7-00000004sVw-2L7T;
	Mon, 16 Mar 2026 21:13:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FG1-00000004sO3-2wR9;
	Mon, 16 Mar 2026 21:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03ACD6132E;
	Mon, 16 Mar 2026 21:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C13C2BCB1;
	Mon, 16 Mar 2026 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773695628;
	bh=mxFcLsr6r2wj9eno75O5C8CT66bJwyYfKm1xkhzS5VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UifoBpWERyyJinDaROIU/8BdcD8QlZmZI4C90pg1x+VXOyqixOQEfjCN6+i/3J7dc
	 ng4p0DmjHhqw6G5izmwLcWgwnKbOoc42J+S2XGFP2mxiszOAzoIXS0GV4yTIkxxCXv
	 yz3z1FS817ZIr//yhxjzoYjSaYH/h7YCM0hb8VWXTjmokqtiEDOroeMZvgdXHtZINp
	 EVHFTJsEwNhAiOmMQOTCqyZhYr/e8LqmnGIasLzpV/XgeN/92XNzwkSI+FGOFMF8mm
	 fycJK6KknV6G9KQdHGYNGRxu+Kh4PFREmkXJTlrYXRzNFLu4UrZ194JVEv4iCCdL/q
	 PqQJKHUPzTbIQ==
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
Subject: [PATCH v2 04/16] mm: add vm_ops->mapped hook
Date: Mon, 16 Mar 2026 21:12:00 +0000
Message-ID: <700b3a31185c1b4255c8410c7724ffd123488467.1773695307.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773695307.git.ljs@kernel.org>
References: <cover.1773695307.git.ljs@kernel.org>
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

Previously, when a driver needed to do something like establish a
reference count, it could do so in the mmap hook in the knowledge that the
mapping would succeed.

With the introduction of f_op->mmap_prepare this is no longer the case, as
it is invoked prior to actually establishing the mapping.

mmap_prepare is not appropriate for this kind of thing as it is called
before any merge might take place, and after which an error might occur
meaning resources could be leaked.

To take this into account, introduce a new vm_ops->mapped callback which
is invoked when the VMA is first mapped (though notably - not when it is
merged - which is correct and mirrors existing mmap/open/close behaviour).

We do better that vm_ops->open() here, as this callback can return an
error, at which point the VMA will be unmapped.

Note that vm_ops->mapped() is invoked after any mmap action is complete
(such as I/O remapping).

We intentionally do not expose the VMA at this point, exposing only the
fields that could be used, and an output parameter in case the operation
needs to update the vma->vm_private_data field.

In order to deal with stacked filesystems which invoke inner filesystem's
mmap() invocations, add __compat_vma_mapped() and invoke it on vfs_mmap()
(via compat_vma_mmap()) to ensure that the mapped callback is handled when
an mmap() caller invokes a nested filesystem's mmap_prepare() callback.

We can now also remove call_action_complete() and invoke
mmap_action_complete() directly, as we separate out the rmap lock logic to
be called in __mmap_region() instead via maybe_drop_file_rmap_lock().

We also abstract unmapping of a VMA on mmap action completion into its own
helper function, unmap_vma_locked().

Update the mmap_prepare documentation to describe the mapped hook and make
it clear what its intended use is.

Additionally, update VMA userland test headers to reflect the change.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 Documentation/filesystems/mmap_prepare.rst | 15 ++++
 include/linux/fs.h                         |  9 ++-
 include/linux/mm.h                         | 17 +++++
 mm/internal.h                              |  8 ++
 mm/util.c                                  | 85 ++++++++++++++++------
 mm/vma.c                                   | 41 ++++++++---
 tools/testing/vma/include/dup.h            | 27 ++++++-
 7 files changed, 164 insertions(+), 38 deletions(-)

diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
index 65a1f094e469..20db474915da 100644
--- a/Documentation/filesystems/mmap_prepare.rst
+++ b/Documentation/filesystems/mmap_prepare.rst
@@ -25,6 +25,21 @@ That is - no resources should be allocated nor state updated to reflect that a
 mapping has been established, as the mapping may either be merged, or fail to be
 mapped after the callback is complete.
 
+Mapped callback
+---------------
+
+If resources need to be allocated per-mapping, or state such as a reference
+count needs to be manipulated, this should be done using the ``vm_ops->mapped``
+hook, which itself should be set by the >mmap_prepare hook.
+
+This callback is only invoked if a new mapping has been established and was not
+merged with any other, and is invoked at a point where no error may occur before
+the mapping is established.
+
+You may return an error to the callback itself, which will cause the mapping to
+become unmapped and an error returned to the mmap() caller. This is useful if
+resources need to be allocated, and that allocation might fail.
+
 How To Use
 ==========
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index a2628a12bd2b..c390f5c667e3 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2059,13 +2059,20 @@ static inline bool can_mmap_file(struct file *file)
 }
 
 int compat_vma_mmap(struct file *file, struct vm_area_struct *vma);
+int __vma_check_mmap_hook(struct vm_area_struct *vma);
 
 static inline int vfs_mmap(struct file *file, struct vm_area_struct *vma)
 {
+	int err;
+
 	if (file->f_op->mmap_prepare)
 		return compat_vma_mmap(file, vma);
 
-	return file->f_op->mmap(file, vma);
+	err = file->f_op->mmap(file, vma);
+	if (err)
+		return err;
+
+	return __vma_check_mmap_hook(vma);
 }
 
 static inline int vfs_mmap_prepare(struct file *file, struct vm_area_desc *desc)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index da94edb287cd..ad1b8c3c0cfd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -777,6 +777,23 @@ struct vm_operations_struct {
 	 * Context: User context.  May sleep.  Caller holds mmap_lock.
 	 */
 	void (*close)(struct vm_area_struct *vma);
+	/**
+	 * @mapped: Called when the VMA is first mapped in the MM. Not called if
+	 * the new VMA is merged with an adjacent VMA.
+	 *
+	 * The @vm_private_data field is an output field allowing the user to
+	 * modify vma->vm_private_data as necessary.
+	 *
+	 * ONLY valid if set from f_op->mmap_prepare. Will result in an error if
+	 * set from f_op->mmap.
+	 *
+	 * Returns %0 on success, or an error otherwise. On error, the VMA will
+	 * be unmapped.
+	 *
+	 * Context: User context.  May sleep.  Caller holds mmap_lock.
+	 */
+	int (*mapped)(unsigned long start, unsigned long end, pgoff_t pgoff,
+		      const struct file *file, void **vm_private_data);
 	/* Called any time before splitting to check if it's allowed */
 	int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
 	int (*mremap)(struct vm_area_struct *vma);
diff --git a/mm/internal.h b/mm/internal.h
index 9e42a57e8a12..f5774892071e 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -202,6 +202,14 @@ static inline void vma_close(struct vm_area_struct *vma)
 /* unmap_vmas is in mm/memory.c */
 void unmap_vmas(struct mmu_gather *tlb, struct unmap_desc *unmap);
 
+static inline void unmap_vma_locked(struct vm_area_struct *vma)
+{
+	const size_t len = vma_pages(vma) << PAGE_SHIFT;
+
+	mmap_assert_write_locked(vma->vm_mm);
+	do_munmap(vma->vm_mm, vma->vm_start, len, NULL);
+}
+
 #ifdef CONFIG_MMU
 
 static inline void get_anon_vma(struct anon_vma *anon_vma)
diff --git a/mm/util.c b/mm/util.c
index ac9dd6490523..cdfba09e50d7 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1163,6 +1163,54 @@ void flush_dcache_folio(struct folio *folio)
 EXPORT_SYMBOL(flush_dcache_folio);
 #endif
 
+static int __compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
+{
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
+	err = mmap_action_prepare(&desc);
+	if (err)
+		return err;
+
+	set_vma_from_desc(vma, &desc);
+	return mmap_action_complete(vma, &desc.action);
+}
+
+static int __compat_vma_mapped(struct file *file, struct vm_area_struct *vma)
+{
+	const struct vm_operations_struct *vm_ops = vma->vm_ops;
+	void *vm_private_data = vma->vm_private_data;
+	int err;
+
+	if (!vm_ops || !vm_ops->mapped)
+		return 0;
+
+	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff, file,
+			     &vm_private_data);
+	if (err)
+		unmap_vma_locked(vma);
+	else if (vm_private_data != vma->vm_private_data)
+		vma->vm_private_data = vm_private_data;
+
+	return err;
+}
+
 /**
  * compat_vma_mmap() - Apply the file's .mmap_prepare() hook to an
  * existing VMA and execute any requested actions.
@@ -1191,34 +1239,26 @@ EXPORT_SYMBOL(flush_dcache_folio);
  */
 int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 {
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
 	int err;
 
-	err = vfs_mmap_prepare(file, &desc);
-	if (err)
-		return err;
-
-	err = mmap_action_prepare(&desc);
+	err = __compat_vma_mmap(file, vma);
 	if (err)
 		return err;
 
-	set_vma_from_desc(vma, &desc);
-	return mmap_action_complete(vma, &desc.action);
+	return __compat_vma_mapped(file, vma);
 }
 EXPORT_SYMBOL(compat_vma_mmap);
 
+int __vma_check_mmap_hook(struct vm_area_struct *vma)
+{
+	/* vm_ops->mapped is not valid if mmap() is specified. */
+	if (vma->vm_ops && WARN_ON_ONCE(vma->vm_ops->mapped))
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(__vma_check_mmap_hook);
+
 static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
 			 const struct page *page)
 {
@@ -1316,10 +1356,7 @@ static int mmap_action_finish(struct vm_area_struct *vma,
 	 * invoked if we do NOT merge, so we only clean up the VMA we created.
 	 */
 	if (err) {
-		const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-		do_munmap(current->mm, vma->vm_start, len, NULL);
-
+		unmap_vma_locked(vma);
 		if (action->error_hook) {
 			/* We may want to filter the error. */
 			err = action->error_hook(err);
diff --git a/mm/vma.c b/mm/vma.c
index 2a86c7575000..3a0fb2caa1c6 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2731,21 +2731,35 @@ static bool can_set_ksm_flags_early(struct mmap_state *map)
 	return false;
 }
 
-static int call_action_complete(struct mmap_state *map,
-				struct mmap_action *action,
-				struct vm_area_struct *vma)
+static int call_mapped_hook(struct vm_area_struct *vma)
 {
-	int ret;
+	const struct vm_operations_struct *vm_ops = vma->vm_ops;
+	void *vm_private_data = vma->vm_private_data;
+	int err;
 
-	ret = mmap_action_complete(vma, action);
+	if (!vm_ops || !vm_ops->mapped)
+		return 0;
+	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff,
+			     vma->vm_file, &vm_private_data);
+	if (err) {
+		unmap_vma_locked(vma);
+		return err;
+	}
+	/* Update private data if changed. */
+	if (vm_private_data != vma->vm_private_data)
+		vma->vm_private_data = vm_private_data;
+	return 0;
+}
 
-	/* If we held the file rmap we need to release it. */
-	if (map->hold_file_rmap_lock) {
-		struct file *file = vma->vm_file;
+static void maybe_drop_file_rmap_lock(struct mmap_state *map,
+				      struct vm_area_struct *vma)
+{
+	struct file *file;
 
-		i_mmap_unlock_write(file->f_mapping);
-	}
-	return ret;
+	if (!map->hold_file_rmap_lock)
+		return;
+	file = vma->vm_file;
+	i_mmap_unlock_write(file->f_mapping);
 }
 
 static unsigned long __mmap_region(struct file *file, unsigned long addr,
@@ -2799,8 +2813,11 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
 	__mmap_complete(&map, vma);
 
 	if (have_mmap_prepare && allocated_new) {
-		error = call_action_complete(&map, &desc.action, vma);
+		error = mmap_action_complete(vma, &desc.action);
+		if (!error)
+			error = call_mapped_hook(vma);
 
+		maybe_drop_file_rmap_lock(&map, vma);
 		if (error)
 			return error;
 	}
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index ccf1f061c65a..4570ec77f153 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -642,7 +642,24 @@ struct vm_operations_struct {
 	 * @close: Called when the VMA is being removed from the MM.
 	 * Context: User context.  May sleep.  Caller holds mmap_lock.
 	 */
-	void (*close)(struct vm_area_struct * area);
+	void (*close)(struct vm_area_struct *vma);
+	/**
+	 * @mapped: Called when the VMA is first mapped in the MM. Not called if
+	 * the new VMA is merged with an adjacent VMA.
+	 *
+	 * The @vm_private_data field is an output field allowing the user to
+	 * modify vma->vm_private_data as necessary.
+	 *
+	 * ONLY valid if set from f_op->mmap_prepare. Will result in an error if
+	 * set from f_op->mmap.
+	 *
+	 * Returns %0 on success, or an error otherwise. On error, the VMA will
+	 * be unmapped.
+	 *
+	 * Context: User context.  May sleep.  Caller holds mmap_lock.
+	 */
+	int (*mapped)(unsigned long start, unsigned long end, pgoff_t pgoff,
+		      const struct file *file, void **vm_private_data);
 	/* Called any time before splitting to check if it's allowed */
 	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
 	int (*mremap)(struct vm_area_struct *area);
@@ -1500,3 +1517,11 @@ static inline pgprot_t vma_get_page_prot(vma_flags_t vma_flags)
 
 	return vm_get_page_prot(vm_flags);
 }
+
+static inline void unmap_vma_locked(struct vm_area_struct *vma)
+{
+	const size_t len = vma_pages(vma) << PAGE_SHIFT;
+
+	mmap_assert_write_locked(vma->vm_mm);
+	do_munmap(vma->vm_mm, vma->vm_start, len, NULL);
+}
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
