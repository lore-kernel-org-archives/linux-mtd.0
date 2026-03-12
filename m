Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A1B106ACE9
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGkoeZN0iUxuvQRcw7fU/Jpfp2rVqkT1mMDtm8e16zs=; b=wazJ27/z/edyr7
	0xVkYRw3E6aIxf0UvJJ7QRnni5lVPXGLppr9gQ8JOkKJ1VKipCPD+ba/pfQJJtWTtnOKdZWGcZrci
	K/Ak+ktAWtVJc21qCmHQJYJm873pDSxE6Le/LZHSeSXdWm0sw/zr1L6Kl6nbymyI7di+odEdcudGH
	w2Nbh7IIjEJHBVVn1vGIN8/sqyMizzdAOdaZwSAfU+LH7eA3CmYVBLFpHIEzlkHe9wIxKPXZYBnCP
	AQ0x7Qm7gi0ddLh3xIRWAiW48DkhDR3o9yRqIwFkX0miD6lGkF5WyH1EgJfOLoeAdurKxNO6miqk9
	af+QdQ5v7KK1QuRfBqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdx-0000000FHb0-2ZJJ;
	Thu, 12 Mar 2026 20:28:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdm-0000000FHER-1jHI;
	Thu, 12 Mar 2026 20:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=22u/zPXLif+tmx8jfL6mwxg5k2jKGBmc27j1Epm3TuI=; b=pqRAv/MelG16x4QkDnWU/qAws0
	Bvz2dCSNNSRhERo1MI9D3Nqh4D8EGxy+MptlBV5jTTlouOhYu+lWgXVGOB4lchsm7B1Yg0xfi+iFW
	RmzdirqpKi1VBUVWV9haCxfwgrmJqrrVcmNt3NB4L7LmdraqSHJurbpWthbQQK+Zn5zlJdGXO7UOq
	We9Qk/LJpmECINcev20MyfKsdfOoI52F9kmz/dUGjQ3w2lEeAlRrC45zQ163KhtE/jUeJyARJGvuA
	ew1Us8fujgD7Ib4os1Nj/uY5dCXMlMtZHYlDMTn8RAY557WcofSY+G76Rk+ANIyOfrZ/BWM6cBiT7
	tB3PZ+jw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdh-00000001zSm-3bDQ;
	Thu, 12 Mar 2026 20:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7349442A65;
	Thu, 12 Mar 2026 20:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CA5C2BC9E;
	Thu, 12 Mar 2026 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773347292;
	bh=GSvvK91SQuAGo90FmVnYDSWYlOSBV2oGchryB/VUxUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWsa4YCwUKUZ6NF6FYl+pCdBC1dxci2Ej9zB0JHhNByo+147eLDUQ5j+WO+JV3dDT
	 HPGMlhtmjp1vUY8qrJhcezjYyDbT6t8kN73X+N7ASnDu1Gs0XVXr5JIkNghq2FJSJq
	 fc0ghbJShYJ4L3gBRp0CQK4fCZfDK0VNeCKnfBCH7R80M78BVItR+Smim/TYIv3o/g
	 j55D8qFvvK06ryl48cViDm7kPX92qwyVcSOZ6lejCdYpmzI6mgUU2UnRDcSu1cKuug
	 ZzB2nNVwTFGi3cqApGKwXIWslumCVtZokUxr7PoiWbDx6tZD6MGmI2dCRDrE26/Mkn
	 qjzCQqiUkRaSg==
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
Subject: [PATCH 10/15] stm: replace deprecated mmap hook with mmap_prepare
Date: Thu, 12 Mar 2026 20:27:25 +0000
Message-ID: <671403f4278a7c77ecbb7617e0bc762536ce25da.1773346620.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773346620.git.ljs@kernel.org>
References: <cover.1773346620.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_202814_598895_0CDFC07B 
X-CRM114-Status: GOOD (  14.50  )
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

The f_op->mmap interface is deprecated, so update driver to use its
successor, mmap_prepare.

The driver previously used vm_iomap_memory(), so this change replaces it
with its mmap_prepare equivalent, mmap_action_simple_ioremap().

Also, in order to correctly maintain reference counting, add a
vm_ops->mapped callback to increment the reference count when successfully
mapped.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 drivers/hwtracing/stm/core.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 37584e786bb5..f48c6a8a0654 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -666,6 +666,16 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
 	return count;
 }
 
+static int stm_mmap_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
+			   const struct file *file, void **vm_private_data)
+{
+	struct stm_file *stmf = file->private_data;
+	struct stm_device *stm = stmf->stm;
+
+	pm_runtime_get_sync(&stm->dev);
+	return 0;
+}
+
 static void stm_mmap_open(struct vm_area_struct *vma)
 {
 	struct stm_file *stmf = vma->vm_file->private_data;
@@ -684,12 +694,14 @@ static void stm_mmap_close(struct vm_area_struct *vma)
 }
 
 static const struct vm_operations_struct stm_mmap_vmops = {
+	.mapped = stm_mmap_mapped,
 	.open	= stm_mmap_open,
 	.close	= stm_mmap_close,
 };
 
-static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
+static int stm_char_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *file = desc->file;
 	struct stm_file *stmf = file->private_data;
 	struct stm_device *stm = stmf->stm;
 	unsigned long size, phys;
@@ -697,10 +709,10 @@ static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!stm->data->mmio_addr)
 		return -EOPNOTSUPP;
 
-	if (vma->vm_pgoff)
+	if (desc->pgoff)
 		return -EINVAL;
 
-	size = vma->vm_end - vma->vm_start;
+	size = vma_desc_size(desc);
 
 	if (stmf->output.nr_chans * stm->data->sw_mmiosz != size)
 		return -EINVAL;
@@ -712,13 +724,12 @@ static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!phys)
 		return -EINVAL;
 
-	pm_runtime_get_sync(&stm->dev);
-
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
-	vma->vm_ops = &stm_mmap_vmops;
-	vm_iomap_memory(vma, phys, size);
+	desc->page_prot = pgprot_noncached(desc->page_prot);
+	vma_desc_set_flags(desc, VMA_IO_BIT, VMA_DONTEXPAND_BIT,
+			   VMA_DONTDUMP_BIT);
+	desc->vm_ops = &stm_mmap_vmops;
 
+	mmap_action_simple_ioremap(desc, phys, size);
 	return 0;
 }
 
@@ -836,7 +847,7 @@ static const struct file_operations stm_fops = {
 	.open		= stm_char_open,
 	.release	= stm_char_release,
 	.write		= stm_char_write,
-	.mmap		= stm_char_mmap,
+	.mmap_prepare	= stm_char_mmap_prepare,
 	.unlocked_ioctl	= stm_char_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 };
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
