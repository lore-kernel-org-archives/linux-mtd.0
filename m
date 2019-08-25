Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEC7C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:49:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F4008206E0
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QuDtc6oq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F4008206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gm2oFbAf+SGhMPfHVXXlTanGQTjiqapRiyj4lUgbL8g=; b=QuDtc6oqRMfLMg
	M99siaGiZIkulULWqcLCLfyZjA+qYGx+dRYXur4UozLM0d4hUztEMVdwFcc57/e+crFPj4VZnUoS/
	V+GbAYWVtcZ0kTIQ7G0bVus127gXpM1xSqutOlACx4WYqy1EhJHqLbmdlSHYCQI/xU1wTojQT2FQY
	chbc9JOihrPYrfQc/1SIoQZ5dVUI+YdyF4sOMLFU4vXC5pxOChhW/Z2hkSce8oRCLBZxjbCO9ELLl
	YFj017lcj74zXuaMlFWLLRrUwmHpj31EKRHYQPPclD6s4Yh2+FpNk5bCT54I9+qYo5wY3ES+9wD00
	2dOLTbv9KPasGscb+irw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1rxY-0006h0-TQ; Sun, 25 Aug 2019 12:49:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1rxV-0006gZ-Vs
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 12:49:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3E9FA28A1AB;
 Sun, 25 Aug 2019 13:49:24 +0100 (BST)
Date: Sun, 25 Aug 2019 14:49:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Global Block Unlock support
Message-ID: <20190825144921.66139a65@collabora.com>
In-Reply-To: <20190824122700.23558-2-tudor.ambarus@microchip.com>
References: <20190824122700.23558-1-tudor.ambarus@microchip.com>
 <20190824122700.23558-2-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_054926_292931_C39FFDA4 
X-CRM114-Status: GOOD (  26.01  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 24 Aug 2019 12:27:12 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> To avoid inadvertent writes during power-up, some flashes are
> write-protected by default after a power-on reset cycle.
> A Global Block-Protection Unlock command offers a single
> command cycle that unlocks the entire memory array. This is
> identical with what other nor flashes are doing by clearing
> the block protection bits from the status register: disable
> the write protection after a power-on reset cycle.
> 
> We can't determine this purely by manufacturer type and it's not
> autodetectable by anything like SFDP, so make a new flag for it:
> UNLOCK_GLOBAL_BLOCK.
> 
> Note that the Global Block Unlock command has different names
> depending on the manufacturer, but always the same command value:
> 0x98. Macronix's MX25U12835F names it Gang Block Unlock,
> Winbound's W25Q128FV names it Global Block Unlock and
> Microchip's SST26VF064B names it Global Block Protection Unlock.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v2: the check for UNLOCK_GLOBAL_BLOCK should be done the first
> thing in spi_nor_disable_block_protection(). We use it for a faster
> throughput, a single command cycle that unlocks the entire memory
> array. Fix it.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 46 ++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spi-nor.h   |  1 +
>  2 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1896d36a7d11..c0ba6fe62461 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -196,7 +196,7 @@ struct flash_info {
>  	u16		page_size;
>  	u16		addr_width;
>  
> -	u16		flags;
> +	u32		flags;
>  #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
>  #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
>  #define SST_WRITE		BIT(2)	/* use SST byte programming */
> @@ -233,6 +233,7 @@ struct flash_info {
>  #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
>  #define USE_CLSR		BIT(14)	/* use CLSR command */
>  #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
> +#define UNLOCK_GLOBAL_BLOCK	BIT(16)	/* Unlock global block protection */

Let's add the corresponding SNOR_F_ flag so that manufacturer/sfdp init
can set the flag directly.

>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> @@ -2031,6 +2032,41 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
>  	return spi_nor_clear_sr_bp(nor);
>  }
>  
> +/**
> + * spi_nor_unlock_global_block_protection() - Unlock the Global Block Protection
> + * @nor:        pointer to a 'struct spi_nor'
> + *
> + * The Global Block-Protection Unlock command offers a single command cycle
> + * that unlocks the entire memory array.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_unlock_global_block_protection(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	write_enable(nor);
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_ULBPR, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_NO_DATA);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = nor->write_reg(nor, SPINOR_OP_ULBPR, NULL, 0);
> +	}
> +
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d on ULBPR\n", ret);
> +		return ret;
> +	}
> +
> +	return spi_nor_wait_till_ready(nor);
> +}
> +
>  /* Used when the "_ext_id" is two bytes at most */
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
>  		.id = {							\
> @@ -4697,6 +4733,14 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
>   */
>  static int spi_nor_disable_block_protection(struct spi_nor *nor)
>  {
> +	/*
> +	 * If the flash supports the Global Block-Protection Unlock command,
> +	 * use it for faster throughput: a single command cycle that unlocks
> +	 * the entire memory array.
> +	 */
> +	if (nor->info->flags & UNLOCK_GLOBAL_BLOCK)
> +		return spi_nor_unlock_global_block_protection(nor);

Hm, I'd rather put that as a new hook in spi_nor_locking_ops, this way
we're ready to support any vendor-specific variant (and I like the idea
of having all locking-related functions placed in a separate _ops
struct).

> +
>  	if (!nor->params.disable_block_protection)
>  		return 0;
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 4752d08e9a3e..31b99a7743fc 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -66,6 +66,7 @@
>  #define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
>  #define SPINOR_OP_RDEAR		0xc8	/* Read Extended Address Register */
>  #define SPINOR_OP_WREAR		0xc5	/* Write Extended Address Register */
> +#define SPINOR_OP_ULBPR		0x98	/* Global Block Unlock Protection */
>  
>  /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>  #define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
