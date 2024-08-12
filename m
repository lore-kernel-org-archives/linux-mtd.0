Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A7BC3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cp23VN18tll6xKV5C0UBlrNN2x7B9UMpCnYEj1UuroA=; b=0ydDOAtbtcAgjT
	RZ2L1bwuCBM29pMM38gv1tk2yx0DBFbbYkEnOXvrz8Njh1TgKHzyU/KupdVTU1RWX+bHoCDrMYa7m
	IDNdxAp0KOP9oNvr7acLvvjscN0VDEtgaJfPQlxo8LafPvdiVGit8uHIFyiII3RTy2eZGlhldsuKU
	nlSStUn5qo0KI756pGdaR1LMyMcs1MM90nFa+dhr68gTP90UmSrma2i86TNlw9rnx/Aq5X2VXPLhd
	PLyAzGsQ/tSd2o6gG9ebDC2fQNVXbJR1astGoSDUpUgzvsESytnQACvNgKG4h21jyex8AYcl2e7Mm
	5t0pX2g/EDK/dW5PRrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVJN-00000000SPh-2GFK;
	Mon, 12 Aug 2024 13:42:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVJK-00000000SOr-0HQ1
	for linux-mtd@lists.infradead.org;
	Mon, 12 Aug 2024 13:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8303CE0DB4;
	Mon, 12 Aug 2024 13:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B96C32782;
	Mon, 12 Aug 2024 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723470126;
	bh=SUDN/6Po80egMnrVOI6BNtVjTOorz0Kb2BQqNcCf52c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z3LqS5NP/8Y5d0AKFntUt7sBV2O6tn4hSUUpNvaZyclDQcqxTENdWIB7fMwG3RxRa
	 3IPcVWBZgfdwgNFQ9iuBqBR8fSRx0OjGwRaO2aTAUyi+8Tx/SFa1V4gqBeyO231TkC
	 K+TBlJKMOa7fuB9/DzQs/UFVN9GqtvHcSEd37WNr7URGOQNFZ2nZTGxFmNstP0cEML
	 6C/RjrYmWyuvaxDlMrQh2kmFigpywx/24wGKtlJb81uIfOa0rEsvzOh72pUdxdmQd6
	 UBBUjG4xTfyAFZ4sy6pHP4oIWwvW7U6w9yoPMdWch/DQuTJ/J1v8212837JRun9Vtr
	 w0W1AtfKL1X/Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: winbond: add Zetta ZD25Q128C support
In-Reply-To: <20240804221535.291923-1-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 5 Aug 2024 00:15:35 +0200")
References: <20240804221535.291923-1-mwalle@kernel.org>
Date: Mon, 12 Aug 2024 15:42:04 +0200
Message-ID: <mafs0v805zwlv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_064210_351373_48CD2054 
X-CRM114-Status: GOOD (  22.79  )
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

On Mon, Aug 05 2024, Michael Walle wrote:

> Zetta normally uses BAh as its vendor ID. But for the ZD25Q128C they
> took the one from Winbond and messed up the size parameters in SFDP.
> Most functions seem compatible with the W25Q128, we just have to fix up
> the size.
>
> Link: http://www.zettadevice.com/upload/file/20150821/DS_Zetta_25Q128_RevA.pdf
> Link: https://www.lcsc.com/datasheet/lcsc_datasheet_2312081757_Zetta-ZD25Q128CSIGT_C19626875.pdf
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
[...]
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index e065e4fd42a3..9f7ce5763e71 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -17,6 +17,31 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
>  
> +static int
> +w25q128_post_bfpt_fixups(struct spi_nor *nor,
> +			 const struct sfdp_parameter_header *bfpt_header,
> +			 const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * Zetta ZD25Q128C is a clone of the Winbond device. But the encoded
> +	 * size is really wrong. It seems that they confused Mbit with MiB.
> +	 * Thus the flash is discovered as a 2MiB device.
> +	 */
> +	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
> +	    bfpt_header->minor == SFDP_JESD216_MINOR &&
> +	    nor->params->size == SZ_2M &&
> +	    nor->params->erase_map.regions[0].size == SZ_2M) {
> +		nor->params->size = SZ_16M;
> +		nor->params->erase_map.regions[0].size = SZ_16M;
> +	}

Since the size is 16 MiB for both Zetta and Winbond, why do you have
these conditions here? Why not just do it unconditionally? What
situation do you want to protect against?

> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups w25q128_fixups = {
> +	.post_bfpt = w25q128_post_bfpt_fixups,
> +};
> +
>  static int
>  w25q256_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
> @@ -108,6 +133,7 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.size = SZ_16M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +		.fixups = &w25q128_fixups,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x40, 0x19),
>  		.name = "w25q256",

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
