Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933E3C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 06:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txz6t5qdQXpoP0Zm+aokgyCANS6Oi2kkGkOF3j9r80Y=; b=bYl5FRdSGmZ3iG
	bfE8DdMUh+whoCTDO07O9XF6mayTYJvl2Ki6z9QZRtevGG6CIgKCYjRlqLPc0TQk+09pAmAlJ6mK9
	W5XaE0ggVQgIND4pMGuK6Q8aSW+ZYu7k5NF8o+XRzInEfJHTL+JNKgYUCXmmL0f4VmZ8keMiFZTfD
	DWP+jSJKPkx+g9e6Sfc/ohEl0kS1HhaSf42u9FDTKNAsteDthOdvGOvzaMcZdjKH5VV/IDb1+3gSy
	5o2TxwiPmvZ3oZ1mMFiWzbLPAdrhWsAhAXTupaOpnCO6/v4UFahRL7ECt3Uv8BOM4HYxAQUx3eLvY
	wwHhkL+cb27W2kG/Jd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwNF-00ArVg-2T;
	Tue, 12 Dec 2023 06:36:09 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwNB-00ArUk-1L
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 06:36:08 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=50;SR=0;TI=SMTPD_---0VyLR3Ee_1702362952;
Received: from 30.97.49.22(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VyLR3Ee_1702362952)
          by smtp.aliyun-inc.com;
          Tue, 12 Dec 2023 14:35:54 +0800
Message-ID: <1812c1bf-08b5-46a5-a633-12470e2c8f18@linux.alibaba.com>
Date: Tue, 12 Dec 2023 14:35:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 for-6.8/block 11/18] erofs: use bdev api
To: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 p.raghav@samsung.com, hare@suse.de
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
 yi.zhang@huawei.com, yangerkun@huawei.com
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140722.974745-1-yukuai1@huaweicloud.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20231211140722.974745-1-yukuai1@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_223605_643123_E59990AE 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2023/12/11 22:07, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Avoid to access bd_inode directly, prepare to remove bd_inode from
> block_devcie.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   fs/erofs/data.c     | 18 ++++++++++++------
>   fs/erofs/internal.h |  2 ++
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index c98aeda8abb2..8cf3618190ab 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -32,8 +32,7 @@ void erofs_put_metabuf(struct erofs_buf *buf)
>   void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
>   		  enum erofs_kmap_type type)
>   {
> -	struct inode *inode = buf->inode;
> -	erofs_off_t offset = (erofs_off_t)blkaddr << inode->i_blkbits;
> +	erofs_off_t offset = (erofs_off_t)blkaddr << buf->blkszbits;
I'd suggest that use `buf->blkszbits` only for bdev_read_folio() since
erofs_init_metabuf() is not always called before erofs_bread() is used.

For example, buf->inode can be one of directory inodes other than
initialized by erofs_init_metabuf().

Thanks,
Gao Xiang


>   	pgoff_t index = offset >> PAGE_SHIFT;
>   	struct page *page = buf->page;
>   	struct folio *folio;
> @@ -43,7 +42,9 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
>   		erofs_put_metabuf(buf);
>   
>   		nofs_flag = memalloc_nofs_save();
> -		folio = read_cache_folio(inode->i_mapping, index, NULL, NULL);
> +		folio = buf->inode ?
> +			read_mapping_folio(buf->inode->i_mapping, index, NULL) :
> +			bdev_read_folio(buf->bdev, offset);
>   		memalloc_nofs_restore(nofs_flag);
>   		if (IS_ERR(folio))
>   			return folio;
> @@ -67,10 +68,15 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
>   
>   void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
>   {
> -	if (erofs_is_fscache_mode(sb))
> +	if (erofs_is_fscache_mode(sb)) {
>   		buf->inode = EROFS_SB(sb)->s_fscache->inode;
> -	else
> -		buf->inode = sb->s_bdev->bd_inode;
> +		buf->bdev = NULL;
> +		buf->blkszbits = buf->inode->i_blkbits;
> +	} else {
> +		buf->inode = NULL;
> +		buf->bdev = sb->s_bdev;
> +		buf->blkszbits = EROFS_SB(sb)->blkszbits;
> +	}
>   }
>   
>   void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index b0409badb017..c9206351b485 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -224,8 +224,10 @@ enum erofs_kmap_type {
>   
>   struct erofs_buf {
>   	struct inode *inode;
> +	struct block_device *bdev;
>   	struct page *page;
>   	void *base;
> +	u8 blkszbits;
>   	enum erofs_kmap_type kmap_type;
>   };
>   #define __EROFS_BUF_INITIALIZER	((struct erofs_buf){ .page = NULL })

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
