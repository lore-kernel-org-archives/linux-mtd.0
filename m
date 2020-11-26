Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8314FC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:02:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382F321973
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGCME3UG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382F321973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pm3FUE5P020bFAEQkExCr37tWgPPud23dgPpgornUgc=; b=fGCME3UGlF7Atn9ASR9gDhGc6
	355OpfVWH6UU8cF2f3002phRHHFoD3As2zH8LnE11g6mETK4uilKEW6IOuqLw4DPokAhcXL89YTBm
	MlNBEVjEpJs/Z1LchTq0nA3Vlt1mU4d33xZKbHnKQ6fCiftr3htucVluuPMUt31iwmleFC1F9lEr5
	Yo+w5D8lX3pL6TwcpFk0JfTym369Y+irug6+jXEMxgD/Ql6vwTrzyLvCMXuiN3PtnK6wM1NK965Mo
	eXNrDbZwhiqMpBnTcIWlm25UnqqqI4wDfqNRPFibdYqmbwvZnI4m4DxLJajlfl0I2LhO6+f0RcTk/
	0HqYhItog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKeD-0004sl-00; Thu, 26 Nov 2020 17:01:33 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKeA-0004sE-NC
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 17:01:31 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8F99ACC4;
 Thu, 26 Nov 2020 17:01:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7DBAB1E10D0; Thu, 26 Nov 2020 18:01:29 +0100 (CET)
Date: Thu, 26 Nov 2020 18:01:29 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 34/44] block: move make_it_fail to struct block_device
Message-ID: <20201126170129.GT422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-35-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-35-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_120130_911899_DC964D2B 
X-CRM114-Status: GOOD (  22.44  )
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

On Thu 26-11-20 14:04:12, Christoph Hellwig wrote:
> Move the make_it_fail flag to struct block_device an turn it into a bool
> in preparation of killing struct hd_struct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/blk-core.c          | 3 ++-
>  block/genhd.c             | 4 ++--
>  include/linux/blk_types.h | 3 +++
>  include/linux/genhd.h     | 3 ---
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 9a3793d5ce38d4..9121390be97a76 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -668,7 +668,8 @@ __setup("fail_make_request=", setup_fail_make_request);
>  
>  static bool should_fail_request(struct hd_struct *part, unsigned int bytes)
>  {
> -	return part->make_it_fail && should_fail(&fail_make_request, bytes);
> +	return part->bdev->bd_make_it_fail &&
> +		should_fail(&fail_make_request, bytes);
>  }
>  
>  static int __init fail_make_request_debugfs(void)
> diff --git a/block/genhd.c b/block/genhd.c
> index a964e7532fedd5..0371558ccde14c 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1284,7 +1284,7 @@ ssize_t part_fail_show(struct device *dev,
>  {
>  	struct hd_struct *p = dev_to_part(dev);
>  
> -	return sprintf(buf, "%d\n", p->make_it_fail);
> +	return sprintf(buf, "%d\n", p->bdev->bd_make_it_fail);
>  }
>  
>  ssize_t part_fail_store(struct device *dev,
> @@ -1295,7 +1295,7 @@ ssize_t part_fail_store(struct device *dev,
>  	int i;
>  
>  	if (count > 0 && sscanf(buf, "%d", &i) > 0)
> -		p->make_it_fail = (i == 0) ? 0 : 1;
> +		p->pdev->bd_make_it_fail = (i == 0) ? 0 : 1;
>  
>  	return count;
>  }
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index c0591e52d7d7ce..b237f1e4081405 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -52,6 +52,9 @@ struct block_device {
>  	struct super_block	*bd_fsfreeze_sb;
>  
>  	struct partition_meta_info *bd_meta_info;
> +#ifdef CONFIG_FAIL_MAKE_REQUEST
> +	bool			bd_make_it_fail;
> +#endif
>  } __randomize_layout;
>  
>  #define bdev_whole(_bdev) \
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index b4a5c05593b99c..349cf6403ccddc 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -56,9 +56,6 @@ struct hd_struct {
>  	struct block_device *bdev;
>  	struct device __dev;
>  	int policy, partno;
> -#ifdef CONFIG_FAIL_MAKE_REQUEST
> -	int make_it_fail;
> -#endif
>  	struct rcu_work rcu_work;
>  };
>  
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
