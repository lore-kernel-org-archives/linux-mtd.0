Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5102C3A59E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 09:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C682070B
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 09:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A1J2roDp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov4DmxlB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C682070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lp42hcI8iW8M/JO/h1Q/2m7sUneyJosKq4q3HzCIe3I=; b=A1J2roDp/l+rPD
	PcWtcmEWDj0TA1Yk/DrrD3N6DLIelLOO3Xuh1p7C24rGB8OmHOJSfMD6sL2EPfydcY+8AN0zoVd7H
	ctBFUkN9zVWA6nBYFGbnVqxUcsyPQ5dlaRL7i3ShdLpBPsMwrigO3ho/I0I2mz7t6NYor2pTOUAx6
	BUf4vqpW3qv4x++KzqX3asILqoOC845urIgkwWcTnYbJMODlopyo8cdASdmkOqCijbxdWyKzg9nJP
	/l0MUK/oZRAF24pgKqV2jCrpQzgUkTziAneTry2Ih9H29r3GXbueG7AB8eovE7BtRzgFbv5BhnkSZ
	JIvt4n3TCFMbpIXgZxKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2BdO-0007FL-4H; Mon, 26 Aug 2019 09:49:58 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2BdL-0007Co-5m; Mon, 26 Aug 2019 09:49:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id z1so14642426wru.13;
 Mon, 26 Aug 2019 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dRJggX7YIR4Be7LdvQ6FETMjFuA1o4T1Bifqrd91O8w=;
 b=Ov4DmxlBukVF49VNclkW4aC22NS730ye9Gw42K0t0pO1pjDRc/khSQoDy5QnfTOdl8
 iI4NE/0Qi8tV1a1eKvj9YCPW976qk/a3ANHh4l/JQmqW7yzp83yQcM/XlGz7F3UeHjQn
 PKAy41MGB2eD8c7ypk2gevobgKIeZjE4JjkE8A6DUn2Saxo+96+Cf9DmEJGe88/i1G3+
 5AitmlfO36eb+lKmNxhmfkMKSza61HD63veVI6bygNNbm3H++f/poHu+hl2Zm05XeKAK
 WRnUEsgzgwzIEazTHZWFXV5m1C5oGncvj1j20IQ5pADEgohoAgFgA1jsIjmC0dchsLKz
 j6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dRJggX7YIR4Be7LdvQ6FETMjFuA1o4T1Bifqrd91O8w=;
 b=JoMPOnpB2P3u9HZ0xkOpAZ2nhoHInYNOSF1bv7vjnHJbsIUq9gwapt1L66/9A7SYNy
 TJSUvcSbV1XarH8pWkUCaOxRYG7Wiq5f6ECIwokgcoTK06P4raPk1Yxo8AZn+BaXW7Oa
 rSD3k3Dcyci9Jr5CdYYa/km73+4fcWNJldNcu+3y/v5PwWGxnDT5p95kLMXlNXkLLb9h
 BJQJES5kA0Kax4UIGjoaTiu+CgesEcXGMUNA5ieFGCanJ6Dq8XxpFuF+HMT9zz6QNf01
 oOlkK8i8DK9/cjLn8FP705mH7fY3dwxM+tF8VpOxGgUO01M1fjbtY4BF4s6GxWAYWuTT
 m9WQ==
X-Gm-Message-State: APjAAAVEsPqCiiCyY3d2BgPM41jCcO5rjNSJgJRfMEzFurtWBfQo6zd6
 AaSwDz62OytKZ22KP0zNFn1N4ctP8ckAQoyHMyA=
X-Google-Smtp-Source: APXvYqyP94sNCqmjuVfA73Ep3VyTRiU2sKL2YtThnnM2sGDiG0z+2syRZB4fLuTD+atX0WlgXOTl5YFu2TfY5IifZgE=
X-Received: by 2002:adf:a2cd:: with SMTP id t13mr20003170wra.251.1566812993586; 
 Mon, 26 Aug 2019 02:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <1565699895-4770-1-git-send-email-sagar.kadam@sifive.com>
 <1565699895-4770-2-git-send-email-sagar.kadam@sifive.com>
In-Reply-To: <1565699895-4770-2-git-send-email-sagar.kadam@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Aug 2019 17:49:42 +0800
Message-ID: <CAEUhbmU6xHjUWK3iM_RqURHGuqgmSxQw6RtWthT4+2aL1xLDcA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] mtd: spi-nor: add support for is25wp256
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_024955_220665_14516323 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vignesh R <vigneshr@ti.com>,
 tudor.ambarus@microchip.com, Richard Weinberger <richard@nod.at>,
 Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 13, 2019 at 8:40 PM Sagar Shrikant Kadam
<sagar.kadam@sifive.com> wrote:
>
> Update spi_nor_id table for is25wp256 (32MB) device from ISSI,
> present on HiFive Unleashed dev board (Rev: A00).
>
> Set method to enable quad mode for ISSI device in flash parameters
> table.
>
> Based on code originally written by Wesley Terpstra <wesley@sifive.com>
> and/or Palmer Dabbelt <palmer@sifive.com>
> https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b
>
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 9 ++++++++-
>  include/linux/mtd/spi-nor.h   | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03cc788..6635127 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1946,7 +1946,10 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
>                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -
> +       { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,

The sector number should be 512, not 1024.

> +                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                       SPI_NOR_4B_OPCODES)
> +       },
>         /* Macronix */
>         { "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
>         { "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
> @@ -3776,6 +3779,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
>                 case SNOR_MFR_ST:
>                 case SNOR_MFR_MICRON:
>                         break;
> +               case SNOR_MFR_ISSI:
> +                       params->quad_enable = macronix_quad_enable;
> +                       break;
> +
>
>                 default:
>                         /* Kept only for backward compatibility purpose. */
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 9f57cdf..5d6583e 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -21,6 +21,7 @@
>  #define SNOR_MFR_INTEL         CFI_MFR_INTEL
>  #define SNOR_MFR_ST            CFI_MFR_ST      /* ST Micro */
>  #define SNOR_MFR_MICRON                CFI_MFR_MICRON  /* Micron */
> +#define SNOR_MFR_ISSI          0x9d            /* ISSI */
>  #define SNOR_MFR_MACRONIX      CFI_MFR_MACRONIX
>  #define SNOR_MFR_SPANSION      CFI_MFR_AMD
>  #define SNOR_MFR_SST           CFI_MFR_SST

Regards,
Bin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
