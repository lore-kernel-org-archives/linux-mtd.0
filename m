Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A7DC02192
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJ4jtVrOBrv2IfJlOXfAKmspV/6CWf7HEUPB+uxPuy0=; b=JlJCWinmsGzJ+r1C2Vvx2ExijB
	/W1t0jBeNuurIsk2iyyQ7ffeftrfix6viqSwGiLlMcJRr+XhYNM4hnUW4TH2aqsM2X7nDExnvDMNP
	Zh9WtrpYlYp7z12ToZfbruahd6+R8268r108mVtEpSap68IrkCB5OZYa3fC/1x/NyeU1YB5Q1M4+P
	16WhPUV1jxdCw8huHL0M75koDXAp1xrawoQz1A3bqJOboEVV4bduzyn898nZcfYj9m1tkE/ZlpBiq
	ly0UYNhN1xr0zxyzNEM10K2HK6wysJwqud1/fi/oKg2hOTZT1aRIw27N15OINqFv1wdEHC2yLswbO
	oHfLwX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJqo-00000008qBo-1xeC;
	Fri, 07 Feb 2025 08:36:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJqm-00000008qBR-2HYd
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 08:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9C435C6563;
	Fri,  7 Feb 2025 08:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C50C4CED1;
	Fri,  7 Feb 2025 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738917395;
	bh=95R7wtZe+y2DcnVkficYA9or/YfcSNgSUS2n9SAYGs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LAUsS20JTtH6AV9OROJt/fNj30Nbuw3DWl80TVd7AaQnxmvSwanZ+MPddNBfbkQe8
	 r3zbXLwCp6AV+4Qjp84/we4L3s1ITPWCp8F0MMLz7QTFZPbiCLhhDSgGFxcKWDc8sA
	 CDbHzbZSnVTf8GGoSrcNgH6cvyPZjU6ML42tYTaGbhOIYhbfa0+TOVFc7CSulngMJ5
	 WNJbPHVhH71hoRhyCFr8tB50cXAdw/fELGtL6PVQmg45Ajz6nbOzwZzv4hQ9vvma/S
	 AN8PEZEpmTbLeoG3CJC52HgFfGjvlLTD+BMUKrAyjEsyHfI2IylNgO0heRShTbBEy2
	 KVA8ZGw485vHQ==
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 09:36:31 +0100
From: Michael Walle <mwalle@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
In-Reply-To: <20250207081846.362919-2-linchengming884@gmail.com>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com>
Message-ID: <8901dcd481a2185ad34fa7dd09997b38@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003636_672018_EE56CAC5 
X-CRM114-Status: GOOD (  18.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Cheng,

> Although certain Macronix NOR flash support the Quad Input Page Program
> feature, the corresponding information in the 4-byte Address 
> Instruction
> Table of these flash is not properly filled. As a result, this feature
> cannot be enabled as expected.
> 
> To address this issue, a post_sfdp fixups implementation is required to
> correct the missing information.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 830da21eea08..ada17999ccbb 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -45,8 +45,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  	return 0;
>  }
> 
> +static int
> +macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
> +			SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
> +
> +	return 0;
> +}
> +
>  static const struct spi_nor_fixups mx25l25635_fixups = {
>  	.post_bfpt = mx25l25635_post_bfpt_fixups,
> +	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
> +};
> +
> +static const struct spi_nor_fixups macronix_qpp4b_fixups = {
> +	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
>  };
> 
>  static const struct flash_info macronix_nor_parts[] = {
> @@ -102,11 +120,13 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x20, 0x1b),
>  		.name = "mx66l1g45g",
>  		.size = SZ_128M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x23, 0x14),
>  		.name = "mx25v8035f",
> @@ -154,18 +174,21 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x25, 0x3a),
>  		.name = "mx66u51235f",
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x25, 0x3c),
>  		.name = "mx66u2g45g",
>  		.size = SZ_256M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x26, 0x18),
>  		.name = "mx25l12855e",

Could you also please share the SFDP dumps of these flashes with us?

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
