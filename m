Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9747C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:34:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AED206F9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iT/ZxvTO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXt1Lod6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AED206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8UhgWScdW+iY6ndCrGLOq/vUgDtOrkCmz0sT1TQxwhM=; b=iT/ZxvTOa3VhD9SZPgxeUsTTI
	cHVX3L+dwgyg4HV0I5WMqAJfg9jODM8AjZC1T0d4JYDJouUykV7gp4zFBE+odbp3FgNCtORb5vxcy
	TAalsNWhnb00bYXbdoDY/foDrzFRw+Y3ci+4L8ScDZWqLjjz8sGDkurqOqGw+uVuaFFrwb9IBKB9o
	vcfA5HhInD8OGXwGx6GViwuCE2h23narQdQ/Y4yEYSb1va3pcu8+cLHgjuXIuBDQCDgNUnJFTaDTF
	CAQ/OUfmTtu0EfHZ18X3MPadYUo1IJdluh/iJDn2joS7MnxauwZcBmVkK5UVP8S+oMUke0ix1rRcp
	645TrMRHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYyUp-0005OG-Lj; Sat, 31 Oct 2020 21:33:11 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYyUm-0005Nk-Tt
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 21:33:09 +0000
Received: by mail-qt1-x841.google.com with SMTP id k90so1156804qte.2
 for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2020 14:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xHvOHUVvu4ckbchx1rcuGr08kZCMPwt4rJyailG9bbE=;
 b=PXt1Lod62vg8gGET6LJhJCXNcAPFlFMqhaLW/oHUss2OGkbyS0YCJBKTjLTU9jBnJP
 Xdkns0Q7fETaxj+olj5iMsdqrAkBUMBMh7IVyQosyXpFAMhodyWnYtGV9BHCihrGZN/B
 dfd+D0Fc+FllJtZcwZTALVV7HrOQnFS8ownbwN+B+bRbMW7Bt1jOhcZGMn9EITUZ5ztH
 JAgGTVa9Y+2y9DFCnki15TVU6X86FLg/UgI+M9QnWnKMVgQD6vZCAcpYeYKRixVxNZxT
 oF2TZ3X/wjk3l44NHMlIGXDU4FtiZJ8X6kqba7Q+o+XP9/kvuSRSQuuohjNPfTLH6yRY
 Dlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xHvOHUVvu4ckbchx1rcuGr08kZCMPwt4rJyailG9bbE=;
 b=JZI4Eja8GZSuu0z6NV6ST1ctBzJIC02BBtIMzva1DFT8ijc/D3WTQiFxaYGsi08wJP
 HMZZsQTf2EI5n7Pi9ZJn29MzSR1lN/gccT6euoHhaomMgQV3gcafKYD+QcXTXSj/67uP
 qwzou1gMFwMsfli5biYObZfsIAt29hDQOx2rfrgL9TuYq1Yh8gz5cAxH9iEises377TS
 RJWcJCOgwZjx8wN7uiviENUyMqGV+M+6fCjun6FB6X39Dig3UlgcVqF3sHzxncvGO7rZ
 jmRgU7ZBkXjQHWMXbhaEQXz+azqf7SZo5rIH6vDtHt5wRGq9BGIzhk7INk1z5EBWAdEn
 r0lw==
X-Gm-Message-State: AOAM530GEw3c4KuJD79sx67KpUmBiHjfj/zTWp4Skg4m9xbWFOg7nBao
 vCrZnCUkh9kv7RXgVqXaq+0g48U87iseRZWGFOI=
X-Google-Smtp-Source: ABdhPJyH4x3XJbLMJ7sY9fe6Z2kSL4S37owrGlWRCqTmjoD87RzDjMLEM/6vqyHGxMoGH58ahNEztGNUEB1zdGP7kcs=
X-Received: by 2002:aed:384a:: with SMTP id j68mr8263047qte.170.1604179987263; 
 Sat, 31 Oct 2020 14:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-2-hch@lst.de>
In-Reply-To: <20201031085810.450489-2-hch@lst.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 31 Oct 2020 22:32:56 +0100
Message-ID: <CAFLxGvzXaM8gKF5ffG6dgNaCuTV_g7uozoMiPPHtkmte2CY_bQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] mtd_blkdevs: don't override BLKFLSBUF
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_173309_186532_3F0E8DFF 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-raid@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 10:08 AM Christoph Hellwig <hch@lst.de> wrote:
>
> BLKFLSBUF does not actually send a flush command to the device, but
> teard down buffer cache structures.  Remove the mtd_blkdevs
> implementation and just use the default semantics instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
