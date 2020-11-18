Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47160C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6C720715
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zA2GH9AA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6C720715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x9sOe/HkG3gLZK0gTd7tyuv8XMalM/1fgI7Y0o7/ijQ=; b=zA2GH9AAqGz+jJPFzIrk8BLUa
	3c6t86eS3cyjOtR0V72HdM5VMG5A0NLFGC96XV+zUfpoVBbwIUUlumPfgEMgdUz1ScmJP9dZkemlm
	uoJ2yes9Su0mBxdTCq/uP0I2IHHQ93s2TTEn7jkLmtmy+FesUQiRjDY3PQM72uIDKaJsulItUgyGp
	ear4QjWkpqjJ8OuP8IzSITwQaAoXOqtQlGMpCWrstcX8GboQ7klH8eHMlK0ZcKyJS6znF7yXf9WLJ
	Wm2utQetBglTSWrMFroTFoWEo8PepaxvFYoWDrddV5/Fsp5DLNFjEh5kegGl+Diw/rDj05REgvylM
	UZqQ1WZsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfV6S-0003NB-Hc; Wed, 18 Nov 2020 21:35:00 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfV5w-0003B1-Si
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 21:34:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53C3FB019;
 Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 716231E1328; Wed, 18 Nov 2020 15:41:05 +0100 (CET)
Date: Wed, 18 Nov 2020 15:41:05 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/20] init: refactor devt_from_partuuid
Message-ID: <20201118144105.GM1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-9-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_163429_311869_C88BB6CC 
X-CRM114-Status: GOOD (  27.03  )
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

On Wed 18-11-20 09:47:48, Christoph Hellwig wrote:
> The code in devt_from_partuuid is very convoluted.  Refactor a bit by
> sanitizing the goto and variable name usage.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  init/do_mounts.c | 68 ++++++++++++++++++++++--------------------------
>  1 file changed, 31 insertions(+), 37 deletions(-)
> 
> diff --git a/init/do_mounts.c b/init/do_mounts.c
> index aef2f24461c7f1..afa26a4028d25e 100644
> --- a/init/do_mounts.c
> +++ b/init/do_mounts.c
> @@ -105,13 +105,10 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
>   */
>  static dev_t devt_from_partuuid(const char *uuid_str)
>  {
> -	dev_t res = 0;
>  	struct uuidcmp cmp;
>  	struct device *dev = NULL;
> -	struct gendisk *disk;
> -	struct hd_struct *part;
> +	dev_t devt = 0;
>  	int offset = 0;
> -	bool clear_root_wait = false;
>  	char *slash;
>  
>  	cmp.uuid = uuid_str;
> @@ -120,52 +117,49 @@ static dev_t devt_from_partuuid(const char *uuid_str)
>  	/* Check for optional partition number offset attributes. */
>  	if (slash) {
>  		char c = 0;
> +
>  		/* Explicitly fail on poor PARTUUID syntax. */
> -		if (sscanf(slash + 1,
> -			   "PARTNROFF=%d%c", &offset, &c) != 1) {
> -			clear_root_wait = true;
> -			goto done;
> -		}
> +		if (sscanf(slash + 1, "PARTNROFF=%d%c", &offset, &c) != 1)
> +			goto clear_root_wait;
>  		cmp.len = slash - uuid_str;
>  	} else {
>  		cmp.len = strlen(uuid_str);
>  	}
>  
> -	if (!cmp.len) {
> -		clear_root_wait = true;
> -		goto done;
> -	}
> +	if (!cmp.len)
> +		goto clear_root_wait;
>  
> -	dev = class_find_device(&block_class, NULL, &cmp,
> -				&match_dev_by_uuid);
> +	dev = class_find_device(&block_class, NULL, &cmp, &match_dev_by_uuid);
>  	if (!dev)
> -		goto done;
> -
> -	res = dev->devt;
> +		return 0;
>  
> -	/* Attempt to find the partition by offset. */
> -	if (!offset)
> -		goto no_offset;
> +	if (offset) {
> +		/*
> +		 * Attempt to find the requested partition by adding an offset
> +		 * to the partition number found by UUID.
> +		 */
> +		struct hd_struct *part;
>  
> -	res = 0;
> -	disk = part_to_disk(dev_to_part(dev));
> -	part = disk_get_part(disk, dev_to_part(dev)->partno + offset);
> -	if (part) {
> -		res = part_devt(part);
> -		put_device(part_to_dev(part));
> +		part = disk_get_part(dev_to_disk(dev),
> +				     dev_to_part(dev)->partno + offset);
> +		if (part) {
> +			devt = part_devt(part);
> +			put_device(part_to_dev(part));
> +		}
> +	} else {
> +		devt = dev->devt;
>  	}
>  
> -no_offset:
>  	put_device(dev);
> -done:
> -	if (clear_root_wait) {
> -		pr_err("VFS: PARTUUID= is invalid.\n"
> -		       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
> -		if (root_wait)
> -			pr_err("Disabling rootwait; root= is invalid.\n");
> -		root_wait = 0;
> -	}
> -	return res;
> +	return devt;
> +
> +clear_root_wait:
> +	pr_err("VFS: PARTUUID= is invalid.\n"
> +	       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
> +	if (root_wait)
> +		pr_err("Disabling rootwait; root= is invalid.\n");
> +	root_wait = 0;
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
