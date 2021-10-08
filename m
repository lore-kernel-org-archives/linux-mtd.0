Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2630FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 11:19:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E020E60F5B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 11:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E020E60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkpEVwhc92uOgUHbTohGAMGcMqr1k5c+9qF8HG9lw/E=; b=vxGhM+IkpQFoUj
	Z3SUoL7Pf0zoY4ey8V5USK6sGQPvGTvcT0/ZJuk1FAqElbZ2JacrRYULV4xfLtKNFn3atecvstIYd
	3+QjZaKIzQ/X0yy2W9rX2sCd4Kq4aN8m/WVX68kWhBxUTSK77fEW8V9Fkwx1FNnmTb6bmecPCmwXm
	kTfneZL9ug7f9+T1H8OD6tZmpga8ZNbXWPf4QzcxhNU/O8qnwdyTjf9qOY8Jakq1htko/0oYrWGSE
	wAmC+mvXTVvtkhsCoHL9xrXVajvuU+ozOKg45CC170By/l0CQoZVtrDgkOG53o2xN/dSOSYbLGrNY
	tK+csavzkFhA2BgkfJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYnu8-002WEt-8O; Fri, 08 Oct 2021 11:19:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYnu5-002WEP-S2
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 11:19:07 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 198BIxuY035240;
 Fri, 8 Oct 2021 06:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633691939;
 bh=zpvbpkao7dA7jNR5k42qfKbvNJsqKIVMWyf5CaqIfH0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ntBFa76onUPGN6BX1gHE8f+jOi9wDe+lNymFmg8lSMwmTouWsTqzkdQHd+5IO26R5
 UOvraAzZHe3orTRrtE4+aXf/p9c82KHKGPMoTWTbtpzoXR4sB/bD0eoYmBs5jxWFHs
 ZEmIXmefAoK+n15Im/o0xG/DVshVyUxpJu+S+7fs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 198BIxcn103692
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 8 Oct 2021 06:18:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 8
 Oct 2021 06:18:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 8 Oct 2021 06:18:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 198BIwWL079968;
 Fri, 8 Oct 2021 06:18:58 -0500
Date: Fri, 8 Oct 2021 16:48:57 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Alexander Stein <Alexander.Stein@tq-systems.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: micron-st: Add support for
 output-driver-strength
Message-ID: <20211008111855.rhfs7xpsybcfclmy@ti.com>
References: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
 <20211004111529.211089-2-Alexander.Stein@tq-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004111529.211089-2-Alexander.Stein@tq-systems.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_041906_026213_CBDA96C1 
X-CRM114-Status: GOOD (  30.62  )
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

Hi Alexander,

On 04/10/21 01:15PM, Alexander Stein wrote:
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Micron flashes support this by the Bits [2:0] in the Enhanced Volatile
> Configuration Register.
> Checked datasheets:
> - n25q_128mb_3v_65nm.pdf
> - mt25t-qljs-L512-xBA-xxT.pdf

What does changing the impedance do? Does it improve latency? If we use 
suboptimal impedance, will the flash still keep working correctly?

In other words, you need to justify why this patch is needed.

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 109 ++++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index c224e59820a1..5d5e7fbc24a2 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -16,6 +16,11 @@
>  #define SPINOR_MT_OCT_DTR	0xe7	/* Enable Octal DTR. */
>  #define SPINOR_MT_EXSPI		0xff	/* Enable Extended SPI (default) */
>  
> +struct micron_drive_strength {
> +	u32 ohms;
> +	u8 val;
> +};
> +
>  static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  {
>  	struct spi_mem_op op;
> @@ -255,8 +260,112 @@ static void micron_st_default_init(struct spi_nor *nor)
>  	nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
>  }
>  
> +
> +/*
> + * Read Micron enhanced volatile configuration register
> + * Return negative if error occurred or configuration register value
> + */
> +static int micron_read_evcr(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_EVCR, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));

Are you always guaranteed to be in 1S-1S-1S mode during register write?

I would suggest calling spi_nor_spimem_setup_op() before this so that it 
sets up all the buswidths correctly based on nor->reg_proto.

> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RD_EVCR, nor->bouncebuf, 1);

Split into 2 lines?

> +	}
> +
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading EVCR\n", ret);
> +		return ret;
> +	}
> +
> +	return nor->bouncebuf[0];
> +}
> +
> +/*
> + * Write Micron enhanced volatile configuration register
> + * Return negative if error occurred or configuration register value
> + */
> +static int micron_write_evcr(struct spi_nor *nor, u8 evcr)
> +{
> +	nor->bouncebuf[0] = evcr;
> +
> +	spi_nor_write_enable(nor);

Check return code.

> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WD_EVCR, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));

Same as above.

> +
> +		return spi_mem_exec_op(nor->spimem, &op);
> +	}
> +
> +	return nor->controller_ops->write_reg(nor, SPINOR_OP_WD_EVCR, nor->bouncebuf, 1);

Same as above. Split into 2 lines?

> +}
> +
> +/*
> + * Supported values from Enahanced Volatile COnfiguration Register (Bits 2:0)
> + */
> +static const struct micron_drive_strength drive_strength_data[] = {
> +	{ .ohms = 90, .val = 1 },
> +	{ .ohms = 45, .val = 3 },
> +	{ .ohms = 20, .val = 5 },
> +	{ .ohms = 30, .val = 7 },
> +};
> +
> +static struct micron_drive_strength const *micron_st_find_drive_strength_entry(u32 ohms)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(drive_strength_data); i++) {
> +		if (ohms == drive_strength_data[i].ohms)
> +			return &drive_strength_data[i];
> +	}
> +	return NULL;
> +}
> +
> +static void micron_st_post_sfdp(struct spi_nor *nor)
> +{
> +	struct device_node *np = spi_nor_get_flash_node(nor);
> +	u32 ohms;
> +
> +	if (!np)
> +		return;
> +
> +	if (!of_property_read_u32(np, "output-driver-strength", &ohms)) {
> +		struct micron_drive_strength const *entry =
> +			micron_st_find_drive_strength_entry(ohms);
> +
> +		if (entry) {
> +			int evcrr = micron_read_evcr(nor);
> +
> +			if (evcrr >= 0) {

This is a bit confusing. Can you instead do:

if (evcrr < 0)
	return evcrr;

...

> +				u8 evcr = (u8)(evcrr & 0xf8) | entry->val;

Don't use magic numbers. Define a bitmask, preferably using GENMASK().

> +
> +				micron_write_evcr(nor, evcr);

Check return code. Do we need to abort flash probe if this fails, or can 
we live with it, despite the suboptimal impedance?

> +				dev_dbg(nor->dev, "%s: EVCR 0x%x\n", __func__,
> +					(u32)micron_read_evcr(nor));
> +			}
> +		} else {
> +			dev_warn(nor->dev,
> +				"Invalid output-driver-strength property specified: %u",
> +				ohms);
> +		}
> +	}
> +}
> +
>  static const struct spi_nor_fixups micron_st_fixups = {
>  	.default_init = micron_st_default_init,
> +	.post_sfdp = micron_st_post_sfdp,

NACK. Not every Micron flash has the EVCR register. For example, the 
Micron MT35 flash family does not have an EVCR and the output drive 
strength is programmed in a separate register. Set this only for the 
flashes that need this.

>  };
>  
>  const struct spi_nor_manufacturer spi_nor_micron = {
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
