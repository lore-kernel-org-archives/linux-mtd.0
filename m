Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066EFC4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIcTke2mO5cQZR7+rF/5vSYBZc33sQ50w83Yu4WL2GY=; b=QAYxE1IGBhv5+pqLjmV3qsGiY0
	zzR8nXUFsMpGLJ3SIMuDIVh/ejMWsHaT68NxqG+q5L2wdflaAl4YtrPFmkETNL+GDw25EvrF52k50
	+H+9GTvAKX2JrW/ewwwOPMywA7u48qBz3co7OdgD7LoqyMaerE8C1v0AcwS5RQF4xnLLFBkk7O37L
	YAgNEqHSaxB4U6jDiYs5/NeOpwhFR43J3G3PutQflj5YNSQBKH1BNqCRFyCbwEuBOGoAlhr4pUPw4
	KznwsqLYw/aZwxOpTuXBLuZe3Hib3+CGVkSvnKNi/IMGThiuzyjLt53JxQdyZn6SgQ1/YxZo7r0SP
	nCRN2Dww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYzk-00000008RwS-46OV;
	Thu, 01 Feb 2024 15:28:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYzh-00000008RuV-3QAl
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 15:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 385B061F70;
	Thu,  1 Feb 2024 15:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804BDC433F1;
	Thu,  1 Feb 2024 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706801328;
	bh=5CkmtnYRZDwQa3AKcyQfp1dgmpBdKEsPqGGm8IacKsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MmwztpI2HyosWCOXTmGULnEUeBGD9b3mPGpgzTKZXtDcEt23A/c2F2rkbuDS2ThqV
	 q8VBH9/ktQUr4/y2ecSLpFSgxIFtQQ36wka8Il1FRFDXjTAi07xxZv6KgQx5CL2Bq8
	 Nzyz8WR5UZMuv/eqrrM06UtWCEvDyf1/7jbRwiyFwq/HPqRjGbXDzMLZH15b2zOGDB
	 gJb6aEf0gWHjLvefdU2VYozsYMdPA+G0oGgPgi6ffsIRy80qGBcdi3ZB8pEATr/Urx
	 gAbTlM5v8RCvriaaPmkMkMO5+TDrBaTfI5JuMh1k/h3LzSpgqI9G3JK/vvRS4fMCHS
	 EcTREXd3SO56w==
MIME-Version: 1.0
Date: Thu, 01 Feb 2024 16:28:44 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v8 3/9] mtd: spi-nor: core: Allow specifying the byte
 order in Octal DTR mode
In-Reply-To: <20240201094353.33281-4-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <20240201094353.33281-4-jaimeliao.tw@gmail.com>
Message-ID: <1b726357f67c1e1a680326b821875031@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_072849_980517_72A14635 
X-CRM114-Status: GOOD (  21.17  )
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

> From: JaimeLiao <jaimeliao@mxic.com.tw>

Same remark as for patch 2/9.

> Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
> The byte order of 16-bit words is swapped when read or written in 
> 8D-8D-8D
> mode compared to STR modes. Allow operations to specify the byte order 
> in
> DTR mode, so that controllers can swap the bytes back at run-time to
> address the flash's endianness requirements, if they are capable. If 
> the
> controllers are not capable of swapping the bytes, the protocol is
> downgrade via spi_nor_spimem_adjust_hwcaps(). When available, the 
> swapping
> of the bytes is always done regardless if it's a data or register 
> access,
> so that we comply with the JESD216 requirements: "Byte order of 16-bit
> words is swapped when read in 8D-8D-8D mode compared to 1-1-1".
> 
> Merge Tudor's patch and add modifications for suiting newer version
> of Linux kernel.
> 
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  drivers/mtd/spi-nor/core.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4129764fad8c..0076007e1cde 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -113,6 +113,11 @@ void spi_nor_spimem_setup_op(const struct spi_nor 
> *nor,
>  		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
>  		op->cmd.nbytes = 2;
>  	}
> +
> +	/* SWAP16 is only applicable when Octal DTR mode */
> +	if (nor->read_proto == SNOR_PROTO_8_8_8_DTR)

Why is it read_proto now? For all the former patches, the local
proto variable was used.

> +		if (nor->flags & SNOR_F_SWAP16)

Please fold this into the former condition.
if (proto == SNOR_PROTO_8_8_8_DTR && nor->flags & SNOR_F_SWAP16)
    op->data.swap16 = true;

-michael

> +			op->data.swap16 = true;
>  }
> 
>  /**
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index d36c0e072954..3c5190ac0a79 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -140,6 +140,7 @@ enum spi_nor_option_flags {
>  	SNOR_F_RWW		= BIT(14),
>  	SNOR_F_ECC		= BIT(15),
>  	SNOR_F_NO_WP		= BIT(16),
> +	SNOR_F_SWAP16		= BIT(17),
>  };
> 
>  struct spi_nor_read_command {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
