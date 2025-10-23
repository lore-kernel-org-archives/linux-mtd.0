Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189D4CCD1BC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 07:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sesqoIwislIduwGevkhwrgsSbOl4pgeF3rYp0Kki/4o=; b=RZHz4YEIjavG0a
	+Q1BcpPokEfVD+KOwFWfNvZEIg0lV6eM2vYC4JqGBLRTMrp+fTpS9d7XcseR9QICpC4smZqLKgUnZ
	ogGylo3eCQTl2OtOAwwmiOHtQURAjxCU8goUPLhs1bx0btrDFknfRT+6cqPcgG3Qj7y0nZ1mT8/ce
	DtW7g0zyQS+VOB0NR6Hbzx2f5EKVN8+Lm+9sJT2rMzOBMyrAaWl1xuOx0k6+QZERJI8kKpNmefITz
	sY/AOdL7G7ysPVvVDhmOX9yHfgAk7rbnXL4BS2/LYeodhi1xhREs+bD+jUFN+cLdzrE5xhsmXF1Ma
	zhD733Y4EFAcZApYi7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpmI-00000005NE0-1IAx;
	Thu, 23 Oct 2025 07:30:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpmF-00000005NC3-1zPQ
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 07:30:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47106fc51faso7044435e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2025 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761204625; x=1761809425; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xU2+l2oWXaSdZaV2lCEesAap59k6WqOAEa+s1mYsl4k=;
        b=JzY1ZQ/rNhXIFbencuhEAy9VuG3T9DQ/Uw64LLh6Lb0znB1VyZ8hV2JGwfwbgSxhv8
         Umpiew9AG2MS47mjXiTiR9B1wP2XePjI6VWkzFGRZIxZEDAxMbnMssOTvBGDWQ1UMljV
         S6aOr8iOC8wxFsux599nFFJcKNFA7i/Qd8KgL1/2DYKh71q1G6HN2LJtrwym1mMW413x
         X3Y1NzJKXlJUfR2jmdEcOgJieYaYQOjvMT8H0a/sveP4nXjTzyL0Fbd4OF4fVZz4M6w+
         5t50JjUBZfVr++cfj0aJMwp2gzEipl8v8ZqsoDCb1931HTTBhvErYKl9hBzZBaSX0/qx
         i7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204625; x=1761809425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xU2+l2oWXaSdZaV2lCEesAap59k6WqOAEa+s1mYsl4k=;
        b=OMiioYvM9Jsu+vZk6yG4XmCy1VFWkyxvFHWEqtc4cYsnotoLaZCoIa3RKG5GBhMUpl
         q6dlcgE9NhIa2k2IXz0W+VlU2IhMYyaPaJJJappNHqg0TaBn7P7maSxdvOXcfakAlMpB
         bvegdX1Qk77J7prhqV6fYwRdX4Wlqx/G7sqA0j7dzo/S8KV2BRu/eZhTULyPUB5M6K2Z
         q60fh2I+I7qYQwUjHKRogVRtW+D5/VcXEZADBbOd0cngR4KQnPkq9MrlbBK+DPDTQn9d
         AyeBhxbGCR8+VoL7UtQeQloXqvQP9piHfBbGQyAGLVjgTPRUslIo4NzTSR0xKdRFH1ue
         Jx+Q==
X-Gm-Message-State: AOJu0Yz7SK/gQj5SEXlx1hywF+36BMmcNtGt842RXpsxp1RTRU5XIoEC
	JMYtPephkCLcQBUz9kSXOQZpW+e5uB7hYj3n8FaQlHzbK8b0aRWpsWJD+5L0B7M2JWQ=
X-Gm-Gg: ASbGncv+pUCIlOPOAuJzaCQ0L4Rz9+APCoQ4AnvGBQK+Fy4f2F/CHYly/JaIvYZnYfS
	BNdUthrr5g9Rmx2djwijXfUAB12G0U+2F+4ZlkjcudEDc2IOpz0ANJE5ZEI/Cq3HwA3yciS7cR3
	MR4aiC1UBZcvgkXRE0cZJ4jrGZoRT6vGBn/pimsS81wiNxb+uvIk8Mj4bMfdxtUiN3JjVrq8nw4
	CqtTOmIgmzgz7k5woSqhwg1s/GkfFe2NXvLOugWdJXBhs8L5Thy9Y4lULyzGgKWattkQMUCpk3t
	73ClUtsp1STfYau+9dj3zTqhVUhfZwv8cOQ7W6DUdu1M8ek6+ACSJjhhH2HlLWg6ZC4zYd5+qRh
	5Kr9q6gSyNCup9xDW9kBWWUXnka4NxniCMjvz0/rTKnEseYdUcphUgUmJ0QnqkOmvLQEcZpEHlg
	5KmD6C4qj7
X-Google-Smtp-Source: AGHT+IGdW6Zt/VmLDLhC0rSwjvMj4I4YzehzmiCpNFLtAN8Xf4TUyFOcY+/2y6jYWq6rNVFlPM38Xw==
X-Received: by 2002:a05:600c:820b:b0:471:1717:40a with SMTP id 5b1f17b1804b1-471178a8245mr165146145e9.18.1761204625412;
        Thu, 23 Oct 2025 00:30:25 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm80778205e9.14.2025.10.23.00.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:30:24 -0700 (PDT)
Message-ID: <b5f36114-f5d2-44c4-8902-f7d7e68b29d4@linaro.org>
Date: Thu, 23 Oct 2025 08:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
 <20251022-s25fs-s-smpt-fixup-v1-2-ce26d4084b2d@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251022-s25fs-s-smpt-fixup-v1-2-ce26d4084b2d@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_003027_548959_FFD395DD 
X-CRM114-Status: GOOD (  25.72  )
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



On 10/22/25 11:07 AM, Takahiro Kuwano wrote:
> Some chips have inconsistency in SMPT that derives wrong map ID and
> fails to detect correct sector map. Introduce smpt_map_id() into
> struct spi_nor_fixups. That is called after map ID detection by SMPT
> and chip specific implementation can correct map ID.

You may reword the commit message a bit:
Certain chips have inconsistent Serial Mapping Parameter Table (SMPT)
data, which leads to the wrong map ID being identified, causing failures
to detect the correct sector map.

To fix this, introduce smpt_map_id() into the struct spi_nor_fixups.
This function will be called after the initial SMPT-based detection,
allowing chip-specific logic to correct the map ID.

And maybe give an example which flash needs it.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>> 
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.h |  3 +++
>  drivers/mtd/spi-nor/sfdp.c | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 5ad46d95d09cc9d527f71579a71eed210e726f68..16b382d4f04f207aa26190ed8bdf2d19885f7315 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -411,6 +411,8 @@ struct spi_nor_flash_parameter {
>   * @post_bfpt: called after the BFPT table has been parsed
>   * @smpt_read_dummy: called during SMPT table is being parsed. Used to fix the
>   *                   number of dummy cycles in read register ops.
> + * @smpt_map_id: called after map ID in SMPT table has been determined for the
> + *               case the map ID is wrong and needs to be fixed.
>   * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
>   *             that do not support RDSFDP). Typically used to tweak various
>   *             parameters that could not be extracted by other means (i.e.
> @@ -429,6 +431,7 @@ struct spi_nor_fixups {
>  			 const struct sfdp_parameter_header *bfpt_header,
>  			 const struct sfdp_bfpt *bfpt);
>  	void (*smpt_read_dummy)(const struct spi_nor *nor, u8 *read_dummy);
> +	void (*smpt_map_id)(const struct spi_nor *nor, u8 *map_id);
>  	int (*post_sfdp)(struct spi_nor *nor);
>  	int (*late_init)(struct spi_nor *nor);
>  };
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 9a47dcaca06ae2ad85ac8503658083b1d56d8b96..a8324c2da0acf2953a4a62e2a9f7ed31fcd8b4f2 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -730,6 +730,16 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
>  	return read_dummy;
>  }
>  
> +static void spi_nor_smpt_map_id_fixups(const struct spi_nor *nor, u8 *map_id)
> +{
> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->smpt_map_id)
> +		nor->manufacturer->fixups->smpt_map_id(nor, map_id);
> +
> +	if (nor->info->fixups && nor->info->fixups->smpt_map_id)
> +		nor->info->fixups->smpt_map_id(nor, map_id);
> +}
> +
>  /**
>   * spi_nor_get_map_in_use() - get the configuration map in use
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -783,6 +793,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  		map_id = map_id << 1 | !!(*buf & read_data_mask);
>  	}
>  
> +	spi_nor_smpt_map_id_fixups(nor, &map_id);
> +
>  	/*
>  	 * If command descriptors are provided, they always precede map
>  	 * descriptors in the table. There is no need to start the iteration
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
