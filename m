Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DAEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DDihrLfEwp9LQhmVH5JGC6S5I3Akhche9Rd1JSXw1k=; b=a904Ovucp5N22e
	CwSA3qFg4CAooYr20SzqjCMjr2ICG1gbM1bsqusLt5ab6vAhorR6hIaYt8dgKUcPb0Mk3uKVyEdwK
	OjP07uVHP9D9zuTu/yt4tIvhaufM0Zny0bPfkAc1Xtns0XY6kUadR9pnNWUvCPdN2UKe2u7YAr69V
	GsEWCAIPqVNbvD2oQkGwQcvgGdg6VfIwkCLttZtGbMgnyKXP7e5d0MTOeBLaLTC13pmcL7GUXN9T8
	yABD7lorvTSrEUg+dp22zCd7FSBuCYa5g2Z2ZMnKD7O696Z/geMljzrm8G0dDu4dgg7TOQ6QsYGPu
	qMjEdG+HwLUUIxkohfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK30x-004B52-Rm; Tue, 15 Feb 2022 18:57:27 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK30v-004B4N-Ls
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 18:57:27 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FIvMbR052255;
 Tue, 15 Feb 2022 12:57:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644951442;
 bh=5U/fmKhkScupajpvEnznWL+J0dy7eQ02Tzjl/NPjDpA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=LMKQcf8cdOPVCrlWvE15B0ft3gjNkw/AEcLF2QHobhUIB/YBHBa0MahF4NUduuF/3
 XPTYZU7xkAQ24LJChF+ORz8lc3mm5T8u9CKbSc/C53Uxtud3AERlEtcx58uK7LaQFK
 7Uq0xZeIprwxuDDcbVGTQJiv5PlmS2IG4m9BZAW4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FIvMkH020922
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 12:57:22 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 12:57:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 12:57:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FIvHG9002914;
 Tue, 15 Feb 2022 12:57:17 -0600
Date: Wed, 16 Feb 2022 00:27:16 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 04/14] mtd: spi-nor: move all xilinx specifics into
 xilinx.c
Message-ID: <20220215185716.ccjthc4a4merlmxw@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-5-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-5-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_105725_827517_36127056 
X-CRM114-Status: GOOD (  16.86  )
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

On 02/02/22 03:58PM, Michael Walle wrote:
> Mechanically move all the xilinx functions to its own module.

If you do some code changes mechanically you should also paste the 
semantic patch for future reference.

> 
> Then register the new flash specific ready() function.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c   | 64 +------------------------------
>  drivers/mtd/spi-nor/core.h   | 18 ---------
>  drivers/mtd/spi-nor/xilinx.c | 73 ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h  |  9 -----
>  4 files changed, 74 insertions(+), 90 deletions(-)
> 
[...]
>  
> +/**
> + * spi_nor_xread_sr() - Read the Status Register on S3AN flashes.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @sr:		pointer to a DMA-able buffer where the value of the
> + *              Status Register will be written.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)

Nitpick: rename to xilinx_read_sr()?

> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 0),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(1, sr, 0));
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_XRDSR, sr,
> +						      1);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * spi_nor_xsr_ready() - Query the Status Register of the S3AN flash to see if
> + * the flash is ready for new commands.
> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int spi_nor_xsr_ready(struct spi_nor *nor)

Nitpick: rename to xilinx_sr_ready()?

Either way,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>


-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
