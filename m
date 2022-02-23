Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C4BC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQH822fUfEAZpADULWQClW03pEJ///V8BfZ2pdOaLUw=; b=vO/UeqIDqgiDVe
	oR/ckkSoF7F44Ir5SilUThHu+2fOQof0csvfeHAppsVPJ+e/xuNNB0s4TtAeO+Dcr8lfwrAk1Atpf
	lw+q37CccPh3ZrDktGpqE2HmIrqtnu8DwVZzCyEmcL7mxQOOclscfQy24ZdB7mCGVa3agl/XrqHCj
	YpxT9YiswBOyKPpm5FQIEhkRN5LXSDPzDNrYBVR/eBGPj8Gua30cHu/VYmDO0FFLSU4seRYCQxCkP
	Dx9tgic7amtfk0TjFCByoVUVl4FvUW0FNff0y6XqxnT5tAEDYqIn1D2OwqEwdAVkv8RY1hCMQ/qpi
	T1SLUX/pO8ZLFVlJDvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMyjg-00G3Bb-NL; Wed, 23 Feb 2022 20:59:44 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMyjc-00G3Ad-VA
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 20:59:43 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NKxWg1026937;
 Wed, 23 Feb 2022 14:59:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645649972;
 bh=J9YTkhnhayU3ZR7csP9bS5fBrAnr5xkdso1tUysRVEI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZhBycOXy1r3HLmU/UnRa6cKbubus+bcbAfc0WMXHWOQOlSNlAy58YLZbChGLTZR1Z
 8BIF2eLa7PgcovPWYSJ5pVlx0/fp4jgCuS0fIr/OpDUiLLDDUHInlrrO6OxpOsghoD
 CcpRpAeIbHZN5xe5CyKZnnyslGprN5BilIkKtu+Q=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NKxWbb078114
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 14:59:32 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 14:59:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 14:59:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NKxSxO124392;
 Wed, 23 Feb 2022 14:59:29 -0600
Date: Thu, 24 Feb 2022 02:29:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: core: Add helpers to read/write any
 register
Message-ID: <20220223205927.axuejgdsnvn4jj65@ti.com>
References: <20220210023334.408926-1-tudor.ambarus@microchip.com>
 <20220210023334.408926-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210023334.408926-2-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_125941_959457_2F6EEF9F 
X-CRM114-Status: GOOD (  18.47  )
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

On 10/02/22 04:33AM, Tudor Ambarus wrote:
> There are manufacturers that use registers indexed by address. Some of
> them support "read/write any register" opcodes. Provide core methods that
> can be used by all manufacturers. SPI NOR controller ops are intentionally
> not supported as we intend to move all the SPI NOR controller drivers
> under the SPI subsystem.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 41 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  4 ++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 7d5e3acb0ae7..d394179689e6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -307,6 +307,47 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  	return nor->controller_ops->write(nor, to, len, buf);
>  }
>  
> +/**
> + * spi_nor_read_reg() - read register to flash memory

Nitpick: s/to/from/ ?

> + * @nor:        pointer to 'struct spi_nor'.
> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
> + * @proto:	SPI protocol to use for the register operation.
> + *
> + * Return: zero on success, -errno otherwise
> + */
> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		     enum spi_nor_protocol proto)
> +{
> +	if (!nor->spimem)
> +		return -EOPNOTSUPP;
> +
> +	spi_nor_spimem_setup_op(nor, op, proto);
> +	return spi_nor_spimem_exec_op(nor, op);
> +}
> +
> +/**
> + * spi_nor_write_reg() - write register to flash memory
> + * @nor:        pointer to 'struct spi_nor'
> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
> + * @proto:	SPI protocol to use for the register operation.
> + *
> + * Return: zero on success, -errno otherwise
> + */
> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		      enum spi_nor_protocol proto)
> +{
> +	int ret;
> +
> +	if (!nor->spimem)
> +		return -EOPNOTSUPP;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;

Nitpick: Add a blank line here.

> +	spi_nor_spimem_setup_op(nor, op, proto);
> +	return spi_nor_spimem_exec_op(nor, op);
> +}
> +
>  /**
>   * spi_nor_write_enable() - Set write enable latch with Write Enable command.
>   * @nor:	pointer to 'struct spi_nor'.
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index cbfb4fa7647f..c728454b5424 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -578,6 +578,10 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>  			  u8 *buf);
>  ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  			   const u8 *buf);
> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		     enum spi_nor_protocol proto);
> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		      enum spi_nor_protocol proto);
>  int spi_nor_erase_sector(struct spi_nor *nor, u32 addr);
>  
>  int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
