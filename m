Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84A9F013FA
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9vxxDEDvbqZOCTOTyrq6GSCmE3qDKNwUuxHgOGaPOU=; b=phqS07QdIIFq0/
	1kXyK17Lb+81b9jYTMBeVAKOkDRoCF615zE6yaTA1OYpvvWyGw15QOTc+smU3KUPDrdnLoVxC37QV
	BmzcjFTMcmuogwOPXu/Wiv+7Ecxo4jQpAOcX/8ojYIryOZWDj/wZbJ5QtH5WrYoBDOCGFVxDlwKld
	2etOmimtdBVLxJpaeFP0t+E9rEaCCKydA+HtdTLDl4CUKX/IUQSwB6/nSLvKfbWRzf6yyQX/2uVN8
	BJ7w5YhFUZAQArKH7PWRO2pge+d8WvyZKbuP+0ue6HrnAF3ndKNILNKkJcLVLYSRSqNMuj/Kt4B7y
	PBdRiRjTbFKqSxRoUNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FGA-00000004sbI-2qi6;
	Mon, 16 Mar 2026 21:13:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FG4-00000004sRO-1uOK;
	Mon, 16 Mar 2026 21:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D174A61337;
	Mon, 16 Mar 2026 21:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE085C19421;
	Mon, 16 Mar 2026 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773695631;
	bh=6S44qhIRjmjl+gxtSz073d0fvCuPGMw2Nzi6g3n7GIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G/nMXj/Gt/rgZs51K4/q3MDaE+1rYepOBe9N35lU0C2jzQBG8tTMYbazchVMYIMrK
	 SH7mg8XpmttG0GxwWU8BM7a0GUW3UGMBHY1NW0EnFW44iOQdJHVsTPnVZ3FoIAIBxx
	 bQDZGVyvVsDs/9OIustgkwgYS2kKqpZnsw2fFPNSxnI9hHJ2uyO4J+A+ZOn3MpRsp7
	 UoLgV+kPKpfkcJFy7hB4YEPJlYUm3QUlmbrfI7JF3TQbwG1WarvqyYy7wBcDFjfHmW
	 yXyR9kTsNP+yM1b0kOfshvK1ytmwp+wOxUyN7ESJXV/1+Gc/FTTQqfKokMguPcdSMp
	 9f+mZjVQTJvFQ==
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
Subject: [PATCH v2 05/16] fs: afs: correctly drop reference count on mapping failure
Date: Mon, 16 Mar 2026 21:12:01 +0000
Message-ID: <7adcb09e6817fadf9572a96893e95eacfe6fc4cc.1773695307.git.ljs@kernel.org>
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

Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to
.mmap_prepare()") updated AFS to use the mmap_prepare callback in favour of
the deprecated mmap callback.

However, it did not account for the fact that mmap_prepare is called
pre-merge, and may then be merged, nor that mmap_prepare can fail to map
due to an out of memory error.

Both of those are cases in which we should not be incrementing a reference
count.

With the newly added vm_ops->mapped callback available, we can simply defer
this operation to that callback which is only invoked once the mapping is
successfully in place (but not yet visible to userspace as the mmap and VMA
write locks are held).

Therefore add afs_mapped() to implement this callback for AFS, and remove
the code doing so in afs_mmap_prepare().

Also update afs_vm_open(), afs_vm_close() and afs_vm_map_pages() to be
consistent in how the vnode is accessed.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 fs/afs/file.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index f609366fd2ac..85696ac984cc 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
 static void afs_vm_open(struct vm_area_struct *area);
 static void afs_vm_close(struct vm_area_struct *area);
 static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pgoff_t end_pgoff);
+static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
+		      const struct file *file, void **vm_private_data);
 
 const struct file_operations afs_file_operations = {
 	.open		= afs_open,
@@ -61,6 +63,7 @@ const struct address_space_operations afs_file_aops = {
 };
 
 static const struct vm_operations_struct afs_vm_ops = {
+	.mapped		= afs_mapped,
 	.open		= afs_vm_open,
 	.close		= afs_vm_close,
 	.fault		= filemap_fault,
@@ -494,32 +497,45 @@ static void afs_drop_open_mmap(struct afs_vnode *vnode)
  */
 static int afs_file_mmap_prepare(struct vm_area_desc *desc)
 {
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(desc->file));
 	int ret;
 
-	afs_add_open_mmap(vnode);
-
 	ret = generic_file_mmap_prepare(desc);
-	if (ret == 0)
-		desc->vm_ops = &afs_vm_ops;
-	else
-		afs_drop_open_mmap(vnode);
+	if (ret)
+		return ret;
+
+	desc->vm_ops = &afs_vm_ops;
 	return ret;
 }
 
+static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
+		      const struct file *file, void **vm_private_data)
+{
+	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
+
+	afs_add_open_mmap(vnode);
+	return 0;
+}
+
 static void afs_vm_open(struct vm_area_struct *vma)
 {
-	afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
+	struct file *file = vma->vm_file;
+	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
+
+	afs_add_open_mmap(vnode);
 }
 
 static void afs_vm_close(struct vm_area_struct *vma)
 {
-	afs_drop_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
+	struct file *file = vma->vm_file;
+	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
+
+	afs_drop_open_mmap(vnode);
 }
 
 static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pgoff_t end_pgoff)
 {
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(vmf->vma->vm_file));
+	struct file *file = vmf->vma->vm_file;
+	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 
 	if (afs_check_validity(vnode))
 		return filemap_map_pages(vmf, start_pgoff, end_pgoff);
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
