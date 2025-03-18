Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FF3C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 06:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ3mDe00BSmsc8W7HtDfcU0KKITzaFW0gMlEDStoc6E=; b=QwqxoM9mvxBLf9
	AG/TuvLVeETTfs+w5w0d8z7sK/ll5RKskw6VwR6BYl/Gz7fjF8Re4iaTeZKjInuQ/itxHvYx59dIs
	cNW/Lv0JFdckQOS6KjiUtsQj8HhnRdPaJO84TYTT7NnTCdMyiwUS73cQp4JlrSShlgHFArmeLFOHV
	DQyRoWsLWzHG/EzNpXP77YMSVi6ND5QuLxT4uyvP3H6NZ07wdWBvbP11zC6NNXM9ondp2ae+TsHwK
	/zG4sLtccT5unO+06vWpn3RMG1FzjI/MT4MAIPtDrSPCxtIxUPyIqJpa2PWjTOxPnc4rexQ96aWT7
	T3RowHuUPCSNrSBiJafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQQ0-00000004p6I-0Gc6;
	Tue, 18 Mar 2025 06:27:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQPx-00000004p5t-1iZf
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 06:27:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso7599627a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742279232; x=1742884032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RS+d+wLLTpLukrshu1KgCi2J/6kgXfG5Xv9HH4pKDHM=;
        b=L0hsdUbO1BlEROCFy9gjhkS01zNd9SDes2vv57EDO1RIxgasFY52IPz7ExEYW3NpjF
         Pd0r1cgD2mX/gJ6mBaJjXFHAwj76IQL7yIOvPR15HOJvWDJ2YOaIOG9JgQ54o/DjHzEK
         KZrDnNgX7bFGzaqWG0HyNwY5MDYuqUGzNIoD/8TCsxU5GpuaLPPBC69pgwKHG6fFTm0b
         m8O2WhMAjWjkV+eevkN0Zod8X1FVowjuIHUP+YjgiN+3eNMlX/dqgpmGEHDLRo44A9BG
         jcBTOJnS+zHrWY7CuO1Mynzz4MDkukwktwXmH0iIbJ/UAbwNnOZe2pZhdWDvTO5o8ubZ
         Q0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742279232; x=1742884032;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RS+d+wLLTpLukrshu1KgCi2J/6kgXfG5Xv9HH4pKDHM=;
        b=XBQjg2+EqBGXi65zxYFiD9LjOCD/aCGGQuh4e9KRsvZjahyi3+iHUvSr8y6WjZFD19
         PjdND/DL4WBuXXc27UtEpsR2fYoZ8ZTbwUR9ojTSOcnWuBb7YxLGfe1YgIrEqk7pyHul
         U7yaiClyjj6WlDXTq1apWcIXvMATS4GaTy2enHjg3CSouTUhBRRH2Qu8mo+06E/FIwR8
         OYVtRqwgGMyDomPtx4IuUcRHDYZ45KvV1BDnJvP0Z/huclMZI/BHl7tcxpC0mLdH7nkg
         xdvugcxqZ6+smH1irF6Q3zdgZIm3t89fL3NEL0Em7sbRcbNQOvC9ACQBk1l0FT4zWEyS
         71gg==
X-Forwarded-Encrypted: i=1; AJvYcCWLiXZ/ILFf53saieGSH4gF2mWZKDWduJk0ojpwjMeC/448BVY3mkPvu6KgJkEQbyL35XlBnANTfdE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEtkk3OxvqUbaFUYZCPtlOO2bdW+LXmGxrHLSt71atSVfHE96i
	FRklSHi3PlHeH5zoRZj66/TmFC7Y4YsX54VvpcKnlRfZ41h45zTnhodJ7YK4POk=
X-Gm-Gg: ASbGnctZEOAudqkhCfmjP8LeV4IDg8O6hJIIsPR+S3LMUemVZ94wKpKTmCRPkiGQjUq
	2y/dRpic9M2+hW1ULxkjbdGwiKMZRqgfSzbVwc3dR/6Y0oIZPWvMfGb9i8e24Vg6P7dEMv6M3v4
	BXn6Ny+29B/ZO1NeCJ4aTXZMJm+/AXXB55DNmXTlWwTeY5t1WhOwhRRvbyXxXGEQHihp+B01/z0
	tqVxea/kV8OanS3nZyxMKGHCSiJCtL0484D1kmR8OztyVTDWlW8q+gii6BftYSlAbmDzsYweYgo
	V9/RXuIfYI8+N5tSKtr2M7K/VIHAZSCY+ugKsXUXJo0wxp8cX429LQ==
X-Google-Smtp-Source: AGHT+IEmbxfd59IWAvU+zhGTYt7uPPYn9mbPs0auwfyns4/IDUqNsQ9RKkZ6UgHGj0ak+k4BmthPIg==
X-Received: by 2002:a05:6402:354d:b0:5e5:bdfe:6c16 with SMTP id 4fb4d7f45d1cf-5eb1deab100mr2062814a12.3.1742279231656;
        Mon, 17 Mar 2025 23:27:11 -0700 (PDT)
Received: from [192.168.0.62] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816974b63sm7143534a12.28.2025.03.17.23.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 23:27:11 -0700 (PDT)
Message-ID: <e2e890a9-ebc4-45fb-92eb-502be027e807@linaro.org>
Date: Tue, 18 Mar 2025 08:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: xmc: add support for XM25QH128C and
 XM25QH256C
To: Jakub Czapiga <czapiga@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250317182107.2060739-1-czapiga@google.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20250317182107.2060739-1-czapiga@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_232713_463970_BB49DCEA 
X-CRM114-Status: GOOD (  19.37  )
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

Hi, Jakub,

Do you have access to these flashes? Can you test them?

We have a minimum testing requirement before updating or adding new
flashes, here it is:
https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements

It's true that we don't have yet locking tests described, but
contributions to the documentation is welcomed!

On 17.03.2025 20:21, Jakub Czapiga wrote:
> Both chips support SFDP (JESD216).
> XM25QH128C only supports 3-bit Block-Protection with Top-Bottom
> configuration bit.
> XM25QH256C supports 4-bit Block-Protection with Top-Bottom configuration
> bit on SR(6).
> 
> Signed-off-by: Jakub Czapiga <czapiga@google.com>
> ---
>  drivers/mtd/spi-nor/xmc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index d5a06054b0dd..963a44c3909a 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -19,7 +19,17 @@ static const struct flash_info xmc_nor_parts[] = {
>  		.name = "XM25QH128A",
>  		.size = SZ_16M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -	},
> +	}, {
> +		.id = SNOR_ID(0x20, 0x40, 0x18),
> +		.name = "XM25QH128C",

for the next version, drop the name and add it just as a comment above
the flash entry definition

> +		.size = SZ_16M,

if flash supports SFDP, drop the size parameter, it will trigger SFDP
parsing.

> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +	}, {
> +		.id = SNOR_ID(0x20, 0x40, 0x19),
> +		.name = "XM25QH256C",
> +		.size = SZ_32M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_TB_SR_BIT6,

same here. After switching to flash init based on SFDP, please do the
tests mentioned above.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
