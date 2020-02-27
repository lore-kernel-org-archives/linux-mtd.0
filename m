Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08012C35E17
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 18:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FFE246B7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 18:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="miY4srAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7FFE246B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0AdwFIHoaLFXbCq4BnBAPfN/Y4Xe74JANTYdlPoyUg=; b=miY4srAl4ZIHwz
	n0vmLBh6BCNmlyECX6wrOJSwp2tqOr05JsHXQ4ipM9gF+X5bDdeGhYmiTFlMag3VhxmC3hSScmtv9
	MTgfIjtq+af2PqoJ/OaaHCDrMG+Jh0TE8C2Tb6IbD/GTXwr9vJGcS7xy/Yl9kotuA52cPisAOcD6r
	JZ0tYjiC8nYpRU/caiQysZdhHv4IwN38meZRTrKvmEFnjvl5oByyN/bHpAiD5gRNG9TZN/byrOsl7
	gT5SxWRmFhaFRKLpGgT6Gl24RUKPS7kX5FaJmBwEWauLRENCwrjbMGZBpw6399FWec4ktjG0C6qhj
	HPSlagrJwgxRCQTVuDXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7NhJ-0002qc-SW; Thu, 27 Feb 2020 18:15:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7NhH-0002q6-5n
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 18:15:44 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A212829523E;
 Thu, 27 Feb 2020 18:15:41 +0000 (GMT)
Date: Thu, 27 Feb 2020 19:15:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH v4 5/5] mtd: spinand: micron: Add new Micron SPI NAND
 devices with multiple dies
Message-ID: <20200227191539.56d86069@collabora.com>
In-Reply-To: <20200206202206.14770-6-sshivamurthy@micron.com>
References: <20200206202206.14770-1-sshivamurthy@micron.com>
 <20200206202206.14770-6-sshivamurthy@micron.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_101543_351474_0E8B9988 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  6 Feb 2020 21:22:06 +0100
shiva.linuxworks@gmail.com wrote:

> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> Add device table for new Micron SPI NAND devices, which have multiple
> dies.
> 
> Also, enable support to select the dies.
> 
> Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> ---
>  drivers/mtd/nand/spi/micron.c | 58 +++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 3d3734afc35e..84e1c109ad0c 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -20,6 +20,15 @@
>  
>  #define MICRON_CFG_CONTI_READ		BIT(0)
>  
> +/*
> + * As per datasheet, die selection is done by the 6th bit of Die
> + * Select Register (Address 0xD0).
> + */
> +#define MICRON_DIE_SELECT_REG	0xD0
> +
> +#define MICRON_SELECT_DIE_0	0x00
> +#define MICRON_SELECT_DIE_1	0x40

#define MICRON_SELECT_DIE(x)		((x) << 6)

> +
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> @@ -66,6 +75,22 @@ static const struct mtd_ooblayout_ops micron_8_ooblayout = {
>  	.free = micron_8_ooblayout_free,
>  };
>  
> +static int micron_select_target(struct spinand_device *spinand,
> +				unsigned int target)
> +{
> +	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(MICRON_DIE_SELECT_REG,
> +						      spinand->scratchbuf);
> +
> +	if (target == 0)
> +		*spinand->scratchbuf = MICRON_SELECT_DIE_0;
> +	else if (target == 1)
> +		*spinand->scratchbuf = MICRON_SELECT_DIE_1;
> +	else
> +		return -EINVAL;

	if (target > 1)
		return -EINVAL;

	*spinand->scratchbuf = MICRON_SELECT_DIE(target);

> +
> +	return spi_mem_exec_op(spinand->spimem, &op);
> +}
> +
>  static int micron_8_ecc_get_status(struct spinand_device *spinand,
>  				   u8 status)
>  {
> @@ -133,6 +158,17 @@ static const struct spinand_info micron_spinand_table[] = {
>  		     0,
>  		     SPINAND_ECCINFO(&micron_8_ooblayout,
>  				     micron_8_ecc_get_status)),
> +	/* M79A 4Gb 3.3V */
> +	SPINAND_INFO("MT29F4G01ADAGD", 0x36,
> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 80, 2, 1, 2),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     0,
> +		     SPINAND_ECCINFO(&micron_8_ooblayout,
> +				     micron_8_ecc_get_status),
> +		     SPINAND_SELECT_TARGET(micron_select_target)),
>  	/* M70A 4Gb 3.3V */
>  	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
>  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> @@ -153,6 +189,28 @@ static const struct spinand_info micron_spinand_table[] = {
>  		     SPINAND_HAS_CR_FEAT_BIT,
>  		     SPINAND_ECCINFO(&micron_8_ooblayout,
>  				     micron_8_ecc_get_status)),
> +	/* M70A 8Gb 3.3V */
> +	SPINAND_INFO("MT29F8G01ADAFD", 0x46,
> +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     SPINAND_HAS_CR_FEAT_BIT,
> +		     SPINAND_ECCINFO(&micron_8_ooblayout,
> +				     micron_8_ecc_get_status),
> +		     SPINAND_SELECT_TARGET(micron_select_target)),
> +	/* M70A 8Gb 1.8V */
> +	SPINAND_INFO("MT29F8G01ADBFD", 0x47,
> +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     SPINAND_HAS_CR_FEAT_BIT,
> +		     SPINAND_ECCINFO(&micron_8_ooblayout,
> +				     micron_8_ecc_get_status),
> +		     SPINAND_SELECT_TARGET(micron_select_target)),
>  };
>  
>  static int micron_spinand_detect(struct spinand_device *spinand)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
