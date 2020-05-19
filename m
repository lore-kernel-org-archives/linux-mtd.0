Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71261C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 11:17:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46A2E20708
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 11:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YO9ZXxgl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjKId3Kr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46A2E20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbXzgTscKzeviE7fbkJeshiOBbX/L4wyw6zOChiPK7w=; b=YO9ZXxglyQB3L9
	fKfnumtSlobFRaY6GgLA0AV3UPhEiWFr1ybca6+RiHMHkWUqtaJdStQp2BnBCqZNyQcy4tKlUN2W0
	9eRpeBBFTP/u/HvqTY4R7OUibY1JzN3nsuabnl5BL0i+3pZ82SJqjlzSHAJGtvki57EHZQ8AiJR4/
	buL5elR0Y+cWsWCV0RBAgr/BZ9KoTBYWnZMVRXKMLd93OGDxsOwilQim/rrOeoee/tBpvV/eVJGNq
	b55Aeektp5u8EeScC3mgv6VM/nd9tVOtikoV6j1OQwHPVCyGx9wmq1mTMmNi/lkBJ/88RjwmS0gpK
	S0Z+bMA+YJKvXZymRzAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb0FT-0001B0-5Z; Tue, 19 May 2020 11:17:27 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb0FQ-0001AN-D0
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 11:17:26 +0000
Received: by mail-qt1-x841.google.com with SMTP id o19so10713194qtr.10
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkPofRNcMbXyidznz5rPbV+dhRqOcYCkUmYQhR8zNpw=;
 b=LjKId3Kr8ZMbr09bN9bNX37UrHGCpsZFFYmlANV1+RwgZUhrnZb73eq0gab2pwfd7S
 zKYPhJr+j2y4m1eU2JxjyIgmb6idJ2L0a7l3hgagF0/cHLZ7s3tfOdifXS0VjYDjDCcb
 npTHJNQx7pJBaIOENEqXDIS0PoX6DlaQMAlhArlG5qoo8QYKapPTXySNKSHmZywc6sej
 K/ApAuu31jyLo06eH4ZUspSpZJAKBZBGIefa5GgN1zhmWnui3rFlfqNjVSKS/Xzbr2kx
 qlYzCPgNOlF4FouH0NIRNTmZx/84X/nI0ykpUcuJJxvYwQsIh5EcS2jzE3PVEQvdviiC
 J1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkPofRNcMbXyidznz5rPbV+dhRqOcYCkUmYQhR8zNpw=;
 b=s+LsUz+WOpuF4Raolwe6s1LZVZBJlxfGFNi8BDySAyXgIkenjr875SbCAvBZsd+H71
 UUZxM/8gIgXn/ovaNwwBbXS/RN8fINLZV87Coq6ymwECBdLBoqzp4t5l5GC8GzXEitN3
 AqGnl8FMn8c6n2fjl3h5Sw+wzDOCrH+OxpHyGGzYb6BCp8I7h2NzieMd2lL4Z69bLuIx
 UXIMat789DPd77K6UeUEm/QP1Yv30kI9TntBVR5BM/w3BKoUcFy3rgdl2fo5A2vKL6p7
 yV39XLvyA+BrpuC1NDXub1r6PvDEvulr2IBjRArBRFLe1uBb+82VElv00kheX0szBjqW
 +ncQ==
X-Gm-Message-State: AOAM530z/1+By68N0m4lsvUTW36xHEgC0DLmBF7vnRDk9+pvsev/nQYh
 JT+8TAI/ebNPsJRfTXfIpXefYPnRrERhZfNkML8=
X-Google-Smtp-Source: ABdhPJyEQYUC6XYIXlhdProrcxLqU7QvaH+lWtMR98/Nx8zkXswtH3NLVV4lpH+vla6gdzAIEz3Vn8hJhA+voFLnqeE=
X-Received: by 2002:ac8:1e16:: with SMTP id n22mr21549107qtl.78.1589887041611; 
 Tue, 19 May 2020 04:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWQ8ZjjdzdTVtBas42L0_qbhJhayqogz_Gg5wgtDBVo+hg@mail.gmail.com>
In-Reply-To: <CAA=hcWQ8ZjjdzdTVtBas42L0_qbhJhayqogz_Gg5wgtDBVo+hg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 19 May 2020 13:17:10 +0200
Message-ID: <CAFLxGvxp3+JuaEatmMg_tvMFonSVC-pwhiB_ikf6i_edAGPewA@mail.gmail.com>
Subject: Re: Issue with 'ubi part' ubi_io_read: error -74 (ECC error)
To: Jupiter <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_041724_439433_739C946D 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: u-boot@lists.denx.de, linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, May 17, 2020 at 1:28 PM Jupiter <jupiter.hce@gmail.com> wrote:
>
> Sorry for a bit recalcitrant with the issue of calling 'ubi part"
> error -74 -EBADMSG, is it MTD issue or u-boot issue?
>
> I used Linux kernel 4.19 to flash UBIFS volume images ubi.img to
> imx6ull NAND using following command in Linux:
>
> flash_erase /dev/mtd2 0 0
> ubiformat /dev/mtd2 -f ubi.img
>
> The flashing image process went well, not errors, but in NAND booting
> (u-boot version 2018), running "ubi part" stuck following errors:
>
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 2
> 35:0, read 64 bytes
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 2048 bytes from PEB
>  235:2048, read 2048 bytes
>
> The document says "The -74 error code is -EBADMSG and means an ECC
> error. In other words, UBI tried to read some data from the flash, but
> the flash driver found that there is an uncorrectable ECC error, and
> returned -EBADMSG."
>
> My question for ubiformat, how does it write ECC to UBIFS volume
> partition when it flashed UBIFS image to NAND?

Neither UBI nor UBIFS care about ECC. The MTD stack does.
If you write something in Linux you cannot read back in u-boot a common
problem is that u-boot and Linux use different MTD settings (layout,
ECC, etc...).

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
