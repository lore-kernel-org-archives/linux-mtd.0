Return-Path: <SRS0=2SY/=L4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A15C07E96
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 13:12:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A73613E0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 13:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A73613E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLhdhFWXc975w2qgcn4jsqhfdbEsymN1Pho4cAA+fYc=; b=dwNVI7X0hoe0vI
	jB84yXRk6gm52lm87Tsc9vvfhnOkTbJnjHqrkju0vJ9/SwEjwz+EAc76yBKqaqdujyyxCr2TFo5ER
	+Lg6Lh2Qz8toX1sF7v+9gUNwdJLuHz+NX1czgmkKV1QtGHzBvlLSCQvYPh9yiWC1cVIU42HDAlyQ7
	HGQCxvxRUHidQL+joxB/fEyPUyoexDKRUduTDd6whVFmOP4zuCP6QmJeS04HzzycxvyZ4KwX1ptQn
	WmFw9oxbd9iA0SlGjwPk3XCYytEMkf/g8lU2NEJE/87AvGaGSq1UYZH++s7El1z6bYlLN9l1kOEl8
	j8RsvqqCUbTvkTkY3ggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m01ud-006Jxr-1b; Sun, 04 Jul 2021 13:11:55 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m01uS-006JxI-RZ
 for linux-mtd@lists.infradead.org; Sun, 04 Jul 2021 13:11:49 +0000
Received: by mail-io1-xd2a.google.com with SMTP id d9so17740683ioo.2
 for <linux-mtd@lists.infradead.org>; Sun, 04 Jul 2021 06:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltZfcnv7zjBzhLuy2wtkFjj0deEQAsc34s3M9eVqMLQ=;
 b=YB2qWASrdgNKTTmSn8bqcIKfLlZJwSdfb13x/wrnPOYX9qgdF9cTRzd3XhDoaaGuLp
 G0/JPvzHG05R2XfCSZVwnnzU2vg75e1LITrrdTMR2IRu0VXJAWWc/AxVdbJ/8YnH55mU
 vAgSw5LARwZ2BVlzKgWw5chSMejpQeYsOda3AmNUcRx7WbATtWgz+GoBDt7qfHszZ67v
 XuSGGZL4vQmg0KGTbo5QhNfgr+Yx24ssB7uPtYB5p7xa/lJpn8j1vTNfuNuvIqLCNpsa
 DtT2ya2ZUT4dt0J807xFIV03btYx65nzPo14fbL+e/DodChW/ft82jAI21C5+vK7SLBi
 2U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltZfcnv7zjBzhLuy2wtkFjj0deEQAsc34s3M9eVqMLQ=;
 b=NBDp6Xze/fSgwq2PcmrW3y0kT4pa+w8iOqrYvRZ5HIxYyUAn6n4k/t87cekgDuBHP6
 H2fGUQbCAZp2yFfldkUBKuo+DAyK3qeoprF+hTrxG4mJr7yms9eG5lPwlrLiJDAZVOIB
 htLYEllyK+iheJLHXBMi7U9FnrtPgd1qC77ONUay/QuRCg5vqiQTCIUNhd9eC+2jL4UZ
 BoPPU80/lhlDJeErSwRvnnVNy+ZYfuf1L3mTyI0FDAWMm9p6f3/ml9EQ/eiUqkFBVjuY
 mAEOFasPkLVPHqMSxlgvN/eqAvOwYtuxetl7x1Q1U39xZpkpvaCbJK2P56+vaK9I43mj
 o8kQ==
X-Gm-Message-State: AOAM532x4SdaUK+zTE49ssyq7PGuxuzDX/h/5mjOm9voOvyC90o05+vH
 4h771jdABOzH/rRYSTZfrIYdgPRSGt8qkQTadtc=
X-Google-Smtp-Source: ABdhPJy+E88ajI1FYnFLijs38oDixPZlVVVW4US6zXG387Zgxq3Z2FnlyW1hwjZzEso8rxBEzIGTkal4VuxDIsQFYHU=
X-Received: by 2002:a05:6638:32aa:: with SMTP id
 f42mr7962655jav.67.1625404303066; 
 Sun, 04 Jul 2021 06:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-2-tudor.ambarus@microchip.com>
In-Reply-To: <20210702144110.250481-2-tudor.ambarus@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 4 Jul 2021 15:11:32 +0200
Message-ID: <CAEyMn7YzOVbNnctKZ-ZLkxm=diqZSPYJkgH+806e-_ETPHbsbg@mail.gmail.com>
Subject: Re: [PATCH 1/7] mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Michael Walle <michael@walle.cc>, vigneshr@ti.com, p.yadav@ti.com,
 figgyc@figgyc.uk, 
 mail@david-bauer.net, linux@rasmusvillemoes.dk, esben@geanix.com, 
 knaerzche@gmail.com, code@reto-schneider.ch, zhengxunli@mxic.com.tw, 
 jaimeliao@mxic.com.tw, macromorgan@hotmail.com, sr@denx.de, 
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_061144_958572_FEFBCD6D 
X-CRM114-Status: GOOD (  27.15  )
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

Hi Tudor,

Am Fr., 2. Juli 2021 um 16:41 Uhr schrieb Tudor Ambarus
<tudor.ambarus@microchip.com>:
>
> SPI NOR flashes that statically declare one of the
> SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags, and do not support
> the RDSFDP command, are gratuiously receiving the RDSFDP command,
> in the attempt of parsing the SFDP tables. It is not desirable to issue
> comands that are not supported, so introduce a flag to help on this
> situation.
>
> New flash additions that support the SFDP standard should be declared
> using SPI_NOR_PARSE_SFDP. Support that can be discovered when parsing
> SFDP should not be duplicated by explicit flags at flash declaration.
> All the flash parameters will be discovered when parsing SFDP.
> Sometimes manufacturers wrongly define some fields in the SFDP tables.
> If that's the case, SFDP data can be ammended with the fixups() hooks.
> It is not common, but if the SFDP tables are entirely wrong, and it
> does not worth the hassle to tweak the SFDP parameters by using the
> fixups hooks, or if the flash does not define the SFDP tables at all,
> then statically init the flash with the SPI_NOR_SKIP_SFDP flag and
> specify the reset of flash capabilities with the flash info flags.
>
> With time, we want to convert all flashes to SPI_NOR_PARSE_SFDP and
> stop triggering the SFDP parsing with the
> SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
> SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easy achievable, the reset
> are a long term goal.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  drivers/mtd/spi-nor/core.h | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cc08bd707378..3d9f3698fb7b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2726,7 +2726,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>
>         spi_nor_manufacturer_init_params(nor);
>
> -       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +       if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
> +                                SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                                  SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>                 spi_nor_sfdp_init_params(nor);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 3348e1dd1445..55fceb0ec894 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -382,6 +382,10 @@ struct flash_info {
>                                          * protection bits. Usually these will
>                                          * power-up in a write-protected state.
>                                          */
> +#define SPI_NOR_PARSE_SFDP     BIT(23) /*
> +                                        * Flash initialized based on the SFDP
> +                                        * tables.
> +                                        */
>
>         const struct spi_nor_otp_organization otp_org;
>

Thank you

--
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
