Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6DEC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zd7R1tn7YVa1cJSUhwST9EUgH2BYYjD0ARB+ouioZOI=; b=W2vnf3iNuyxWRE
	i+e0vQtvGoxxWU9bJdqvP+b8WBQ1tfFsGmFX1qnxgKnHehErc6A74BKhC8dzc6t25xyNLnMBV4ps3
	caBZh8OY4pnp68pxn7jmb1rbVBucUu5K1Rr+KnLrgSQCNhEipYvEuDqnnHpU6duYeC7W+7ouDAJ1z
	xaqF97oGaeJ7e/fxkIcW/Q4mwSy+CEeWZ5jhL35AtsCyq6hEjk3NZc7FTc4Xaix1rtXVYGTeYd2Ay
	BKrzIGVZnmLrP68Wm3vm6xkvoiFJXn73PBjfgyJR1pngt27NMmyRWbHeRvBtWZsUwOgw9r72UUSOm
	RgquLhd2WPJtQEyCIRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxno-00CuVM-28;
	Thu, 27 Jul 2023 10:01:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxnj-00CuTF-2A
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:00:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98e39784a85so432877366b.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690452052; x=1691056852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+KG6uRAHZ0iPO8XqNaYa/TCCNMetRQrbCyIG1qkr+8=;
        b=pGpo//9MCzuje47qC2utSPT/bcrBHqC3Pkj73T8YjHGAlyZ4hrB6gO6TpKxOR15YTA
         5i2UfN8J/Wp5rRF85dorY2d7jdPM5wI7q5RwtNDKpEGIsqTRjJKTGEii+oqIKyIgbtZn
         8Iv4/8f35PDB+v37+pFqGg1rmf1zrHBwlpgiaX9RBuPP57c4YaBWPRQZ0NvX+8dWcogE
         wFwo5eZx7ls9MyHa8UvMP9brhtIz00ZoZcFsJFf1Rl55r0UAvBvCDtxci5wTVcnooZg8
         j4M3QsDKLEhPQxrt3Di/Vd+XyM8tLkLlL8QLfqD/mRS4/HQQtRETgC90/JIYkGbkJqsO
         dPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690452052; x=1691056852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+KG6uRAHZ0iPO8XqNaYa/TCCNMetRQrbCyIG1qkr+8=;
        b=JaShDm6UXoCPhKIsmLajwlmi0sOd6MxY7A4F8dlxcnDV6VVKphWiuWAqTlivb/mc3r
         sp3RQR1Pwfd8J9Z/nPvcE9dO8moU/ZVFk05jPIXIH0lLY3ujlVYgMHnf3DZJ9uNvacP7
         kEmEM6KMKefWDuITNxzeDZtrzxue1J6ho6T8nU0QTOTctv6kkGZnLzIHRmZe3g5fmAXU
         Ssf/9O2ap9Bw+peEUY2caqnQ8kOwhG/3FTXZIkV+LYGoaOLTEF1mfrHJLhMsUH2BoTXN
         nOrJNPgANvwFjz6uRVbxMnKWupnZtg+4J5p7OqoVKkO9lRc1cgocNqMPveYZ2lRJt5nY
         MvAA==
X-Gm-Message-State: ABy/qLaGHKQ5zHDYT85psNgJTORlnAZs1s8hhXvK1QhK+8V4DuBB/EpN
	dRBkoCBkqvzloF3RnudTHuq6Mg==
X-Google-Smtp-Source: APBJJlFTf6GoiZr2JSJvM0DJRb0DKbgX71Y9C5K7aMPD3+R8rRD+Y5INZF5EibtqX2wECULYtuc85g==
X-Received: by 2002:a17:907:8a21:b0:98e:1c4b:10e2 with SMTP id sc33-20020a1709078a2100b0098e1c4b10e2mr1705612ejc.20.1690452052610;
        Thu, 27 Jul 2023 03:00:52 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id y26-20020a170906071a00b009737b8d47b6sm562168ejb.203.2023.07.27.03.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 03:00:52 -0700 (PDT)
Message-ID: <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
Date: Thu, 27 Jul 2023 11:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230727091610.234132-2-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_030057_140963_F64A2DED 
X-CRM114-Status: GOOD (  27.91  )
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



On 7/27/23 10:16, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Create Macronix specify method for enable Octal DTR mode and
> set 20 dummy cycles to allow running at the maximum supported
> frequency for Macronix Octal flash.

20 dummy cycles is particular for a specific operating frequency.

If you test the flash at different speeds, let's say at 30 MHz, and
at their highest frequency (133, 200 MHZ?) does the flash work with
current settings?
> 
> For enable Macronix flashes in Octal DTR mode, Configuration
> Register2 DOPI bit should be set and DC bit setting for dummy
> cycles.

Use imperative.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/macronix.c | 97 ++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 04888258e891..b397fd274868 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,22 @@
>  
>  #include "core.h"
>  
> +#define SPINOR_OP_MXIC_RD_ANY_REG	0x71		/* Read volatile configuration register 2 */
> +#define SPINOR_OP_MXIC_WR_ANY_REG	0x72		/* Write volatile configuration register 2 */
> +#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
> +#define SPINOR_REG_MXIC_CR2_DC		0x00000300	/* For setting dummy cycles */
> +#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
> +#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
> +#define SPINOR_REG_MXIC_DC_20		0x0		/* Setting dummy cycles to 20 */
> +#define SPINOR_REG_MXIC_ADDR_BYTES	4		/* Fixed R/W volatile address bytes to 4 */
> +
> +/* Macronix SPI NOR flash operations. */
> +#define MXIC_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MXIC_WR_ANY_REG, 0),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -105,9 +121,90 @@ static const struct flash_info macronix_nor_parts[] = {
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  };
>  
> +static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf, i;
> +	int ret;
> +
> +	/* Use 20 dummy cycles for memory array reads. */
> +	buf[0] = SPINOR_REG_MXIC_DC_20;
> +	op = (struct spi_mem_op)
> +		MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> +				       SPINOR_REG_MXIC_CR2_DC, 1, buf);
> +
> +	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the octal and DTR enable bits. */
> +	buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
> +	op = (struct spi_mem_op)
> +		MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> +				       SPINOR_REG_MXIC_CR2_MODE, 1, buf);
> +	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	/* Read flash ID to make sure the switch was successful. */
> +	ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
> +	if (ret) {
> +		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
> +		return ret;
> +	}
> +
> +	/* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data A-A-B-B-C-C */
> +	for (i = 0; i < nor->info->id_len; i++)
> +		if (buf[i * 2] != nor->info->id[i])
> +			return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int macronix_nor_octal_dtr_dis(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf;
> +	int ret;
> +
> +	/*
> +	 * The register is 1-byte wide, but 1-byte transactions are not
> +	 * allowed in 8D-8D-8D mode. Since there is no register at the
> +	 * next location, just initialize the value to 0 and let the
> +	 * transaction go on.
> +	 */
> +	buf[0] = SPINOR_REG_MXIC_SPI_EN;
> +	buf[1] = 0x0;
> +	op = (struct spi_mem_op)
> +		MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> +				       SPINOR_REG_MXIC_CR2_MODE, 2, buf);
> +	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +	if (ret)
> +		return ret;
> +
> +	/* Read flash ID to make sure the switch was successful. */
> +	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
> +	if (ret) {
> +		dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
> +		return ret;
> +	}
> +
> +	if (memcmp(buf, nor->info->id, nor->info->id_len))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int macronix_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +	return enable ? macronix_nor_octal_dtr_en(nor) :
> +			macronix_nor_octal_dtr_dis(nor);
> +}
> +
>  static void macronix_nor_default_init(struct spi_nor *nor)
>  {
>  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> +	nor->params->octal_dtr_enable = macronix_nor_octal_dtr_enable;

this must be done in the late_init hook, I'd like to get rid of the
default_init hook.
>  }
>  
>  static void macronix_nor_late_init(struct spi_nor *nor)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
