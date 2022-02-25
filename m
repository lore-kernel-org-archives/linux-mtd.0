Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09365C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nny67QlaXJe5bdw2QpkVTgYBuAoVqELgrS/5MPCO1Kg=; b=beX5M3QTBKRH52
	pI4DXgRiRtY2y/ElsjCmuBk2e+HQIvgVtHTKnja0fEKd7ovp3kdMaHFEKD8hP+5AW65cRy2T0sbD3
	5psA4TJYHlkOZCTn2KR+cVH6qKk4k1WJqTLXl3tnwvPWAixPnNf6Q4VTPQ8rONRHSq/cerLp6w37G
	LlOHXJObHO3AyzUVoFMwFbXYH17iy9y7wWPTNsM6mQXipTcs+pz9kSSxF+Bx+62zSsimFZDlV9e6L
	lRZ9GGey6E0JxFVnU7GPVU1gRy2BQghtgy4O8gEwbXnury/1hbZ3QDFtqgVKqcDe8PRNZie2eihpo
	FEPpl9Uqv/jXcv/3znhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNUqj-003ZG9-Rb; Fri, 25 Feb 2022 07:17:09 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNUqg-003ZFo-J4
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 07:17:08 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21P7GnEH038213;
 Fri, 25 Feb 2022 01:16:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645773409;
 bh=6CrmrfZqyLJbVe9Bi2gEiC9OIR7Ia7OBxorAbseneT0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=khgzJHjLhc87+ZsUE9UGHrKaYtApit9GPeHDjR1hKlrIAdvmzsZVY9lSAJkrf1jdq
 dGExMyKKfOSs6yytf3sx13EnRivmVurio+GCVUZY/7tkMt1OX/Ncqw7j6gi3A3I44V
 iK0LADmckeT6zwDvITY//ddg2Mxq3BYSYJV0jDqA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21P7GnZ8050284
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Feb 2022 01:16:49 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 01:16:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 01:16:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21P7GmcT092473;
 Fri, 25 Feb 2022 01:16:49 -0600
Date: Fri, 25 Feb 2022 12:46:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v8 2/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Message-ID: <20220225071648.wweb46iogiemobkl@ti.com>
References: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
 <dc30b0262fa977a3e87a2244d6bb3710e76b78fb.1645426789.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc30b0262fa977a3e87a2244d6bb3710e76b78fb.1645426789.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_231706_782798_171B78C4 
X-CRM114-Status: GOOD (  27.03  )
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

On 21/02/22 04:14PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Infineon chips support volatile version of configuration registers
> and it is recommended to update volatile registers in the field application
> due to a risk of the non-volatile registers corruption by power interrupt.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v8:
>   - Use spi_nor_read/write_reg() functions
>   - Use nor->bouncebuf instead of a variable on stack
>   
> Changes in v7:
>   - Add missing macro definitions in v6
>   
> Changes in v6:
>   - Remove multi die package support
> 
> Changes in v5:
>   - No change
>   
> Changes in v4:
>   - No change
>   
> Changes in v3:
>   - Add multi-die package parts support
> 
>  drivers/mtd/spi-nor/spansion.c | 61 ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 9040edf7359f..5453b89a1c22 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -10,6 +10,8 @@
>  
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */

You might have to rename function and variable names based on mwalle's 
patches [0], depending on which series goes in first.

Other than this,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
> @@ -105,6 +107,65 @@ static int spi_nor_cypress_octal_dtr_dis(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +/**
> + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_dummy:	number of dummy bytes for register read
> + *
> + * It is recommended to update volatile registers in the field application due
> + * to a risk of the non-volatile registers corruption by power interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> + * also set during Flash power-up. This function supports multi-die package
> + * parts that require to set the Quad Enable bit in each die.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
> +{
> +	struct spi_mem_op op;
> +	u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
> +	u8 cfr1v_written;
> +	int ret;
> +
> +	op = (struct spi_mem_op)
> +		SPI_NOR_SPANSION_RD_ANY_REG_OP(nor->addr_width, reg_addr,
> +					       reg_dummy, 1, nor->bouncebuf);
> +	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +		return 0;
> +
> +	/* Update the Quad Enable bit. */
> +	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +	op = (struct spi_mem_op)
> +		SPI_NOR_SPANSION_WR_ANY_REG_OP(nor->addr_width, reg_addr,
> +					       1, nor->bouncebuf);
> +	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_1_1_1);
> +	if (ret)
> +		return ret;
> +
> +	cfr1v_written = nor->bouncebuf[0];
> +
> +	/* Read back and check it. */
> +	op = (struct spi_mem_op)
> +		SPI_NOR_SPANSION_RD_ANY_REG_OP(nor->addr_width, reg_addr,
> +					       reg_dummy, 1, nor->bouncebuf);
> +	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->bouncebuf[0] != cfr1v_written) {
> +		dev_err(nor->dev, "CFR1: Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:		pointer to a 'struct spi_nor'
> -- 
> 2.25.1
> 

[0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20220223134358.1914798-13-michael@walle.cc/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
