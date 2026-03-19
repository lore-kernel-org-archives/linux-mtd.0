Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CEF1091910
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JU4Xl2RO71iK41Cc4q+INMkGm5tYpuWf99vMoSmSGE=; b=dCVSl3MIw9vKYq
	W/eYSM0DhuDLOSET+bH6sVyTxK7OrKsr/z7EnB5AAcEebrdqls6/9ghUN8iKjTfTkqj7gJFTkcZBp
	2Aznk3MgzIgFNLVa01GS6QOctVh8hDcaKXXHqxe4FOXVdyMpqqZ3wpIDQ0Oo3TRbhLv+dW0zPpjMa
	rg6C/rjn2N0UR8RYgMxFhERwLaBEcMJ/YD2AZGafNmdvuSd84f31TD32fRihwoguh3orHIHNePfxj
	t0SSgQK5EW0l7FDaXOhRaRp5QhpydxctkVMdX3M4qTLgXiUqSd4TmUgW9oEIs65nXfcOoZ2V/286q
	/VbcgkowIQa8X7ZYmqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2t-0000000BJUH-3tFD;
	Thu, 19 Mar 2026 18:24:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2c-0000000BJ03-0WqE;
	Thu, 19 Mar 2026 18:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E8C560133;
	Thu, 19 Mar 2026 18:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87533C19425;
	Thu, 19 Mar 2026 18:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773944657;
	bh=rywd1FEi1wWV4fl3gPPvz3vegyh8dDCmAT13xfhNCIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s/SWFDPp/Ts84cvlaB/Qi1k/S8R+UEuypLUXJ0pIsRslBHhIoc6LyLx6zxeNTpGS2
	 4ez9z6YZdGfCdOHupwQoaziazOmdTwigKVq/6YcauP6xT/Wj2J+lJwnObayLwG/o4p
	 rVpBZsjYL6tjg1BmOwnwNu8eEfK437IBH5lV48arSRDnYHpuCl4p6iyGR4ltslA5Rx
	 32jfbLjVhpZvAVN/CDpGJO+OS+cQHyxm6mAxeuKW/e4ybdlsSn4aZg6b8dnZqpfcbE
	 N76icg80NqYJ3h+Amv1KNS0CrsngojkcjXpTqj50aPg3wyO8dpU3fX0lf6UpR8FVyp
	 fmy0xg50AD3/Q==
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
Subject: [PATCH v3 11/16] staging: vme_user: replace deprecated mmap hook with mmap_prepare
Date: Thu, 19 Mar 2026 18:23:35 +0000
Message-ID: <3cd88c01d1bc8179e98c41c4da0f190d3300b86a.1773944114.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773944114.git.ljs@kernel.org>
References: <cover.1773944114.git.ljs@kernel.org>
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

The f_op->mmap interface is deprecated, so update driver to use its
successor, mmap_prepare.

The driver previously used vm_iomap_memory(), so this change replaces it
with its mmap_prepare equivalent, mmap_action_simple_ioremap().

Functions that wrap mmap() are also converted to wrap mmap_prepare()
instead.

Also update the documentation accordingly.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 Documentation/driver-api/vme.rst    |  2 +-
 drivers/staging/vme_user/vme.c      | 20 +++++------
 drivers/staging/vme_user/vme.h      |  2 +-
 drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++------------
 4 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/Documentation/driver-api/vme.rst b/Documentation/driver-api/vme.rst
index c0b475369de0..7111999abc14 100644
--- a/Documentation/driver-api/vme.rst
+++ b/Documentation/driver-api/vme.rst
@@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be used to read from and
 
 In addition to simple reads and writes, :c:func:`vme_master_rmw` is provided to
 do a read-modify-write transaction. Parts of a VME window can also be mapped
-into user space memory using :c:func:`vme_master_mmap`.
+into user space memory using :c:func:`vme_master_mmap_prepare`.
 
 
 Slave windows
diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index f10a00c05f12..7220aba7b919 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask,
 EXPORT_SYMBOL(vme_master_rmw);
 
 /**
- * vme_master_mmap - Mmap region of VME master window.
+ * vme_master_mmap_prepare - Mmap region of VME master window.
  * @resource: Pointer to VME master resource.
- * @vma: Pointer to definition of user mapping.
+ * @desc: Pointer to descriptor of user mapping.
  *
  * Memory map a region of the VME master window into user space.
  *
@@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
  *         resource or -EFAULT if map exceeds window size. Other generic mmap
  *         errors may also be returned.
  */
-int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma)
+int vme_master_mmap_prepare(struct vme_resource *resource,
+			    struct vm_area_desc *desc)
 {
+	const unsigned long vma_size = vma_desc_size(desc);
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
 	phys_addr_t phys_addr;
-	unsigned long vma_size;
 
 	if (resource->type != VME_MASTER) {
 		dev_err(bridge->parent, "Not a master resource\n");
@@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma)
 	}
 
 	image = list_entry(resource->entry, struct vme_master_resource, list);
-	phys_addr = image->bus_resource.start + (vma->vm_pgoff << PAGE_SHIFT);
-	vma_size = vma->vm_end - vma->vm_start;
+	phys_addr = image->bus_resource.start + (desc->pgoff << PAGE_SHIFT);
 
 	if (phys_addr + vma_size > image->bus_resource.end + 1) {
 		dev_err(bridge->parent, "Map size cannot exceed the window size\n");
 		return -EFAULT;
 	}
 
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-
-	return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma->vm_start);
+	desc->page_prot = pgprot_noncached(desc->page_prot);
+	mmap_action_simple_ioremap(desc, phys_addr, vma_size);
+	return 0;
 }
-EXPORT_SYMBOL(vme_master_mmap);
+EXPORT_SYMBOL(vme_master_mmap_prepare);
 
 /**
  * vme_master_free - Free VME master window
diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 797e9940fdd1..b6413605ea49 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 ssize_t vme_master_write(struct vme_resource *resource, void *buf, size_t count, loff_t offset);
 unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask, unsigned int compare,
 			    unsigned int swap, loff_t offset);
-int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma);
+int vme_master_mmap_prepare(struct vme_resource *resource, struct vm_area_desc *desc);
 void vme_master_free(struct vme_resource *resource);
 
 struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route);
diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index d95dd7d9190a..11e25c2f6b0a 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_area_struct *vma)
 	kfree(vma_priv);
 }
 
-static const struct vm_operations_struct vme_user_vm_ops = {
-	.open = vme_user_vm_open,
-	.close = vme_user_vm_close,
-};
-
-static int vme_user_master_mmap(unsigned int minor, struct vm_area_struct *vma)
+static int vme_user_vm_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
+			      const struct file *file, void **vm_private_data)
 {
-	int err;
+	const unsigned int minor = iminor(file_inode(file));
 	struct vme_user_vma_priv *vma_priv;
 
 	mutex_lock(&image[minor].mutex);
 
-	err = vme_master_mmap(image[minor].resource, vma);
-	if (err) {
-		mutex_unlock(&image[minor].mutex);
-		return err;
-	}
-
 	vma_priv = kmalloc_obj(*vma_priv);
 	if (!vma_priv) {
 		mutex_unlock(&image[minor].mutex);
@@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned int minor, struct vm_area_struct *vma)
 
 	vma_priv->minor = minor;
 	refcount_set(&vma_priv->refcnt, 1);
-	vma->vm_ops = &vme_user_vm_ops;
-	vma->vm_private_data = vma_priv;
-
+	*vm_private_data = vma_priv;
 	image[minor].mmap_count++;
 
 	mutex_unlock(&image[minor].mutex);
-
 	return 0;
 }
 
-static int vme_user_mmap(struct file *file, struct vm_area_struct *vma)
+static const struct vm_operations_struct vme_user_vm_ops = {
+	.mapped = vme_user_vm_mapped,
+	.open = vme_user_vm_open,
+	.close = vme_user_vm_close,
+};
+
+static int vme_user_master_mmap_prepare(unsigned int minor,
+					struct vm_area_desc *desc)
+{
+	int err;
+
+	mutex_lock(&image[minor].mutex);
+
+	err = vme_master_mmap_prepare(image[minor].resource, desc);
+	if (!err)
+		desc->vm_ops = &vme_user_vm_ops;
+
+	mutex_unlock(&image[minor].mutex);
+	return err;
+}
+
+static int vme_user_mmap_prepare(struct vm_area_desc *desc)
 {
-	unsigned int minor = iminor(file_inode(file));
+	const struct file *file = desc->file;
+	const unsigned int minor = iminor(file_inode(file));
 
 	if (type[minor] == MASTER_MINOR)
-		return vme_user_master_mmap(minor, vma);
+		return vme_user_master_mmap_prepare(minor, desc);
 
 	return -ENODEV;
 }
@@ -498,7 +507,7 @@ static const struct file_operations vme_user_fops = {
 	.llseek = vme_user_llseek,
 	.unlocked_ioctl = vme_user_unlocked_ioctl,
 	.compat_ioctl = compat_ptr_ioctl,
-	.mmap = vme_user_mmap,
+	.mmap_prepare = vme_user_mmap_prepare,
 };
 
 static int vme_user_match(struct vme_dev *vdev)
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
