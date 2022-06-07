Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3DFC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=infsMWt+MQbN/fOm0N076cgte5r/012zEJp/nh5xwIU=; b=v+VdQk2dUwZxWY
	IHtppK447r+x6/DXthmgur27Rh1hwSBpQJLqb8RJgwXXPLAFtGQ+lhgcoY2Od89+nWJsnEsKSWEwZ
	RcwyuOzDXJ1InXrjNJrnF0YsgkIsCDuYmWg+Q6fGVYkAcr9MzGJlwXjgPMLOGl5K6fKa9PAviyMMp
	fOZ5bO6heBbe0UPV4tgHSsPqDs7/FYf0CGKDl6P6Amo2Ib9L27sQ/qtdvKXqSP2JzaxujRHc84NBq
	bKOpYmmXLz+m54ORLrIAX6069DWFKRSqhW8VXb5G85caS2sz0S48MXEWZnApvTysJb0tE7iNhPTeP
	hdxGOINubfVKq0CGSjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTm6-005Un7-2m; Tue, 07 Jun 2022 07:37:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTm3-005UjI-99
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 07:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654587426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poSLf3SQpSQVqGAvfY9ZUAc4mDsdNw09sPQoA12+Xn0=;
	b=Ei+tS59UADcqRz8t/v6zXFGm4EirBPntNruDT19yvMF9YHB0MHFhp3IEyb+cuD0A992nYg
	D39RQmqe/dt0C1JFN17d4H6Tw+rzmJJNiqBkd5Qr+Z2n5LKSvSi0fssMroXBAMVSEW6qnJ
	HECw1UpOfT6vHDEHvIqVFVk+w02e7rk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-evPXKXV5OnC4iFBq_tJw5w-1; Tue, 07 Jun 2022 03:36:25 -0400
X-MC-Unique: evPXKXV5OnC4iFBq_tJw5w-1
Received: by mail-wr1-f72.google.com with SMTP id o18-20020a5d4a92000000b00213b4eebc25so2930463wrq.21
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 00:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=poSLf3SQpSQVqGAvfY9ZUAc4mDsdNw09sPQoA12+Xn0=;
        b=tbi8WJoZ/VQ+X57IioZnFZhg9DKzn6M7s4FLQxolh/jSqp97Knd3ctMeVHRX3tyYhm
         v1RefKuLJ+2rFGhIGO/SYVyELbOFtvVe4fzot4Zp4aZCSu2uupDYTr8oFavzoJCnB0dz
         hyIPFC3Bsnos09olo8PNWPS8bqKxHoYwnUnHd5ANLQjXkYgicP1Qhfef179T2n9mnOeQ
         b1feG07aOx7V4wdz+W6W6umS/HW0Xir3tl4OLZN9UUAr22KRPmw8jxxFzwCNXto+7R2R
         /gjDDVeRoUqwTbFdwUCV/M3QeuesTyukCJC2wPXGIi3RnL2bixTePgHLb99fQq/FT3vv
         cOUw==
X-Gm-Message-State: AOAM532PKS79co9U0y0oGN0tUN48mqBWR2K2+DHsnpl+AjB/LwtVoVh+
	cnrW5/YgEVrf49/DrHHl8nUmXO3KO2seLC0QLbc9+Cda9NIT4mQP6M+Dlc6Mvn7T+w+pORsXiJO
	uq/Luy5ceg2Y5AD3VkI8gdkQUxw==
X-Received: by 2002:a05:600c:4ec9:b0:397:750a:798a with SMTP id g9-20020a05600c4ec900b00397750a798amr56010313wmq.169.1654587384018;
        Tue, 07 Jun 2022 00:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/TT1zDaD6ih4ST/0Z6l6/VJexv/LUjWrit9gRiSM2S633qB8aLjqIdjv8Hs+falCUt0H+YA==
X-Received: by 2002:a05:600c:4ec9:b0:397:750a:798a with SMTP id g9-20020a05600c4ec900b00397750a798amr56010293wmq.169.1654587383789;
        Tue, 07 Jun 2022 00:36:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f? (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de. [2003:cb:c709:500:4c8d:4886:f874:7b6f])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b0039c235fb6a5sm19943141wms.8.2022.06.07.00.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 00:36:22 -0700 (PDT)
Message-ID: <e4d017a4-556d-bb5f-9830-a8843591bc8d@redhat.com>
Date: Tue, 7 Jun 2022 09:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 15/20] balloon: Convert to migrate_folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 virtualization@lists.linux-foundation.org
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-16-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220606204050.2625949-16-willy@infradead.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_003711_462131_BCC849B2 
X-CRM114-Status: GOOD (  20.79  )
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

On 06.06.22 22:40, Matthew Wilcox (Oracle) wrote:
> This is little more than changing the types over; there's no real work
> being done in this function.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/balloon_compaction.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 4b8eab4b3f45..3f75b876ad76 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -230,11 +230,10 @@ static void balloon_page_putback(struct page *page)
>  
>  
>  /* move_to_new_page() counterpart for a ballooned page */
> -static int balloon_page_migrate(struct address_space *mapping,
> -		struct page *newpage, struct page *page,
> -		enum migrate_mode mode)
> +static int balloon_migrate_folio(struct address_space *mapping,
> +		struct folio *dst, struct folio *src, enum migrate_mode mode)
>  {
> -	struct balloon_dev_info *balloon = balloon_page_device(page);
> +	struct balloon_dev_info *balloon = balloon_page_device(&src->page);
>  
>  	/*
>  	 * We can not easily support the no copy case here so ignore it as it
> @@ -244,14 +243,14 @@ static int balloon_page_migrate(struct address_space *mapping,
>  	if (mode == MIGRATE_SYNC_NO_COPY)
>  		return -EINVAL;
>  
> -	VM_BUG_ON_PAGE(!PageLocked(page), page);
> -	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
> +	VM_BUG_ON_FOLIO(!folio_test_locked(src), src);
> +	VM_BUG_ON_FOLIO(!folio_test_locked(dst), dst);
>  
> -	return balloon->migratepage(balloon, newpage, page, mode);
> +	return balloon->migratepage(balloon, &dst->page, &src->page, mode);
>  }
>  
>  const struct address_space_operations balloon_aops = {
> -	.migratepage = balloon_page_migrate,
> +	.migrate_folio = balloon_migrate_folio,
>  	.isolate_page = balloon_page_isolate,
>  	.putback_page = balloon_page_putback,
>  };

I assume you're working on conversion of the other callbacks as well,
because otherwise, this ends up looking a bit inconsistent and confusing :)

Change LGTM.

-- 
Thanks,

David / dhildenb


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
