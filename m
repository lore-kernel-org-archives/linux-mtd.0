Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE04C43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 17:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 609132173E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 17:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V5SjLpi9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jv7DxdnV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 609132173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/O9wUShqNcfPL7MxnxrQt4eVpi8gm9vYzSB3n6mZhk=; b=V5SjLpi9tI7bmH
	lLlPHocZAmxt4d28AO/Xt8pip/balpcCcZT/6gxr8vOHfYObtOygu3nUo7TefaMJ3imVu75O9ZpcX
	JeylgN0iegSMHzIW6XWxwnKA/6Whd9AkjZThZAiRK4RhOKWbbzz0DyXS4xMhLL3DbPqiNvYOY1XbS
	upBqvDXZuOhimGyLNJla8Y/LOe1HX2BgsZunKmysyj1yeXISaQkAt8b0E4m6tUoPNEktGrpVdRddu
	h0aaoXArkCjZ8QH84ZWOaVIdphiTaBR/cakrxPDbhho97DXE/WgiF54rL4AO1lCzLAWQXqLaO/GPQ
	yX4i9JTqY0WRV/WQtUjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLWAj-0003Vy-NI; Tue, 30 Apr 2019 17:04:01 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLWAh-0003Tt-3I
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 17:04:00 +0000
Received: by mail-io1-xd41.google.com with SMTP id a23so12882741iot.4
 for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2019 10:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=etJ1WR4qO+3IuPfLuVdMXPbV+XDBvAU6tcECrR4xCrc=;
 b=jv7DxdnVudtPMbDXxMEw/GM6NMPqoYoCohNeCzcb2ZSDFyhwR53p8yt5rztmB+SlAf
 /6HkkM1OGFkTHmp6HqKcBGui9wGjTtcdnfFajTPjETmcuAIhe9NUW0xK/jTAi7NKtmHI
 lL2AftBMEwQCtNz7CwfBTolnOwMRZxouvJvbRP9iDJKEwDZbq+agZE/edhY16NycGWzf
 D0zkdHg9jEo/1wZ4p2aGffpsSAtgX6TsX+Vd0um8aKmDQ3T9FoNbSkve4NsttbhxTaq4
 o5LzkTsG3l9hA0mHJxLmZ2vDRt2nqULQ71SsYLA1yapsTMA5oOJoYFdsY9wZ06I3p7yQ
 /tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=etJ1WR4qO+3IuPfLuVdMXPbV+XDBvAU6tcECrR4xCrc=;
 b=cXYKBEUvWdAR0od+JCv54QHP9jFHO7CGuUrJU0jOmrsSM9sVR0/5EC8U7XeOE0yDM3
 MotEbWWCuDI8313QTNgq0s45c+XQ4Rj78/MLs5Toq/5d+levoQGIx0U+CDNskT+keQlU
 f1d8jVU5sfLNM3khw0SrbY295/zs3VR3JYOPM8e09fjNSUwTyoHXQdyzSHBl2IKg53So
 prJt10sj7v+l6B0y0mMrZgZaCG5ZSf8z7zwnAtvlG06A9WDZWwPAOod6AYbOYamTY7pU
 Mg47zUhs/NmG75lqxYA0FZ1pac3Z241GyNOkqMdtPKUObQt4BAlL8QmyCd3ToDTnv73s
 R5vw==
X-Gm-Message-State: APjAAAUAh5APzrtOvZ5zc8egCCGV671Zkm8IhdWX/gVctWJ8g5V2HgEM
 Bb1aeE71eDdREsVZu+txTHA8mg==
X-Google-Smtp-Source: APXvYqwtQ6krzDTRPbFVrDov44ozx7k+PlhNoNgKqYFMwYfxTI/Usg4vUIfk12zixNg61hOvW70aRA==
X-Received: by 2002:a5e:9307:: with SMTP id k7mr16429275iom.155.1556643837925; 
 Tue, 30 Apr 2019 10:03:57 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id 12sm526406itm.2.2019.04.30.10.03.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 10:03:57 -0700 (PDT)
Date: Tue, 30 Apr 2019 10:03:56 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: add support for is25wp256
In-Reply-To: <1556474956-27786-2-git-send-email-sagar.kadam@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1904301002170.7063@viisi.sifive.com>
References: <1556474956-27786-1-git-send-email-sagar.kadam@sifive.com>
 <1556474956-27786-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_100359_146713_43995026 
X-CRM114-Status: GOOD (  17.88  )
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
Cc: palmer@sifive.com, bbrezillon@kernel.org, richard@nod.at,
 tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 28 Apr 2019, Sagar Shrikant Kadam wrote:

> Update spi_nor_id tablet for is25wp256 (32MB)device from ISSI,
> present on HiFive Unleashed dev board (Rev: A00).
> 
> Set method to enable quad mode for ISSI device in flash parameters
> table.

This patch was based on one originally written by Wes and/or Palmer: 
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

The right thing to do is to note this in the commit message.

> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
>  include/linux/mtd/spi-nor.h   |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index fae1474..c5408ed 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1834,6 +1834,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_4B_OPCODES)
> +	},
>  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> @@ -3650,6 +3654,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  		case SNOR_MFR_MACRONIX:
>  			params->quad_enable = macronix_quad_enable;
>  			break;
> +		case SNOR_MFR_ISSI:
> +			params->quad_enable = macronix_quad_enable;
> +			break;
> +
>  
>  		case SNOR_MFR_ST:
>  		case SNOR_MFR_MICRON:
> @@ -4127,7 +4135,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (nor->addr_width) {
> +	if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
>  		/* already configured from SFDP */
>  	} else if (info->addr_width) {
>  		nor->addr_width = info->addr_width;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3d360b..ff13297 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -19,6 +19,7 @@
>  #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
>  #define SNOR_MFR_GIGADEVICE	0xc8
>  #define SNOR_MFR_INTEL		CFI_MFR_INTEL
> +#define SNOR_MFR_ISSI		0x9d		/* ISSI */
>  #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
>  #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
>  #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
> -- 
> 1.9.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
