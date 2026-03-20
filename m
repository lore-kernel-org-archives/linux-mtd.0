Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457421099B35
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7JSPNQoA3B3mFGEovPaivQW73arWB05nUz4YCfR+xA=; b=jcduhSgrnoxcsF
	Vn9LSJynYX0fsR5U3bfrelcPE37Tmrdlw426EskvT3OLHYWNrGwnsrIBTzHZvau1dip8vV3ziYTRb
	mD1fzktybwxuclVURken1ur77aVZyvDpy28hsIGWct6UIrcvQkFQK9VQup9+f2y5nsWEE+DUuvPhk
	VXJeekS4Pwz1YlMJIDE/fxt4/+Vt/Uq975lh9p/wGKZSBI1Zkr8hyMEUYipDZ8Nn4Ja9k3L8ky97w
	Elp2bv/cNTL4gEdT+I/STSoxDIE0Wcv/ZLWs0wudAJkPDbofJhRjI5PVVimOm7G9VhJM6ne42Pt9+
	YULiBT2FG5+z0DZ3traw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3f2U-0000000DP3F-3pHj;
	Fri, 20 Mar 2026 18:57:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3f2T-0000000DP34-3BLr;
	Fri, 20 Mar 2026 18:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80C8060126;
	Fri, 20 Mar 2026 18:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C94C4CEF7;
	Fri, 20 Mar 2026 18:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774033060;
	bh=a8ys166E/M77dCSrucnKwE5heGp6aoVZbHs9H3pgrKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d1UmBx/KAU+ZajRc0Utu3iGMoA6qXkfpo2A3GmQu8VB00T2ciUsv0bUxBPTN6cpTm
	 m3xxfTtoFLkqoxFN2UkxrqdyEtIRum9BSaNPu6j+994kGaQQ67cuDJi2oDwvWgDmKh
	 6PWVHSUzCXkNdeUl6lKfFgj/jcJTsJl9L7GIzzLjsbklBRc7rOGYW4Fn923e39Uvvr
	 ttgPeY3wAum2TPoqAT48arege0caAn/E8yJkUN7Up2QA4ZleyQSJbDwORXj7psDga2
	 /GC2DRXLDgEDvmGPPLRO944+KOeHvwAeZxrk9FTglWfQhRpZGclw4Gn1hTFIShfbwA
	 AZE7RKjyLC7dQ==
Message-ID: <608ba54c-f19e-4e27-8142-0870f91d6514@kernel.org>
Date: Fri, 20 Mar 2026 19:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] fs: afs: correctly drop reference count on
 mapping failure
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
References: <cover.1773944114.git.ljs@kernel.org>
 <018cd0d8b2dae44de6d3952527e754e52ef02da8.1773944114.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <018cd0d8b2dae44de6d3952527e754e52ef02da8.1773944114.git.ljs@kernel.org>
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

On 3/19/26 19:23, Lorenzo Stoakes (Oracle) wrote:
> Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to
> .mmap_prepare()") updated AFS to use the mmap_prepare callback in favour
> of the deprecated mmap callback.
> 
> However, it did not account for the fact that mmap_prepare is called
> pre-merge, and may then be merged, nor that mmap_prepare can fail to map
> due to an out of memory error.

So that means a file can become pinned forever? OOM is probably only a
problem with fault injection in practice, but the merge case can happen. And
9d5403b1036c is pre-6.18 LTS. Are we going to need Fixes: and Cc: stable then?

> Both of those are cases in which we should not be incrementing a reference
> count.
> 
> With the newly added vm_ops->mapped callback available, we can simply
> defer this operation to that callback which is only invoked once the
> mapping is successfully in place (but not yet visible to userspace as the
> mmap and VMA write locks are held).
> 
> Therefore add afs_mapped() to implement this callback for AFS, and remove
> the code doing so in afs_mmap_prepare().
> 
> Also update afs_vm_open(), afs_vm_close() and afs_vm_map_pages() to be
> consistent in how the vnode is accessed.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  fs/afs/file.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index f609366fd2ac..85696ac984cc 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
>  static void afs_vm_open(struct vm_area_struct *area);
>  static void afs_vm_close(struct vm_area_struct *area);
>  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pgoff_t end_pgoff);
> +static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> +		      const struct file *file, void **vm_private_data);
>  
>  const struct file_operations afs_file_operations = {
>  	.open		= afs_open,
> @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_aops = {
>  };
>  
>  static const struct vm_operations_struct afs_vm_ops = {
> +	.mapped		= afs_mapped,
>  	.open		= afs_vm_open,
>  	.close		= afs_vm_close,
>  	.fault		= filemap_fault,
> @@ -494,32 +497,45 @@ static void afs_drop_open_mmap(struct afs_vnode *vnode)
>   */
>  static int afs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	struct afs_vnode *vnode = AFS_FS_I(file_inode(desc->file));
>  	int ret;
>  
> -	afs_add_open_mmap(vnode);
> -
>  	ret = generic_file_mmap_prepare(desc);
> -	if (ret == 0)
> -		desc->vm_ops = &afs_vm_ops;
> -	else
> -		afs_drop_open_mmap(vnode);
> +	if (ret)
> +		return ret;
> +
> +	desc->vm_ops = &afs_vm_ops;
>  	return ret;
>  }
>  
> +static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> +		      const struct file *file, void **vm_private_data)
> +{
> +	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
> +
> +	afs_add_open_mmap(vnode);
> +	return 0;
> +}
> +
>  static void afs_vm_open(struct vm_area_struct *vma)
>  {
> -	afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> +	struct file *file = vma->vm_file;
> +	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
> +
> +	afs_add_open_mmap(vnode);
>  }
>  
>  static void afs_vm_close(struct vm_area_struct *vma)
>  {
> -	afs_drop_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> +	struct file *file = vma->vm_file;
> +	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
> +
> +	afs_drop_open_mmap(vnode);
>  }
>  
>  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pgoff_t end_pgoff)
>  {
> -	struct afs_vnode *vnode = AFS_FS_I(file_inode(vmf->vma->vm_file));
> +	struct file *file = vmf->vma->vm_file;
> +	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
>  
>  	if (afs_check_validity(vnode))
>  		return filemap_map_pages(vmf, start_pgoff, end_pgoff);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
