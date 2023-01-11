Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520F8C46467
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Jan 2023 06:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3H9ShKulQTAJowRL95Uwyw2yv9k7EuiiGp4n79N7djs=; b=4saUhRpL9Sox/5
	+ZAAVYiqQ6R+mxU+tp/5XmW0CcXkn7MfFVq2iuLW06FEFuHI4Ii/2nxnxOAV+5SG1cAH46dRxGVu+
	9DAjocfMnjQl1xa51A4PYgYFggYWPBCkYmc9FkO7lXoWO8X++ODrT4ZWRzpZE9kerf9MjLAsKlg7X
	HzRZlNrf59ZhScEAeCPSVie7mTZ0qd0OsoQf0GBWau56uGZXAvgdWS8dEHXbFfDw//n4jdXf6S3eu
	sExW9uL6Pv8obQ1oBaEHoMR6MErQEAA15/+WFW6oB2ZHKrKdFzBfZvaAonFoHK+gDOZRjAPMcpSxv
	GIrFO+TF57em9elkCQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFUeL-009rze-98; Wed, 11 Jan 2023 06:31:49 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFUeI-009rz9-5C
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2023 06:31:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30B6URw2102291;
	Wed, 11 Jan 2023 00:30:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673418627;
	bh=23DwmL0+bcMQTL4xS+OEn6n02lNsL7rrZOqpyoM2n+E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JEWBdj8cxoaPNYuRonGA9wuUBDg0Y53Jbi9RsXnnWLYW7KtGe3Vt0xvEuAr0C3RGB
	 P3QCVGWPvzmAevvYcqGlmvjbkYkU6qbjyR1TtrPm6Z4ke0G5fGGGUI6C+o66bPAEHi
	 3Oe2JEviDMiWY6bBJvgpSB0CbWVK8a6I0NAJQAJ8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30B6URki003451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Jan 2023 00:30:27 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 00:30:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 00:30:26 -0600
Received: from [10.24.69.26] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30B6UNUZ085896;
	Wed, 11 Jan 2023 00:30:24 -0600
Message-ID: <12309c41-7141-8848-c0ce-0cdb2d618938@ti.com>
Date: Wed, 11 Jan 2023 12:00:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Make CFRx reg fields generic
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, <Takahiro.Kuwano@infineon.com>,
        <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <pratyush@kernel.org>, <michael@walle.cc>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <Bacem.Daassi@infineon.com>
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
 <20230110164703.83413-2-tudor.ambarus@linaro.org>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <20230110164703.83413-2-tudor.ambarus@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_223146_310074_11E317FC 
X-CRM114-Status: GOOD (  19.82  )
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



On 10/01/23 22:17, Tudor Ambarus wrote:
> Cypress defines two flavors of configuration registers, volatile and
> non volatile, and both use the same bit fields. Rename the bitfields in
> the configuration registers so that they can be used for both flavors.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

>   drivers/mtd/spi-nor/spansion.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 07fe0f6fdfe3..12a256c0ef4c 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -15,19 +15,19 @@
>   #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>   #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>   #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> -#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
> +#define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
>   #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
> -#define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
> +#define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
>   #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
> -#define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
> +#define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
>   #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
>   #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
>   #define SPINOR_REG_CYPRESS_CFR5_DDR		BIT(1)
>   #define SPINOR_REG_CYPRESS_CFR5_OPI		BIT(0)
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN				\
> +#define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN				\
>   	(SPINOR_REG_CYPRESS_CFR5_BIT6 |	SPINOR_REG_CYPRESS_CFR5_DDR |	\
>   	 SPINOR_REG_CYPRESS_CFR5_OPI)
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
> +#define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
>   #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>   
>   /* Cypress SPI NOR flash operations. */
> @@ -57,7 +57,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>   	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
>   
>   	/* Use 24 dummy cycles for memory array reads. */
> -	*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> +	*buf = SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
>   	op = (struct spi_mem_op)
>   		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>   					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
> @@ -69,7 +69,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>   	nor->read_dummy = 24;
>   
>   	/* Set the octal and DTR enable bits. */
> -	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> +	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
>   	op = (struct spi_mem_op)
>   		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>   					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
> @@ -103,7 +103,7 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>   	 * in 8D-8D-8D mode. Since there is no register at the next location,
>   	 * just initialize the value to 0 and let the transaction go on.
>   	 */
> -	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> +	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
>   	buf[1] = 0;
>   	op = (struct spi_mem_op)
>   		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
> @@ -155,11 +155,11 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>   	if (ret)
>   		return ret;
>   
> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1_QUAD_EN)
>   		return 0;
>   
>   	/* Update the Quad Enable bit. */
> -	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1_QUAD_EN;
>   	op = (struct spi_mem_op)
>   		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>   					  SPINOR_REG_CYPRESS_CFR1V, 1,
> @@ -210,7 +210,7 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
>   	if (ret)
>   		return ret;
>   
> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
>   		nor->params->page_size = 512;
>   	else
>   		nor->params->page_size = 256;

-- 
Thanks and Regards,
Dhruva Gole

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
