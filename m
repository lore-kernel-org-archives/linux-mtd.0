Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB236C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 31 May 2022 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4zO3fscHH7HUQJADCnjl2pJ+bOfMTfB+hLNtOEMyYo=; b=DnPXkDpbsxsGNi
	NpFMCm9KNdFGJ18dvUOyVhJe/MeZbfezJfz8mjSJpjG8KRt1WPdL2qau75fYwSxoKI2Kk+xZOrul2
	v7z+uJi2DFCMEtOaT49rRz9cEOFRxZop97oM5WAEAR5EeNjGNTkP+5qT0S5BHytknCOc1ZOQEhp5x
	nU8KBd1NaeAbzDJFC+nmslEWrT+P6btdQQm8slkeBV+Omww7IHErkkeSRNlCuKirihJYOo9O0ckG/
	SImRZg7XaIS3qN1YQw41MizimC+MeBXvaU2Pu3HOcVeHWQcecw0m7sYuvXy7TNnlwlLh7+bd0wq6R
	CnBSBxeCwsNP1XKtjLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw05c-00AV82-9G; Tue, 31 May 2022 11:31:08 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw05Z-00AV5V-0B
	for linux-mtd@lists.infradead.org; Tue, 31 May 2022 11:31:06 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24VBUvhw087086;
	Tue, 31 May 2022 06:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653996657;
	bh=2AxiTPyhilyPthOcbeU4YtawPM3v6FBlpDzXdJYkJm8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uiz7FPZhDwUqb5LzWTmusC8H773yxM7d05TyeWf/qtOSM+0n7KLaDYynIrMZ3RlFE
	 buZBQlZ4EMNH74r5aUrWDu+4pCCjMeUCaSHC1fRVuqBwnmf04n/S4TpsYAOrnQ58vH
	 mkFQcVtOleKuJQ/VLBqKAdkp+nWnmXCZXB7/OrmU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24VBUvth086459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 May 2022 06:30:57 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 31
 May 2022 06:30:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 31 May 2022 06:30:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24VBUuIK022635;
	Tue, 31 May 2022 06:30:57 -0500
Date: Tue, 31 May 2022 17:00:56 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <michael@walle.cc>, <Bacem.Daassi@infineon.com>,
        Takahiro Kuwano
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at
 SFDP parsing time
Message-ID: <20220531113056.elquk3pup5lsrz4o@ti.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <ccff78b42bab8d6eb0ffa2127f4fe6c4daddf6af.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccff78b42bab8d6eb0ffa2127f4fe6c4daddf6af.1652063152.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_043105_173716_26754AFC 
X-CRM114-Status: GOOD (  28.04  )
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

On 10/05/22 07:10AM, tkuw584924@gmail.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> At the SFDP parsing time we should not change members of struct spi_nor,
> but instead fill members of struct spi_nor_flash_parameters which could
> leter on be used by callers. The caller will then decide if SFDP params

s/leter/later/

> should be used and more importantly when they should be used. Clean the
> code flow and don't initialize nor->addr_nbytes at SFDP parsing time.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c |  5 ++---
>  drivers/mtd/spi-nor/core.h |  2 ++
>  drivers/mtd/spi-nor/sfdp.c | 18 ++++++------------
>  3 files changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 7db6b41d7c30..dd71deba9f11 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2272,8 +2272,8 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>  
>  static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
>  {
> -	if (nor->addr_nbytes) {
> -		/* already configured from SFDP */
> +	if (nor->params->addr_nbytes) {
> +		nor->addr_nbytes = nor->params->addr_nbytes;
>  	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
>  		/*
>  		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
> @@ -2518,7 +2518,6 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
>  
>  	if (spi_nor_parse_sfdp(nor)) {
>  		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
> -		nor->addr_nbytes = 0;
>  		nor->flags &= ~SNOR_F_4B_OPCODES;
>  	}
>  }
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index fe7683fe1b4d..41df8bc8e008 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -345,6 +345,7 @@ struct spi_nor_otp {
>   * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
>   *			ECC unit size for ECC-ed flashes.
>   * @page_size:		the page size of the SPI NOR flash memory.
> + * @addr_nbytes:	number of address bytes to send.
>   * @rdsr_dummy:		dummy cycles needed for Read Status Register command
>   *			in octal DTR mode.
>   * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
> @@ -377,6 +378,7 @@ struct spi_nor_flash_parameter {
>  	u64				size;
>  	u32				writesize;
>  	u32				page_size;
> +	u8				addr_nbytes;
>  	u8				rdsr_dummy;
>  	u8				rdsr_addr_nbytes;
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 058ce218d2af..90d7c25f7281 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -178,19 +178,16 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
>  static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  			     size_t len, void *buf)
>  {
> -	u8 addr_nbytes;
>  	int ret;
>  
> -	addr_nbytes = nor->addr_nbytes;
> -
>  	nor->read_opcode = SPINOR_OP_RDSFDP;
>  	nor->addr_nbytes = 3;
>  	nor->read_dummy = 8;
>  
>  	ret = spi_nor_read_raw(nor, addr, len, buf);
>  
> -	nor->addr_nbytes = addr_nbytes;
>  	/* Restore setup to its uninitialized state. */
> +	nor->addr_nbytes = 0;
>  	nor->read_opcode = 0;
>  	nor->read_dummy = 0;
>  
> @@ -461,11 +458,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
> -		nor->addr_nbytes = 3;
> +		params->addr_nbytes = 3;
>  		break;
>  
>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> -		nor->addr_nbytes = 4;
> +		params->addr_nbytes = 4;
>  		break;
>  
>  	default:
> @@ -652,7 +649,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
>  		return 4;
>  	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
>  	default:
> -		return nor->addr_nbytes;
> +		return nor->params->addr_nbytes;
>  	}
>  }
>  
> @@ -689,7 +686,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  	u32 addr;
>  	int err;
>  	u8 i;
> -	u8 addr_nbytes;
>  	u8 read_data_mask, map_id;
>  
>  	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
> @@ -697,8 +693,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  	if (!buf)
>  		return ERR_PTR(-ENOMEM);
>  
> -	addr_nbytes = nor->addr_nbytes;
> -
>  	map_id = 0;
>  	/* Determine if there are any optional Detection Command Descriptors */
>  	for (i = 0; i < smpt_len; i += 2) {
> @@ -753,8 +747,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  	/* fall through */
>  out:
>  	kfree(buf);
> -	nor->addr_nbytes = addr_nbytes;
>  	/* Restore setup to its uninitialized state. */
> +	nor->addr_nbytes = 0;

Same as before, I don't think this function should know or care about 
the default or uninitialised values.

>  	nor->read_dummy = 0;
>  	nor->read_opcode = 0;
>  	return ret;
> @@ -1096,7 +1090,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  	 * Spansion memory. However this quirk is no longer needed with new
>  	 * SFDP compliant memories.
>  	 */
> -	nor->addr_nbytes = 4;
> +	params->addr_nbytes = 4;

Patch looks good at first glance but I have not looked very carefully if 
it might cause some small issues.

>  	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
>  
>  	/* fall through */
> -- 
> 2.25.1
> 

issi.c's is25lp256_post_bfpt_fixups() also sets nor->addr_nbytes. Should 
that be updated to use params->addr_nbytes instead?

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
