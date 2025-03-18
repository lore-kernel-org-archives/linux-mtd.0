Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C66C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/M2hDUEE1gdqEZeROb6D7DbJcm/J1OMvv1NBkeqtE68=; b=EnKkdK8hFALwAO
	NEj9yZoFl1LZFdqN2psXpaqaSD07YAETVZvgLhdxDMkHRJ0C18ytNv1H5tWpzTwGNrVp1hFbnsUcr
	dNgvle5pZOhvgpsGuBbACr65aIF0iT6e+eWbQdGV81SK033lf4V6UCBIyey5IniXOi+8iIzsRhhKn
	E0JDvsZQkgW1UKtahPbx9xfiZp6fsQB6lAvLdDP/pUqTdvu1AvQkQbvLkx4xGyGTlcCGkaS+aNmrg
	hvfaGTLncRMFnEFSsBBStICqb78M17AYhX5OW4nk5GhMISnv4JNM1l6CzCvwHw8UoqxMrIbj+qAz/
	KJCUmeSP5a/bpSvkpwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQTV-00000004pVZ-37un;
	Tue, 18 Mar 2025 06:30:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQSg-00000004pPE-0WLg
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 06:30:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so19163655e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 23:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742279400; x=1742884200; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjlGvph9FbeHzoqEjT5wXcJBYP4G9CrB0xyfis6EXwg=;
        b=fhse/fU2OCbnaW0qgK1xNIX4gXTX/L/V3AL03M9vLOuPoSD1Tw8qjSYTrjeo9wHuv4
         gxs5d30x8xyjCUsatawE3KAsDwe2J5AXf3sWX7EhNQBzQMAM3ZP6x/JxxSZEV2DEFRNr
         +HFyjRT8fZGtlLTAyJbIfk5ROnMsB1ekhRXmzSdUNtcD7ZbKfJrSWdza88ZuwhUyCwcd
         bP9hpw2prfle+0NC4jsAUNww3XkBZz4QE71wLhqUdv1LejSH6m3r762c//aQyMbZ+C+v
         SEh1k3EuH17SBxE8fJxGHFPgrDYbGUm9svtVPicIh65GmFyTZthUilQrxMTrY4NBsfk7
         n9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742279400; x=1742884200;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjlGvph9FbeHzoqEjT5wXcJBYP4G9CrB0xyfis6EXwg=;
        b=ifWoI/FWMPCQhowgjV/brawemuYnBs5L21QUNvH1xErfFy4erG+HEFYMhtu47nZvEk
         2cvB6TSI0zI7fxzE+X78qejgEeXYlASh9+c/KsSfoun9JapdhIiPuj/aerdEO8HV4ooJ
         zN5pCvp0XZclYt/R9ZA03yBoY83xpsReqts8Y/nTJARXVA02iumqPX/vJWOn4TTIq3XG
         N5eTmNLIEjoLu+hKtg3s971fyxKkerL343ZZ+1PDkYsfbJHVbUL/fZVFCOm7Z7T9JuO1
         fJlDi0gb7Q0MRJcAyZZsbephEXePClgMtlPDTEC8VHE86G1xePmJN4sR1uh/KrvmjL8I
         abyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTRKneI4RJC8FfRLT0dx3o9j0dRJeoLVsA5OfIXEedR4FOyAZThIC8NNQBTFWtGqy/+sLt2aS6RCY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUkm/CEPCd6KzsQrq1DcAH0hqMvmjaox9mVuPmIvE1scXi8f8m
	atjmlIR7aBIEw459r3aJ6bVIRBrMe8EbSdTy7w2uCm72mb8jrUYH1PdRbQueW1o=
X-Gm-Gg: ASbGncuxsBbaW/9kiTCVExrwC+ecYn5NGeLtZl4nI++jIVup7QHw/3BfdepESxyVdJ7
	wsPz+IN8zwttFg5vQtzatEM+4jd+7or1Iw93p0StHtWEOyaxOtuZ5LIX96J+ZtxS1lbgxSzLl4V
	qjYvWhfuqQJGDo3YO25yJoOt63P2Pzt8q54qnC5lZR0XFxOfoW9XVN9sl87tXi6s3ab90ADwXik
	2VtXt69eri0gdjr96ML1m1BPkZ/biQFlW6gjGgeTBSXp5BwWGm8A2lHgQ4aG8hKfzRTYnfBIeId
	N8wzBwWDQKZ1xc5rgljcXnjStHH6o+JK799RPoaj8VmuS3pyz1KQRg==
X-Google-Smtp-Source: AGHT+IGvkDQyai2xtZeXLR1F8esFYWuLjTmm+NlpTt1JcTgeasTcJhfvy1fpJlRGxBNpxuafLcoMZA==
X-Received: by 2002:a05:600c:310e:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-43d3b7c9a0fmr7634995e9.0.1742279400388;
        Mon, 17 Mar 2025 23:30:00 -0700 (PDT)
Received: from [192.168.0.62] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbf901sm124206115e9.15.2025.03.17.23.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 23:29:59 -0700 (PDT)
Message-ID: <93f5e13d-2a4d-4528-9c55-37a79eae3da3@linaro.org>
Date: Tue, 18 Mar 2025 08:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix W25Q256 and W25Q512 chips
 configuration
To: Jakub Czapiga <czapiga@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250317182103.2060524-1-czapiga@google.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20250317182103.2060524-1-czapiga@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_233002_167547_C112B3B4 
X-CRM114-Status: GOOD (  16.42  )
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



On 17.03.2025 20:21, Jakub Czapiga wrote:
> Fill and fix configuration of Winbond chips:
> - W25Q512JVQ (+lock, +tb)
> - W25Q256JW (+lock, +tb)
> - W25Q256JVM (+lock, +tb, +4k, +dual, +quad)
> - W25Q512JWM (+lock, +tb)
> 
> Top-Bottom selection bit is SR(6). All mentioned chips have 4-bit long
> Block-Protection field.
> 
> Signed-off-by: Jakub Czapiga <czapiga@google.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 8d0a00d69e12..8ebb1461a4e9 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -145,6 +145,7 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.id = SNOR_ID(0xef, 0x40, 0x20),
>  		.name = "w25q512jvq",
drop the name on next version and add it as a comment

>  		.size = SZ_64M,
drop size if flash supports SFDP
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
drop no_sfdp_flags if flash supports SFDP.

Btw, switching to SFDP shall be done in a dedicated patch, then come
with the BP patch on top of it. Comment applies to all patches.

>  	}, {
>  		.id = SNOR_ID(0xef, 0x50, 0x12),
> @@ -190,6 +191,7 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.id = SNOR_ID(0xef, 0x60, 0x19),
>  		.name = "w25q256jw",
>  		.size = SZ_32M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
same comments as above for this flash and all from below.

Cheers,
ta
>  	}, {
>  		.id = SNOR_ID(0xef, 0x60, 0x20),
> @@ -221,6 +223,9 @@ static const struct flash_info winbond_nor_parts[] = {
>  	}, {
>  		.id = SNOR_ID(0xef, 0x70, 0x19),
>  		.name = "w25q256jvm",
> +		.size = SZ_32M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x71, 0x19),
>  		.name = "w25m512jv",
> @@ -249,7 +254,7 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.id = SNOR_ID(0xef, 0x80, 0x19),
>  		.name = "w25q256jwm",
>  		.size = SZ_32M,
> -		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x80, 0x20),

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
