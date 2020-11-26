Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B77AC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:57:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC88F221EB
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="boRKUu3l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC88F221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T5l6GSMa0VEbeNnGrL+NbCoLMHAnSwHLWItzMBkZmUU=; b=boRKUu3loXnT/b9o0tfHz8x24
	MgIfAHM5BDHHjMiqRfd1WaKp6M9sYLHp5vx/VdlLyz2cZ1eVHm1Bjl/HITulaqMAEau+ht39o6raV
	uHx3ZW7ytbJMxxBcZmlTWhVEBjW+l4dImmYHruQRyjoRVL4+PPa8CEhRaK5CsXgnfc0FJ0WDoKgit
	YaC5MbrHTRS/xO0cIMC3Yys7tiTj5eCDhXcaFwbrFqHHkQcoXidjCUNcANT6LyttiDZaa5KvCUNfR
	DWCSzjw0/JAnQZtpvviDXHCddxDOylL4nFsXP7TKu0TiLO98e6fjfUJ0KinMEmnollSZKZpQPUQqA
	mEsGGD2YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKZZ-0003zz-Fu; Thu, 26 Nov 2020 16:56:45 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKZX-0003z9-1L
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 16:56:43 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00CC4AD20;
 Thu, 26 Nov 2020 16:56:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 841961E10D0; Thu, 26 Nov 2020 17:56:41 +0100 (CET)
Date: Thu, 26 Nov 2020 17:56:41 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 31/44] block: move the start_sect field to struct
 block_device
Message-ID: <20201126165641.GQ422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-32-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-32-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_115643_239345_813B83C9 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu 26-11-20 14:04:09, Christoph Hellwig wrote:
> Move the start_sect field to struct block_device in preparation
> of killing struct hd_struct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good, just one nit below. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index 8924e1ea8b2ad6..485777cea26bfa 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -192,7 +192,7 @@ static ssize_t part_start_show(struct device *dev,
>  {
>  	struct hd_struct *p = dev_to_part(dev);
>  
> -	return sprintf(buf, "%llu\n",(unsigned long long)p->start_sect);
> +	return sprintf(buf, "%llu\n",(unsigned long long)p->bdev->bd_start_sect);

The long long conversion is pointless here, right?

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
