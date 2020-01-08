Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA22C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 22:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A87206DB
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 22:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DKUH0VJD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5NdnaWa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3A87206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnyLx+ee+IgDWuS9pdAdFscUSVYftexA2WWKxv4Bt+k=; b=DKUH0VJDU7+QKE
	LtRrNDNiH6T2sXzOhECDUuUlXE9zGa46GzdW24EOynQq48yPz+0sN/LzpyJ7zP3/0O/sho6pjZrCS
	4dULeCCdvWMWQo9s5gHzC/Ww3sRjnlumJXmIK0LbQDR2Fv2DDozYK3OQfaCTujO9o9iAlaP2w3wvN
	usNzAH72HFpT/kGZJDdq3WmGXVmUb7afVlvSbKThfGYz/AK5LiZ1Qh5akLORZlElW4x/uf7NLxDjC
	TmbVHN3mAl+soXhLYvr9kNPSs+Ia0iUqy4Gsy2fZ/OLIb4pl+RiKMDwYByGn0zOCk9Q3Qdx5FfZI2
	KeRqo7X8rT81P/iC2ySw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipK2U-0005J0-CI; Wed, 08 Jan 2020 22:42:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipK2R-0005IX-4h
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 22:42:57 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A6DA2053B;
 Wed,  8 Jan 2020 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578523374;
 bh=o+EBZqF4Q3rb3rJsaguToktWL8ixzhk3Cs0X6JHnuWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k5NdnaWaKTe+ShsNn7Avicpv6kmAudgSdjCCCkHc8JkJ93E1FGAoiqJTJv9Gt2b7h
 K86oj/gBeyC8BzLIZWCfEwzTczvjm+Q6NtHwDbaI/4l6BETeoUDyqXGraok+juAheo
 k9q1huD97Dyfqg5/bZhKEna9PZ9KqS6dlvuuDgUI=
Date: Wed, 8 Jan 2020 14:42:53 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH v4] fs: Fix page_mkwrite off-by-one errors
Message-ID: <20200108224253.GA42219@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200108131528.4279-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108131528.4279-1-agruenba@redhat.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_144255_227810_C06DB4C4 
X-CRM114-Status: GOOD (  31.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, Chao Yu <yuchao0@huawei.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, YueHaibing <yuehaibing@huawei.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 ceph-devel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/08, Andreas Gruenbacher wrote:
> Hi Darrick,
> 
> here's an updated version with the latest feedback incorporated.  Hope
> you find that useful.
> 
> As far as the f2fs merge conflict goes, I've been told by Linus not to
> resolve those kinds of conflicts but to point them out when sending the
> merge request.  So this shouldn't be a big deal.
> 
> Changes:
> 
> * Turn page_mkwrite_check_truncate into a non-inline function.
> * Get rid of now-unused mapping variable in ext4_page_mkwrite.
> * In btrfs_page_mkwrite, don't ignore the return value of
>   block_page_mkwrite_return (no change in behavior).
> * Clean up the f2fs_vm_page_mkwrite changes as suggested by
>   Jaegeuk Kim.
> 
> Thanks,
> Andreas
> 
> --
> 
> The check in block_page_mkwrite that is meant to determine whether an
> offset is within the inode size is off by one.  This bug has been copied
> into iomap_page_mkwrite and several filesystems (ubifs, ext4, f2fs,
> ceph).
> 
> Fix that by introducing a new page_mkwrite_check_truncate helper that
> checks for truncate and computes the bytes in the page up to EOF.  Use
> the helper in the above mentioned filesystems.
> 
> In addition, use the new helper in btrfs as well.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Acked-by: David Sterba <dsterba@suse.com> (btrfs)
> Acked-by: Richard Weinberger <richard@nod.at> (ubifs)
> Acked-by: Theodore Ts'o <tytso@mit.edu> (ext4)
> Acked-by: Chao Yu <yuchao0@huawei.com> (f2fs)

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/btrfs/inode.c        | 16 +++++-----------
>  fs/buffer.c             | 16 +++-------------
>  fs/ceph/addr.c          |  2 +-
>  fs/ext4/inode.c         | 15 ++++-----------
>  fs/f2fs/file.c          | 19 +++++++------------
>  fs/iomap/buffered-io.c  | 18 +++++-------------
>  fs/ubifs/file.c         |  3 +--
>  include/linux/pagemap.h |  2 ++
>  mm/filemap.c            | 28 ++++++++++++++++++++++++++++
>  9 files changed, 56 insertions(+), 63 deletions(-)
> 
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index e3c76645cad7..23e6f614e000 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -9011,16 +9011,15 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
>  		goto out_noreserve;
>  	}
>  
> -	ret = VM_FAULT_NOPAGE; /* make the VM retry the fault */
>  again:
>  	lock_page(page);
> -	size = i_size_read(inode);
>  
> -	if ((page->mapping != inode->i_mapping) ||
> -	    (page_start >= size)) {
> -		/* page got truncated out from underneath us */
> +	ret2 = page_mkwrite_check_truncate(page, inode);
> +	if (ret2 < 0) {
> +		ret = block_page_mkwrite_return(ret2);
>  		goto out_unlock;
>  	}
> +	zero_start = ret2;
>  	wait_on_page_writeback(page);
>  
>  	lock_extent_bits(io_tree, page_start, page_end, &cached_state);
> @@ -9041,6 +9040,7 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
>  		goto again;
>  	}
>  
> +	size = i_size_read(inode);
>  	if (page->index == ((size - 1) >> PAGE_SHIFT)) {
>  		reserved_space = round_up(size - page_start,
>  					  fs_info->sectorsize);
> @@ -9073,12 +9073,6 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
>  	}
>  	ret2 = 0;
>  
> -	/* page is wholly or partially inside EOF */
> -	if (page_start + PAGE_SIZE > size)
> -		zero_start = offset_in_page(size);
> -	else
> -		zero_start = PAGE_SIZE;
> -
>  	if (zero_start != PAGE_SIZE) {
>  		kaddr = kmap(page);
>  		memset(kaddr + zero_start, 0, PAGE_SIZE - zero_start);
> diff --git a/fs/buffer.c b/fs/buffer.c
> index d8c7242426bb..53aabde57ca7 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2499,23 +2499,13 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
>  	struct page *page = vmf->page;
>  	struct inode *inode = file_inode(vma->vm_file);
>  	unsigned long end;
> -	loff_t size;
>  	int ret;
>  
>  	lock_page(page);
> -	size = i_size_read(inode);
> -	if ((page->mapping != inode->i_mapping) ||
> -	    (page_offset(page) > size)) {
> -		/* We overload EFAULT to mean page got truncated */
> -		ret = -EFAULT;
> +	ret = page_mkwrite_check_truncate(page, inode);
> +	if (ret < 0)
>  		goto out_unlock;
> -	}
> -
> -	/* page is wholly or partially inside EOF */
> -	if (((page->index + 1) << PAGE_SHIFT) > size)
> -		end = size & ~PAGE_MASK;
> -	else
> -		end = PAGE_SIZE;
> +	end = ret;
>  
>  	ret = __block_write_begin(page, 0, end, get_block);
>  	if (!ret)
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 7ab616601141..ef958aa4adb4 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1575,7 +1575,7 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
>  	do {
>  		lock_page(page);
>  
> -		if ((off > size) || (page->mapping != inode->i_mapping)) {
> +		if (page_mkwrite_check_truncate(page, inode) < 0) {
>  			unlock_page(page);
>  			ret = VM_FAULT_NOPAGE;
>  			break;
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 629a25d999f0..3244803df30a 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -5871,13 +5871,11 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct page *page = vmf->page;
> -	loff_t size;
>  	unsigned long len;
>  	int err;
>  	vm_fault_t ret;
>  	struct file *file = vma->vm_file;
>  	struct inode *inode = file_inode(file);
> -	struct address_space *mapping = inode->i_mapping;
>  	handle_t *handle;
>  	get_block_t *get_block;
>  	int retries = 0;
> @@ -5907,18 +5905,13 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
>  	}
>  
>  	lock_page(page);
> -	size = i_size_read(inode);
> -	/* Page got truncated from under us? */
> -	if (page->mapping != mapping || page_offset(page) > size) {
> +	err = page_mkwrite_check_truncate(page, inode);
> +	if (err < 0) {
>  		unlock_page(page);
> -		ret = VM_FAULT_NOPAGE;
> -		goto out;
> +		goto out_ret;
>  	}
> +	len = err;
>  
> -	if (page->index == size >> PAGE_SHIFT)
> -		len = size & ~PAGE_MASK;
> -	else
> -		len = PAGE_SIZE;
>  	/*
>  	 * Return if we have all the buffers mapped. This avoids the need to do
>  	 * journal_start/journal_stop which can block and take a long time
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 85af112e868d..c2d919210a26 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -51,7 +51,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct dnode_of_data dn = { .node_changed = false };
> -	int err;
> +	int offset, err;
>  
>  	if (unlikely(f2fs_cp_error(sbi))) {
>  		err = -EIO;
> @@ -70,11 +70,12 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	file_update_time(vmf->vma->vm_file);
>  	down_read(&F2FS_I(inode)->i_mmap_sem);
>  	lock_page(page);
> -	if (unlikely(page->mapping != inode->i_mapping ||
> -			page_offset(page) > i_size_read(inode) ||
> -			!PageUptodate(page))) {
> +	offset = -EFAULT;
> +	if (likely(PageUptodate(page)))
> +		offset = page_mkwrite_check_truncate(page, inode);
> +	if (unlikely(offset < 0)) {
>  		unlock_page(page);
> -		err = -EFAULT;
> +		err = offset;
>  		goto out_sem;
>  	}
>  
> @@ -101,14 +102,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	if (PageMappedToDisk(page))
>  		goto out_sem;
>  
> -	/* page is wholly or partially inside EOF */
> -	if (((loff_t)(page->index + 1) << PAGE_SHIFT) >
> -						i_size_read(inode)) {
> -		loff_t offset;
> -
> -		offset = i_size_read(inode) & ~PAGE_MASK;
> +	if (offset != PAGE_SIZE)
>  		zero_user_segment(page, offset, PAGE_SIZE);
> -	}
>  	set_page_dirty(page);
>  	if (!PageUptodate(page))
>  		SetPageUptodate(page);
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 828444e14d09..7c84c4c027c4 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1077,24 +1077,16 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
>  	struct page *page = vmf->page;
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	unsigned long length;
> -	loff_t offset, size;
> +	loff_t offset;
>  	ssize_t ret;
>  
>  	lock_page(page);
> -	size = i_size_read(inode);
> -	offset = page_offset(page);
> -	if (page->mapping != inode->i_mapping || offset > size) {
> -		/* We overload EFAULT to mean page got truncated */
> -		ret = -EFAULT;
> +	ret = page_mkwrite_check_truncate(page, inode);
> +	if (ret < 0)
>  		goto out_unlock;
> -	}
> -
> -	/* page is wholly or partially inside EOF */
> -	if (offset > size - PAGE_SIZE)
> -		length = offset_in_page(size);
> -	else
> -		length = PAGE_SIZE;
> +	length = ret;
>  
> +	offset = page_offset(page);
>  	while (length > 0) {
>  		ret = iomap_apply(inode, offset, length,
>  				IOMAP_WRITE | IOMAP_FAULT, ops, page,
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index cd52585c8f4f..91f7a1f2db0d 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1563,8 +1563,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
>  	}
>  
>  	lock_page(page);
> -	if (unlikely(page->mapping != inode->i_mapping ||
> -		     page_offset(page) > i_size_read(inode))) {
> +	if (unlikely(page_mkwrite_check_truncate(page, inode) < 0)) {
>  		/* Page got truncated out from underneath us */
>  		goto sigbus;
>  	}
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 37a4d9e32cd3..6c9c5b88924d 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -636,4 +636,6 @@ static inline unsigned long dir_pages(struct inode *inode)
>  			       PAGE_SHIFT;
>  }
>  
> +int page_mkwrite_check_truncate(struct page *page, struct inode *inode);
> +
>  #endif /* _LINUX_PAGEMAP_H */
> diff --git a/mm/filemap.c b/mm/filemap.c
> index bf6aa30be58d..d3e2766216e3 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2700,6 +2700,34 @@ const struct vm_operations_struct generic_file_vm_ops = {
>  	.page_mkwrite	= filemap_page_mkwrite,
>  };
>  
> +/**
> + * page_mkwrite_check_truncate - check if page was truncated
> + * @page: the page to check
> + * @inode: the inode to check the page against
> + *
> + * Returns the number of bytes in the page up to EOF,
> + * or -EFAULT if the page was truncated.
> + */
> +int page_mkwrite_check_truncate(struct page *page, struct inode *inode)
> +{
> +	loff_t size = i_size_read(inode);
> +	pgoff_t index = size >> PAGE_SHIFT;
> +	int offset = offset_in_page(size);
> +
> +	if (page->mapping != inode->i_mapping)
> +		return -EFAULT;
> +
> +	/* page is wholly inside EOF */
> +	if (page->index < index)
> +		return PAGE_SIZE;
> +	/* page is wholly past EOF */
> +	if (page->index > index || !offset)
> +		return -EFAULT;
> +	/* page is partially inside EOF */
> +	return offset;
> +}
> +EXPORT_SYMBOL(page_mkwrite_check_truncate);
> +
>  /* This is used for a general mmap of a disk file */
>  
>  int generic_file_mmap(struct file * file, struct vm_area_struct * vma)
> -- 
> 2.20.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
