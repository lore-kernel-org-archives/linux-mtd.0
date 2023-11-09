Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44711C4167D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpiIcBPl4htoOLNNwhJ281112hcxCcq+nkLdclHALRY=; b=DQ05gvWJKsvzWQ595vGka2zEDb
	nhxF3glFns1d/RPEfmIkd74Y+kw0dO8ioaNsHkE1vsdy7UZCVOyWTyeA3Jp/yoFWblQXeOq48UlQE
	HtkP3Zm1Q5dMdRYZbdxuYdyMrGuatnurYh91W3TCXuWOby+PjFLtIOqQrvbVeEWYlbUv/Qy6E7i4v
	nh1MoU9b44CM3Z7/ieHlrqu+ugyWzHcVFsI0wJolPd30gAbNEjGbMuitzeNfgGufpdHgp/mRE3sNe
	0/25O7z2GjGPuE3JTL9AuchPAP4Vh0NqSpnbX3HCgbCvbD+ATKL8UJ20XmRqFZVO/6DWVEhn/6Mva
	cZn4hN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12iU-0060Bn-0M;
	Thu, 09 Nov 2023 10:56:54 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12iR-0060Aw-1J
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 10:56:53 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B05CA3D5;
	Thu,  9 Nov 2023 11:56:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699527406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lkYMEi9z1AjiGREcvVrdAbNNB3OU3WdHnR6KqvlMljQ=;
	b=grAGzuV2AuyNfQRQappwyoX4KVhLzIR3bZ8s+T/jMKZda052fs0tidxamkCKzcbyO2S8aD
	euDE0g9Olk/ci/LzsausVg0dTodWuK447lx9wMfOVl/vWLsw+dRKFwqT234ZADj4sWgcF5
	rg/5lW+yI9jRpd8ssM8Mlp5CkE3YPDaR1tv4P8dcgDQK3QF/dpH425j3AnzNVBG+5b4cpX
	N8sRh6VHg5kGC67oCzSMhjRLY7N5mSp+BoAXdaVaAQ+IwJXhM/8VbEevc/tbxpKeDT+jU2
	DHbKwHp9BE4nOtNFGwmV4zf0EhXo/SPUWCaI+siCnjIKlb5Ufs3yRpVRXoxH5g==
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 11:56:46 +0100
From: Michael Walle <michael@walle.cc>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Dhruva Gole <d-gole@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op
 checking
In-Reply-To: <20231108094303.46303-1-acelan.kao@canonical.com>
References: <20231108094303.46303-1-acelan.kao@canonical.com>
Message-ID: <30509dedc61b0590b322e2860abbd109@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_025651_597952_D9CED64C 
X-CRM114-Status: GOOD (  20.82  )
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

Am 2023-11-08 10:43, schrieb AceLan Kao:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> No functional changes are introduced by this patch; it's a code cleanup
> to use the correct error code.

This error code might be returned to userspace (I guess?).

> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> 
> ---
> v5. distinguish -EOPNOTSUPP from -ENOTSUPP
> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  drivers/spi/atmel-quadspi.c | 2 +-
>  drivers/spi/spi-ath79.c     | 2 +-
>  drivers/spi/spi-bcm-qspi.c  | 2 +-
>  drivers/spi/spi-mem.c       | 6 +++---
>  drivers/spi/spi-npcm-fiu.c  | 2 +-
>  drivers/spi/spi-ti-qspi.c   | 4 ++--
>  drivers/spi/spi-wpcm-fiu.c  | 2 +-

This is missing a user in spi-nor/core.c (in
spi_nor_set_4byte_addr_mode()).

-michael

>  8 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 393ff37f0d23..d1df5cd401cf 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -973,7 +973,7 @@ static int spinand_manufacturer_match(struct 
> spinand_device *spinand,
>  		spinand->manufacturer = manufacturer;
>  		return 0;
>  	}
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
> 
>  static int spinand_id_detect(struct spinand_device *spinand)
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index 3d1252566134..370c4d1572ed 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -272,7 +272,7 @@ static int atmel_qspi_find_mode(const struct 
> spi_mem_op *op)
>  		if (atmel_qspi_is_compatible(op, &atmel_qspi_modes[i]))
>  			return i;
> 
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
> 
>  static bool atmel_qspi_supports_op(struct spi_mem *mem,
> diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
> index c9f1d1e1dcf7..b7ada981464a 100644
> --- a/drivers/spi/spi-ath79.c
> +++ b/drivers/spi/spi-ath79.c
> @@ -146,7 +146,7 @@ static int ath79_exec_mem_op(struct spi_mem *mem,
>  	/* Only use for fast-read op. */
>  	if (op->cmd.opcode != 0x0b || op->data.dir != SPI_MEM_DATA_IN ||
>  	    op->addr.nbytes != 3 || op->dummy.nbytes != 1)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
> 
>  	/* disable GPIO mode */
>  	ath79_spi_wr(sp, AR71XX_SPI_REG_FS, 0);
> diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
> index ef08fcac2f6d..d96222e6d7d2 100644
> --- a/drivers/spi/spi-bcm-qspi.c
> +++ b/drivers/spi/spi-bcm-qspi.c
> @@ -1199,7 +1199,7 @@ static int bcm_qspi_exec_mem_op(struct spi_mem 
> *mem,
> 
>  	if (!op->data.nbytes || !op->addr.nbytes || op->addr.nbytes > 4 ||
>  	    op->data.dir != SPI_MEM_DATA_IN)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
> 
>  	buf = op->data.buf.in;
>  	addr = op->addr.val;
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index edd7430d4c05..2dc8ceb85374 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -323,7 +323,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const 
> struct spi_mem_op *op)
>  		return ret;
> 
>  	if (!spi_mem_internal_supports_op(mem, op))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
> 
>  	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && 
> !spi_get_csgpiod(mem->spi, 0)) {
>  		ret = spi_mem_access_start(mem);
> @@ -339,7 +339,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const 
> struct spi_mem_op *op)
>  		 * read path) and expect the core to use the regular SPI
>  		 * interface in other cases.
>  		 */
> -		if (!ret || ret != -ENOTSUPP)
> +		if (!ret || ret != -ENOTSUPP || ret != -EOPNOTSUPP)
>  			return ret;
>  	}
> 
> @@ -559,7 +559,7 @@ spi_mem_dirmap_create(struct spi_mem *mem,
>  	if (ret) {
>  		desc->nodirmap = true;
>  		if (!spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
> -			ret = -ENOTSUPP;
> +			ret = -EOPNOTSUPP;
>  		else
>  			ret = 0;
>  	}
> diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
> index 03db9f016a11..f3bb8bbc192f 100644
> --- a/drivers/spi/spi-npcm-fiu.c
> +++ b/drivers/spi/spi-npcm-fiu.c
> @@ -556,7 +556,7 @@ static int npcm_fiu_exec_op(struct spi_mem *mem, 
> const struct spi_mem_op *op)
>  		op->data.nbytes);
> 
>  	if (fiu->spix_mode || op->addr.nbytes > 4)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
> 
>  	if (fiu->clkrate != chip->clkrate) {
>  		ret = clk_set_rate(fiu->clk, chip->clkrate);
> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> index 4c81516b67db..0877dc5058a1 100644
> --- a/drivers/spi/spi-ti-qspi.c
> +++ b/drivers/spi/spi-ti-qspi.c
> @@ -613,12 +613,12 @@ static int ti_qspi_exec_mem_op(struct spi_mem 
> *mem,
>  	/* Only optimize read path. */
>  	if (!op->data.nbytes || op->data.dir != SPI_MEM_DATA_IN ||
>  	    !op->addr.nbytes || op->addr.nbytes > 4)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
> 
>  	/* Address exceeds MMIO window size, fall back to regular mode. */
>  	from = op->addr.val;
>  	if (from + op->data.nbytes > qspi->mmap_size)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
> 
>  	mutex_lock(&qspi->list_lock);
> 
> diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
> index 852ffe013d32..d76f7b5a9b97 100644
> --- a/drivers/spi/spi-wpcm-fiu.c
> +++ b/drivers/spi/spi-wpcm-fiu.c
> @@ -361,7 +361,7 @@ static int wpcm_fiu_exec_op(struct spi_mem *mem, 
> const struct spi_mem_op *op)
> 
>  	wpcm_fiu_stall_host(fiu, false);
> 
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
> 
>  static int wpcm_fiu_adjust_op_size(struct spi_mem *mem, struct 
> spi_mem_op *op)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
