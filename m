Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA48C001CC
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JxVovPlr/zGpjOvBDZeI/HBXSI/4GLhqWKmW7aIcsE=; b=fQtZGWMyAJwEr5
	vKQrsiOFqr9h1+FTqz9gLEeMRH3zRAC2jM3Qj/7YRzBueoV/tzVk9zX+/u2eFIAU6XjXW1AB3Go88
	lLWuXu9GKAkWg19xadOku0s8Rvk6/wB90zI1w2RsDgFclniOLSZjuF96nMyTOJS8mYYvRM9Tjo3sG
	r2trUAs8Il0OQFeHIH/vKdyyjC+tYfd5ZIMxFaqAmJ7/ePyx0uVMxfxd+F3rH3NZL5RIE6LQJ2HNq
	9aj1hT0AJNqPNBse0gzdSTJ2lzstY41vUiBENI1FbXgQxfWhUUaPMUSFMKFxAWFoGT+HK1QIpTlpr
	/MjLRE0cbqKK475RF3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyYN-0000000DUb4-1KJe;
	Thu, 11 Apr 2024 17:49:39 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyYJ-0000000DUYf-2xT2
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 17:49:37 +0000
Date: Thu, 11 Apr 2024 13:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712857769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/TZdE1FK3O4qkESTbUB1nUL6z8CdzrLZmjris90VHw=;
	b=aI/Km0jiSMVL4A1tCs8hlsrV66vbuWxJKZ+EgkonCW2LmuJAGBaIivtgu4+3HhSKhbSBh3
	uS3+3l/YqK0GsHToDiJSOy8jQgouByPKNokiyLYxRwngjkex1lryU/nDL4TDH7+GmcHLtc
	35AcbG0Y+MpEd8VLadpzkGxeP5lZ1Bo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de, 
	kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, 
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.com, 
	konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org, hare@suse.de, 
	p.raghav@samsung.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org, yukuai3@huawei.com, 
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 07/17] bcachefs: remove dead
 function bdev_sectors()
Message-ID: <2pat6ombemqnq5wjl6eb4lbip2pfgg5tkubmbwqphvcvpdc6cu@poiexziaa2q4>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-8-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221085712.1766333-8-yukuai1@huaweicloud.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_104936_109796_56A710EF 
X-CRM114-Status: GOOD (  11.40  )
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

On Thu, Dec 21, 2023 at 04:57:02PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> bdev_sectors() is not used hence remove it.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>

> ---
>  fs/bcachefs/util.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/fs/bcachefs/util.h b/fs/bcachefs/util.h
> index 2984b57b2958..22a0acc1704f 100644
> --- a/fs/bcachefs/util.h
> +++ b/fs/bcachefs/util.h
> @@ -516,11 +516,6 @@ static inline unsigned fract_exp_two(unsigned x, unsigned fract_bits)
>  void bch2_bio_map(struct bio *bio, void *base, size_t);
>  int bch2_bio_alloc_pages(struct bio *, size_t, gfp_t);
>  
> -static inline sector_t bdev_sectors(struct block_device *bdev)
> -{
> -	return bdev->bd_inode->i_size >> 9;
> -}
> -
>  #define closure_bio_submit(bio, cl)					\
>  do {									\
>  	closure_get(cl);						\
> -- 
> 2.39.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
