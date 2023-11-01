Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E189FC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMQJLU9TmYwccDcXoVgkZoRh2sj1+S1ZhCsswOZdhhA=; b=0tZePoefsOWahP
	D7r1Y78+5SmdBR73tKLegDS6+8ZsWZWCa9M6HX7vF1EDXZXwh9cViUh3TYbMWx2RIP2tCtWurD3Mh
	kQHUeVyt4eH2PM/xpNBTXLFkZdWmyo8zf+urU3XGqOMe6YxyXslL71fS948tXmH25qXoaoisJh8R7
	qGBERG/1f/Kpre0RyB8oBi6DG/kHZOoWaERe/UR5MR/WD56i+R9GHjX0JU/ImDrtSiMEj/MaIFFMc
	7tEgjHaPBvUlgYXU8E6zSPrniebGolv6QjsxebLrzsUY1GtmdNBeg/TooOsYyCSxu40o5+0EeRhyk
	Tljn8cUZ1UfW7DP7T6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAMj-007UJL-01;
	Wed, 01 Nov 2023 12:30:33 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9yP-007Kz7-3A
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 12:05:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so11647932a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698840324; x=1699445124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLdMG+eAaC/L0rL41QBqFEOhOYsSYOCLyTBBIBvPEsg=;
        b=X4x7SWii2Ggc8TnJyWFr/v18scwVgaBg/246zCAEHKN4RHvqJV4WcXwZAFULFjQf88
         CeXpD1srwQcsYyJHl0nYJz6EVcM4c+vZZlQHi4AFWixyz8nOZWstZCK8L3FdBzhZxTdz
         7nf2Pp8avUe+YZ9TX90OErw1zsEqaWuN67UXITlTrTngA8tdzLNl/CCjHTsSFIAXi5/S
         q5trPhymqgq7OYlQMuHLbxC/FAIOfgempL2ER2Znpx4UEUFFxQO/HgRE+TTgHvFoxzxA
         Lf6NoloFxIVgu45b2AlSGWGk02Tc92z39d0Yc0q1/BFDUnV+kRDFIbJ6+G7JfL61017X
         o0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698840324; x=1699445124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLdMG+eAaC/L0rL41QBqFEOhOYsSYOCLyTBBIBvPEsg=;
        b=ZIHprNuYIf9OFG/y9U7GG4bl+m6fl+yb98jZQ72VL8vP0Gw6aNYIzVk/LAA7kpnMkW
         c8k6KtnPPNdhLSAPWe3BSmMa3e+y4d3OeKil/NLb8OOh7a8lqnIz5gPx6A6xb4GGWS8F
         EA2VSLm4t/4MfUgeThoOkzC+LMqZRw6c1ncdgjJz1cNd8iG2+9girQpQrpROD4GW9FRM
         Nc9E0Cy32BP+OreF/b5hTKBtfV61XMkJQQrBceSnKf0xyTNnzHpzTn/zBorqG/dRDY0b
         k4byJqmoIvbNf94FlHCvXDcRKHh9vmzCCJMX2T+PTnLYVH4cX4Csa/628Kev2ckXui40
         Alxg==
X-Gm-Message-State: AOJu0YwZQiaOhlHIy3mbwiwpcLUGSDLVHzXStf8JckPYM6dhI74Oyn2y
	JaUcZcbFMOlKgkwbmMFALKh2sg==
X-Google-Smtp-Source: AGHT+IGaEKuOrjZAVHPe0zmLZiOAUxMt8455glAeFN37T3AlzJmEFUvA1PtT6atMLiSpjPFYSrYNww==
X-Received: by 2002:a17:907:7247:b0:9bd:bbc1:1c65 with SMTP id ds7-20020a170907724700b009bdbbc11c65mr1746388ejc.13.1698840323517;
        Wed, 01 Nov 2023 05:05:23 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id bq20-20020a170906d0d400b0099d798a6bb5sm2318978ejb.67.2023.11.01.05.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 05:05:23 -0700 (PDT)
Message-ID: <fe6ccf43-7b71-4db6-a8de-9b33474d5a3c@linaro.org>
Date: Wed, 1 Nov 2023 12:05:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mtd: spi-nor: add erase die (chip) capability
To: michael@walle.cc, festevam@denx.de, takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
 <20231101094325.95851-3-tudor.ambarus@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231101094325.95851-3-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_050526_019304_46A51396 
X-CRM114-Status: GOOD (  27.58  )
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



On 11/1/23 09:43, Tudor Ambarus wrote:
> JESD216 defines a chip as a die, one and the other are the same thing.
> JESD216 clarifies that the chip erase time defined in BFPT dword(11)
> applies separately to each die for multi-die devices in which the dice
> are individually accessed. Based on this, update the
> spi_nor_erase_chip() method to support multi-die devices.
> 
> For now, benefit of the die erase when addr and len are aligned with die
> size. This could be improved however for the uniform and non-uniform
> erases cases to use the die erase when possible. For example if one
> requests that an erase of a 2 die device starting from the last 64KB of
> the first die to the end of the flash size, we could use just 2
> commands, a 64KB erase and a die erase. This improvement is left as an
> exercise for the reader, as I don't have multi die flashes at hand.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/core.c    | 22 +++++++++++++++++++---
>  drivers/mtd/spi-nor/core.h    |  6 ++++--
>  drivers/mtd/spi-nor/debugfs.c |  2 +-
>  3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 25a64c65717d..360fce7ffe82 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1067,17 +1067,21 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
>   */
>  static int spi_nor_erase_chip(struct spi_nor *nor)
>  {
> +	u8 opcode = nor->params->chip_erase_opcode;
>  	int ret;
>  
>  	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
>  
>  	if (nor->spimem) {
> -		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
> +		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP(opcode);
>  
>  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> +		if (opcode != SPINOR_OP_CHIP_ERASE)
> +			return -EOPNOTSUPP;
> +
>  		ret = spi_nor_controller_ops_write_reg(nor,
>  						       SPINOR_OP_CHIP_ERASE,
>  						       NULL, 0);
> @@ -1799,7 +1803,10 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>  static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	u8 n_dice = nor->params->n_dice;
> +	bool die_erase = false;
>  	u32 addr, len, rem;
> +	size_t die_size;
>  	int ret;
>  
>  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
> @@ -1814,12 +1821,18 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	addr = instr->addr;
>  	len = instr->len;
>  
> +	if (n_dice) {
> +		die_size = div_u64(mtd->size, n_dice);
> +		if (len == die_size && (addr & (die_size - 1)))
> +			die_erase = true;
> +	}
> +
>  	ret = spi_nor_prep_and_lock_pe(nor, instr->addr, instr->len);
>  	if (ret)
>  		return ret;
>  
> -	/* whole-chip erase? */
> -	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
> +	/* chip (die) erase? */
> +	if ((len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) || die_erase) {

and here I should have iterated over all dices, whereas now I erase just
one die :).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
