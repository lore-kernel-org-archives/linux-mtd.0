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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C702AC07E95
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 13:12:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86127613D1
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 13:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86127613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1bpB46sQcnM4LUvZXlNJVKPG4yfnOk/gZdNzsteTJM=; b=NM/G8W/q8MgISf
	Zk8ipBYkjFQZWltb3rI9BhPkEAMIVDOmXf78zB3VjPUFgzBYQBJdoRa4tH2QuZfA4ykxQj8Kv8sI7
	+a4ANzvHkrWNSHw7VwEBBsWOr0NhEUYUyX77uBTfB8Ayw40/C42hzW1PDAMQe2P2I/RehTjOsAmDX
	EJeCHkMZCxyvRPLp6SguJoVvfy5wV5EfAnX7gE191G4WkrIeRtJAy8riwqMfMOigSlaHXy/w4k2Q0
	4QHq5k0EPBLRK/HlZ/hrJfNQuGEvN43p+rGn0F5lSU/OngZyay2Is9nxuCo8oSFPr6hCMd5Z9nbvi
	zIA6l6+DOmCI1+tXL5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m01uq-006Jyw-56; Sun, 04 Jul 2021 13:12:08 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m01uY-006JxX-G5
 for linux-mtd@lists.infradead.org; Sun, 04 Jul 2021 13:11:53 +0000
Received: by mail-io1-xd2b.google.com with SMTP id g22so17810174iom.1
 for <linux-mtd@lists.infradead.org>; Sun, 04 Jul 2021 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+aLU8SmvFa0r/YfHq2DOTna5+0c44Fr6DNbbPPajh4=;
 b=UlZ8VUDW9Lvhn9PH3dqyjq7PE93tniOUZ/kXgSMJ8IF9SHeNIFGb0NookS6qHbSXbp
 mHzYXSOq0YBv9i+ietBIQkD32A08UFlroj8TrTVKZ2mnf9xVE6GmQa/xMN8n+qWcsbzv
 f5cBseP25TdXOodIMqGNpKz7nEKsqBb35VVehiFFZUrI3Kp4CTgRS4tzBKVpYCSsnzlX
 LeVnAMbQA7pbqEFRDyoHfheemHlR56ho4T8waGO+ndiDn6vqrgIpK8TYH2a15Zc560If
 JYgaUljpaw6iXLkwHt3WFB7lh/2JsrAfwrxuiP5dYxOH675lHfcvMVZClKv83IVqwJMy
 GREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+aLU8SmvFa0r/YfHq2DOTna5+0c44Fr6DNbbPPajh4=;
 b=JZOjhQmYhTQMlHoZVVRtaeb+CUtTPZhHlajv/1xQD4ZjtgubnvG3+SzYVmTUtqKr0L
 U4VkLl/SGtOsFyeOnhDGHdzPe1rxVoYHcmUJeHUKvx6x4Zb6ybJcIu5Oabf5UtsAUwXa
 eBngVRWD8JHtOzUXxKU1AeX8BQgjm/75H2r4esu5R4xwr3wYVIrd2YzfmHmZax+0uCoU
 OwKDXb6bm6qs7vMMfDJhkzCBrsZjOvP0d21Yb+/JmkQ8XbasCJdIySrdYc9zjo+XV+dz
 2Fc+IgOpTe61z1tFcMSX0l21owAgxGDTZgJ3EYK5duiJe9tur4xlLrnlIP3Rgzyos2cq
 8Wpw==
X-Gm-Message-State: AOAM530k9HpqQOiqjDDYQ6xkyqo18HWEZ1J2YBEG9uFvym32p1SqwOTu
 QV5yfyC7OajtmMu4YD1RgyXCO8XS908bDciL8bA=
X-Google-Smtp-Source: ABdhPJxTdgofA3QZLtq5T7WODv1eKu1prPOKj/BCrdvHBK0iXJfUWCEcsXV13pG7qbKlH671S4Rh4Azv188CYSe9v/I=
X-Received: by 2002:a6b:d20c:: with SMTP id q12mr7653029iob.59.1625404308751; 
 Sun, 04 Jul 2021 06:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-3-tudor.ambarus@microchip.com>
In-Reply-To: <20210702144110.250481-3-tudor.ambarus@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 4 Jul 2021 15:11:37 +0200
Message-ID: <CAEyMn7ZMV9zc_S7DFCV++hw-UU7kQfmZfWRNYb84SVa1mepshg@mail.gmail.com>
Subject: Re: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of ID
 collisions
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Michael Walle <michael@walle.cc>, vigneshr@ti.com, p.yadav@ti.com,
 figgyc@figgyc.uk, 
 mail@david-bauer.net, linux@rasmusvillemoes.dk, esben@geanix.com, 
 knaerzche@gmail.com, code@reto-schneider.ch, zhengxunli@mxic.com.tw, 
 jaimeliao@mxic.com.tw, macromorgan@hotmail.com, sr@denx.de, 
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_061150_578393_88505278 
X-CRM114-Status: GOOD (  21.67  )
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
> Provide a way to report the correct flash name in case of ID collisions.
> There will be a single flash_info entry when flash IDs collide, and the
> differentiation between the flash types will be made at runtime
> if possible.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  drivers/mtd/spi-nor/core.c  | 5 ++++-
>  include/linux/mtd/spi-nor.h | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3d9f3698fb7b..d528e28995c6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3208,7 +3208,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>         /* Configure OTP parameters and ops */
>         spi_nor_otp_init(nor);
>
> -       dev_info(dev, "%s (%lld Kbytes)\n", info->name,
> +       if (!nor->name)
> +               nor->name = info->name;
> +
> +       dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
>                         (long long)mtd->size >> 10);
>
>         dev_dbg(dev,
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index f67457748ed8..bd92acdd1899 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -369,6 +369,7 @@ struct spi_nor_flash_parameter;
>   * @bouncebuf:         bounce buffer used when the buffer passed by the MTD
>   *                      layer is not DMA-able
>   * @bouncebuf_size:    size of the bounce buffer
> + * @name:              used to point to correct name in case of ID collisions.
>   * @info:              SPI NOR part JEDEC MFR ID and other info
>   * @manufacturer:      SPI NOR manufacturer
>   * @page_size:         the page size of the SPI NOR
> @@ -399,6 +400,7 @@ struct spi_nor {
>         struct spi_mem          *spimem;
>         u8                      *bouncebuf;
>         size_t                  bouncebuf_size;
> +       const char *name;
>         const struct flash_info *info;
>         const struct spi_nor_manufacturer *manufacturer;
>         u32                     page_size;

Thank you


--
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
