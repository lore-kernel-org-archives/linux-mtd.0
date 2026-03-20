Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888D21099B4E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urwfmyVlo79hXyVB9xl1zFrgLITAQLujQ9yd3sTWL5o=; b=e2Dd5sZdfiwvpX
	r42cmJTC9CCV4zSsNIS096zeZFCRwuuZwMB96mx7d/zv3upNtX6VavzL/ji8mAMatpMyZItzWL5JZ
	gchqBgxl+9RqHMZ66jTzvSfPsDFmrtzh0F94nRleecQSt8LhV07pPhjzow4YIJGRZ33Ut9dks018p
	vLQYM4B2VoujxA5QzmIpDNcIJqK38rPQSIJjgO23ZunDMZdqM9oUNb5UxnTeXT8o32IXMNZRAtnzA
	laa6FcuM8ytweG4CwIg26emq97a6RrokvTS/28wA460MnJT8UfHtRcIM9atGEXHnx1RVuBoOnU20N
	oAhfhhf2CoqI6X9zSJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iVz-0000000DiYL-0t7Q;
	Fri, 20 Mar 2026 22:40:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iVu-0000000DiSp-3Vjv;
	Fri, 20 Mar 2026 22:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B97F60154;
	Fri, 20 Mar 2026 22:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A85C2BC9E;
	Fri, 20 Mar 2026 22:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774046417;
	bh=L0GQ2G+rRvGPAFrt5sDMa8oj/FKKHLhal+DfkgK7NEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFVvmSaqDqJLoDlg+6noI1Wxcf1pqHJkBZjp3o48gNpg4DH44rSaBGPbLYz/qYZkM
	 Nd8QwUFV1MaXSsj8jMMIjACmWtdO9Y/w9/2x+JJoanOvv9XyP9qFBdKZZkxb1A4iHC
	 tkLQhKpN3alMVayVyEb9I/udX19c+sGN7XDtcaIOMLn6nekaglVJYw11nFmLwGrBc4
	 hsCpEv1VvOJUhXrUrciA2il+pJ/sMHTGafOaYgDrjovh6SCT8n/MXsfdX3tgBGQOS2
	 ldB6CM957Gunm1xRN2e3elhZJR5PM4eGqJVCx4WeRxsCBdQ44ZurTnPnt2jh0taBlN
	 sszGTQBOqqiOA==
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
Subject: [PATCH v4 04/21] mm: avoid deadlock when holding rmap on mmap_prepare error
Date: Fri, 20 Mar 2026 22:39:30 +0000
Message-ID: <d44248be9da68258b07c2c59d4e73485ee0ca943.1774045440.git.ljs@kernel.org>
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

Commit ac0a3fc9c07d ("mm: add ability to take further action in
vm_area_desc") added the ability for drivers to instruct mm to take actions
after the .mmap_prepare callback is complete.

To make life simpler and safer, this is done before the VMA/mmap write lock
is dropped but when the VMA is completely established.

So on error, we simply munmap() the VMA.

As part of this implementation, unfortunately a horrible hack had to be
implemented to support some questionable behaviour hugetlb relies upon -
that is that the file rmap lock is held until the operation is complete.

The implementation, for convenience, did this in mmap_action_finish() so
both the VMA and mmap_prepare compatibility layer paths would have this
correctly handled.

However, it turns out there is a mistake here - the rmap lock cannot be
held on munmap, as free_pgtables() -> unlink_file_vma_batch_add() ->
unlink_file_vma_batch_process() takes the file rmap lock.

We therefore currently have a deadlock issue that might arise.

Resolve this by leaving it to callers to handle the unmap.

The compatibility layer does not support this rmap behaviour, so we simply
have it unmap on error after calling mmap_action_complete().

In the VMA implementation, we only perform the unmap after the rmap lock is
dropped.

This resolves the issue by ensuring the rmap lock is always dropped when
the unmap occurs.

Fixes: ac0a3fc9c07d ("mm: add ability to take further action in vm_area_desc")
Cc: <stable@vger.kernel.org>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/util.c | 12 +++++++-----
 mm/vma.c  | 13 ++++++++++---
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 73c97a748d8e..a2cfa0d77c35 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1215,7 +1215,13 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 		return err;
 
 	set_vma_from_desc(vma, &desc);
-	return mmap_action_complete(vma, &desc.action);
+	err = mmap_action_complete(vma, &desc.action);
+	if (err) {
+		const size_t len = vma_pages(vma) << PAGE_SHIFT;
+
+		do_munmap(current->mm, vma->vm_start, len, NULL);
+	}
+	return err;
 }
 EXPORT_SYMBOL(compat_vma_mmap);
 
@@ -1316,10 +1322,6 @@ static int mmap_action_finish(struct vm_area_struct *vma,
 	 * invoked if we do NOT merge, so we only clean up the VMA we created.
 	 */
 	if (err) {
-		const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-		do_munmap(current->mm, vma->vm_start, len, NULL);
-
 		if (action->error_hook) {
 			/* We may want to filter the error. */
 			err = action->error_hook(err);
diff --git a/mm/vma.c b/mm/vma.c
index ee91f2b76acf..3fc5fe4f1a7c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2736,9 +2736,9 @@ static int call_action_complete(struct mmap_state *map,
 				struct mmap_action *action,
 				struct vm_area_struct *vma)
 {
-	int ret;
+	int err;
 
-	ret = mmap_action_complete(vma, action);
+	err = mmap_action_complete(vma, action);
 
 	/* If we held the file rmap we need to release it. */
 	if (map->hold_file_rmap_lock) {
@@ -2746,7 +2746,14 @@ static int call_action_complete(struct mmap_state *map,
 
 		i_mmap_unlock_write(file->f_mapping);
 	}
-	return ret;
+
+	if (err) {
+		const size_t len = vma_pages(vma) << PAGE_SHIFT;
+
+		do_munmap(current->mm, vma->vm_start, len, NULL);
+	}
+
+	return err;
 }
 
 static unsigned long __mmap_region(struct file *file, unsigned long addr,
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
