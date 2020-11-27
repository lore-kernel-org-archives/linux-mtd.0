Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374CAC2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:54:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036B022243
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j+6Yi+EI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036B022243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TvCg6mtf2fBcP2UO9VSdPTzyk0/+0V7JbLyvf/a9COM=; b=j+6Yi+EIeuYjEpxpX/ak9WPXn
	cJWXD2mXc9r0fp+fLqOkdeFJZQ2/jaxe6mbAtUH+dU0G8bbyrLyotGznop9GvkqqycoUYv6ksdxP9
	1+tfTq3gxrKDtHAXrbpWhv3l2fBpCjPhbUYbFfJLeP3BVXjDqX2kJLbS/zKTEl1+Blp7GXaDcDbjy
	A7lrJs9T1fyt4NKEgjwV1sy1fV7nsfgTqGKs2VO00615LTmRz731R389r2VJCkDwqrU/0Iueq4T+N
	yKJ0aJC0IcgXy/Og9g25vb5976TThVPAGss6QlVGaFHKvGLLl7azfxjvCGEdpB1RBEk2HOVNbGipp
	xHMbNgsQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kidFy-0003Xe-Ac; Fri, 27 Nov 2020 12:53:46 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kidFv-0003WM-92
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 12:53:44 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E46AABD7;
 Fri, 27 Nov 2020 12:53:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8B3201E1318; Fri, 27 Nov 2020 13:53:41 +0100 (CET)
Date: Fri, 27 Nov 2020 13:53:41 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 41/44] block: switch disk_part_iter_* to use a struct
 block_device
Message-ID: <20201127125341.GD27162@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-42-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-42-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_075343_545904_3DF71E5C 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 26-11-20 14:04:19, Christoph Hellwig wrote:
> Switch the partition iter infrastructure to iterate over block_device
> references instead of hd_struct ones mostly used to get at the
> block_device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch mostly looks good. Two comments below.

> diff --git a/block/genhd.c b/block/genhd.c
> index 28299b24173be1..b58595f2ca33b1 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -233,7 +233,7 @@ EXPORT_SYMBOL_GPL(disk_part_iter_init);
>   * CONTEXT:
>   * Don't care.
>   */
> -struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
> +struct block_device *disk_part_iter_next(struct disk_part_iter *piter)
>  {
>  	struct disk_part_tbl *ptbl;
>  	int inc, end;

There's:

        /* put the last partition */
        disk_put_part(piter->part);
        piter->part = NULL;

at the beginning of disk_part_iter_next() which also needs switching to
bdput(), doesn't it?

> @@ -271,8 +271,7 @@ struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
>  		      piter->idx == 0))
>  			continue;
>  
> -		get_device(part_to_dev(part->bd_part));
> -		piter->part = part->bd_part;
> +		piter->part = bdgrab(part);

bdgrab() could return NULL if we are racing with delete_partition() so I
think we need to take care of that.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
