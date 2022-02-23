Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D56AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceE3u+iTjUcOv6fufNReJSssYX7pOV2il5hhyp5qB4M=; b=NFBQXkQs5EUmr7
	7L5yVFzoP6oQeZkL2GB7UABgC1qqnyM5h+jiQmt8UsKWd5Vcvf7CJIc6fgxtluxZRB6nLIhCzF3Ci
	z4kp1iucQEzAi1TfTceuSt3pkG1RbNawYzEt8LLP2ZY4DwImg1LvkeCSfVLEeRlSPuR3N7+XTAdSV
	2WwzDiS6CEimTYm5TRi3XKh1m+dvwgUHzr3Uha9/2GwLlfd7SJxvmZz0/H9w599PWnEeELpzSRfQd
	LPTJVPozEnzku9mJrk7BXHkHOTjiLvJHZdx/A4ri00SkvUdC0uYdO9VvZ6+JfK8L2GXSYrVSLhGFN
	7RiyKKp06w1wbTs6T/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMr2z-00EF3t-OE; Wed, 23 Feb 2022 12:47:10 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMqIs-00E22m-A2
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 11:59:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NBxSQF028094;
 Wed, 23 Feb 2022 05:59:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645617568;
 bh=y0CTifx/SII+A7nZ6Kxf8q8vy5DnXtlySIBCjwQtU1w=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=W+2sa+0+1y/Ia6DVpQBe4lW2nSAduGBmmCBqUhQT4ZpTFFzTBPwSwuW65A2GgykUL
 Yq90GVuSYrH6TAFq9fOg5CbAUcX0o/Mk7JlttNrpcRKzU9DGC66LC/790wO4BPjXXB
 rKQrnCUxIfmN5QyGOAj1FxSb8lze1fAnt6SnaeNA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NBxRZe027398
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 05:59:27 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 05:59:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 05:59:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NBxNAj114579;
 Wed, 23 Feb 2022 05:59:24 -0600
Date: Wed, 23 Feb 2022 17:29:23 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 28/32] mtd: spi-nor: move all spansion specifics into
 spansion.c
Message-ID: <20220223115923.rxvpuuaj4dkdrxdl@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-29-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120809.1531502-29-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_035930_478030_F3A99EDC 
X-CRM114-Status: GOOD (  26.37  )
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

On 21/02/22 01:08PM, Michael Walle wrote:
> The clear status register flags is only available on spansion flashes.
> Move all the functions around that into the spanion module.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c     | 49 ------------------------
>  drivers/mtd/spi-nor/spansion.c | 70 ++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h    |  1 -
>  3 files changed, 70 insertions(+), 50 deletions(-)
> 
[...]
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 1a0e7214d9e5..38eeb0913ab2 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,7 @@
>  
>  #include "core.h"
>  
> +#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
> @@ -294,6 +295,72 @@ static const struct flash_info spansion_nor_parts[] = {
>  	},
>  };
>  
> +/**
> + * spi_nor_clear_sr() - Clear the Status Register.
> + * @nor:	pointer to 'struct spi_nor'.
> + */
> +static void spi_nor_clear_sr(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_NO_DATA);
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> +						       NULL, 0);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> +}
> +
> +/**
> + * spi_nor_sr_ready_and_clear() - Query the Status Register to see if the flash
> + * is ready for new commands and clear it.

Nitpick: "... and clear it if there are any errors."

Looks good otherwise.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
> +		if (nor->bouncebuf[0] & SR_E_ERR)
> +			dev_err(nor->dev, "Erase Error occurred\n");
> +		else
> +			dev_err(nor->dev, "Programming Error occurred\n");
> +
> +		spi_nor_clear_sr(nor);
> +
> +		/*
> +		 * WEL bit remains set to one when an erase or page program
> +		 * error occurs. Issue a Write Disable command to protect
> +		 * against inadvertent writes that can possibly corrupt the
> +		 * contents of the memory.
> +		 */
> +		ret = spi_nor_write_disable(nor);
> +		if (ret)
> +			return ret;
> +
> +		return -EIO;
> +	}
> +
> +	return !(nor->bouncebuf[0] & SR_WIP);
> +}
> +
>  static void spansion_nor_late_init(struct spi_nor *nor)
>  {
>  	if (nor->params->size > SZ_16M) {
> @@ -302,6 +369,9 @@ static void spansion_nor_late_init(struct spi_nor *nor)
>  		nor->erase_opcode = SPINOR_OP_SE;
>  		nor->mtd.erasesize = nor->info->sector_size;
>  	}
> +
> +	if (nor->flags & SNOR_F_USE_CLSR)
> +		nor->params->ready = spi_nor_sr_ready_and_clear;
>  }
>  
>  static const struct spi_nor_fixups spansion_nor_fixups = {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 4622251a79ff..5e25a7b75ae2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -90,7 +90,6 @@
>  
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
> -#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> -- 
> 2.30.2
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
