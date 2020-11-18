Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF07C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F68220715
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZckExapX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F68220715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Khc59qupNLRjTZofVUtulM6/sKu4//8PLQz6rYEzQSE=; b=ZckExapXFR5vGHy0d5e5iyfd4
	h5EshwDzyujbXvq0ZeGBfTsO0sg3bEAeuvlOb9kXv65BSt0i7ctuxLEwaQIXlLliHdvJ51/HGnLEf
	zkcnRFJmy1dtM3HkzivTVjlLnAfsdMb7A35aFEIx87W034CLyCgcGwppudAWkuvCzKZI41RIK6b9u
	M16PmEiI2Vayl7MNf19rP4nMU2rabZsrzbX9BfjwFinLv6SHqzd6DZivcevg38u0K+yqVLh7xHeZ5
	5qjvdpnw9lgKGBN7DjcPWugLRa1hDA2mZg6a+KKaLOCoRHVnq1TBJRWrh3PY8PQ2tUXFlqY0y2914
	N13VOnbnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfV67-0003FH-82; Wed, 18 Nov 2020 21:34:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfV5u-00039J-HW
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 21:34:30 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF58DAFFD;
 Wed, 18 Nov 2020 21:34:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id BC1911E1321; Wed, 18 Nov 2020 15:22:37 +0100 (CET)
Date: Wed, 18 Nov 2020 15:22:37 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/20] block: change the hash used for looking up block
 devices
Message-ID: <20201118142237.GK1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-7-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_163426_995842_5D2010F5 
X-CRM114-Status: GOOD (  21.72  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed 18-11-20 09:47:46, Christoph Hellwig wrote:
> Adding the minor to the major creates tons of pointless conflicts. Just
> use the dev_t itself, which is 32-bits and thus is guaranteed to fit
> into ino_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Fair enough. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/block_dev.c | 26 ++------------------------
>  1 file changed, 2 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index d8664f5c1ff669..29db12c3bb501c 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -870,35 +870,12 @@ void __init bdev_cache_init(void)
>  	blockdev_superblock = bd_mnt->mnt_sb;   /* For writeback */
>  }
>  
> -/*
> - * Most likely _very_ bad one - but then it's hardly critical for small
> - * /dev and can be fixed when somebody will need really large one.
> - * Keep in mind that it will be fed through icache hash function too.
> - */
> -static inline unsigned long hash(dev_t dev)
> -{
> -	return MAJOR(dev)+MINOR(dev);
> -}
> -
> -static int bdev_test(struct inode *inode, void *data)
> -{
> -	return BDEV_I(inode)->bdev.bd_dev == *(dev_t *)data;
> -}
> -
> -static int bdev_set(struct inode *inode, void *data)
> -{
> -	BDEV_I(inode)->bdev.bd_dev = *(dev_t *)data;
> -	return 0;
> -}
> -
>  static struct block_device *bdget(dev_t dev)
>  {
>  	struct block_device *bdev;
>  	struct inode *inode;
>  
> -	inode = iget5_locked(blockdev_superblock, hash(dev),
> -			bdev_test, bdev_set, &dev);
> -
> +	inode = iget_locked(blockdev_superblock, dev);
>  	if (!inode)
>  		return NULL;
>  
> @@ -910,6 +887,7 @@ static struct block_device *bdget(dev_t dev)
>  		bdev->bd_super = NULL;
>  		bdev->bd_inode = inode;
>  		bdev->bd_part_count = 0;
> +		bdev->bd_dev = dev;
>  		inode->i_mode = S_IFBLK;
>  		inode->i_rdev = dev;
>  		inode->i_bdev = bdev;
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
