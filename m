Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C6EC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mvh+QlnT5GEqGgMRhDoeNVbYMZlZXJFHnBQOmdXGJdk=; b=l/h9jeR1v3105d
	mjGQK2O1jyB5HwCvAmpuFtWQeD5loxmwoZrwE80b7GVTw6+rVDM+eXE/FTV1v8irav4mO1dH9BOmN
	3z6HqwLDrmAr02dOFWvnWjr0ImCF6wUufP92pE812k3QDskDb551fVfctKSYvq4k8qcBPXa9oECME
	TOCyuuDYMAydESlHTQpGqTn25aSfxKyb8Si1OJPmj0+dx+DCYH1caLbu3KIDznbi7f89cKGJHuyoN
	jG25SWtM8gnyDDlqlciqL/HZL1Jwg0AHv04rWf5NGXMm0rhwVc/MR8fNBzHVcW+eiHcp/eupuEY4B
	GNzJXP3/WTj8Stj6cjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7pp-006z8K-1w;
	Wed, 01 Nov 2023 09:48:25 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7pj-006z7H-2s
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:48:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so10850265a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698832097; x=1699436897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwpSxBowZ7fGgTf3vasiRlH8Hfcy741d3f9oW1eMJEE=;
        b=l5pPioBuBMHyAQivwBuSwQhyaEfk47mwH6TQ+xZiI2PZOYQawihzNjnttWyZuJ6Q64
         VrWZVvQX+0tXdZoz6E4sbHvS7s/zH0PdrCZrk7R0HaaTxzvK3TKEku0bPvrZObRS7c0y
         H/vX5qvVzSUwX15HZ9yVL8+Se2VzB9OHKFjIH0WTh0+7lFmC+Y9TgvdAI/3+AJ4tKVBM
         4235wznHsJXuUDvNHhiL1klrj1/2s2qCWskAC2C4cxUA7q4uQHQvSZUFOfWjQR0djt5O
         i+reTpwRxxR+mNAr/YSfNhpG9sc56ZkaTwcwv6OicNxHhhSAUDjA0wabqC62SQePoAiM
         6UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698832097; x=1699436897;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwpSxBowZ7fGgTf3vasiRlH8Hfcy741d3f9oW1eMJEE=;
        b=dingFG85SYMGlt99TCoXQQMiRayydYk6eJS39b23Q5Bl+lUuWv/iJi4gGvjS80vlGU
         jhro9mcY2NH/HJXibR+mFCP+eDw4H6530P6xWHhSp2eVdSafNpPMYVXGIBP0JRTJ1RlU
         +JQPjn7I6HIytn7/A1f4v1hWKWK0SFF4K/ezrWPv76/eA2Gcq0WNCXmX1rt0XUc9jwh/
         KVsN0DXWpQ8bzGuqhnCq+wyfn0dujAztUsAzcHYxcHb9rQXrg6alPTRCnvNNTNGnXMaW
         jY4glkr4d5c2gAZmwIqzDiqB7tXwn5rNLUTAlJnct3tGKESNLMcWjiBeJOYxW3dekktb
         PV4g==
X-Gm-Message-State: AOJu0Yz95tOYMe2VWE9PeVbCdV/CV/WGpNMmppV351lAU/cEH2ekuRP6
	2R+TLLH+1zTG0UbaHb4QKs7J/g==
X-Google-Smtp-Source: AGHT+IHWHu+1kpm3VXUP25guEhk8Zwb/PiCC/IG/qeo267vyupbLEbkI+PrLJ7ynCYV0aG/9Y14GXA==
X-Received: by 2002:a17:906:d797:b0:9c7:58cd:b57 with SMTP id pj23-20020a170906d79700b009c758cd0b57mr1118476ejb.37.1698832097430;
        Wed, 01 Nov 2023 02:48:17 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id j18-20020a508a92000000b0054351b5a768sm865329edj.82.2023.11.01.02.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 02:48:17 -0700 (PDT)
Message-ID: <05fb3eac-0f1f-44f4-83b8-6ac5914c73c4@linaro.org>
Date: Wed, 1 Nov 2023 11:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mtd: spi-nor: add erase die (chip) capability
To: michael@walle.cc, festevam@denx.de, takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
 <20231101094325.95851-3-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20231101094325.95851-3-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024819_953998_48494D18 
X-CRM114-Status: GOOD (  28.28  )
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



On 01.11.2023 11:43, Tudor Ambarus wrote:
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
>  		unsigned long timeout;
>  
>  		ret = spi_nor_lock_device(nor);
> @@ -2902,6 +2915,9 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>  			return ret;
>  	}
>  
> +	if (nor->params->chip_erase_opcode)

oops, here I wanted to check for null, when null, set the default.
Takahiro and Fabio, would you please update when/if testing?

	if (!nor->params->chip_erase_opcode)


Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
