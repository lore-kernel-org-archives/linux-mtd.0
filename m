Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4999EC433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:08:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D1F206BE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCzhmJjX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D1F206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n3P8SCFN9GPsovyh3oxw9L8ZiaoR50fui+VEgttP+Hc=; b=jCzhmJjXzGCeSY4IZY7ZMQwiS
	PXMPkvERqftFVmw8SdpOzsVEVUbWITbx/luo6If++6xOBRWoE5pOymNEIAcF7i9rOksZcAWjEvgJE
	ag1bkesGXh3QnTUePbRv1hhIPeJofvMpRkXO9iDX+pJH0b8vb5HXn/INnwnFUjYGpDswoBcfQDJJU
	e1LxLsO1OoWlmqzF4HV4bWUVEeOTQVZOw3fTu/HnjJRx4DtsCrad6OsBjP5Sa+BcEmLCQyC7WduqF
	naGCIWSErtU+Y+r+LPH7LKZBYy3V7oq8L5KO1f2xHyIRpkNRxD2U6D3jP6RAd8keYcqAVmG3IxT4d
	tyTbrDdvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIpsX-0006td-QL; Thu, 17 Sep 2020 09:06:57 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIpsU-0006sX-Nj
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:06:55 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC534AE08;
 Thu, 17 Sep 2020 09:07:26 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D5C071E12E1; Thu, 17 Sep 2020 11:06:52 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:06:52 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/12] mm: use SWP_SYNCHRONOUS_IO more intelligently
Message-ID: <20200917090652.GB7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-10-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_050654_885126_67BAF990 
X-CRM114-Status: GOOD (  19.94  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:29, Christoph Hellwig wrote:
> There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> is not set, as the device won't support it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/page_io.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/page_io.c b/mm/page_io.c
> index e485a6e8a6cddb..b199b87e0aa92b 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -403,15 +403,17 @@ int swap_readpage(struct page *page, bool synchronous)
>  		goto out;
>  	}
>  
> -	ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> -	if (!ret) {
> -		if (trylock_page(page)) {
> -			swap_slot_free_notify(page);
> -			unlock_page(page);
> -		}
> +	if (sis->flags & SWP_SYNCHRONOUS_IO) {
> +		ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> +		if (!ret) {
> +			if (trylock_page(page)) {
> +				swap_slot_free_notify(page);
> +				unlock_page(page);
> +			}
>  
> -		count_vm_event(PSWPIN);
> -		goto out;
> +			count_vm_event(PSWPIN);
> +			goto out;
> +		}
>  	}
>  
>  	ret = 0;
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
