Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60322CA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 10:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0D42083E
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 10:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QIJsR9Lt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0D42083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADLNRHCMtn8LpkrvN+IcSXNGvK6sJhZ4LkMFlr0sMPU=; b=QIJsR9Lt4wed6B
	EZlagvdCSTxBUvWobLOfYZigvBh2LX9QU2a63PRSt2uKbMoccDIBO5T1hP6IBv1K20zwagVi4HqYD
	OGUPuAHxb995mfDLT69sO/vXQFtNv/l6f7yvihX0MaQW0mexVTuLsSzFEyUnBqo+GFiyt7f64GoXQ
	z01m28pJdJksfW271GEnoE+gW6OqGK74WcjP/8hZxyvcg9MxmiDrLgLNNuMlBLuKqCPfNBJg3ywex
	TVdud/PSTQaz4e2e3EShnydJqQre7+f4aA8gHPvDCv/lJTmOL1TZNatGcntYHlMja/xSmp1x6P1g7
	zqVDa6uG3p5kZlkGrygw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ7nt-00016n-HG; Thu, 31 Oct 2019 10:35:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ7nh-0000uP-6X
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 10:35:35 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CE9DC28DE61;
 Thu, 31 Oct 2019 10:35:31 +0000 (GMT)
Date: Thu, 31 Oct 2019 11:35:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 03/32] mtd: spi-nor: Group all Reg Ops to avoid
 forward declarations
Message-ID: <20191031113528.57ccc19b@collabora.com>
In-Reply-To: <20191029111615.3706-4-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-4-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_033533_506184_36DCA667 
X-CRM114-Status: GOOD (  21.99  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 29 Oct 2019 11:16:52 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Group all register methods up in the file, to avoid forward
> declarations.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 426 +++++++++++++++++++++---------------------
>  1 file changed, 213 insertions(+), 213 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e82df577eed..24378d65fa2e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -389,6 +389,43 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  }
>  
>  /*
> + * Set write enable latch with Write Enable command.
> + * Returns negative if error occurred.
> + */
> +static int spi_nor_write_enable(struct spi_nor *nor)
> +{
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_NO_DATA);
> +
> +		return spi_mem_exec_op(nor->spimem, &op);
> +	}
> +
> +	return nor->controller_ops->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
> +}
> +
> +/*
> + * Send write disable instruction to the chip.
> + */
> +static int spi_nor_write_disable(struct spi_nor *nor)
> +{
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_NO_DATA);
> +
> +		return spi_mem_exec_op(nor->spimem, &op);
> +	}
> +
> +	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
> +}
> +
> +/*
>   * Read the status register, returning its value in the location
>   * Return the status register value.
>   * Returns negative if error occurred.
> @@ -499,126 +536,6 @@ static int spi_nor_write_sr(struct spi_nor *nor, u8 val)
>  					      nor->bouncebuf, 1);
>  }
>  
> -/*
> - * Set write enable latch with Write Enable command.
> - * Returns negative if error occurred.
> - */
> -static int spi_nor_write_enable(struct spi_nor *nor)
> -{
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_NO_DATA);
> -
> -		return spi_mem_exec_op(nor->spimem, &op);
> -	}
> -
> -	return nor->controller_ops->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
> -}
> -
> -/*
> - * Send write disable instruction to the chip.
> - */
> -static int spi_nor_write_disable(struct spi_nor *nor)
> -{
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 1),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_NO_DATA);
> -
> -		return spi_mem_exec_op(nor->spimem, &op);
> -	}
> -
> -	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
> -}
> -
> -static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
> -{
> -	return mtd->priv;
> -}
> -
> -static u8 spi_nor_convert_opcode(u8 opcode, const u8 table[][2], size_t size)
> -{
> -	size_t i;
> -
> -	for (i = 0; i < size; i++)
> -		if (table[i][0] == opcode)
> -			return table[i][1];
> -
> -	/* No conversion found, keep input op code. */
> -	return opcode;
> -}
> -
> -static u8 spi_nor_convert_3to4_read(u8 opcode)
> -{
> -	static const u8 spi_nor_3to4_read[][2] = {
> -		{ SPINOR_OP_READ,	SPINOR_OP_READ_4B },
> -		{ SPINOR_OP_READ_FAST,	SPINOR_OP_READ_FAST_4B },
> -		{ SPINOR_OP_READ_1_1_2,	SPINOR_OP_READ_1_1_2_4B },
> -		{ SPINOR_OP_READ_1_2_2,	SPINOR_OP_READ_1_2_2_4B },
> -		{ SPINOR_OP_READ_1_1_4,	SPINOR_OP_READ_1_1_4_4B },
> -		{ SPINOR_OP_READ_1_4_4,	SPINOR_OP_READ_1_4_4_4B },
> -		{ SPINOR_OP_READ_1_1_8,	SPINOR_OP_READ_1_1_8_4B },
> -		{ SPINOR_OP_READ_1_8_8,	SPINOR_OP_READ_1_8_8_4B },
> -
> -		{ SPINOR_OP_READ_1_1_1_DTR,	SPINOR_OP_READ_1_1_1_DTR_4B },
> -		{ SPINOR_OP_READ_1_2_2_DTR,	SPINOR_OP_READ_1_2_2_DTR_4B },
> -		{ SPINOR_OP_READ_1_4_4_DTR,	SPINOR_OP_READ_1_4_4_DTR_4B },
> -	};
> -
> -	return spi_nor_convert_opcode(opcode, spi_nor_3to4_read,
> -				      ARRAY_SIZE(spi_nor_3to4_read));
> -}
> -
> -static u8 spi_nor_convert_3to4_program(u8 opcode)
> -{
> -	static const u8 spi_nor_3to4_program[][2] = {
> -		{ SPINOR_OP_PP,		SPINOR_OP_PP_4B },
> -		{ SPINOR_OP_PP_1_1_4,	SPINOR_OP_PP_1_1_4_4B },
> -		{ SPINOR_OP_PP_1_4_4,	SPINOR_OP_PP_1_4_4_4B },
> -		{ SPINOR_OP_PP_1_1_8,	SPINOR_OP_PP_1_1_8_4B },
> -		{ SPINOR_OP_PP_1_8_8,	SPINOR_OP_PP_1_8_8_4B },
> -	};
> -
> -	return spi_nor_convert_opcode(opcode, spi_nor_3to4_program,
> -				      ARRAY_SIZE(spi_nor_3to4_program));
> -}
> -
> -static u8 spi_nor_convert_3to4_erase(u8 opcode)
> -{
> -	static const u8 spi_nor_3to4_erase[][2] = {
> -		{ SPINOR_OP_BE_4K,	SPINOR_OP_BE_4K_4B },
> -		{ SPINOR_OP_BE_32K,	SPINOR_OP_BE_32K_4B },
> -		{ SPINOR_OP_SE,		SPINOR_OP_SE_4B },
> -	};
> -
> -	return spi_nor_convert_opcode(opcode, spi_nor_3to4_erase,
> -				      ARRAY_SIZE(spi_nor_3to4_erase));
> -}
> -
> -static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
> -{
> -	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
> -	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
> -	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
> -
> -	if (!spi_nor_has_uniform_erase(nor)) {
> -		struct spi_nor_erase_map *map = &nor->params.erase_map;
> -		struct spi_nor_erase_type *erase;
> -		int i;
> -
> -		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
> -			erase = &map->erase_type[i];
> -			erase->opcode =
> -				spi_nor_convert_3to4_erase(erase->opcode);
> -		}
> -	}
> -}
> -
>  static int macronix_set_4byte(struct spi_nor *nor, bool enable)
>  {
>  	if (nor->spimem) {
> @@ -859,6 +776,99 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
>  }
>  
>  /*
> + * Write status Register and configuration register with 2 bytes
> + * The first byte will be written to the status register, while the
> + * second byte will be written to the configuration register.
> + * Return negative if error occurred.
> + */
> +static int spi_nor_write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
> +{
> +	int ret;
> +
> +	spi_nor_write_enable(nor);
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_OUT(2, sr_cr, 1));
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
> +						     sr_cr, 2);
> +	}
> +
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while writing configuration register\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret) {
> +		dev_err(nor->dev,
> +			"timeout while writing configuration register\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Write status register and ensure bits in mask match written values */
> +static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new,
> +				      u8 mask)
> +{
> +	int ret;
> +
> +	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_sr(nor, status_new);
> +	if (ret)
> +		return ret;
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +
> +	ret = spi_nor_read_sr(nor);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ((ret & mask) != (status_new & mask)) ? -EIO : 0;
> +}
> +
> +static int spi_nor_write_sr2(struct spi_nor *nor, u8 *sr2)
> +{
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_OUT(1, sr2, 1));
> +
> +		return spi_mem_exec_op(nor->spimem, &op);
> +	}
> +
> +	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR2, sr2, 1);
> +}
> +
> +static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
> +{
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(1, sr2, 1));
> +
> +		return spi_mem_exec_op(nor->spimem, &op);
> +	}
> +
> +	return nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);
> +}
> +
> +/*
>   * Erase the whole flash memory
>   *
>   * Returns 0 if successful, non-zero otherwise.
> @@ -881,6 +891,89 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
>  					      NULL, 0);
>  }
>  
> +static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
> +{
> +	return mtd->priv;
> +}
> +
> +static u8 spi_nor_convert_opcode(u8 opcode, const u8 table[][2], size_t size)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < size; i++)
> +		if (table[i][0] == opcode)
> +			return table[i][1];
> +
> +	/* No conversion found, keep input op code. */
> +	return opcode;
> +}
> +
> +static u8 spi_nor_convert_3to4_read(u8 opcode)
> +{
> +	static const u8 spi_nor_3to4_read[][2] = {
> +		{ SPINOR_OP_READ,	SPINOR_OP_READ_4B },
> +		{ SPINOR_OP_READ_FAST,	SPINOR_OP_READ_FAST_4B },
> +		{ SPINOR_OP_READ_1_1_2,	SPINOR_OP_READ_1_1_2_4B },
> +		{ SPINOR_OP_READ_1_2_2,	SPINOR_OP_READ_1_2_2_4B },
> +		{ SPINOR_OP_READ_1_1_4,	SPINOR_OP_READ_1_1_4_4B },
> +		{ SPINOR_OP_READ_1_4_4,	SPINOR_OP_READ_1_4_4_4B },
> +		{ SPINOR_OP_READ_1_1_8,	SPINOR_OP_READ_1_1_8_4B },
> +		{ SPINOR_OP_READ_1_8_8,	SPINOR_OP_READ_1_8_8_4B },
> +
> +		{ SPINOR_OP_READ_1_1_1_DTR,	SPINOR_OP_READ_1_1_1_DTR_4B },
> +		{ SPINOR_OP_READ_1_2_2_DTR,	SPINOR_OP_READ_1_2_2_DTR_4B },
> +		{ SPINOR_OP_READ_1_4_4_DTR,	SPINOR_OP_READ_1_4_4_DTR_4B },
> +	};
> +
> +	return spi_nor_convert_opcode(opcode, spi_nor_3to4_read,
> +				      ARRAY_SIZE(spi_nor_3to4_read));
> +}
> +
> +static u8 spi_nor_convert_3to4_program(u8 opcode)
> +{
> +	static const u8 spi_nor_3to4_program[][2] = {
> +		{ SPINOR_OP_PP,		SPINOR_OP_PP_4B },
> +		{ SPINOR_OP_PP_1_1_4,	SPINOR_OP_PP_1_1_4_4B },
> +		{ SPINOR_OP_PP_1_4_4,	SPINOR_OP_PP_1_4_4_4B },
> +		{ SPINOR_OP_PP_1_1_8,	SPINOR_OP_PP_1_1_8_4B },
> +		{ SPINOR_OP_PP_1_8_8,	SPINOR_OP_PP_1_8_8_4B },
> +	};
> +
> +	return spi_nor_convert_opcode(opcode, spi_nor_3to4_program,
> +				      ARRAY_SIZE(spi_nor_3to4_program));
> +}
> +
> +static u8 spi_nor_convert_3to4_erase(u8 opcode)
> +{
> +	static const u8 spi_nor_3to4_erase[][2] = {
> +		{ SPINOR_OP_BE_4K,	SPINOR_OP_BE_4K_4B },
> +		{ SPINOR_OP_BE_32K,	SPINOR_OP_BE_32K_4B },
> +		{ SPINOR_OP_SE,		SPINOR_OP_SE_4B },
> +	};
> +
> +	return spi_nor_convert_opcode(opcode, spi_nor_3to4_erase,
> +				      ARRAY_SIZE(spi_nor_3to4_erase));
> +}
> +
> +static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
> +{
> +	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
> +	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
> +	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
> +
> +	if (!spi_nor_has_uniform_erase(nor)) {
> +		struct spi_nor_erase_map *map = &nor->params.erase_map;
> +		struct spi_nor_erase_type *erase;
> +		int i;
> +
> +		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
> +			erase = &map->erase_type[i];
> +			erase->opcode =
> +				spi_nor_convert_3to4_erase(erase->opcode);
> +		}
> +	}
> +}
> +
>  static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>  {
>  	int ret = 0;
> @@ -1326,28 +1419,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	return ret;
>  }
>  
> -/* Write status register and ensure bits in mask match written values */
> -static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new,
> -				      u8 mask)
> -{
> -	int ret;
> -
> -	spi_nor_write_enable(nor);
> -	ret = spi_nor_write_sr(nor, status_new);
> -	if (ret)
> -		return ret;
> -
> -	ret = spi_nor_wait_till_ready(nor);
> -	if (ret)
> -		return ret;
> -
> -	ret = spi_nor_read_sr(nor);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ((ret & mask) != (status_new & mask)) ? -EIO : 0;
> -}
> -
>  static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
>  				 uint64_t *len)
>  {
> @@ -1664,47 +1735,6 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	return ret;
>  }
>  
> -/*
> - * Write status Register and configuration register with 2 bytes
> - * The first byte will be written to the status register, while the
> - * second byte will be written to the configuration register.
> - * Return negative if error occurred.
> - */
> -static int spi_nor_write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
> -{
> -	int ret;
> -
> -	spi_nor_write_enable(nor);
> -
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_OUT(2, sr_cr, 1));
> -
> -		ret = spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
> -						     sr_cr, 2);
> -	}
> -
> -	if (ret < 0) {
> -		dev_err(nor->dev,
> -			"error while writing configuration register\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = spi_nor_wait_till_ready(nor);
> -	if (ret) {
> -		dev_err(nor->dev,
> -			"timeout while writing configuration register\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * macronix_quad_enable() - set QE bit in Status Register.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -1870,36 +1900,6 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -static int spi_nor_write_sr2(struct spi_nor *nor, u8 *sr2)
> -{
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 1),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_OUT(1, sr2, 1));
> -
> -		return spi_mem_exec_op(nor->spimem, &op);
> -	}
> -
> -	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR2, sr2, 1);
> -}
> -
> -static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
> -{
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 1),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_IN(1, sr2, 1));
> -
> -		return spi_mem_exec_op(nor->spimem, &op);
> -	}
> -
> -	return nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);
> -}
> -
>  /**
>   * sr2_bit7_quad_enable() - set QE bit in Status Register 2.
>   * @nor:	pointer to a 'struct spi_nor'


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
