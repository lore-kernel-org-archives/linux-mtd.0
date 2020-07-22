Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C81C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 16:28:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B712065F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 16:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MNASOJw3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ra98AzIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B712065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jp32x5Zf8IYmrZWyslu+WqmpI3D7RItxBU782z+FkZg=; b=MNASOJw3CKqCpoNBEu9DvPQLM
	0g6PuJgQkI1EcDnuOLJ2KcoBPrPf/qPnx7eCHM6fB5TMQoyIXNFaKJWP0GxdzkkJcylE4E9PUwrqR
	+hgkJtBzqhZMJHwQISMRHRDwyn7ctN+6ec92ADVIoE7f9eIOIzatnJn0j/eRNgNztoZ99NsSy3Vx4
	0YMLjnRJ8sdFYwwepFsc89mal4q8r/fm+0UoBEZXQfS8HI7f5Xs52ZwHxYl80bPeNNvhYXrOdHaQQ
	OXHnKu4GOQSTuILz8uTV5mQW1hnNEz0sS0Z9uatW9ZNZ+cNsJwlJDfdG5ZI8YUQve7wpKrRbpS1RF
	St6HMqirg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyHaA-000834-69; Wed, 22 Jul 2020 16:27:02 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyHa7-00081x-UH
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 16:27:00 +0000
Received: by mail-il1-x144.google.com with SMTP id t27so1804594ill.9
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2020 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2kHXQvVGBuGkaVHirVH2ldXpqiigd2kMJlKCki7PqMg=;
 b=ra98AzIYvVtLIKFmQ0582LpmVzZLDFtXPiDLxSIB7SoDAYKfzHUmecVZxZuP/M6Pvb
 fDufO1C+Q4FiAbYniw6ePsXq6IniiF94IvlcqmWtmSWtqcN5EqOCbg+nsxHw7v2/BzpD
 yqdQ4eKGDs88B1pTQ+/lVZ3atNYajhFCrKFlxc6iGCv2w9U5QibkcB5fjdiaYFspwg/7
 DUAeDu27aJnyG2kaxKFRHFuV9pRJvCocGy9/pSs9I4O2w31H+artkiu+wABWqj20BtFU
 4mfkDrAHear+tV6pm6mm5Q1TEtNXZAq/Blh918qa8SfTMXEI9nUlQIkjpdOHfrsto+Ju
 hfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2kHXQvVGBuGkaVHirVH2ldXpqiigd2kMJlKCki7PqMg=;
 b=MlcVfniMnO8tjd7LcfuXrYCtR2a3hvaIejePfAuC2weNU+lyanK6qPSFxrofAIYECD
 5Aniuo0xA5yfrQE04IjFf/LsbWYwfVrABBAAr/D/5rxjhM/P/VThK50w44G5v5BUG6fY
 XQMboxDLLy7oiguNeK41C+MxtosStHbEHetLJRJKdxGcoCKZUmvjI81WIW4HlpCdTqzb
 obsBjlNa51be2xBQIidxjfoIW0aP9QV6rtvUh2w3qSoMwcfj8eSTh20rtLrZS+SMsAFG
 x7lZ/bhhiNaKpd7aCEcI0JsxjRrNmpXEgXpgstTOoK4duXsTx09F9DpbvKleKj0kg4bT
 EQcg==
X-Gm-Message-State: AOAM531JM4xL2fzyjLlCp2dmMmg8y/xtzUG4s/i9pdOECMwzl/mVxjVT
 Bfi4JRaYjKAlojJwHU161YaE4UpZ1urb9J0iTZVicA==
X-Google-Smtp-Source: ABdhPJzNeJo6F0VTZ0S6U9fuGWdBKZjH6dGksbNLyWqgmXOtrkpA/UinCG7oju3HCUHK5DY6DzL72Fr4547fWGtbqgk=
X-Received: by 2002:a05:6e02:1253:: with SMTP id
 j19mr673988ilq.145.1595435216934; 
 Wed, 22 Jul 2020 09:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200722062552.212200-1-hch@lst.de>
 <20200722062552.212200-12-hch@lst.de>
In-Reply-To: <20200722062552.212200-12-hch@lst.de>
From: Shakeel Butt <shakeelb@google.com>
Date: Wed, 22 Jul 2020 09:26:45 -0700
Message-ID: <CALvZod6zF7Ak8KWf4dq0pEF2ty7JN_SyNE7PxLjrfF+EuDbZ2w@mail.gmail.com>
Subject: Re: [PATCH 11/14] mm: use SWP_SYNCHRONOUS_IO more intelligently
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_122700_012318_62BFC617 
X-CRM114-Status: GOOD (  16.78  )
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
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Cgroups <cgroups@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 11:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> is not set, as the device won't support it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/page_io.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index ccda7679008851..442061348dfb26 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -403,15 +403,17 @@ int swap_readpage(struct page *page, bool synchronous)
>                 goto out;
>         }
>
> -       ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> -       if (!ret) {
> -               if (trylock_page(page)) {
> -                       swap_slot_free_notify(page);
> -                       unlock_page(page);
> -               }
> +       if (sis->flags & SWP_SYNCHRONOUS_IO) {
> +               ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> +               if (ret) {

!ret

> +                       if (trylock_page(page)) {
> +                               swap_slot_free_notify(page);
> +                               unlock_page(page);
> +                       }
>
> -               count_vm_event(PSWPIN);
> -               goto out;
> +                       count_vm_event(PSWPIN);
> +                       goto out;
> +               }
>         }
>
>         ret = 0;
> --
> 2.27.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
