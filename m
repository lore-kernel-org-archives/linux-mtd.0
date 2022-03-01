Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F06C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqUk55FeS48ts3CNXzGCgSpuOx2lsTUQKEWt8cgvi3g=; b=dRgJC4HFRvR8I/
	DDpxdKXF3J6ZHhKVIPDvuQ606xXBsZzokwXYneoxRFJxHlZk98bfV8vo82kq+X2gqi1quSgjbtOZ5
	+vCf/+4V52BvNj4jVaM521qEECTegoAjBRHDQOb0vinRjLYWkKCxkRLzp+xmmu6a1faF9ih9hFy7Z
	lZ40XhG9BS40vySwznGW0q5SRBaiF1deUGs+EgWbJgupPjbKW8NJf89dG5pznSYqhP7nYuMlKhxjY
	WzDi6dQIqyHsXOpNzxqIYIbRqMNPFdJpv8wVin/L/0tPHtEEiuw7NhfTmJWOf7xZl7GcaXhT/FhxL
	wdIxx58Zcm0zGsVG2KSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxM0-00FQpV-Tn; Tue, 01 Mar 2022 07:55:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxLy-00FQo5-S6; Tue, 01 Mar 2022 07:55:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id n14so19016621wrq.7;
 Mon, 28 Feb 2022 23:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZYpRslZKPMhSJcOPPqFcGxqUDUyIQtArJWya3p8BbWs=;
 b=fH2aRnFdGr3GCkq9inL6Na2A4nWCUOgIZgXkX9yg4XaJF2dNbuYlXMi+R5jBCjrB4r
 aZZHXxrY3XappvhlENKH/HS96zNBjj1QV1aW6S1JnYBH+KBVlwiMfeB0x69QVmODUeMa
 bs8fV78ZAag97QLvqcVHGUc9KAx5jReMVs2by8c/ggCzfJVkMwvl/sFQoQqIGILgNaXU
 cf8hZ9tGa3j7yiADAfwXpV4enj1Qw+sTew0mvxdFGfTRb2sweGvr1Xp5OcpzKwaYESgS
 iXus6y2XXnp126sg06AB4YJPQRKa84PZq+4q5DjrTp6YH2gRparzu5hmAp3QjIbpYERT
 pK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZYpRslZKPMhSJcOPPqFcGxqUDUyIQtArJWya3p8BbWs=;
 b=q0wZLo+KI61YWGcXYyCMqB3S8xvc/X5oNam20FLxtRqKczHXwQdqszYPUl4ThQ2h/Q
 6xXfXvQWmDeprZGoe0TbnzDCDFY0A3uTPxrMXX5H5EMu9WFE+7/lcuast84VzOC5Z0qw
 LnJDPA4Dzmt78utmV0mUMOzj/Gl1tlfTMpx+6n+Tu7oZSdgCX8zB/2zGuxgU2KQK7J+f
 ou4VEhG6aOLEg2mjUIb8YpYp44gxa2u3NpIrH75c3KDA7iaySHFHt6g8eqjIdSVw5hhH
 ZLySeQy2e87UnGM1b4vODuTP42yuifOjSZDoqby812+0FlgDPFb88rY5b66f7jj2LIwe
 klnA==
X-Gm-Message-State: AOAM531FFLogseWrveM9lRUlOhe2q+D/m5DLdRE1UrPFLS+ywSNehj8H
 G2M/A7dmwAQNDNWPcUVcODtHtWz6d6HFfMB9PaM=
X-Google-Smtp-Source: ABdhPJwlEQNQQVoeJKl0hGRBdNZhz6Q3zuJ9HYjrKgr7hmp0SReXCmngTtRi2NwEEBuZKMSFxzChmnfNJrV7Vm5G8TI=
X-Received: by 2002:a5d:64ac:0:b0:1e7:1415:2548 with SMTP id
 m12-20020a5d64ac000000b001e714152548mr18778823wrp.267.1646121324940; Mon, 28
 Feb 2022 23:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-5-tudor.ambarus@microchip.com>
In-Reply-To: <20220228134505.203270-5-tudor.ambarus@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Mar 2022 08:55:13 +0100
Message-ID: <CAEyMn7Ynym+kMX6Mkj45UHw7LFXKRVMSHa31+NjmQYpD7es7rQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
To: Tudor Ambarus <tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_235526_943100_F716FEC1 
X-CRM114-Status: GOOD (  23.81  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 nicolas.ferre@microchip.com, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 macromorgan@hotmail.com, miquel.raynal@bootlin.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

Am Mo., 28. Feb. 2022 um 14:45 Uhr schrieb Tudor Ambarus
<tudor.ambarus@microchip.com>:
>
> Macronix has a bad habbit of reusing flash IDs. While MX25L12835F supports
> RDSFDP opcode, MX25L12805D does not. Given that it is unlikely that RDSFDP
> will cause any problems for the old MX25L12805D, differentiate between the
> two flashes by parsing SFDP.
>
> cc: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> # cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
> .0/spi-nor/sfdp | xxd -p
> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> ffffffffffff003600279df9c06485cbffffffffffff
>
>  drivers/mtd/spi-nor/macronix.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 2754bbef3d2e..45c2f2c50e56 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -26,6 +26,24 @@ static const struct spi_nor_fixups mx25l3205d_fixups = {
>         .post_bfpt = mx25l3205d_post_bfpt_fixups,
>  };
>
> +static int mx25l12805d_post_bfpt_fixups(struct spi_nor *nor,
> +                               const struct sfdp_parameter_header *bfpt_header,
> +                               const struct sfdp_bfpt *bfpt)
> +{
> +       /*
> +        * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
> +        * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
> +        * variant does not.
> +        */
> +       nor->name = "mx25l12835f";
> +
> +       return 0;
> +}
> +
> +static const struct spi_nor_fixups mx25l12805d_fixups = {
> +       .post_bfpt = mx25l12805d_post_bfpt_fixups,
> +};
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>                             const struct sfdp_parameter_header *bfpt_header,
> @@ -82,8 +100,11 @@ static const struct flash_info macronix_nor_parts[] = {
>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128)
>                 NO_SFDP_FLAGS(SECT_4K) },
>         { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256)
> +               /* ID collision with mx25l12835f. */
> +               PARSE_SFDP
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
> -               NO_SFDP_FLAGS(SECT_4K) },
> +               NO_SFDP_FLAGS(SECT_4K)
> +               .fixups = &mx25l12805d_fixups },
>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256) },
>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> --
> 2.25.1
>

I tried this patch and saw that the flash is no longer detected. I did
some debugging and see now that the correct function to set the quad
mode (spi_nor_sr1_bit6_quad_enable) is not called. Instead the
spi_nor_sr2_bit1_quad_enable() is invoked. Further debbuging showed me
that the macronix specific fixup is not called.

For the flash that does support SFDP parsing the
spi_nor_manufacturer_init_params() is not called. Is that expected to
be?

--
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
