Return-Path: <SRS0=mmHb=FY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA25C4361B
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 21:16:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E4942256F
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 21:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E4942256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5poiOgKWmjFn626qmnVZxjvgiKp+3xhKRuhQ8l9tW24=; b=lkZ/hBtHq/a/q3sYbkMMiGgJ1
	hECl+uV0g+zriemmyOvck2YikG/8XOp/tRCyzkvJE0lLZqUJRVHNRwRywtojhPgFghBe9nJLbMZHE
	ItPPlnSqCWwGSZfG50V2XN9Pv26/9Z8XdN1516Y7pTWNHMvVCXqK9G7y9Ns501T+IcLRiU/YeyC6m
	vCoz4MzMSv0al6bfs8IDA06IehnYvyUwDWNS8wiX7koXKcMRTN/V9JQZnIkR9EryFeOoOzQSw+Uwq
	6UPqEj0PoBulxOX2YMDpC5Zx3nHwr1C5/qX41c92QDKUUZ6iNMgCilYFH0MJaIS9iW6gbYbD8Hzmd
	ZfyA2o7rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr63c-0007SJ-2a; Sun, 20 Dec 2020 21:16:00 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr63V-0007Rl-DS
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2020 21:15:54 +0000
Received: by mail-qk1-x734.google.com with SMTP id b64so7239791qkc.12
 for <linux-mtd@lists.infradead.org>; Sun, 20 Dec 2020 13:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O6uzmAaKy6Tpw6472b4l28CsRG+K9Idwpy1rMAZdnEI=;
 b=emmaaPK7eQb08PlZ4lpNFAEqxAucZreW++pSIMdzKcKO1pjomXibpBvgu7Qx8BcPFd
 Zztfx236CzyXSQtQ4C0IbdoqN042/m8xZdE39SaEflP3WeWj6yWOvLcMngz5I9nz8S4D
 UqIT72fobV2g2+4jN5dD3qzAUTC732KseG6TboPyex0L1e/4xulEn8b482C+59wApRhK
 d+UEUZ3LYpTrHAkH0Jy41FZhubV/iDqE0QmeiqddgA90hoVww1wS0dQnpX2bGK+nwgCk
 alGZ298K5tIVtpxylcKBkiFyfdqXEVl3M7Nlz7iiBRIdpyDZUMGFqAaEn/RvUrSMq4WE
 nyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O6uzmAaKy6Tpw6472b4l28CsRG+K9Idwpy1rMAZdnEI=;
 b=uNsJgkJn0MZPu1TEcuoIUW0e0/g5sMOtOnpDBGECTFfxTo1eB+UeceOn2j2YGQnvHT
 /GXbMtKCCy5eb3RwjF11npF6ip2Te2jD2pNBP64R6q1YL3HHIMup/clkitOMwNJCbt+r
 uUO2JIYgQ/Km5b77ddvtTqIy8EwK1DYnc42jc3NrgssHURN0VtKNUmFf2gC4zXW7UcSD
 bl3OwfeUzRibpDJ/uR4UhRZ37+vRX3qfm5bNnTfsoKqT3JqOf2vnaawo4qyonU7P8+kp
 UHjIAhcRyS413t2zGz6AmOOYyPJc1BW6AHHa8YZMIMWdz8Ki1CFRBz4FBXfC1ZX85PJY
 1jgg==
X-Gm-Message-State: AOAM5325d+dvWQn85eSs7kYlMvhfjmPdd8lOiOIvH3tHdhzgZWrShphv
 6eEsvqFrJgBOkCVeItioC5yPtkB7e6TX2mu1y5A=
X-Google-Smtp-Source: ABdhPJzfLoLk+OzIA3X+/glzoot3vKjcNRcsGID4CFp9Nji7KF0mmXNRb8yl+v4+dkvdR6YyHD8hwgONp0CdFiWoAew=
X-Received: by 2002:a37:9a4a:: with SMTP id c71mr15037964qke.56.1608498950121; 
 Sun, 20 Dec 2020 13:15:50 -0800 (PST)
MIME-Version: 1.0
References: <1608382150-102703-1-git-send-email-zhongjubin@huawei.com>
In-Reply-To: <1608382150-102703-1-git-send-email-zhongjubin@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 20 Dec 2020 22:15:39 +0100
Message-ID: <CAFLxGvz5d__+yNLeRqHfF=5M7hKf-PoQrJ8EBy_tu7R1S6n6yA@mail.gmail.com>
Subject: Re: [PATCH] ubi: remove dead code in validate_vid_hdr()
To: Jubin Zhong <zhongjubin@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_161553_526556_8073C35F 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 wangfangpeng1@huawei.com, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Dec 19, 2020 at 1:52 PM Jubin Zhong <zhongjubin@huawei.com> wrote:
>
> data_size is already checked against zero when vol_type matches
> UBI_VID_STATIC. Remove the following dead code.
>
> Signed-off-by: Jubin Zhong <zhongjubin@huawei.com>
> ---
>  drivers/mtd/ubi/io.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 2f3312c..8a7306c 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -913,12 +913,7 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
>                                 ubi_err(ubi, "bad data_size");
>                                 goto bad;
>                         }
> -               } else if (lnum == used_ebs - 1) {
> -                       if (data_size == 0) {
> -                               ubi_err(ubi, "bad data_size at last LEB");
> -                               goto bad;
> -                       }
> -               } else {
> +               } else if (lnum > used_ebs - 1) {
>                         ubi_err(ubi, "too high lnum");
>                         goto bad;
>                 }
> --

Looks good, applied to my 5.12 queue!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
