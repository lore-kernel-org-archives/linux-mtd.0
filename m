Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF876C47420
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:41:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC1720789
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z245nJIu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kGM8wh9M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC1720789
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0qhmgZBw/A1Iy0DJxKscvoFbMaJ57jb2BCOWVjYZLuc=; b=Z245nJIuVMLplGHA9IAX3XE7B
	JDZBTmKDTl1d+XlqLhXagKHou428yy7r6N05cYz8PgJcqHoKFspUbJUqFZvAHPrdP940QgoAt5rrq
	F7iJsGG+OPGg36UjLBefiiF1vsEDkyOYgASRc0wna1owA4i50bKAiTcU1qCRne1EpJhEeNNg+sfE5
	1xDnYA579wFz7MpzvsP7RP6MW8O4a2t5igJ9s8u39RZSrhMSXPNlaAv3UAQ8ZEcyaxuW47RXMy9C0
	hreEk6yQyAkqJgtH6TUfE4vbjiHa5WmqiMT0/xd+ICSCqOBSC4meQzd9Us747BKSPeMpHNCHjnaJn
	euyIxMK4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNYb4-00088u-Pd; Wed, 30 Sep 2020 09:40:26 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNYan-0007wm-Gk
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 09:40:22 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U9e6OX043951;
 Wed, 30 Sep 2020 04:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601458806;
 bh=KCmXt6m7Rv8hOJZq8QJiUqI+hcs587SPq0k6bMwb4+M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kGM8wh9MdSDS0BicpexwEIinc8VH6nmnZ3VbE4WdCLYsHE+z4Ig4a0GQGTwHSo1tj
 G/zLeeJcmLzNjNcyTRcYjglRTmeAPylHJNvb2wDu5yMw+wiXD9j8G5TqE2hJVsKPHy
 rwFct1UMYEYRse55WPh1hD3qTpOsPz9d+F6IYSqo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U9e6w5088130
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 04:40:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 04:40:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 04:40:05 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U9e3Jq089623;
 Wed, 30 Sep 2020 04:40:04 -0500
Subject: Re: [RESEND PATCH 2/2] mtd: spi-nor: enable lock interface for
 macronix chips
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
 <20200921112450.4824-3-i.mikhaylov@yadro.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <cb47d79f-ecbb-f0ec-388e-b56ba740045e@ti.com>
Date: Wed, 30 Sep 2020 15:10:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921112450.4824-3-i.mikhaylov@yadro.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_054009_685543_D8CBEE68 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 9/21/20 4:54 PM, Ivan Mikhaylov wrote:
> Add locks for whole macronix chip series with BP0-2 and BP0-3 bits.
> 
> Tested with mx25l51245g(BP0-3).

Since you have only tested on flash that have 4bit BP, please don't
modify flashes that have 3bit BP. Lets be conservative and enable only
things that have been tested else we may end up with broken feature from
day 1.

Regards
Vignesh

> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 75 ++++++++++++++++++++++------------
>  1 file changed, 50 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 96735d83c77c..80de43eb05d6 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -37,53 +37,78 @@ static const struct flash_info macronix_parts[] = {
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
>  	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
> -	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
> -	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
> -	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
> -	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
> -	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
> -	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> -	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
> +	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8,
> +			      SECT_4K | SPI_NOR_HAS_LOCK) },
> +	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16,
> +			      SPI_NOR_HAS_LOCK) },
> +	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32,
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64,
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64,
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4,
> +			      SECT_4K | SPI_NOR_HAS_LOCK) },
>  	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> -	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
> -	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
> -	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> -	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
> -	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
> +	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8,
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16,
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128,
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256,
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
>  	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
>  	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
> -			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
>  		.fixups = &mx25l25635_fixups },
>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
> -			      SECT_4K | SPI_NOR_4B_OPCODES) },
> +			      SECT_4K | SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
>  	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
>  	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> -	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
> +	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512,
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
>  	{ "mx25l51245g", INFO(0xc2201a, 0, 64 * 1024, 1024,
>  			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			      SPI_NOR_4B_OPCODES) },
> +			      SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			      SPI_NOR_4B_OPCODES) },
> +			      SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
> -			      SPI_NOR_QUAD_READ) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_4BIT_BP) },
>  };
>  
>  static void macronix_default_init(struct spi_nor *nor)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
