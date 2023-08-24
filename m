Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA382C7113B
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyATAx4S8K07qqQWEWaM4mjKz+1MdDJOMw6JO8N6YW8=; b=cy7Hwxen5Qti5D
	DWYxmQq5AiqxW8HBih0qruxMTv5m7oKvkAK1QpuM8htNl+3V0JkSL5XZOFlUs4XBEp8x9k06VX4UN
	JUxzU3q4eMcDFUyD+Pmo5LlvCAUZWTjOX4hY3mLfJbfppUoLrvawjYeLIBOlVbneCi0UwH81Sm1T2
	+wDHl/ltO9zgWRCJIMS2QgECBkYn47sOzuP9KJG1i58oQoTFupILhw/1gAa4mR9yI47UsfCH1f3cK
	O93H0VCOKqMHWth2lxWP+r4+l04croUyrKZ52PKXnx9sdrGVyg2QbwCv+On+aD7vdYHuEK2NlqPc7
	ByWBcX+ofnt7Mo51E4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5v5-002bDe-1t;
	Thu, 24 Aug 2023 08:42:23 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5v1-002bCd-33
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 08:42:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c1f6f3884so844849066b.0
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692866536; x=1693471336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=puURoaQfBrDJF9LCn2Zc0LTYGt1gtTe27qvoHHoLoso=;
        b=m70jlyC5KmxF+VRYoKneKTTm5TuR5xHF+mzbh7p9LG+r3xpMlQhPYmazDXN0DF3XES
         niN1faNCh/sa3DW5+llfmk8hoh+nSn+Cu2/zl5muEx+slGnJ4RPgDTEwT3hdTsFhh+P7
         BgvbCfZ0BNqZX7DQowClJfL9L1UYwy+BLmKlFS+e0IYvxf9gRkLiBMcc/Bm4gnwRAOOm
         vGT2ziGkxb3Nc78GG0Io14Xfdv1bM+BRFYNSAlmEsis8EH4/I5D3DrB+aUF8FBicJvWq
         j7qnB/QsJENCR7a4d9FsltYrwI6XxIOXD0l1dNL40cI/EgB1UjdfhQEJqXyqAoayx5TU
         CilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866536; x=1693471336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puURoaQfBrDJF9LCn2Zc0LTYGt1gtTe27qvoHHoLoso=;
        b=Hz1SfFvJS5hUKA5DkO4gKpF9gqR+s7jP8NOmLjS7+1K6ZTCFM6Oq/AZlfs+jgQY7NQ
         KQ0+CH+s5lsowoVmbKoj2m3gZcCJgWhCPPWzRLW6CH2B42s1vJe6Fi9nX1+In7uwUQeG
         UaksWew48L6mimXJ5ZKKX2fS80s9AODzstZXKBSSH25fSK0+yMNy6oixj2zK2bE4qrhg
         auHVFyZKn5zfKazF7J/IKrK4Gtkvh6b4OTHwZ3rOR6UQa4qjv55sZM2U/aPGRXFo2i5U
         FUOQ5Fm7Droj0vrmI+BDOhfW1YN6mtM+jnCCpCNa7OfAr3Z4VIZZUwhnj/DL1z/jHw/x
         Puxg==
X-Gm-Message-State: AOJu0Yz+lCsAgnnzOPPoFlkgRfXQdXvuNXg/YPVqrAt2/SbmdkPKr9gW
	AJ4iF9rufFMgchApz/iQGaYzsA==
X-Google-Smtp-Source: AGHT+IHNUFAhYyu/BT2VvKG1iuTaw9fuREQvuxHATujHtPzh13LPG8RFDxXgINPzaRx9NaaoAV2j5A==
X-Received: by 2002:a17:906:255a:b0:99c:47a:8bcd with SMTP id j26-20020a170906255a00b0099c047a8bcdmr10124636ejb.67.1692866536147;
        Thu, 24 Aug 2023 01:42:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id gq6-20020a170906e24600b0099c53c44083sm10612118ejb.79.2023.08.24.01.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:42:15 -0700 (PDT)
Message-ID: <8d42e8a2-d697-e3e8-a576-910d669883b3@linaro.org>
Date: Thu, 24 Aug 2023 09:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 08/41] mtd: spi-nor: default .n_banks to 1
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-8-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-8-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_014219_984738_3280B17F 
X-CRM114-Status: GOOD (  24.48  )
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



On 8/22/23 08:09, Michael Walle wrote:
> If .n_banks is not set in the flash_info database, the default value
> should be 1. This way, we don't have to always set the .n_banks
> parameter in flash_info.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/core.c   | 3 +--
>  drivers/mtd/spi-nor/core.h   | 8 ++++----
>  drivers/mtd/spi-nor/xilinx.c | 1 -
>  3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e27f1323fa0b..68baf6032639 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2017,7 +2017,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>  
>  static const struct flash_info spi_nor_generic_flash = {
>  	.name = "spi-nor-generic",
> -	.n_banks = 1,
>  	.parse_sfdp = true,
>  };
>  
> @@ -2997,7 +2996,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	params->size = info->size;
>  	params->bank_size = params->size;
>  	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
> -	params->n_banks = info->n_banks;
> +	params->n_banks = info->n_banks ?: SPI_NOR_DEFAULT_N_BANKS;
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {
>  		/* Default to Fast Read for DT and non-DT platform devices. */
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 2fc999f2787c..8627d0b95be6 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -15,6 +15,7 @@
>   * have the page size defined within their SFDP tables.
>   */
>  #define SPI_NOR_DEFAULT_PAGE_SIZE 256
> +#define SPI_NOR_DEFAULT_N_BANKS 1
>  
>  /* Standard SPI NOR flash operations. */
>  #define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
> @@ -453,7 +454,7 @@ struct spi_nor_fixups {
>   * @size:           the size of the flash in bytes.
>   * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
>   *                  isn't necessarily called a "sector" by the vendor.
> - * @n_banks:        the number of banks.
> + * @n_banks:        (optional) the number of banks. Defaults to 1.
>   * @page_size:      (optional) the flash's page size. Defaults to 256.
>   * @addr_nbytes:    number of address bytes to send.
>   *
> @@ -570,7 +571,7 @@ struct flash_info {
>  /* Used when the "_ext_id" is two bytes at most */
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
>  	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
>  
>  #define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
>  	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> @@ -578,13 +579,12 @@ struct flash_info {
>  
>  #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
>  	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
>  
>  #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
>  		.size = (_sector_size) * (_n_sectors),			\
>  		.sector_size = (_sector_size),				\
>  		.page_size = (_page_size),				\
> -		.n_banks = 1,						\
>  		.addr_nbytes = (_addr_nbytes),				\
>  		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
>  
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index 284e2e4970ab..8d4539e32dfe 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -26,7 +26,6 @@
>  		.size = 8 * (_page_size) * (_n_sectors),		\
>  		.sector_size = (8 * (_page_size)),			\
>  		.page_size = (_page_size),				\
> -		.n_banks = 1,						\
>  		.flags = SPI_NOR_NO_FR
>  
>  /* Xilinx S3AN share MFR with Atmel SPI NOR */
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
