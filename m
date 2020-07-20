Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCD5C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 17:54:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D5B420709
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 17:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nzndbBaQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="SX8NYsOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D5B420709
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2n+6n7qBycbce2Tg224Aow5XKqvBHxuhEHPB7hAjwBY=; b=nzndbBaQt6BgygWpNRuEC2K8c
	6zqXsUIVdf74Wr+GXmZ23xER6ystaz2ZB2++QK3PS0U7swRA4YVZQrle4YMMMgXKyR7wWn57UoZ1g
	20poMFsR2IFgyfopr7ZL9ei5D8JupfYwmZEsXvkrj7ITIPXrTiTqZHJehTFkc+Brei9zkJdvKtuJE
	O9QnKzGXft/hSe+HWuNM9lXC5E4hOIfkzVDWUmLkxAkby85gMLZ3FS49SWSM33K/Gx3/afA2H29cq
	PgWo7TZsU5EOURXpBl4wYcEo02OG1eMB4aNXBR58Jd6jA/rVih3C4sLwqEgnZuqHtnPCvFHfatvpH
	5kOH3texA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxZyU-0005sn-8Q; Mon, 20 Jul 2020 17:53:14 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxZyR-0005qH-Cr
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 17:53:12 +0000
Received: by mail-lj1-x242.google.com with SMTP id q4so21266555lji.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kya9ou2H4xCIeg2jTugLQPDLPsUiSPAXkhjVJRHMDG8=;
 b=SX8NYsOLgCeGmFxjb3Z0RzsYrlrHY6Njtfv46WXbScI3rw3tkdMvNy7qsqcNAy91ok
 EmnOsjkBbRSUSYO4/Q+Cx/xTEf85/D7y3ubLVL9GrTTaC883stkN/jVXYzE2FCCqF7eB
 9s7gGZej8MgWwlJIFwC85V0qxylpm5PoPDao/u8vX7pBu4QWu3w4EYzNHhOsY3D9UTQv
 wZ7VKxvMYrxM6QJlB3KwFInEXd5SELo26Gs2/yM5C+3lGgUkJm4gOG1yFNX6CZ+WQun4
 2A746f0YswL5r2QB7a0ry1PuFLvHVFwRkJvX+AeFb1QZo7ouw1eWDpQA/DMeKnb180Pl
 r/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kya9ou2H4xCIeg2jTugLQPDLPsUiSPAXkhjVJRHMDG8=;
 b=uobMGUnjZX6AUMksIUy4uzXVKA1A3MAZQ/0afykIbHDPTMZ99+s/Gf4zC3TMPV5dP2
 CIMMc2VKrkJXD1SJQdSkncj9MLBBrLjJ3M2TODow7aJSjAC1lY7Jme0zzkz2OEIh8zVK
 HIdCnkE9X2bJqhW8IR/fZ+lxW3jCub8aVRLNZ3bKG0O8YCqGQSQJKIKNbQovwd4ygNCa
 lqY8uDV4KKFJSFmGjdelfOG0DZhJOlGnICWPzP/k3NGpnLduhFOQRrcWc6inkJv1bGBC
 UP2LTEC0CVwPvhVRYyq54ITglJ/l4nC1Msgr68VAiJ7wFq3AICZXhXBelKqhSO6KXLAE
 8n3w==
X-Gm-Message-State: AOAM5304ESokW/maTqqDIxCBqVA6R6s2eSevh5mZHy4nLvr44NnRILy0
 lC0acvj1AJk0wMI22VlSiYeV95HhQcLpkyfBtTkHYogLVC8=
X-Google-Smtp-Source: ABdhPJxVEb/gDZEkvQ7LMo203fIZqznHvbPDVwx5Y0R9jHwZ6CsaSCd83ZH/mrB+5f45z4TkFHBNvGDSXrXZqTZC034=
X-Received: by 2002:a2e:8e36:: with SMTP id r22mr10983662ljk.77.1595267587620; 
 Mon, 20 Jul 2020 10:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200720075148.172156-1-hch@lst.de>
 <20200720075148.172156-12-hch@lst.de>
In-Reply-To: <20200720075148.172156-12-hch@lst.de>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 20 Jul 2020 10:52:55 -0700
Message-ID: <CALvZod7ACBnNX5W-gtTzheh8R-rxv1nB-5q7UcDUZ7BvtpakpA@mail.gmail.com>
Subject: Re: [PATCH 11/14] mm: use SWP_SYNCHRONOUS_IO more intelligently
To: Christoph Hellwig <hch@lst.de>, Minchan Kim <minchan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_135311_461764_7651B2E8 
X-CRM114-Status: GOOD (  16.96  )
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
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Cgroups <cgroups@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Minchan Kim

On Mon, Jul 20, 2020 at 12:52 AM Christoph Hellwig <hch@lst.de> wrote:
>
> There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> is not set, as the device won't support it.  Also there is no point in
> trying a bio submission if bdev_read_page failed.

This will at least break the failure path of zram_rw_page().

>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/page_io.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index ccda7679008851..63b44b8221af0f 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -403,8 +403,11 @@ int swap_readpage(struct page *page, bool synchronous)
>                 goto out;
>         }
>
> -       ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> -       if (!ret) {
> +       if (sis->flags & SWP_SYNCHRONOUS_IO) {
> +               ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> +               if (ret)
> +                       goto out;
> +
>                 if (trylock_page(page)) {
>                         swap_slot_free_notify(page);
>                         unlock_page(page);
> --
> 2.27.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
