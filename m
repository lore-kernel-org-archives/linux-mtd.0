Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6F6C001DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8pzlDCvL/ojSPhqQJl/Xd89EZhTDFAnDEVoGDQMMBQ=; b=kmdMMcAi2gsCAEbQ5G/hY6Ywf9
	CMkYUIIEuyLx7lsfGh5C4UpYFOVOOKitzKHlLQiz5vXIC509UAMU6Pazx9sUOuiUrBClhDoaxsfgF
	cgXmiWgd7FG4Lch2XhSFF5gV+fQ4psZ14pZqUSHmWjmVpVX8Uhz5aoFjn/2xzdIn2wf+Kq7lIMhhg
	x1YC4nZvZjGr7iVCCxiBU1aikriMYnITqdrcuiXaWdMZn6WZcBJBowTK+Z3p7yUDmwlOqhdQNf605
	P9AVWGVE/rJNi+YbUDPA2XIrG8DkdNMjakomoH4wENnXUU2wSHTxul/Wrruk8XQSB2I2kcMmy3pMk
	dNwCx/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCIL-006YjY-03;
	Tue, 25 Jul 2023 07:17:21 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCI5-006Ybt-2b
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 07:17:08 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3B3EC5E7;
	Tue, 25 Jul 2023 09:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690269419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJTQMmeF3m1nxrc4sFHSLJFMi3qRoI92kBt1+tmDUbA=;
	b=MqICd4inc5joXRSJzNpOgwUOjOye6SNjRhWhSQnm7dVNqYl7klimNxynfz3fb5J7azIvZW
	FzJjiD9EDokLuMLIHtAsNicuMB4YEUQh/KaBpXpNg6QVTA2bPyFcdIgrogvODaOdPoWzHE
	4YG2x530aDyvDCp7aNYeQgzvX0icQHozQYAPHW6j2dXDK5EkEFn7Xu/BI5ZgKtjRNkaSQJ
	MregkEQnDSoHhszVi82C4DkjgS52Q9xc2My84vxD9vUl5/9yXCkONQ2TCHOJqR/yXHgZC7
	jsVO0zDEeoHuBdjMTTV1XHJfwV0GTeIGgHfQ0ornnLyqzGW3v42aEXyLKOI53g==
MIME-Version: 1.0
Date: Tue, 25 Jul 2023 09:16:58 +0200
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao.tw@gmail.com>
Subject: Re: [PATCH v1 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
In-Reply-To: <20230725022302.210275-2-jaimeliao.tw@gmail.com>
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-2-jaimeliao.tw@gmail.com>
Message-ID: <0acced240c27dd34cf1348ac4a24dba3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_001706_486540_AF83F6AF 
X-CRM114-Status: GOOD (  28.82  )
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

Hi,

> From: JaimeLiao <jaimeliao.tw@gmail.com>

You write "We" in your next patch. "We" as in macronix? Then please
use your macronix email address for the patches. Please note, you
can still send them through your gmail account.

> Enable Octal DTR mode with 20 dummy cycles to allow running
> at the maximum supported frequency for adding Macronix flash
> in Octal DTR mode.

Please explain a bit more what you are doing here. The patch itself
looks dodgy. You are writing CR2 but maybe thats used for register
accesses?! I also can't really tell from the macro names.

> 
> Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
> Co-authored-by: Tudor Ambarus <tudor.ambarus@linaro.org>

There seems to be no written process documentation wether this has
to be followed by a SoB (unlike Co-developed-by). Dunno.

> ---
>  drivers/mtd/spi-nor/macronix.c | 77 ++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 04888258e891..9010b81e098f 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,12 @@
> 
>  #include "core.h"
> 
> +#define SPINOR_OP_RD_CR2		0x71		/* Read configuration register 2 */
> +#define SPINOR_OP_WR_CR2		0x72		/* Write configuration register 2 */

Copied from spansion.c? Why isn't there an _MXIC_ in the name?

> +#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR 
> mode */
> +#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
> +#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */

The names don't make much sense to me. Are you accessing individual
registers? If so please use MXIC_REG_<regname> and
MXIC_REG_<regname>_<bit/mode/mask/..>

> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -32,6 +38,76 @@ static const struct spi_nor_fixups mx25l25635_fixups 
> = {
>  	.post_bfpt = mx25l25635_post_bfpt_fixups,
>  };
> 
> +/**
> + * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix 
> flashes.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @enable:		whether to enable Octal DTR or switch back to SPI
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool 
> enable)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf, i;
> +	int ret;
> +
> +	/* Set/unset the octal and DTR enable bits. */
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	if (enable) {
> +		buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
> +	} else {
> +		/*
> +		 * The register is 1-byte wide, but 1-byte transactions are not
> +		 * allowed in 8D-8D-8D mode. Since there is no register at the
> +		 * next location, just initialize the value to 0 and let the
> +		 * transaction go on.
> +		 */
> +		buf[0] = SPINOR_REG_MXIC_SPI_EN;
> +		buf[1] = 0x0;
> +	}
> +
> +	op = (struct spi_mem_op)
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
> +			   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
> +			   SPI_MEM_OP_NO_DUMMY,
> +			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
> +
> +	if (!enable)
> +		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret)
> +		return ret;
> +
> +	/* Read flash ID to make sure the switch was successful. */

While cleaning up the flash_info db I come around this and it is
copied all over the place. Please work on factoring this (also the
other code in micron-st.c and spansion.c) out into a helper.

> +	op = (struct spi_mem_op)
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> +			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
> +			   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
> +			   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
> +
> +	if (enable)
> +		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret)
> +		return ret;
> +
> +	if (enable) {
> +		for (i = 0; i < nor->info->id_len; i++)
> +			if (buf[i * 2] != nor->info->id[i])
> +				return -EINVAL;

Why is the ID now swapped? Doesn't look right.

-michael

> +	} else {
> +		if (memcmp(buf, nor->info->id, nor->info->id_len))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct flash_info macronix_nor_parts[] = {
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
> @@ -108,6 +184,7 @@ static const struct flash_info macronix_nor_parts[] 
> = {
>  static void macronix_nor_default_init(struct spi_nor *nor)
>  {
>  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> +	nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
>  }
> 
>  static void macronix_nor_late_init(struct spi_nor *nor)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
