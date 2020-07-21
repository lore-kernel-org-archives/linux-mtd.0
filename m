Return-Path: <SRS0=j43f=BA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D70C433E5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 05:47:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC9220792
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 05:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LyFTtBNQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/IxIwyE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC9220792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2sHffX+PChA4MthMqPJsRFgytwP4rbV63+U5kBqZ7VQ=; b=LyFTtBNQnVyzOCHiGPEY7Rwk3
	VcGz4Sr/a8cRiQqmkldqPmta0n0r8NU0CUC/Tx3ZOgXUnWNEmpfOpOfMq4z8gJptGb/euqY8kaG6v
	DdyDWgNiaLG7LSp2N0sQmO5dR8D6AhVCsb0wpu1bCYsb+Y/fFkFqx6wl6fq1pL1fhO06nixROsnTm
	JsEc1Q7nQr2wrZVjle4Plopu2SWSbEMJx6ctU0N3xOX3wDkbwVHHJqncowaefkVGmLX7NnxwqMbSV
	coC1EyvGuZBo6W5iDIjcisPptN4jsRmh7NfQTRnC6sVh6el1gX6PK42xR3cvxxk5tjhHWk91njmsF
	EGc14Uhhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxl6h-0005Rl-4p; Tue, 21 Jul 2020 05:46:27 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxl6e-0005Q7-F4
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2020 05:46:25 +0000
Received: by mail-pj1-x1041.google.com with SMTP id md7so1103908pjb.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 22:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3veC3pi53wl7dFDGpjkOo+uS1itnPbzCOm4x4ko6JVY=;
 b=D/IxIwyEq3hF3iTuaIk+KFCFZyGC8VqcCGJnFT12TDv/8eGagJrHkXCGkF3Muc266t
 OGT7OoG2HtHbaXMhlknQISHa5De5A/xFpxWKJLCbc/SAIqTngBdVmIG3+rFG2+Y1Wb46
 YATZPWszcpNmKSDpEHErZUkhido9bvZlai2206IHzthib3Y0UiQ6fX8Re2N3orWnF12s
 XZ6RPqQNT9T2QKcABfS3hJr1GCzgJFm/rDpCofJQA16hsZZMLUHK0fkaVJHJKDnTcvEP
 YayBMF/DStbLmLjOPFjbig16IweaRvLj4UCWCSitHEj/N0DuM+39Lm+dho9165oRwpKe
 XDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3veC3pi53wl7dFDGpjkOo+uS1itnPbzCOm4x4ko6JVY=;
 b=KAlfYulAsia2OY2kHVg8zhMXtx6J1X/hhwuRWayBpRXbLeg9wXwFSObdl0Sb6MTE4X
 t7Yj0vIH5K19V9UoRIJ1R03z2U1PmBupVjrZV3jBGrnCrhG7RqxQekynwDJH2cnu0OK3
 0ii+WJlicWeZ0UvEFb2EfBK20+iLvEpqIQSh5YdE2xdJym56qhpiCMGmLHwysjcsTEsw
 T7zLz0/kSghIqE7cwo3u6xbB6qdLOxE6FkdH38YIi8lZHEjlEgdBm+2T3TMfRa8H0oRG
 Lswg5LVkb6j9CZBtPiI9WqOPCATpAKHr9ZADBbU7GpSyM1T/GsSIHHDHS5Bl503VrnRZ
 /DnQ==
X-Gm-Message-State: AOAM533OCOqIVN+fRWRhh+Q6thz4X30XozmPrHwhJgs+JKq6aHFFM6bC
 iY8pGa0EdtEMrw0B9ifuJWo=
X-Google-Smtp-Source: ABdhPJylrFyWY9zOcJ3tuosterYe/etVkRG4BboKrT7kWFS6Sy9YPaV4NbuHkPEn95UZ4BSYHonUbw==
X-Received: by 2002:a17:90a:dd44:: with SMTP id
 u4mr2794038pjv.203.1595310380927; 
 Mon, 20 Jul 2020 22:46:20 -0700 (PDT)
Received: from google.com ([2620:15c:211:1:7220:84ff:fe09:5e58])
 by smtp.gmail.com with ESMTPSA id nh14sm1541134pjb.4.2020.07.20.22.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 22:46:19 -0700 (PDT)
Date: Mon, 20 Jul 2020 22:46:17 -0700
From: Minchan Kim <minchan@kernel.org>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH 11/14] mm: use SWP_SYNCHRONOUS_IO more intelligently
Message-ID: <20200721054617.GA1879427@google.com>
References: <20200720075148.172156-1-hch@lst.de>
 <20200720075148.172156-12-hch@lst.de>
 <CALvZod7ACBnNX5W-gtTzheh8R-rxv1nB-5q7UcDUZ7BvtpakpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALvZod7ACBnNX5W-gtTzheh8R-rxv1nB-5q7UcDUZ7BvtpakpA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_014624_526276_EDAC0E69 
X-CRM114-Status: GOOD (  23.87  )
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
 Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Linux MM <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Cgroups <cgroups@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks for Ccing me, Shakeel.

On Mon, Jul 20, 2020 at 10:52:55AM -0700, Shakeel Butt wrote:
> +Minchan Kim
> 
> On Mon, Jul 20, 2020 at 12:52 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> > is not set, as the device won't support it.  Also there is no point in
> > trying a bio submission if bdev_read_page failed.
> 
> This will at least break the failure path of zram_rw_page().

Yes, it needs post processing for error propagaion like *page* handling
part in end_swap_bio_read(mostly, PG_error and PG_uptodate with pr_alert).
bdev_read_page's sematic doesn't need to be synchronous so it could just
submit the IO request and complete the IO afterward. In that case, we
need right error handling, too if the IO encoutered error. BIO fallback
makes it simple.

 * bdev_read_page() - Start reading a page from a block device
 * @bdev: The device to read the page from
 * @sector: The offset on the device to read the page to (need not be aligned)
 * @page: The page to read
 *
 * On entry, the page should be locked.  It will be unlocked when the page
 * has been read.  If the block driver implements rw_page synchronously,
 * that will be true on exit from this function, but it need not be.
 *
 * Errors returned by this function are usually "soft", eg out of memory, or
 * queue full; callers should try a different route to read this page rather
 * than propagate an error back up the stack.

The other concern about this patch is zram have used rw_page for a long
time even though sometime it doesn't declare BDI_CAP_SYNCHRONOUS_IO by itself
because rw_page shows 4~5% bandwidth improvement compared to bio-based.
The performance gain becomes more important these day because compressor
becomes more fast day by day.

> 
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  mm/page_io.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/page_io.c b/mm/page_io.c
> > index ccda7679008851..63b44b8221af0f 100644
> > --- a/mm/page_io.c
> > +++ b/mm/page_io.c
> > @@ -403,8 +403,11 @@ int swap_readpage(struct page *page, bool synchronous)
> >                 goto out;
> >         }
> >
> > -       ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> > -       if (!ret) {
> > +       if (sis->flags & SWP_SYNCHRONOUS_IO) {
> > +               ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> > +               if (ret)
> > +                       goto out;
> > +
> >                 if (trylock_page(page)) {
> >                         swap_slot_free_notify(page);
> >                         unlock_page(page);
> > --
> > 2.27.0
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
