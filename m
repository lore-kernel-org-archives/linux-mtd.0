Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271541099B4C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UBjAPMdJ9C69wlM6T93Fgr3Ju7jARPU7Qbd4zeGu8g=; b=vm1D5mo9HM8gu7
	te4uU0jOzsC9B/QeKrvNNp5ztFm1XISjAPcbAm9HKd0IULd6SbBBqvIUAd9shQvSS5TMlswu9DhzC
	1l1kmCkv0+MEw6ACZcLeJUtAoRv36aJDBl8jf8vbAxEVcFKAKEoEGxrl6kKzLEa7zu79pDzEJ0Zlg
	mCrbu0QWpir/zUdCFVFB25fOxmDZdgC00vc4vPn61xkZBUYivDfvOaET5PuK6eDX+GchA7l+tlRs6
	aTjH48IBwr8pHdakB247t66zY3YqT3JyqBs8UTqFYChLpE2aXQx95zgQBN0xvV/YlP+v0HJG6DkWn
	HmAf0TpHp0YNBiV+Onxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWB-0000000Dim9-0Yk1;
	Fri, 20 Mar 2026 22:40:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iW0-0000000DiZc-1NWk;
	Fri, 20 Mar 2026 22:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD65B61118;
	Fri, 20 Mar 2026 22:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF76C2BCB0;
	Fri, 20 Mar 2026 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774046423;
	bh=5B0UudB5t6IvoUSjas4gSsitxv5wljP/xv5/LMRSwMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KUQ4yJnN/WuHnEHkwKNXjPL29+3niu71Tepf6T8MO4WkDdogsFLE72V8PeJFDVlF4
	 Bgq2IUCnGX2DqjqxgG9VU/AJ9tvaRvZoXCJ/edOpA2ecyHNMPx/827tzdtxUxlno1b
	 kB/jx2f29BxgqysOfNJm2thngFQSBiZldAHGABhZEbYYZtllNjGAzqunIUk7syMpWE
	 q4F2EYNQ3xjEpxq+z70oW/TZyTdZnIe3eNlH70hr0fh7kvql3+XaNSIzX6J9joDX/J
	 Wo7adkEJHy2wBoh1A0sfY4bHYjqE6KjPrlgSkBE1+cXFhZzg9cVq3BIUNXtQCYbYf7
	 VMR8sVXp9E6aw==
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
Subject: [PATCH v4 06/21] mm/vma: remove superfluous map->hold_file_rmap_lock
Date: Fri, 20 Mar 2026 22:39:32 +0000
Message-ID: <42c3fbb701e361a17193ecda0d2dabcc326288a5.1774045440.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
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

We don't need to reference this field, it's confusing as it duplicates
mmap_action->hide_from_rmap_until_complete, so thread the mmap_action
through to __mmap_new_vma() instead and use the same field consistently.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/vma.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 3fc5fe4f1a7c..6105f54cea61 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -38,8 +38,6 @@ struct mmap_state {
 
 	/* Determine if we can check KSM flags early in mmap() logic. */
 	bool check_ksm_early :1;
-	/* If we map new, hold the file rmap lock on mapping. */
-	bool hold_file_rmap_lock :1;
 	/* If .mmap_prepare changed the file, we don't need to pin. */
 	bool file_doesnt_need_get :1;
 };
@@ -2531,10 +2529,12 @@ static int __mmap_new_file_vma(struct mmap_state *map,
  *
  * @map:  Mapping state.
  * @vmap: Output pointer for the new VMA.
+ * @action: Any mmap_prepare action that is still to complete.
  *
  * Returns: Zero on success, or an error.
  */
-static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
+static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap,
+	struct mmap_action *action)
 {
 	struct vma_iterator *vmi = map->vmi;
 	int error = 0;
@@ -2583,7 +2583,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 	vma_start_write(vma);
 	vma_iter_store_new(vmi, vma);
 	map->mm->map_count++;
-	vma_link_file(vma, map->hold_file_rmap_lock);
+	vma_link_file(vma, action->hide_from_rmap_until_complete);
 
 	/*
 	 * vma_merge_new_range() calls khugepaged_enter_vma() too, the below
@@ -2650,8 +2650,6 @@ static int call_action_prepare(struct mmap_state *map,
 	if (err)
 		return err;
 
-	if (desc->action.hide_from_rmap_until_complete)
-		map->hold_file_rmap_lock = true;
 	return 0;
 }
 
@@ -2741,7 +2739,7 @@ static int call_action_complete(struct mmap_state *map,
 	err = mmap_action_complete(vma, action);
 
 	/* If we held the file rmap we need to release it. */
-	if (map->hold_file_rmap_lock) {
+	if (action->hide_from_rmap_until_complete) {
 		struct file *file = vma->vm_file;
 
 		i_mmap_unlock_write(file->f_mapping);
@@ -2795,7 +2793,7 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
 
 	/* ...but if we can't, allocate a new VMA. */
 	if (!vma) {
-		error = __mmap_new_vma(&map, &vma);
+		error = __mmap_new_vma(&map, &vma, &desc.action);
 		if (error)
 			goto unacct_error;
 		allocated_new = true;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
