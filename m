Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D9C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utCQij26QKJQaVy4b5cAdNaZSRmp78MZPyx60hJScbk=; b=ojpS6L8yJu4POR
	T90cxKUjykjG9qPpYvuPuNW9GgSurLRJZkeX+WVkxwFNqoDeAqfrND4W910NIhNr6hXPSExN9PXgL
	NGcSwLRWlpHQMcX//AoQpo/N0PGttiku3JURTlrABidnnfS73QTYMjEZDRpURF7ENk6Xq5bjxnNxR
	YnPfpW2tfcBoi6Yfr9BW4p8mFQ3fTqjQL8B6vqeHq9vWvi9Q8ALxNHqX//ACnMTV+bkBRuk+0B0O7
	dMZzsd/lCImV8DreFFfEk0IAid65KDCu1oV7t+wcAVD7U/lq0iLCW0OxWzpakhDYh0+0OdJt/quOP
	KAeiizy+vOp5XGfjUccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsAC-00Gby0-0I;
	Wed, 20 Dec 2023 08:42:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsA9-00GbxK-0l
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:42:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3363aa2bbfbso5832054f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703061761; x=1703666561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KPYh1EzcMpEOWR7wqkql1di0UZAvYYTR15wrpgLdj0=;
        b=W2oaMltfuXF9P/u7s8ers+W3QU4I/8GhlwQ1Eyb5+iBiSXMkUuOMr2kS2GhScpGNpg
         UC2Q5NwFz98vkBgQyKdUkcCs0RMi/KXH/iqHArOADGj0+xAFMrnOHUYxE2ZiN1TA8zg1
         PKzjtgPjojDu7p044OoXqUtvNZeLHw0ZYI5zBqaKzO4m0r1ntNA0U3LZqAKM5qyEV8l7
         R1GDXrfreZAS0QcaNslbFyQiVwoGjXmyh4rw8En2rZKNgDLZJzmymoL/sqmGLlAcc6i/
         PlxSE0L42/Mgzihs54fNz8Auzo4fTcHzZ9WDPVfoCfZT57uQZSMZseRD+YebK5lelKVt
         jl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703061761; x=1703666561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KPYh1EzcMpEOWR7wqkql1di0UZAvYYTR15wrpgLdj0=;
        b=HrE12mh3SN7mIYTmxUmVnYUHddyofQRXgcLonaNNEarGLwGHrCevTdGHdr0z7mEtIh
         NJM06ldqFGtJyUtmMKL7sZO7YUUPmQDB/S8RzdUtmj7DXslqAnfcJhukCaErWD8ztxz/
         tm9HF9qzCp5AeEXK9fMky7mVflttXhQF/uQKSdIJw1tR6g/+m2ZvQBSZ2yrKWFWbFIOu
         C90roziXiuFadDH2fWpxvNrIVwH1qM6WosHveeNUzHs+lqlLc9gT4IWZNcWyl7ttGnY8
         peHQyYaTtRkn2qOPtWAkET406VGUVy/FZrpG6+776p6139rtU1wo63JiTEUUKNKDQD/9
         V8Pg==
X-Gm-Message-State: AOJu0Yz0324S1rZ99sIFerjCYhvJ/VYI3EKkHGwO4RRuX5KuEJNrOuT6
	hMUqLDfxDHAZf1/LZaQo02jXYQ==
X-Google-Smtp-Source: AGHT+IFODOs/Axujy/DIVRZ71MUHUEhN6BGP9yWW4EjYLV1Z04WE40Dc6nqolV45CjKu7GBs9xvuHw==
X-Received: by 2002:adf:da4f:0:b0:334:b31d:eeb3 with SMTP id r15-20020adfda4f000000b00334b31deeb3mr9426244wrl.140.1703061761090;
        Wed, 20 Dec 2023 00:42:41 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d5690000000b00336781490dcsm1801308wrv.69.2023.12.20.00.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 00:42:40 -0800 (PST)
Message-ID: <17e3070f-eb2a-45f3-80a7-67aacf991a8b@linaro.org>
Date: Wed, 20 Dec 2023 10:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: spi-nor: sfdp: Get the 1-1-8 and 1-8-8 protocol
 from SFDP
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
 <20231219102103.92738-2-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231219102103.92738-2-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_004245_274539_156AC1DE 
X-CRM114-Status: GOOD (  23.72  )
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



On 19.12.2023 12:21, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> BFPT 17th DWORD contains the information about 1-1-8
> and 1-8-8, parse BFPT 17 DWORD instruction to determine
> whether flash support 1-1-8 and 1-8-8, and set its dummy
> cycles accordingly.
> 
> Protocols 1-1-8 and 1-8-8 support are not determined by a
> single bit, so that use 8 bits instruction to determine
> whether the protocol support or not.
> 
> Macronix spi-nor flash didn't support 1-8-8 read feature,
> this patch validated 1-1-8 feature only on Xilinx board
> zynq-picozed.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> ---
> Changes in v3:
>  - Modify title of patch
>  - Parse 1-8-8 read as well
>  - Modify the typo descriptions in commit log
> ---
>  drivers/mtd/spi-nor/sfdp.c | 29 +++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/sfdp.h |  7 +++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b3b11dfed789..3f1eba83a7d8 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	u32 dword;
>  	u16 half;
>  	u8 erase_mask;
> +	u8 wait_states, mode_clocks, opcode;
>  
>  	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
>  	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> @@ -631,6 +632,32 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>  		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>  
> +	/* Parse 1-1-8 read instruction */
> +	opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
> +	if (opcode) {
> +		mode_clocks = FIELD_GET(BFPT_DWORD17_RD_1_1_8_MODE_CLOCKS,
> +					bfpt.dwords[SFDP_DWORD(17)]);
> +		wait_states = FIELD_GET(BFPT_DWORD17_RD_1_1_8_WAIT_STATES,
> +					bfpt.dwords[SFDP_DWORD(17)]);
> +		nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> +		spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
> +					  mode_clocks, wait_states, opcode,
> +					  SNOR_PROTO_1_1_8);
> +	}
> +
> +	/* Parse 1-8-8 read instruction */
> +	opcode = FIELD_GET(BFPT_DWORD17_RD_1_8_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
> +	if (opcode) {
> +		mode_clocks = FIELD_GET(BFPT_DWORD17_RD_1_8_8_MODE_CLOCKS,
> +					bfpt.dwords[SFDP_DWORD(17)]);
> +		wait_states = FIELD_GET(BFPT_DWORD17_RD_1_8_8_WAIT_STATES,
> +					bfpt.dwords[SFDP_DWORD(17)]);
> +		nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
> +		spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_8_8],
> +					  mode_clocks, wait_states, opcode,
> +					  SNOR_PROTO_1_8_8);
> +	}

you can use params directly instead of nor->params. And it could have
been written in a generic way, considering the other read settings
parsed from SFDP. I'll get rid of the extra dereference and queue it,
you can address how settings are parsed later on if you care. Or I'll do
it myself if I won't be able to bear it.

> +
>  	/* 8D-8D-8D command extension. */
>  	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
>  	case BFPT_DWORD18_CMD_EXT_REP:
> @@ -968,6 +995,8 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
>  		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
>  		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
> +		{ SNOR_HWCAPS_READ_1_1_8,	BIT(20) },
> +		{ SNOR_HWCAPS_READ_1_8_8,	BIT(21) },
>  	};
>  	static const struct sfdp_4bait programs[] = {
>  		{ SNOR_HWCAPS_PP,		BIT(6) },
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 6eb99e1cdd61..da0fe5aa9bb0 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -118,6 +118,13 @@ struct sfdp_bfpt {
>  	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
>  #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
>  
> +#define BFPT_DWORD17_RD_1_1_8_CMD		GENMASK(31, 24)
> +#define BFPT_DWORD17_RD_1_1_8_MODE_CLOCKS	GENMASK(23, 21)
> +#define BFPT_DWORD17_RD_1_1_8_WAIT_STATES	GENMASK(20, 16)
> +#define BFPT_DWORD17_RD_1_8_8_CMD		GENMASK(15, 8)
> +#define BFPT_DWORD17_RD_1_8_8_MODE_CLOCKS	GENMASK(7, 5)
> +#define BFPT_DWORD17_RD_1_8_8_WAIT_STATES	GENMASK(4, 0)
> +
>  #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
>  #define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
>  #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
