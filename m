Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D31AC4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B9661059
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B9661059
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZI74UoHNqAXtNAgJsia3FDXjARs+OdF5pjZSCzM9QCI=; b=lR3c1gv+HhQhWQ2b5WaIY3EqXg
	S4+S7VqHXIo8bwXYxO7nfuknbpXL2JTjiGz64CIzShNuiyvEhigYOOMAsS9rFIm6GZ/pwx67TgqpW
	bcUluU227P1wFSb/t2CR2GeNk2ERX4+q+db+d8b1Zjpyl/v/RXcJa8V7vOQdy9JWYla+ORyTPpg5o
	Bq6459qzuUHr6zUIa0bQV0j/82Pb5GlnDBhviA0ex2GYvFw1fSPxLM3vIpv/LE/SKWhKdFCJp/jtD
	ixmGQPR62WIlYlGCqXjWMMQGpogNq2vQom3UQvNy5KlGD6q27GHK35oPFf41iIicSCKUagWs8ca0H
	b61xu8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmG69-006Hvy-Ie; Thu, 27 May 2021 13:30:54 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmFwi-006CtP-VJ
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 13:21:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RDL1KK075748;
 Thu, 27 May 2021 08:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622121661;
 bh=PlOJYf/dA5U5QB+68fwfBVApJMfsFzevQvhmOuhgpcw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=rZsH+2BHKexWmpAy2glgeFQUZKHp6B6NuqmUSuinYFvyEHzZixCdnK0Vo5r98n5ez
 SIx0cKjVQep7S8PKiRIvbdx6fPGSHOtL5ZyQLU2Ns6+CuXz5ihz47Ak5QxQn0Zf91a
 aAEg78zhyayZkqzjBXZ8pnxwfKzs0jvgZ7viUJuM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RDL18e002666
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 08:21:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 08:21:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 08:21:01 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RDKvbN055454;
 Thu, 27 May 2021 08:20:58 -0500
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
 <28d1a4015f37156a8bebe88959ea643e64b030f8.1619504535.git.Takahiro.Kuwano@infineon.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6b329250-93f4-bbbe-048f-696de9436342@ti.com>
Date: Thu, 27 May 2021 18:50:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <28d1a4015f37156a8bebe88959ea643e64b030f8.1619504535.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_062109_169277_E6FD6EE4 
X-CRM114-Status: GOOD (  29.93  )
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



On 4/27/21 12:39 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. For the multi-die package parts (2Gb),
> only uniform sector sizes is supprted. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> Changes in v5:
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT 
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize 
> 
>  drivers/mtd/spi-nor/spansion.c | 117 +++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 79d3249ed0aa..b3b006874b4f 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -229,6 +229,103 @@ static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
>  	return 1;
>  }
>  
> +static int s25hx_t_quad_enable(struct spi_nor *nor)
> +{
> +	return spansion_quad_enable_volatile(nor, 0, SZ_128M);

Number of dies should be part of struct flash_info
Die size can then be derived from total_size / die_num


> +}
> +
> +static int s25hx_t_mdp_ready(struct spi_nor *nor)
> +{
> +	return spansion_mdp_ready(nor, 0, SZ_128M);

Hmm, is it necessary to poll second die if writes/erases were targeted
to first die only?

Please split multi die support into a separate series. SPI NOR core
should be aware of multiple dies and thus call poll on each of the dies
separately.

This will also allow base S25hx support to be accepted faster.

> +}
> +
> +static int
> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
> +			 const struct sfdp_parameter_header *bfpt_header,
> +			 const struct sfdp_bfpt *bfpt,
> +			 struct spi_nor_flash_parameter *params)
> +{
> +	int ret;
> +	u32 addr;
> +	u8 cfr3v;
> +
> +	ret = spi_nor_set_4byte_addr_mode(nor, true);
> +	if (ret)
> +		return ret;
> +	nor->addr_width = 4;

Don't we need to check if flash size is actual >16M before enabling 4
byte addressing?

> +
> +	/* Replace Quad Enable with volatile version */
> +	params->quad_enable = s25hx_t_quad_enable;
> +
> +	/*
> +	 * The page_size is set to 512B from BFPT, but it actually depends on
> +	 * the configuration register. Look up the CFR3V and determine the
> +	 * page_size. For multi-die package parts, use 512B only when the all
> +	 * dies are configured to 512B buffer.
> +	 */
> +	for (addr = 0; addr < params->size; addr += SZ_128M) {
> +		ret = spansion_read_any_reg(nor,
> +					    addr + SPINOR_REG_CYPRESS_CFR3V, 0,
> +					    &cfr3v);
> +		if (ret)
> +			return ret;
> +
> +		if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ)) {
> +			params->page_size = 256;
> +			return 0;
> +		}
> +	}
> +	params->page_size = 512;
> +
> +	return 0;
> +}
> +
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
