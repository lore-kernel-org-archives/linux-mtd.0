Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04579C3DA6E
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Dec 2023 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF22yKDrrdc+FQPWTsjbJI61eMzWCGxHnVfZcOzGjvo=; b=ZkdCM2bBY3Kbf+
	XBDH6OA4GK98WXuN0tvlQfY+tDA9CX1JQqmlsDCNUB0beO9sWAwy9lS+CsD1bxoyDId0HmkbIXZox
	UJo4XuOFxr9Ghlj6sADhe+vHYU4naPsRV0sgcPwxEM3hKj8TmYKsOVYGNFQGVu9eqG6xn9sLAgPCa
	dP62Q5QO6Ib0djKgldJk+8GWxGoY3eKk5wt+U/xjRzWghgAgfqntDQutq/7q/+DtIvj2FiCWNXHHZ
	PAbOWVjHcTE96kbP6T5ego+eWAIkiRL1GqsAiht33jg8BzxwMnJAgaSQ35Zq5yp3Eg/TQI+5xkNMD
	W9SODnph5W2Rk2k7kBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH5r8-008E90-1e;
	Sat, 23 Dec 2023 17:32:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH5r6-008E8i-12
	for linux-mtd@bombadil.infradead.org;
	Sat, 23 Dec 2023 17:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cxs7b1r/Fe+mA08T4R0mNQ1fxv7+YhK2lTuot6SaQik=; b=n5ecZBTziYZYMztlj2287d4czK
	ml7cm9aw1T+0iVgkbnWKxaTTXKBcb46wrTtLR2cpZ6JzPt87e/ZOk+YN+BcmHpGceFYQwbG6TCmUn
	2/VVFTmvky5olmxAfDG+0qZ8z+LPPpf8u70Ai7d5Slq1K484QQZDKCm7dBvsESdFibfIkn0wHOZFA
	dZJMlBYBjYa9hkvZpbAVrPS56AMkvhhCeNeu4AfGdy+6akR7Z9BIJQ6lfh3OOUC9V+pNhgGo/mfiK
	S401NuO0YUaMlRsvZHgjfMbObBG2ZmuSJGS1ljZCYKmYCBguSKNIaneuWlwbS7egy1SGKjDV3fGW4
	digukkoQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rH5qt-00BIro-7V; Sat, 23 Dec 2023 17:31:55 +0000
Date: Sat, 23 Dec 2023 17:31:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, jack@suse.com, konishi.ryusuke@gmail.com,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 09/17] btrfs: use bdev apis
Message-ID: <ZYcZi5YYvt5QHrG9@casper.infradead.org>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-10-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221085712.1766333-10-yukuai1@huaweicloud.com>
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

On Thu, Dec 21, 2023 at 04:57:04PM +0800, Yu Kuai wrote:
> @@ -3674,16 +3670,17 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
>  		 * Drop the page of the primary superblock, so later read will
>  		 * always read from the device.
>  		 */
> -		invalidate_inode_pages2_range(mapping,
> -				bytenr >> PAGE_SHIFT,
> +		invalidate_bdev_range(bdev, bytenr >> PAGE_SHIFT,
>  				(bytenr + BTRFS_SUPER_INFO_SIZE) >> PAGE_SHIFT);
>  	}
>  
> -	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
> -	if (IS_ERR(page))
> -		return ERR_CAST(page);
> +	nofs_flag = memalloc_nofs_save();
> +	folio = bdev_read_folio(bdev, bytenr);
> +	memalloc_nofs_restore(nofs_flag);

This is the wrong way to use memalloc_nofs_save/restore.  They should be
used at the point that the filesystem takes/releases whatever lock is
also used during reclaim.  I don't know btrfs well enough to suggest
what lock is missing these annotations.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
