Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D10106ACE5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sINPMBI0tUvFydnOWU68LceQ1w8r+PULIcJBbUypR8E=; b=oikcDfApYOsrPf
	Nz5Mw1mInTxWsYRlrMMNjFsyDuJS37dwg0PCxNqqukaikN4WCesxT0XaZ7JMKy7Do5RWJE6t/kdrn
	skOHewIhtTQIPSC1qCrFrgK9MIBsBNUHJgXZk0WvM86YElHwasKrjtDLzMpxPEhYQGpAXraUnu8Uy
	a3qAW2BwDqhAvAxtmR6uwH7OP9HyYprPJ5OmKrS7/rgcYwLu73dAsDiehwLzEd2HFmvPBcSJKehJb
	qCXxYNO0ax1Yi7byRCT+qexlc/RvdOxQw3lYIzN5gs0OYtRzhYQtwUmMIOCAycV1e1DIlJ22NmLlp
	OXHNwyRD5umC9oAxQWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdi-0000000FHAM-2yhQ;
	Thu, 12 Mar 2026 20:28:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdV-0000000FGrW-0bJp;
	Thu, 12 Mar 2026 20:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4CBD44422;
	Thu, 12 Mar 2026 20:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1CFC4CEF7;
	Thu, 12 Mar 2026 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773347280;
	bh=+y+8TQWjiS/6OrohqiWfuyvPwbhSgEN2DOnPq14pRqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LfFsDlKLNAp/oUkhFt8+RJpJFNYhJzB9jojo7IzLuXDt50MFkYyLL3CyAZ4orGL89
	 khtFo/M99wAIHGfgccHgA4i9BOZL5xKbg+QwXzkPEfJGsVsqudSj1PcBlmszAf6jUb
	 ZdlUOHKcaob0y3vsG/pBzy4NU5HZTOTpdAht1Fp4UVqk0c69cBrynC1//SoepQdeej
	 tzFBQxTBarGSS/viTR8OOOWGPKeCyBr/USYqWgbRQ/5DPHfa1oDWDRhxg/xB4dHxSF
	 p5vuEySpbc07otTTLQ4eERmCocSh+bkDcVL8rWtVelKhT6mEOsZ0bVdv3mUICoipaS
	 atIMiOhViZuxQ==
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
Subject: [PATCH 05/15] fs: afs: correctly drop reference count on mapping failure
Date: Thu, 12 Mar 2026 20:27:20 +0000
Message-ID: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773346620.git.ljs@kernel.org>
References: <cover.1773346620.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_132801_226130_A968E455 
X-CRM114-Status: GOOD (  16.39  )
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

However, it did not account for the fact that mmap_prepare can fail to map
due to an out of memory error, and thus should not be incrementing a
reference count on mmap_prepare.

With the newly added vm_ops->mapped callback available, we can simply defer
this operation to that callback which is only invoked once the mapping is
successfully in place (but not yet visible to userspace as the mmap and VMA
write locks are held).

Therefore add afs_mapped() to implement this callback for AFS.

In practice the mapping allocations are 'too small to fail' so this is
something that realistically should never happen in practice (or would do
so in a case where the process is about to die anyway), but we should still
handle this.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 fs/afs/file.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index f609366fd2ac..69ef86f5e274 100644
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
@@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_area_desc *desc)
 	afs_add_open_mmap(vnode);
 
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
 	afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
