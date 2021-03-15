Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F5DC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 12:08:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFE7600CC
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 12:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FFE7600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xl0k2L69r7pW0YICfoCdx5EFhQ8gSe9W1lIybcOARHU=; b=mzb1bYX1ZZ8DhL1WO417/U3VT
	OUbt7TeVllKw/H6q13szD6QGE4cymLFQ1NOpXN0Zc+ymjipOE4G1rPgOpJ8mcr8zMgK2z7p1VUsnb
	VAKOU/DOP4Iu4g4cEYLiD2iHbwcf2iJ7OVL4DNKeVN80S9X4gZkCGJ0QqS+eQShxtLoufnHtzf0JF
	yG17MmCsbYl/E3WA+fwmwTa6YTeLOSgcUpkDwPpe2ziPMvHNZsNtut9C7l/+DB+bGjopFq/djlzP/
	BfqGniBfLxJYIpS6uglzMOv2hJa0tgQtNFgTieIZRZrYoofASB9w/adwDiIVDqX1imZaOWslJ7YTa
	H/uRVgD7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLm0Q-00FmAI-Lx; Mon, 15 Mar 2021 12:07:30 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLlhV-00Fhf3-AG
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 11:48:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FBlov0098132;
 Mon, 15 Mar 2021 06:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615808870;
 bh=0F/Z/E0bRKh7e3szILcSeSooS/QLtJMd68KP/UMIt60=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=p8mar3A9BJTq3uBr9UUlv69XhpgZXlt9jReLBNfsEF8pe9sKw1/UUzk1E6cu1FRy6
 gZRYr20wnSTPBqhqCtS9KGNdndl3uSOVfhFyPhRDKO/O+9Zqxo3v3+PajwRKs51z/4
 bPJEc7XJsU04ljT5WetH5zGmBTzQtXxAeZdHoOI8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FBlo71012224
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 06:47:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 06:47:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 06:47:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FBlnT2103767;
 Mon, 15 Mar 2021 06:47:50 -0500
Date: Mon, 15 Mar 2021 17:17:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 4/6] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Message-ID: <20210315114747.gzqvtikg23mebwmw@ti.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <dc9bc04fbfc9c913e37e8200f46ac4773acedce9.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc9bc04fbfc9c913e37e8200f46ac4773acedce9.1615523176.git.Takahiro.Kuwano@infineon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_114757_810657_1B741A0D 
X-CRM114-Status: GOOD (  30.81  )
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

On 12/03/21 06:44PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Spansion/Cypress chips support volatile version of configuration
> registers and it is recommended to update volatile registers in the field
> application due to a risk of the non-volatile registers corruption by
> power interrupt. This patch adds a function to set Quad Enable bit in CFR1
> volatile. The function supports multi-die package parts that require to
> set the Quad Enable bit in each die.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v3:
>   - Add multi-die package parts support
> 
>  drivers/mtd/spi-nor/spansion.c | 58 ++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 1bce95cb7896..b5b5df4836c6 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -10,6 +10,8 @@
>  
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
> @@ -121,6 +123,62 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
>  	return ret;
>  }
>  
> +/**
> + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_dummy:	number of dummy cycles for register read
> + * @die_size:	size of each die to determine the number of dies
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
> +static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
> +					 u32 die_size)
> +{
> +	int ret;
> +	u32 base, reg_addr;
> +	u8 cfr1v, cfr1v_written;
> +
> +	for (base = 0; base < nor->params->size; base += die_size) {
> +		reg_addr = base + SPINOR_REG_CYPRESS_CFR1V;
> +
> +		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);

I didn't notice it when reviewing the U-Boot series. How does register 
read work here? This will be issued in 1-1-4 mode since the 
nor->read_proto should be set to that protocol. But the flash is still 
in 1-1-1 mode. So the flash will output data on 1 line and the 
controller will read it on 4 lines, giving us a bogus register value. In 
fact I see this with pretty much every quad_enable() hook. What am I 
missing?

> +		if (ret)
> +			return ret;
> +
> +		if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +			continue;
> +
> +		/* Update the Quad Enable bit. */
> +		cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +
> +		ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
> +		if (ret)
> +			return ret;
> +
> +		cfr1v_written = cfr1v;
> +
> +		/* Read back and check it. */
> +		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
> +		if (ret)
> +			return ret;
> +
> +		if (cfr1v != cfr1v_written) {
> +			dev_err(nor->dev, "CFR1: Read back test failed\n");
> +			return -EIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

Rest of the patch looks good.

>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:		pointer to a 'struct spi_nor'
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
