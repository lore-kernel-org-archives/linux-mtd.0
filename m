Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC86C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:16:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF9560235
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EF9560235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dJr8BNgSQe2o3ajlBo84mDS31iStFkrZnEEtFm2u+Lg=; b=rR5JA5PTKgQ8u/aFRZcGwO+Pq
	9R3+7jYIoTOinVWqF3SwQReMKCo+09PnsN4+if9yuaEa2/TkFESfUjrM8TU654BcWfovDlUK5yUkA
	7XVOTEOtAICZUZFU/mZRJddFGMDdEpMlXQHZX4IYwXzne06F2gF1gmuSxu/kD7JTo6RJuOKG+Ll9z
	SpjmOFnNmJ5U7euSE8QgGZNn9WSJz4XSXqnRbECTQAvn3J5I3zC+08lGMYb/LIbzyaQj7Q0mDxJqG
	mtZROoh7umGDOr4sxtpSPw2IOATWHHkDcH9DPFDJ7nmWyyE/GCVz4GniC+Q63A33/DXPeEYd9BpSj
	SZTqp3w1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCgLP-0001cK-MJ; Thu, 18 Feb 2021 10:15:35 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCgLN-0001bc-6f
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 10:15:34 +0000
Received: by mail-il1-x12e.google.com with SMTP id p15so974145ilq.8
 for <linux-mtd@lists.infradead.org>; Thu, 18 Feb 2021 02:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wa41ZICrh6GVYznxkRauzUNlcVZfyWoSG7mn2YEifxI=;
 b=WRTS8WOwy9/EH6XN+YT5h3nVd0f7jcNq0TI/jVeVYimMycTcihAIIcd0515+3zsHk7
 VQBfHLKnDAoDQATcnocUlAWs05qvgJpJGvZK3a9KbagUz6T1LY+L1jSevFjN47fg70l0
 vAiStIz6wkI45fzokMDIwnRIzekXiugJRv4boRfk8wrzeEW1MYwPhdnggmocNOBmVfES
 bbnxAAGAKx6TsGCluTpu2z3KNxZl96+/ghBskwD2C95UYk5D4AUT+cY6dFa3/YWagk7c
 EvRVpMy28GgU3NGSNgUMimh0XgR2/AM4GVHUpfJhdqrNs9mUnBgX8pwX1nFnXJwY0WtH
 4E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wa41ZICrh6GVYznxkRauzUNlcVZfyWoSG7mn2YEifxI=;
 b=HErn4Vtj91gcK0paqWI2HmogDXON5HBARzaqHO2zHptIoWtUA0JBSLt1a9dR7Oscma
 anLpOaeFox1rW1WwEkP3QXR8Y69Rtb+vXpN+XhtIiDE3877t1tHnVjNOnY7P36wa14p6
 BvFdzK0QYpkBvR9pOeiEDMOtamH4Wj/bY1HST4RkXsQo7QEdHVosfgKCHAjdRk2KbhB7
 ronSyeIVoyTIjg0FQX6xkwH2ubsXc6dZ+MxIN/4yTVo1Z+eKFPs1QcBPnrDPB5/dtQrY
 SJ2mJfKbDprLV/Epb4HKqlzqz7tswbEKgasnXWQyvhr3y61p2P5Bsjz/HKmTR3lQqnYI
 0apg==
X-Gm-Message-State: AOAM532sTtLkHgC7uOkqM4zPY/1eRe7rbZ0AeQFxx0WK3k1UehChHe6x
 Q5zDWDkNMnSrtmReadSClBu8fL+zUvrNIcjnpNM=
X-Google-Smtp-Source: ABdhPJy+ekj/ToABNocprxtoY40NolXL6NXX880ogflNNvt9Y0TplyZPUN5jJD050SnyiU/KSByY3if7BHnNDBADGlc=
X-Received: by 2002:a05:6e02:48d:: with SMTP id
 b13mr3001318ils.98.1613643331444; 
 Thu, 18 Feb 2021 02:15:31 -0800 (PST)
MIME-Version: 1.0
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
In-Reply-To: <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 18 Feb 2021 11:15:20 +0100
Message-ID: <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_051533_305039_8B26F5FB 
X-CRM114-Status: GOOD (  22.02  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

[...]

> >> Thinking loud, now we do a static initialization of flash params, that
> >> can be overwritten dynamically by SFDP. How about doing the params init
> >> the other way around. Try first to dynamically discover the params via
> >> SFDP, and if SFDP fails or if it is not defined, do the static init via
> >> flags. That would spare some code. And new flash IDs will have less flags
> >> declared, and we'll better track faulty SFDP flashes.
> >
> > I am a newbie but it sounds reasonable. I made a first attempt and
>
> Let's first see if all parties find the idea good (I'll have to double check
> it myself). Vignesh and others might help.
>
> Until then can you try the patch form below and see if you can do the
> reads in quad mode?
>
> Cheers,
> ta
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..718d0b75df91 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3099,7 +3099,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>         spi_nor_manufacturer_init_params(nor);
>
>         if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
> +                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
> +                                SPI_NOR_AIM_SFDP)) &&
>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>                 spi_nor_sfdp_init_params(nor);
>
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..3495549815e6 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -338,6 +338,11 @@ struct flash_info {
>                                          * protection bits. Usually these will
>                                          * power-up in a write-protected state.
>                                          */
> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
> +                                        * that share the same JEDEC-ID, but
> +                                        * where a flash defines the SFDP tables
> +                                        * and the other doesn't.
> +                                        */
>
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 9203abaac229..1ebce775eae4 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>                               SECT_4K | SPI_NOR_DUAL_READ |

I tried your patch and it works like expected. I can now read the
whole flash in ~2sec while without that it was ~6sec.

# time dd if=/dev/mtd0 of=dump.bin
32768+0 records in
32768+0 records out
real 0m 2.08s
user 0m 0.01s
sys 0m 2.06s

vs.

# time dd if=/dev/mtd0 of=dump.bin
32768+0 records in
32768+0 records out
real 0m 6.16s
user 0m 0.05s
sys 0m 6.09s


Should I prepare a patch with that change or will you do?

Thank you

-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
