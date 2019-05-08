Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A67C04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 17:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C6F216F4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 17:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cnTaz0bn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C6F216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADB6YENDcQrQ6hcQ9ofWUQY45yaj6bffO2+kTKpXbW8=; b=cnTaz0bn65O3k6
	opHzMZoU7PLS4nw2RUmBjAv6zTVEER8bppoIWvWYuxTNSz3REkYfXxgxsASkQ7UtKyc3FNfYZOjKk
	iVROEMODb15/q6v/xBBgUo/fVeDeMOsVRJAnLh5WqL/lmXrplMYEhrdlbZd4MsdnUNEjwWgtuNsTi
	ojanAvtTGi7ityyPe+KRb89OZ50oIPh7Z9elOAa5IQRLD27wkDe/6xL/r5hot9liouM9hKJi9t2hX
	RVmJm/zT+d/RRoYdv3bNtFI8k/1mYruVBPAtnfL6Eqgl5KGlcpyy7og6m3C2hpol8SmS6ykwPS/3F
	ieOkrWtj9P3lkJlMOE8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOPvd-0004jk-Gx; Wed, 08 May 2019 17:00:25 +0000
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOPva-0004iv-ED
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 17:00:23 +0000
Received: by mail-vs1-f67.google.com with SMTP id e2so13080999vsc.13
 for <linux-mtd@lists.infradead.org>; Wed, 08 May 2019 10:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQpdS2BoEXavGkDkQ8SZu1pVpvwtdePVG1xQzZyqCT4=;
 b=YP/AmqJEEB1zw+EQNGwYLVJqY7yRV8ZU7uZLnPbsRMmSkK4oLmRZUjPIPgHDRWkGoc
 hVG0Ei4+63Tdo0OygIyaBim9deQvg6PDHF+LgWHC44mUSosAYydINp68BTbnOXSiWgtn
 N6yOj1Qw9oyy5ohlKgjLhQEyHQp0lW2dDIYehYkaWdM8mS8CYpOVWvU4pjPdjvuwWbBS
 GvwK17v0fIyDGlS4RXr5bA8xLghIsKLO3dYU95rx75gOSk0KaCzfqLoS+hGPmdX38BXH
 HytBJn8xtolhuKTTp3zLrVYUw4letWXtZ/1i0ACRvJZmZM5Xaj4ei/wYPrr4ZoZzkV+6
 C6pA==
X-Gm-Message-State: APjAAAUIgfWDU3+dudxeZL4nWmVBLi7KMOd9PmU3kcDZ/DC2sURqS1mq
 IaYjkH7M5EEyUaSETEk+I82bzkVfllGL8igoXWKgUU34
X-Google-Smtp-Source: APXvYqyU8GkdyLjbtfeyP0LPWxT1gdAL1M98hPFoTiogs2t4uJWzeKkD4ZHOi1UFIw89Yy4Iya6YxZ3GsHXerDyo8go=
X-Received: by 2002:a67:e2ca:: with SMTP id i10mr12858004vsm.96.1557334820955; 
 Wed, 08 May 2019 10:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
In-Reply-To: <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 May 2019 19:00:06 +0200
Message-ID: <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_100022_479718_D039CB52 
X-CRM114-Status: GOOD (  13.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jonas Bonn <jonas@norrbonn.se>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On Wed, May 8, 2019 at 4:23 PM <Tudor.Ambarus@microchip.com> wrote:
> On 05/08/2019 04:11 PM, Geert Uytterhoeven wrote:
> > On Wed, May 8, 2019 at 12:44 PM <Tudor.Ambarus@microchip.com> wrote:
> >> Would you run this debug patch on top of mtd/next? I dumped the SR and CR before
> >> and after the operations in cause.
> >
> > Thanks, giving it a try...
> >
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >> index 73172d7f512b..20d0fdb1dc92 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -22,6 +22,8 @@
> >>  #include <linux/spi/flash.h>
> >>  #include <linux/mtd/spi-nor.h>
> >>
> >> +#define DEBUG
> >
> > Should be moved to the top of the file, before dev_dbg() is defined.
> >
> > Result is:
> >
> > m25p80 spi0.0: bfpt.dwords[1] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[2] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[3] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[4] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[5] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[6] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[7] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[8] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[9] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[10] = 00000000
> > m25p80 spi0.0: bfpt.dwords[11] = 00000000
> > m25p80 spi0.0: bfpt.dwords[12] = 00000000
> > m25p80 spi0.0: bfpt.dwords[13] = 00000000
> > m25p80 spi0.0: bfpt.dwords[14] = 00000000
> > m25p80 spi0.0: bfpt.dwords[15] = 00000000
> > m25p80 spi0.0: bfpt.dwords[16] = 00000000
> > m25p80 spi0.0: failed to parse BFPT: err = -22
> > m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
> > m25p80 spi0.0: SR = 00000000
> > m25p80 spi0.0: CR = 00000002
> > m25p80 spi0.0: Erase Error occurred
> > m25p80 spi0.0: timeout while writing SR, ret = -5
> > m25p80 spi0.0: SR = 000000ff
> > m25p80 spi0.0: CR = 000000ff
>
> ff can mean that the lines are "in air", maybe the flash resets when we
> write_sr(nor, 0)? How about adding a delay here to let the flash reset?

No difference after adding msleep(1000).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
