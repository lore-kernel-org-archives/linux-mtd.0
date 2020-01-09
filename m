Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC24EC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 13:35:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FAF1206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 13:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+nJWpiH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP854yG1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FAF1206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3sl1v1kcKDbj9il75qbIVMU7L8LFyRvQ3jPNYss92I=; b=Q+nJWpiHhw5QM8
	j/p0kyLIp8nt0Qb8brSMaw1z8tdxNJIP6ODyk3zNu5aL5aETtPl8QM23uELco7JOyrrdBWFHV8v8T
	PiMv4By4IM7F4mleiWaGXIr7kN6SKa8Ks8AmooTzQcPkXGVbNCSs2YNibP3JFPGCLxGBcmOp4d11s
	46zmb4gTOPz5W3TxBvMk/OxcMHJ7tqsv/FpCSYnJBq6if80nC/gQbCUHjlE8yla3LB1Zg6A2TSlz4
	JnvhoccLkBzu3y6g3L1QT4qMGBDJSkc5GUTxVnnkVxyKMoY4htLOkJoROPci2aeO68QWnTY+bsZAt
	O8q7SOe8PIRwoCOLbSXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipXxn-0002qB-NB; Thu, 09 Jan 2020 13:35:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipXxk-0002gX-6i
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 13:35:02 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E05F20661;
 Thu,  9 Jan 2020 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578576899;
 bh=B5yzemeRMvzL4pKKGwpH7BIBwVJZXFC+F4JbFhOpfek=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=FP854yG1iF6PZ3f6ByuN1p2Ck1GBxOzQ7bJVht0FIaYDlv1ZpMklxdzoRLjXc24xu
 yLKaBtnOxLxgrrHRlvX1FPMkTu5c2imI1AWkgiKt56QokkSQZHzV5fJTLYZBVp6zDp
 o7s2RWwZqfybKsBicS2CNXr6XgOrIP1D8y9ov0kg=
Message-ID: <03e0e79fefcd9e7985a5defce5d5833d3175847a.camel@kernel.org>
Subject: Re: [PATCH v4] fs: Fix page_mkwrite off-by-one errors
From: Jeff Layton <jlayton@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>, "Darrick J. Wong"
 <darrick.wong@oracle.com>
Date: Thu, 09 Jan 2020 08:34:56 -0500
In-Reply-To: <20200108131528.4279-1-agruenba@redhat.com>
References: <20200108131528.4279-1-agruenba@redhat.com>
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_053500_286817_12C7769F 
X-CRM114-Status: GOOD (  26.10  )
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
 Richard Weinberger <richard@nod.at>, YueHaibing <yuehaibing@huawei.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-01-08 at 14:15 +0100, Andreas Gruenbacher wrote:
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


You can add my Acked-by on the ceph part.

-- 
Jeff Layton <jlayton@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
