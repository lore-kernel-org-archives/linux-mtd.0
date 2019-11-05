Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BC9C5DF60
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 17:07:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8D420656
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 17:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BJcOa2TL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lzzZ7M0N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8D420656
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXG862UjaJqVUur4h+CJ6Op5GY5Y1/6tlKrFZ/fx6Y0=; b=BJcOa2TLGi+94V
	pcVQi1GlKVTkOOETKcqayht6DGNF+ig4M7XZxMatk2AAak5nxjt6l0PJ9TpGBHAllTiz9FfhTCVKZ
	pQAOEcDEt/z5rY/S3oJMCt0TOE9C82niF+BXDK2yISwh7xlILTf8cNPRG2yYM/dI8NkhVX7HbY24D
	CVD4NFaAFXgc2aPnkQy90XCMzEi9Hy0piWsNKX6F3JFCMVR4+Ij/sugOdnXKVEWIqR9mJSvQO8HQc
	yWSv6i7qW3KTu0qn+mjjEWFC5G0hSQlZkAfmdHoHpUrccP/brb8KJ00ljFWjEh/yASqVcMKimcn22
	4RvJDl9P9MflV+zrqalQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS2Ix-000162-5M; Tue, 05 Nov 2019 17:07:43 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS2Ip-00014v-UO
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 17:07:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5H7TBZ093926;
 Tue, 5 Nov 2019 11:07:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1572973649;
 bh=bMI+XNkn4AgQXNeVFiaqXG8t27CoQPuoN38/FAQrVHM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=lzzZ7M0Nc4RZGq7oBDPKgiEIIhcZCx7oyJ9C0Yc3BPvjBYb989i10CDzlmMaSEwp0
 wymNfE2mp3oQtEM/5txZpp7s7FL2Rdg/OBGyDW/I2nLqvEbPhydit7BXhg/XH0YMal
 qCwsD79AX1xNboP+fTiC0VUAMP+wPvVfY+HkGIX8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5H7Trl011766
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Nov 2019 11:07:29 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 11:07:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 11:07:13 -0600
Received: from [10.250.132.11] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5H7PBg098967;
 Tue, 5 Nov 2019 11:07:26 -0600
Subject: Re: [PATCH v4 13/20] mtd: spi-nor: Fix clearing of QE bit on
 lock()/unlock()
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-14-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <14e9c474-1a92-b8be-12cf-56c7f6d0d696@ti.com>
Date: Tue, 5 Nov 2019 22:37:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191102112316.20715-14-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_090736_081890_BBBC876F 
X-CRM114-Status: GOOD (  21.56  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02-Nov-19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Make sure that when doing a lock() or an unlock() operation we don't clear
> the QE bit from Status Register 2.
> 
> JESD216 revB or later offers information about the *default* Status
> Register commands to use (see BFPT DWORDS[15], bits 22:20). In this
> standard, Status Register 1 refers to the first data byte transferred on a
> Read Status (05h) or Write Status (01h) command. Status register 2 refers
> to the byte read using instruction 35h. Status register 2 is the second
> byte transferred in a Write Status (01h) command.
> 
> Industry naming and definitions of these Status Registers may differ.
> The definitions are described in JESD216B, BFPT DWORDS[15], bits 22:20.
> There are cases in which writing only one byte to the Status Register 1
> has the side-effect of clearing Status Register 2 and implicitly the Quad
> Enable bit. This side-effect is hit just by the
> BFPT_DWORD15_QER_SR2_BIT1_BUGGY and BFPT_DWORD15_QER_SR2_BIT1 cases.
>

But I see that 1 byte SR1 write still happens as part of
spi_nor_clear_sr_bp() until patch 20/20. So is this only a partial fix?
Should this patch be rearranged to appear along with 20/20?


> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 120 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |   3 ++
>  2 files changed, 118 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 725dab241271..f96bc80c0ed1 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -959,12 +959,19 @@ static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
>  	return spi_nor_wait_till_ready(nor);
>  }
>  
[...]
> +/**
>   * spi_nor_write_sr2() - Write the Status Register 2 using the
>   * SPINOR_OP_WRSR2 (3eh) command.
>   * @nor:	pointer to 'struct spi_nor'.
> @@ -3634,19 +3723,38 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		break;
>  
>  	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
> +		/*
> +		 * Writing only one byte to the Status Register has the
> +		 * side-effect of clearing Status Register 2.
> +		 */
>  	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
> +		/*
> +		 * Read Configuration Register (35h) instruction is not
> +		 * supported.
> +		 */
> +		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;

Since SNOR_F_HAS_16BIT_SR is set by default in
spi_nor_info_init_params(), no need to set the flag here again

>  		params->quad_enable = spansion_no_read_cr_quad_enable;
>  		break;
>  
>  	case BFPT_DWORD15_QER_SR1_BIT6:
> +		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>  		params->quad_enable = macronix_quad_enable;
>  		break;
>  
>  	case BFPT_DWORD15_QER_SR2_BIT7:
> +		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>  		params->quad_enable = sr2_bit7_quad_enable;
>  		break;
>  
>  	case BFPT_DWORD15_QER_SR2_BIT1:
> +		/*
> +		 * JESD216 rev B or later does not specify if writing only one
> +		 * byte to the Status Register clears or not the Status
> +		 * Register 2, so let's be cautious and keep the default
> +		 * assumption of a 16-bit Write Status (01h) command.
> +		 */
> +		nor->flags |= SNOR_F_HAS_16BIT_SR;
> +

Same here...

>  		params->quad_enable = spansion_read_cr_quad_enable;
>  		break;
>  
> @@ -4613,6 +4721,8 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	params->quad_enable = spansion_read_cr_quad_enable;
>  	params->set_4byte = spansion_set_4byte;
>  	params->setup = spi_nor_default_setup;
> +	/* Default to 16-bit Write Status (01h) Command */
> +	nor->flags |= SNOR_F_HAS_16BIT_SR;
>  
>  	/* Set SPI NOR sizes. */
>  	params->size = (u64)info->sector_size * info->n_sectors;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index d1d736d3c8ab..d6ec55cc6d97 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -243,6 +243,9 @@ enum spi_nor_option_flags {
>  	SNOR_F_4B_OPCODES	= BIT(6),
>  	SNOR_F_HAS_4BAIT	= BIT(7),
>  	SNOR_F_HAS_LOCK		= BIT(8),
> +	SNOR_F_HAS_16BIT_SR	= BIT(9),
> +	SNOR_F_NO_READ_CR	= BIT(10),
> +
>  };
>  
>  /**
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
