Return-Path: <SRS0=Xhow=5B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F108C0044D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 05:29:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2944A20575
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 05:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rBdUsrFz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yLmZCeYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2944A20575
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4HthVt7qkuGOfZ24TECFFo6pMfMLk/JTPZdxWyk1c4=; b=rBdUsrFzJsZF90
	siktobeKlFM53VlJfP6JXZenfFq90zITi+HFMz1VafRJMSn4PIXDVgpOQ8QcTUXN2LPkyKGJIOpus
	twf2tX2n4sEAZ0D8rgGwv7IaVD+vjy0zaXZnSh2ELZis/70//+UwwSn90JPnd8PjnTRKfHg86d9cV
	d6nG2MGI+VYSVCDuELYwF/5ciMiMnJMt1gfEKHALDjzSKSgk2wcWLKUTQS8eMx4gL61x4LwjCQ88z
	DN3pZ/PyiUdMsR0U1x8HE4H9Tl0OGtKML7HlgMhglzcNtXnkhaKcREwDm/S9g+XE5DtLIxzsMgbuS
	j0INmY2UQHWOhvuYOD3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDiJI-0004nk-SS; Mon, 16 Mar 2020 05:29:08 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDiJF-0004mt-1D; Mon, 16 Mar 2020 05:29:06 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02G5SoC7066578;
 Mon, 16 Mar 2020 00:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584336530;
 bh=VywGfyW92inbO727amnziWzaRxzKUXtHBdnwI7UMFo8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yLmZCeYhsIWmTL6QGooNcfKiHZ/XatY3sNP+Z+zJMo/ingX83f+E5lxHHNa3/0MdE
 MlX5xegaIs3b49bJPk5LQuDS2NoiUvEic2H6n6Qp22Pab5JBSQ0EOXiQ0WXzVJcVRE
 0qQ6C2CccYp7fqC8RXUzY4yW7kIYqpx8VcCM8vAU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02G5SoRx034285;
 Mon, 16 Mar 2020 00:28:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 00:28:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 00:28:50 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02G5ShH8085020;
 Mon, 16 Mar 2020 00:28:47 -0500
Subject: Re: [PATCH v2 02/25] mtd: spi-nor: Emphasise which is the generic
 set_4byte_addr_mode() method
To: <Tudor.Ambarus@microchip.com>, <bbrezillon@kernel.org>
References: <20200313194130.342251-1-tudor.ambarus@microchip.com>
 <20200313194130.342251-3-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5c0f86db-11d5-ac9e-6a3d-234c22737071@ti.com>
Date: Mon, 16 Mar 2020 10:59:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200313194130.342251-3-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_222905_206004_CF53CF38 
X-CRM114-Status: GOOD (  24.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 14/03/20 1:12 am, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Rename (*set_4byte)() to (*set_4byte_addr_mode)() for a better
> differentiation between the 4 byte address mode and opcodes.
> 
> Rename macronix_set_4byte() to spi_nor_set_4byte_addr_mode(), it will be
> the only 4 byte address mode method exposed to the manufacturer drivers.
> 
> Here's how the manufacturers enter and exit the 4 byte address mode:
> - eon, gidadevice, issi, macronix, xmc use EN4B/EX4B
> - micron-st needs WEN. st_micron_set_4byte_addr_mode() will become
>   a private method, as they are the only ones that need WEN before the
>   EN4B/EX4B commands.
> - newer spansion have a 4BAM opcode (this translates to a new, public
>   command). Older spansion  flashes use the BRWR command (legacy in
>   core.c -> spansion_set_4byte_addr_mode())
> - winbond's method is hackish and may be reason for just a flash
>   fixup hook -> private method
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

spansion_set_4byte_addr() is the only function with manuf specific
prefix in core.c.

This could probably renamed to a generic one in a separate change

Regards
Vignesh

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 34 ++++++++++++++++++----------------
>  include/linux/mtd/spi-nor.h   |  4 ++--
>  2 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0b8fac0b0299..8616673ddb7c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -568,14 +568,14 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
>  }
>  
>  /**
> - * macronix_set_4byte() - Set 4-byte address mode for Macronix flashes.
> + * spi_nor_set_4byte_addr_mode() - Enter/Exit 4-byte address mode.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
>   *		address mode.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int macronix_set_4byte(struct spi_nor *nor, bool enable)
> +static int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
>  
> @@ -604,14 +604,15 @@ static int macronix_set_4byte(struct spi_nor *nor, bool enable)
>  }
>  
>  /**
> - * st_micron_set_4byte() - Set 4-byte address mode for ST and Micron flashes.
> + * st_micron_set_4byte_addr_mode() - Set 4-byte address mode for ST and Micron
> + * flashes.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
>   *		address mode.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
> +static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
>  
> @@ -619,7 +620,7 @@ static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
>  	if (ret)
>  		return ret;
>  
> -	ret = macronix_set_4byte(nor, enable);
> +	ret = spi_nor_set_4byte_addr_mode(nor, enable);
>  	if (ret)
>  		return ret;
>  
> @@ -627,14 +628,15 @@ static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
>  }
>  
>  /**
> - * spansion_set_4byte() - Set 4-byte address mode for Spansion flashes.
> + * spansion_set_4byte_addr_mode() - Set 4-byte address mode for Spansion
> + * flashes.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
>   *		address mode.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spansion_set_4byte(struct spi_nor *nor, bool enable)
> +static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
>  
> @@ -692,18 +694,18 @@ static int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
>  }
>  
>  /**
> - * winbond_set_4byte() - Set 4-byte address mode for Winbond flashes.
> + * winbond_set_4byte_addr_mode() - Set 4-byte address mode for Winbond flashes.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
>   *		address mode.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int winbond_set_4byte(struct spi_nor *nor, bool enable)
> +static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
>  
> -	ret = macronix_set_4byte(nor, enable);
> +	ret = spi_nor_set_4byte_addr_mode(nor, enable);
>  	if (ret || enable)
>  		return ret;
>  
> @@ -4655,7 +4657,7 @@ static void issi_set_default_init(struct spi_nor *nor)
>  static void macronix_set_default_init(struct spi_nor *nor)
>  {
>  	nor->params.quad_enable = spi_nor_sr1_bit6_quad_enable;
> -	nor->params.set_4byte = macronix_set_4byte;
> +	nor->params.set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
>  }
>  
>  static void sst_set_default_init(struct spi_nor *nor)
> @@ -4668,12 +4670,12 @@ static void st_micron_set_default_init(struct spi_nor *nor)
>  	nor->flags |= SNOR_F_HAS_LOCK;
>  	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>  	nor->params.quad_enable = NULL;
> -	nor->params.set_4byte = st_micron_set_4byte;
> +	nor->params.set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
>  }
>  
>  static void winbond_set_default_init(struct spi_nor *nor)
>  {
> -	nor->params.set_4byte = winbond_set_4byte;
> +	nor->params.set_4byte_addr_mode = winbond_set_4byte_addr_mode;
>  }
>  
>  /**
> @@ -4759,7 +4761,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  
>  	/* Initialize legacy flash parameters and settings. */
>  	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
> -	params->set_4byte = spansion_set_4byte;
> +	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
>  	params->setup = spi_nor_default_setup;
>  	/* Default to 16-bit Write Status (01h) Command */
>  	nor->flags |= SNOR_F_HAS_16BIT_SR;
> @@ -5011,7 +5013,7 @@ static int spi_nor_init(struct spi_nor *nor)
>  		 */
>  		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
>  			  "enabling reset hack; may not recover from unexpected reboots\n");
> -		nor->params.set_4byte(nor, true);
> +		nor->params.set_4byte_addr_mode(nor, true);
>  	}
>  
>  	return 0;
> @@ -5035,7 +5037,7 @@ void spi_nor_restore(struct spi_nor *nor)
>  	/* restore the addressing mode */
>  	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
>  	    nor->flags & SNOR_F_BROKEN_RESET)
> -		nor->params.set_4byte(nor, false);
> +		nor->params.set_4byte_addr_mode(nor, false);
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_restore);
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index de90724f62f1..2b9717b0cd62 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -520,7 +520,7 @@ struct spi_nor_locking_ops {
>   * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
>   * @quad_enable:	enables SPI NOR quad mode.
> - * @set_4byte:		puts the SPI NOR in 4 byte addressing mode.
> + * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @convert_addr:	converts an absolute address into something the flash
>   *                      will understand. Particularly useful when pagesize is
>   *                      not a power-of-2.
> @@ -541,7 +541,7 @@ struct spi_nor_flash_parameter {
>  	struct spi_nor_erase_map        erase_map;
>  
>  	int (*quad_enable)(struct spi_nor *nor);
> -	int (*set_4byte)(struct spi_nor *nor, bool enable);
> +	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>  	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>  	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
>  
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
