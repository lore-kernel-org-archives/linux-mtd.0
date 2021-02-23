Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFBBC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 13:07:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF8664E68
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 13:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF8664E68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s2SJB1UZOycghtvugLkaaRT3QHmcFsJIDGhMWjvQKZw=; b=sPPgN6f/49yI4zJXMyQyZvptJ
	akD9mfhLp/PSHZ7P8a8HKGk4QSq0htu3IzRfb1RMWr2bEDZmjmQhuTImzDNDclYwxhyOf36E7KW/j
	m76eUdN40KNrsnoeG8TCXVmnv4SxJJlId4iR3bDqdQo8/9gpOnkhF1bI0hKGdGib88RmI2EHh0cKv
	ngxQIFQPJSgMf1t7NMeEIaF2J8eAIc6EfFPipUwd9QKm1HdL+T6oa7HBifdcrRBSfypBHb0+vhuoW
	sWUSxgogdS7N+Mxj8ypeWONpVYqFQi+FqPy+HrJpmbwLy4uGbnwEyOupozuO7JzaiffBwlG0TtANJ
	wF0ypUPrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEXOc-0004bH-FP; Tue, 23 Feb 2021 13:06:34 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEXOY-0004au-Kz
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 13:06:32 +0000
Received: by mail-pf1-x434.google.com with SMTP id 201so5631036pfw.5
 for <linux-mtd@lists.infradead.org>; Tue, 23 Feb 2021 05:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i+wBTCcIbfZfSD3todczvayfE0aGhQO6fU9sW+g75IA=;
 b=yreT7+PC6fAf+/9WCV1ZX5tTKnMf7vOg3Wfw50F3svCS3RJB73ZaWHfBxHIPpa0SrK
 mGyVWvv2CNR23WwG/tUpWjIbkNJy9YvK/3YThKvbJd8uIwqWjPzJI971vEJhHh2bIUvP
 hPdgzO4LVKO9LXAvGLaXUa99mJtG9UCdAztByUog5MrxZwnQNgJeQiJc8/YTwfunX0sH
 CSZ30QeW4fL/psc3kgvPU8HXdlCM+KWfuQDI1ajDOw05jk2FxC1VYvHAjK5WYotYAGwL
 /gKoIeMoXZ53RFPO554IZKWVQ9QCr9XnHZmtPRIv7neLbf1VyoVzBpoKdFiTFhRRKd5B
 6ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i+wBTCcIbfZfSD3todczvayfE0aGhQO6fU9sW+g75IA=;
 b=GedcjGyjP0eZkIKevbF89kKjXKN9rE1R8X6mSsEleIib/IDUThsnmoWNjj/j/2e0xF
 ZpnzAeBKx0oScdzkmWYdF5Iao5NmuRgSpsUg+AqBU69y7y0ESRSIZ9ByY9RpG7yR/F0f
 i75Dyc5suz2UwCkXdus+V30K5fpl3tIlELhBaZi+Zxa28GCDAh/8UT6RLg0Iyz9M7Dcg
 PKJpSKg2l6ryzUCleQSlYOybmfqweTC0F9uRikSbpVYDzXFcsxwXNptsxjE07aSp9L+H
 rmf1CSIipqb1vDLAPCbGsmoHBXQIgAdsT01VzPZ9OrYreoGeZ7f7K0s27JzjGSNmZLVC
 R8Xw==
X-Gm-Message-State: AOAM533VCDbvRVO2sTKQDsdsAoLK4au2YUR4MCpJ/4l9nIIwm6/lwGkx
 f8GWncXFBqSzhAS28+8Ty9s5
X-Google-Smtp-Source: ABdhPJzaVaZNGpIyJD7PJ/eOlnnt9uigVCifJJtWf7qkPXLSIImurvYMokByKJpe9oiZLEMKTYLYUw==
X-Received: by 2002:a63:5f44:: with SMTP id t65mr19858081pgb.321.1614085587977; 
 Tue, 23 Feb 2021 05:06:27 -0800 (PST)
Received: from work ([103.66.79.25])
 by smtp.gmail.com with ESMTPSA id n4sm22339671pgg.68.2021.02.23.05.06.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Feb 2021 05:06:27 -0800 (PST)
Date: Tue, 23 Feb 2021 18:36:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] mtd: parsers: extend Qcom SMEM parser to SPI flash
Message-ID: <20210223130624.GB9724@work>
References: <7f558e888a41c5b1fd4ca0427b3976531c51a876.1614080824.git.baruch@tkos.co.il>
 <20210223120717.GA9724@work> <875z2jj7xe.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875z2jj7xe.fsf@tarshish>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_080631_035024_A7E7B961 
X-CRM114-Status: GOOD (  24.77  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 23, 2021 at 02:16:29PM +0200, Baruch Siach wrote:
> Hi Manivannan,
> 
> On Tue, Feb 23 2021, Manivannan Sadhasivam wrote:
> > On Tue, Feb 23, 2021 at 01:47:04PM +0200, Baruch Siach wrote:
> >> The Qcom MIBIB partition might be stored on SPI flash devices, and the
> >> parser works in this case just as well:
> >
> > Nice!
> >
> >> [    1.404229] spi_qup 78b5000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
> >> [    1.408078] spi-nor spi0.0: found mx25u6435f, expected n25q128a11
> >> [    1.415016] spi-nor spi0.0: mx25u6435f (8192 Kbytes)
> >> [    1.420756] 12 qcomsmem partitions found on MTD device spi0.0
> >> [    1.425739] Creating 12 MTD partitions on "spi0.0":
> >> [    1.431381] 0x000000000000-0x00000000c000 : "0:sbl1"
> >> [    1.437058] 0x00000000c000-0x00000000d000 : "0:mibib"
> >> [    1.442143] 0x00000000d000-0x000000027000 : "0:qsee"
> >> [    1.447057] 0x000000027000-0x000000028000 : "0:devcfg"
> >> [    1.452088] 0x000000028000-0x00000002a000 : "0:rpm"
> >> [    1.457065] 0x00000002a000-0x00000002b000 : "0:cdt"
> >> [    1.461832] 0x00000002b000-0x00000002c000 : "0:appsblenv"
> >> [    1.466736] 0x00000002c000-0x000000036000 : "0:appsbl"
> >> [    1.472248] 0x000000036000-0x00000003a000 : "0:art"
> >> [    1.477297] 0x00000003a000-0x00000003e000 : "config"
> >> [    1.482047] 0x00000003e000-0x00000004e000 : "data"
> >> [    1.487257] 0x00000004e000-0x000000200000 : "0:hlos"
> >> 
> >> Remove dependency on MTD_NAND_QCOM. Update the Kconfig prompt and help
> >> text accordingly.
> >> 
> >> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >> ---
> >>  drivers/mtd/parsers/Kconfig | 5 ++---
> >>  1 file changed, 2 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> >> index d90c30229052..96d5716db544 100644
> >> --- a/drivers/mtd/parsers/Kconfig
> >> +++ b/drivers/mtd/parsers/Kconfig
> >> @@ -162,9 +162,8 @@ config MTD_REDBOOT_PARTS_READONLY
> >>  endif # MTD_REDBOOT_PARTS
> >>  
> >>  config MTD_QCOMSMEM_PARTS
> >> -	tristate "Qualcomm SMEM NAND flash partition parser"
> >> -	depends on MTD_NAND_QCOM || COMPILE_TEST
> >
> > Can we keep COMPILE_TEST below?
> 
> The code will not build without QCOM_SMEM, I believe.
> 

Doh! You're right. Please ignore my comment.

Thanks,
Mani

> Thanks for your review,
> baruch
> 
> > With that,
> >
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Thanks,
> > Mani
> >
> >> +	tristate "Qualcomm SMEM flash partition parser"
> >>  	depends on QCOM_SMEM
> >>  	help
> >>  	  This provides support for parsing partitions from Shared Memory (SMEM)
> >> -	  for NAND flash on Qualcomm platforms.
> >> +	  for NAND and SPI flash on Qualcomm platforms.
> >> -- 
> >> 2.30.0
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
