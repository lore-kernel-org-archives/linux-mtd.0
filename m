Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231C3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txgUk/6X5bCP6nVya/TfjkxWMU0UD8i2Lb9mUWpxaH4=; b=QqF3jeR2m3DZI0
	eujtjOxZNiZ/ow6Jw/rjc1WSd9V+FCAhLJNOeSE79h12FJ0xyh7dkTHY4jAVBkb2HNacEyIWhxvvQ
	NngQCMtiMq28IpD6pWWfNnVV0mNx6VTIeOlu6U3hCUgiJorfwyEZM79Nh0lqawe5ripIdmS2PAYWl
	zRjAZtxGfovnf5TwH7vNDScO0ONs6MM+eLW7Pw5HbLzObNtq2hOTN+4Q61wJAAAsDGAkfVXZL+o6o
	JHqS2U4v7KNGwep3OMmoJiiFGzEQmgEvvEVGXDgeC4qJvINo8yP9lsj1MlzeBI20gefJajF8bWnoM
	7Rb+ZukXufO+YfWiFMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNK9c-002CIx-52; Thu, 24 Feb 2022 19:51:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNK9V-002CHH-TY
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 19:51:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21OJpfE6023425;
 Thu, 24 Feb 2022 13:51:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645732301;
 bh=/Yco3sZhqGHYG24zZDa8hoqr6CjPjhi6uAaQBygzIN0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=wUzqL0siiBF6IFywVllx+1rK1oFxL2s7nREVGHGuXSB43zq8cMjr1w7S9oFy7f5y1
 nfFvF5gTB9M/HBDnxkTDLESb6foNoWx/oeZO15cqOBbDAvpXo949CJC3BEwIb8Q88g
 MWiUwomBRnQI8ZBSThJplDhjRZx5bMkq4quea44U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21OJpenP099894
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Feb 2022 13:51:40 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 13:51:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 13:51:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21OJpdWI045062;
 Thu, 24 Feb 2022 13:51:40 -0600
Date: Fri, 25 Feb 2022 01:21:39 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: micron-st: Rework
 spi_nor_micron_octal_dtr_enable()
Message-ID: <20220224195139.i4kjbnhgthwtcaet@ti.com>
References: <20220210023334.408926-1-tudor.ambarus@microchip.com>
 <20220210023334.408926-3-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210023334.408926-3-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_115150_104261_5B9ED26C 
X-CRM114-Status: GOOD (  33.12  )
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

Hi Tudor,

On 10/02/22 04:33AM, Tudor Ambarus wrote:
> Introduce template operation to remove code duplication.
> Split spi_nor_micron_octal_dtr_enable() in spi_nor_micron_octal_dtr_en()
> and spi_nor_micron_octal_dtr_dis() as it no longer made sense to try to
> keep everything alltogether: too many "if (enable)" throughout the code,
> which made the code difficult to follow.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 105 +++++++++++++++++---------------
>  1 file changed, 55 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 7f66b5943ceb..013aa6a52737 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -17,73 +17,72 @@
>  #define SPINOR_MT_OCT_DTR	0xe7	/* Enable Octal DTR. */
>  #define SPINOR_MT_EXSPI		0xff	/* Enable Extended SPI (default) */
>  
> -static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +/* Micron ST SPI NOR flash operations. */
> +#define SPI_NOR_MICRON_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\

Should change function and variable names based on mwalle's patches 
(assuming you agree with that scheme). MICRON_NOR_WR_ANY_REG_OP?

> +	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 0),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> +
> +static int spi_nor_micron_octal_dtr_en(struct spi_nor *nor)

micron_nor_octal_dtr_en(). Same for other functions.

>  {
>  	struct spi_mem_op op;
>  	u8 *buf = nor->bouncebuf;
>  	int ret;
>  
> -	if (enable) {
> -		/* Use 20 dummy cycles for memory array reads. */
> -		ret = spi_nor_write_enable(nor);
> -		if (ret)
> -			return ret;
> -
> -		*buf = 20;
> -		op = (struct spi_mem_op)
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> -				   SPI_MEM_OP_ADDR(3, SPINOR_REG_MT_CFR1V, 1),
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
> -
> -		ret = spi_mem_exec_op(nor->spimem, &op);
> -		if (ret)
> -			return ret;
> +	/* Use 20 dummy cycles for memory array reads. */
> +	*buf = 20;
> +	op = (struct spi_mem_op)
> +		SPI_NOR_MICRON_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR1V, 1, buf);
> +	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
>  
> -		ret = spi_nor_wait_till_ready(nor);
> -		if (ret)
> -			return ret;
> -	}
> +	buf[0] = SPINOR_MT_OCT_DTR;
> +	op = (struct spi_mem_op)
> +		SPI_NOR_MICRON_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR0V, 1, buf);
> +	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
>  
> -	ret = spi_nor_write_enable(nor);
> +	/* Read flash ID to make sure the switch was successful. */
> +	ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
>  	if (ret)
>  		return ret;
>  
> -	if (enable) {
> -		buf[0] = SPINOR_MT_OCT_DTR;
> -	} else {
> -		/*
> -		 * The register is 1-byte wide, but 1-byte transactions are not
> -		 * allowed in 8D-8D-8D mode. The next register is the dummy
> -		 * cycle configuration register. Since the transaction needs to
> -		 * be at least 2 bytes wide, set the next register to its
> -		 * default value. This also makes sense because the value was
> -		 * changed when enabling 8D-8D-8D mode, it should be reset when
> -		 * disabling.
> -		 */
> -		buf[0] = SPINOR_MT_EXSPI;
> -		buf[1] = SPINOR_REG_MT_CFR1V_DEF;
> -	}
> +	if (memcmp(buf, nor->info->id, nor->info->id_len))
> +		return -EINVAL;
>  
> -	op = (struct spi_mem_op)
> -		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> -			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
> -					   SPINOR_REG_MT_CFR0V, 1),
> -			   SPI_MEM_OP_NO_DUMMY,
> -			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
> +	return 0;
> +}
>  
> -	if (!enable)
> -		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +static int spi_nor_micron_octal_dtr_dis(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf;
> +	int ret;
>  
> -	ret = spi_mem_exec_op(nor->spimem, &op);
> +	/*
> +	 * The register is 1-byte wide, but 1-byte transactions are not allowed
> +	 * in 8D-8D-8D mode. The next register is the dummy cycle configuration
> +	 * register. Since the transaction needs to be at least 2 bytes wide,
> +	 * set the next register to its default value. This also makes sense
> +	 * because the value was changed when enabling 8D-8D-8D mode, it should
> +	 * be reset when disabling.
> +	 */
> +	buf[0] = SPINOR_MT_EXSPI;
> +	buf[1] = SPINOR_REG_MT_CFR1V_DEF;
> +	op = (struct spi_mem_op)
> +		SPI_NOR_MICRON_WR_ANY_REG_OP(4, SPINOR_REG_MT_CFR0V, 2, buf);
> +	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
>  	if (ret)
>  		return ret;
>  
>  	/* Read flash ID to make sure the switch was successful. */
> -	if (enable)
> -		ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
> -	else
> -		ret = spi_nor_read_id(nor, 0, 0, buf, nor->reg_proto);
> +	ret = spi_nor_read_id(nor, 0, 0, buf, nor->reg_proto);

nor->reg_proto is not updated yet. It will be updated _after_ this 
function completes. So you would end up calling read ID in 8D-8D-8D 
mode, which would be bogus.

I tried with Micron MT35XU512ABA. Enable works fine, but disable fails 
(it succeeds in reality but the function is unable to verify that) 
because of this. Changing nor->reg_proto to SNOR_PROTO_1_1_1 fixes it.

Looks like the problem is not introduced by this patch though. It seems 
to come from patch 5 of your mx66 series. I see the same with the 
Cypress flash too but I have not tested it yet.

>  	if (ret)
>  		return ret;
>  
> @@ -93,6 +92,12 @@ static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  	return 0;
>  }
>  
> +static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +	return enable ? spi_nor_micron_octal_dtr_en(nor) :
> +			spi_nor_micron_octal_dtr_dis(nor);
> +}
> +
>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>  {
>  	nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
