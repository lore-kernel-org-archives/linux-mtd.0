Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953B91099B4B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV4ICY1OdTux3CjhNkJQVoBqM1kordXJ0CpI7vl9D/Q=; b=GTSwMMgT3/iz1G
	3odjALuNV/YWOZYcGAT0L/vKotrxJ2/yFtn8Nu3oD7F0h9+QbzzhICrx3h7k5wFxMPcY++/vO1aj2
	WO6KFyE/+nL2+l0qu9m4ycrXGyBeIMtKwV+sN0TOhWankox16zI7e/EvlcujcjYgDJJtJwZclqNfV
	V8R/ugnZwfeIraQJtpTc7XP5xLinc6ldfv/k84jHIQkP7Owiw4DQ2XWEZXDWdUalcdcKE7F9Oeg0j
	D310PxXwftwCnWUy2DQpAHy791OJ6bwTnrs62tVWCAnA1EC2QKC9Re7rjjtuvJxD4bMd0aLCx2woB
	dobWIepCV/elvSgpL/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWC-0000000DinK-03OA;
	Fri, 20 Mar 2026 22:40:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iW2-0000000DicG-3rem;
	Fri, 20 Mar 2026 22:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qNZ0cSW5tVKwJdkc+8VZnUhYg3Myxx6O/VK3EewvUNU=; b=hRe+v5Rm+Db1o9NjwLtnolz32i
	IZ6CUZCQo3P2vtk6nxYZxI8NMVZMMknjpKjuf/p/md80h07XhvRrGcOOD9b/3t/Sf5JGf5LED9fCJ
	yR31/mlLbYE1m+0/rEEgreW6IqYWr4ifW/1/XZw7T5aqi3Qn44WTXxZMR/1wLdr+bDEuQZIB+JxoL
	/gXa9CpkjL8SHcmi3nsYpiozBaQULwwYBw+Y7NMre5fBMRyserXRxd0sJCxkFSlIeHhvoPfA7uw94
	418SLowuzzxNB+7H3H6qpZCmC1U3RPFG7FXUpl4ywzEcbp3e4B250lKNiLQb1lQcOn3HIk6ulkoAi
	IrIiPD0A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iVy-0000000GaSz-3NTK;
	Fri, 20 Mar 2026 22:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B65744452A;
	Fri, 20 Mar 2026 22:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E63C2BCB0;
	Fri, 20 Mar 2026 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774046420;
	bh=nTMi7MwgWhsqzEL3innRO8x3UGd+wS99PKV5J1/IH6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjT5OfG/LeaNBmLBTUcJPgnFfktEPzYQp1DS+lVjzFF9mviCzUaOB/pv5EHU0EsMM
	 0WimX7637MvnHvbDM5ijVu4+dtO8s0Vvfj0NenkAY/HaB3Ad88bN2u1mlJ0c1QIkvA
	 cIxW5OOMSphnCBkiQSwasBNYmIRGz9qUDAFkFdd6pzQVCWVUiupz5jZCRHZs5XTkYp
	 DB/EkEvfD1Afqqzo+MwllMaR4ktnrqaRLNCUlkajLtTYHG7nILemLEO/ih0qWLXHHT
	 sHtHoecxEP3lZPCejF3YNgU1Tz5BXICj27Ua1a6alZHwlWd+3T5ga9RjPT/WeFhCgB
	 Wbo/bkpNIqoog==
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
Subject: [PATCH v4 05/21] mm: switch the rmap lock held option off in compat layer
Date: Fri, 20 Mar 2026 22:39:31 +0000
Message-ID: <dda74230d26a1fcd79a3efab61fa4101dd1cac64.1774045440.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_224023_670487_549F2CB4 
X-CRM114-Status: GOOD (  16.66  )
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

In the mmap_prepare compatibility layer, we don't need to hold the rmap
lock, as we are being called from an .mmap handler.

The .mmap_prepare hook, when invoked in the VMA logic, is called prior to
the VMA being instantiated, but the completion hook is called after the VMA
is linked into the maple tree, meaning rmap walkers can reach it.

The mmap hook does not link the VMA into the tree, so this cannot happen.

Therefore it's safe to simply disable this in the mmap_prepare
compatibility layer.

Also update VMA tests code to reflect current compatibility layer state.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/util.c                       |  6 ++++-
 tools/testing/vma/include/dup.h | 42 +++++++++++++++++----------------
 2 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index a2cfa0d77c35..182f0f5cc400 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1204,6 +1204,7 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)

 		.action.type = MMAP_NOTHING, /* Default */
 	};
+	struct mmap_action *action = &desc.action;
 	int err;

 	err = vfs_mmap_prepare(file, &desc);
@@ -1214,8 +1215,11 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 	if (err)
 		return err;

+	/* being invoked from .mmmap means we don't have to enforce this. */
+	action->hide_from_rmap_until_complete = false;
+
 	set_vma_from_desc(vma, &desc);
-	err = mmap_action_complete(vma, &desc.action);
+	err = mmap_action_complete(vma, action);
 	if (err) {
 		const size_t len = vma_pages(vma) << PAGE_SHIFT;

diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 26c6c3255a94..c62d3998e922 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1256,8 +1256,17 @@ static inline void vma_set_anonymous(struct vm_area_struct *vma)
 static inline void set_vma_from_desc(struct vm_area_struct *vma,
 		struct vm_area_desc *desc);

-static inline int __compat_vma_mmap(const struct file_operations *f_op,
-		struct file *file, struct vm_area_struct *vma)
+static inline int vfs_mmap_prepare(struct file *file, struct vm_area_desc *desc)
+{
+	return file->f_op->mmap_prepare(desc);
+}
+
+static inline unsigned long vma_pages(struct vm_area_struct *vma)
+{
+	return (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
+}
+
+static inline int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct vm_area_desc desc = {
 		.mm = vma->vm_mm,
@@ -1272,9 +1281,10 @@ static inline int __compat_vma_mmap(const struct file_operations *f_op,

 		.action.type = MMAP_NOTHING, /* Default */
 	};
+	struct mmap_action *action = &desc.action;
 	int err;

-	err = f_op->mmap_prepare(&desc);
+	err = vfs_mmap_prepare(file, &desc);
 	if (err)
 		return err;

@@ -1282,28 +1292,25 @@ static inline int __compat_vma_mmap(const struct file_operations *f_op,
 	if (err)
 		return err;

+	/* being invoked from .mmmap means we don't have to enforce this. */
+	action->hide_from_rmap_until_complete = false;
+
 	set_vma_from_desc(vma, &desc);
-	return mmap_action_complete(vma, &desc.action);
-}
+	err = mmap_action_complete(vma, action);
+	if (err) {
+		const size_t len = vma_pages(vma) << PAGE_SHIFT;

-static inline int compat_vma_mmap(struct file *file,
-		struct vm_area_struct *vma)
-{
-	return __compat_vma_mmap(file->f_op, file, vma);
+		do_munmap(current->mm, vma->vm_start, len, NULL);
+	}
+	return err;
 }

-
 static inline void vma_iter_init(struct vma_iterator *vmi,
 		struct mm_struct *mm, unsigned long addr)
 {
 	mas_init(&vmi->mas, &mm->mm_mt, addr);
 }

-static inline unsigned long vma_pages(struct vm_area_struct *vma)
-{
-	return (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
-}
-
 static inline void mmap_assert_locked(struct mm_struct *);
 static inline struct vm_area_struct *find_vma_intersection(struct mm_struct *mm,
 						unsigned long start_addr,
@@ -1473,11 +1480,6 @@ static inline int vfs_mmap(struct file *file, struct vm_area_struct *vma)
 	return file->f_op->mmap(file, vma);
 }

-static inline int vfs_mmap_prepare(struct file *file, struct vm_area_desc *desc)
-{
-	return file->f_op->mmap_prepare(desc);
-}
-
 static inline void vma_set_file(struct vm_area_struct *vma, struct file *file)
 {
 	/* Changing an anonymous vma with this is illegal */
--
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
