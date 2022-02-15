Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07947C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCZH9P154ePap9GYwylVipNkT01E6BJuV6TkZR6Uf4Q=; b=fcBFRomTMeC9XJ
	DQpn9yYhN6nZnUivzbr27f8VBiuiPOFGnV39c0wKU6HQdcZhP7yAaKq5iCSCc8U8s1DSa0ig+pDvL
	sYAXzSJEmKWmf6PDuMQ1CgJQ30it7PU/38WrBNV6BONyEyuAemJgHtYQ//u8HlOHgwuBM3lCPFX7u
	yNvt860mKBJZULDcsChmQk2oY6qMdGeSGUEZT8wKkXfQt6y8IuCvIvFzfiJqbR5SJ0LnT4M08kMJI
	/umqvc2JrGAgv8P+tX6QpuM9KUzlFwfC9eWH3v2cwOafjl1dAtLhgm3lnCvPXzGnJiZZnqu4yiP2Y
	IN0JNz6jy1KyQXhV0zAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK3Gr-004FUE-2c; Tue, 15 Feb 2022 19:13:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK3Gk-004FQB-NS
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 19:13:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FJDhm7000644;
 Tue, 15 Feb 2022 13:13:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644952423;
 bh=7OwaduZPLkGK401BNbTmi2EmMBOqRw81kM8za35FTxs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=rv4c0QqvmEwCfSZaoeiN4VIStihxwhhHTa9VPS1O164dDk1Qr5UPPgNrlQMVqDwdD
 JPhL4cEQWeIwH74ZQzEDEtkI3ek5Jd4SXFt4UFTtj3jwx6T1YyvTtdxyRlT3z3HDDb
 pbNoX70yOI7K1aLwcz8YOpGGSl53taqCJhGPkMuk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FJDhIu019605
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 13:13:43 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 13:13:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 13:13:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FJDJbG017292;
 Tue, 15 Feb 2022 13:13:19 -0600
Date: Wed, 16 Feb 2022 00:43:18 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 07/14] mtd: spi-nor: move all micron-st specifics into
 micron-st.c
Message-ID: <20220215191318.a3dzc26dazgd6i4k@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-8-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-8-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_111346_881250_83E90BBD 
X-CRM114-Status: GOOD (  27.10  )
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

On 02/02/22 03:58PM, Michael Walle wrote:
> The flag status register is only available on micron flashes. Move all
> the functions around that into the micron module.
> 
> This is almost a mechanical move except for the spi_nor_fsr_ready()
> which now also checks the normal status register. Previously, this was
> done in spi_nor_ready().
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c      | 123 +-----------------------------
>  drivers/mtd/spi-nor/micron-st.c | 129 ++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h     |   8 --
>  3 files changed, 130 insertions(+), 130 deletions(-)
> 
[...]
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index bb95b1aabf74..c66580e8aa00 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -8,6 +8,8 @@
>  
>  #include "core.h"
>  
> +#define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
> +#define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
>  #define SPINOR_OP_MT_DTR_RD	0xfd	/* Fast Read opcode in DTR mode */
>  #define SPINOR_OP_MT_RD_ANY_REG	0x85	/* Read volatile register */
>  #define SPINOR_OP_MT_WR_ANY_REG	0x81	/* Write volatile register */
> @@ -17,6 +19,12 @@
>  #define SPINOR_MT_OCT_DTR	0xe7	/* Enable Octal DTR. */
>  #define SPINOR_MT_EXSPI		0xff	/* Enable Extended SPI (default) */
>  
> +/* Flag Status Register bits */
> +#define FSR_READY		BIT(7)	/* Device status, 0 = Busy, 1 = Ready */
> +#define FSR_E_ERR		BIT(5)	/* Erase operation status */
> +#define FSR_P_ERR		BIT(4)	/* Program operation status */
> +#define FSR_PT_ERR		BIT(1)	/* Protection error bit */
> +
>  static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  {
>  	struct spi_mem_op op;
> @@ -273,12 +281,133 @@ static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  	return spi_nor_write_disable(nor);
>  }
>  
> +/**
> + * spi_nor_read_fsr() - Read the Flag Status Register.
> + * @nor:	pointer to 'struct spi_nor'
> + * @fsr:	pointer to a DMA-able buffer where the value of the
> + *              Flag Status Register will be written. Should be at least 2
> + *              bytes.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 0),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(1, fsr, 0));
> +
> +		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
> +			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> +			op.dummy.nbytes = nor->params->rdsr_dummy;
> +			/*
> +			 * We don't want to read only one byte in DTR mode. So,
> +			 * read 2 and then discard the second byte.
> +			 */
> +			op.data.nbytes = 2;
> +		}
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDFSR, fsr,
> +						      1);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d reading FSR\n", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * spi_nor_clear_fsr() - Clear the Flag Status Register.
> + * @nor:	pointer to 'struct spi_nor'.
> + */
> +static void spi_nor_clear_fsr(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_NO_DATA);
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLFSR,
> +						       NULL, 0);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d clearing FSR\n", ret);
> +}
> +
> +/**
> + * spi_nor_fsr_ready() - Query the Flag Status Register to see if the flash is
> + * ready for new commands.
> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int spi_nor_fsr_ready(struct spi_nor *nor)

Nitpick: At this point this function is not just spi_nor_fsr_ready(). I 
think it should be renamed to something more accurate like 
micron_st_ready() (with whatever prefix scheme that was decided upon).

Looks good otherwise.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
