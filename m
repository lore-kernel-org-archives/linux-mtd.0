Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E45C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 20:05:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DCC222B8
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 20:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYnX6M5z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+7LV9NU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1DCC222B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PLA+TBdJYl+NIRg6uFg7sTRmdrBLLx1Hfcfbd6EsCRE=; b=qYnX6M5zV7C6HxNvlLpdWDdir
	3owmh9nxEdzVCcA+rI6Dqk8ZVS5oRKisag+UX5+bFlWshRbnyXiwEIgGeVs8H/5pooXRfPk+etrsJ
	PfgR37puV0FD1agUkVSxyUzptkPXBlFncqBp/kH85VV+IOk+nrgGq4XPEzGam+bdLIn5l5VWAPs9w
	VQmzaDdvtc6VG5U/wsvVQOvCHbbK37Pf0xJhsmfy1KywsxnPDUaWs2Q1WDE45nDGpCtmJwftjazp5
	/Y39jpsi81tqi3DJw3fUcccF419dx41qhGKoFi0Zjk0GCLLusiskZGVixsifuEl5bjzShJMCdizod
	Iqj0kMkkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUbOU-0002O4-MP; Mon, 19 Oct 2020 20:04:34 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUbOS-0002My-4g
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2020 20:04:32 +0000
Received: by mail-qt1-x844.google.com with SMTP id t9so719751qtp.9
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2020 13:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XSfxmMkZMNrPnoT0gljcl/qWl3/OnZ4ITcfP06i5z3Y=;
 b=P+7LV9NU/clppD5XH/mUZOvJ5aRFAhm7pkrqfknV2vOTbGUjhVyGjrroLwd8Kq+Edj
 zzpZd/VtlsnSx8TuuuMg8gGEApuOxh2OOB/ei7qVWZLQuBKYDPocRFM3cRVmnZV/nGLe
 NkT7zqtFUtf1LfzzaqyulqKFtfJF0UxLKsztpY8wsIAA9H8qIA6oVJbdo9AG71va4Rua
 SWy06PTCFJjZynPD+hfobhI8Fv+txnnH052cXnwX9LWtn541xEeBa9CfA3icZjqF467z
 hZTtEGsmcbAdjH6YdvGtoYOFJ83SCU0RYHGB7Tc8UJJzS8qRyZtXIsEaV2rIS145TYpY
 dZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSfxmMkZMNrPnoT0gljcl/qWl3/OnZ4ITcfP06i5z3Y=;
 b=NlNeJI/WQqb/Nc7gtU26KSiF7Tc0PDBFEohYHNlAS0rYircboduFBEsQQr0+8w3qD3
 7JcAbetmXwsyTcfcIQihU4w1UZNzR1aTKLTI6i+Zigo0jkbmtj4w5UM+SnknHPTPFg1G
 V9NJTEotvlK5REz0HxqP6PYJgEMvCqqXxsHhvglsS+J8mnfIX3x3u3TuUVUHPlha0zDg
 AjgauGEVdAQmIO0gEhx9M7U7XeFFXM2KuXLn7GJxg7iW8jGBrNJr7qe7y/6KM9Tym3Po
 ad0oFj7uOEVaXXk1OYW0TczXG5WAtFLqE45TiZWOB9LZc8OoreM07Yi1HFxbYns9M7re
 gYqA==
X-Gm-Message-State: AOAM530DxInA6ykZOnCqEr63SZgbqXT7C4g2QUaU0/kSgzEVcxJc4rb0
 h8OtPIfjefvw/1HOcB+jYuV2XUi6b4h3QwZ7QyrYOhIoM7o=
X-Google-Smtp-Source: ABdhPJyVyAM/3YohTjTeJvg3D9kIQTCnDMQ71J0tMGAA0FIzrEbmesrF4wQ1MmGtT1p1awj2aIzrXY7DWM492WXKeG8=
X-Received: by 2002:aed:3e78:: with SMTP id m53mr1188470qtf.170.1603137869631; 
 Mon, 19 Oct 2020 13:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201019191631.9604-1-trix@redhat.com>
In-Reply-To: <20201019191631.9604-1-trix@redhat.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 19 Oct 2020 22:04:18 +0200
Message-ID: <CAFLxGvwAVbpUe221N-qS19aFSaJ4hM=J=veHfi+4wAkNTNGAog@mail.gmail.com>
Subject: Re: [PATCH] mtd: remove unneeded break
To: trix@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_160432_201799_4C2CAF44 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Oct 19, 2020 at 9:23 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> A break is not needed if it is preceded by a return
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/mtd/mtdchar.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index b40f46a43fc6..323035d4f2d0 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -881,7 +881,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>                 if (copy_from_user(&offs, argp, sizeof(loff_t)))
>                         return -EFAULT;
>                 return mtd_block_isbad(mtd, offs);
> -               break;
>         }
>
>         case MEMSETBADBLOCK:
> @@ -891,7 +890,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>                 if (copy_from_user(&offs, argp, sizeof(loff_t)))
>                         return -EFAULT;
>                 return mtd_block_markbad(mtd, offs);
> -               break;

Acked-by: Richard Weinberger <richard@nod.at>

Do you want to route this patch through mtd or do you carry it?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
