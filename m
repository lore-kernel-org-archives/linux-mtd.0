Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F951C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 18:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269C12468E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 18:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gE4Jqqfy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 269C12468E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCl2sDV+8nTC5U69e7KwrKacBWrxDQck0zo9IRbX8N4=; b=gE4JqqfyWuOkia
	ne2Ln6lr2dhJoief6F6NFG1W3t6tzLTJfBp8PA99VjaOG1yEpqL6A092sY7Ql1tHT8Djef7sh/teW
	qMDATEtqnU3JRxkUPfxpQubi9N7b0ksA3scz5heSHURA/smKvgaMalo4YfaV54BMBRBTEzv+8GWlG
	VhfJ+OYYlIK+WY8Lujz4WqwQfR0rDounySPf4mpUqYyz2GSdjZ6lvYqWUGkkKGE2r6YqgSA6aP56O
	d7GZUSzMA2eQgBgp10DCMUmbjFa4UeEWxxClsoZaKS/oVC9biLdwWnPZjAohRiKHg+5ud9EvsQdjc
	UEiJOdDxcUeSdx64gC8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7NZU-0005In-6N; Thu, 27 Feb 2020 18:07:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7NZQ-0005Hs-Ff
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 18:07:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7B24C2963D9;
 Thu, 27 Feb 2020 18:07:32 +0000 (GMT)
Date: Thu, 27 Feb 2020 19:07:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH v4 3/5] mtd: spinand: micron: identify SPI NAND device
 with Continuous Read mode
Message-ID: <20200227190729.1c5e4fef@collabora.com>
In-Reply-To: <20200206202206.14770-4-sshivamurthy@micron.com>
References: <20200206202206.14770-1-sshivamurthy@micron.com>
 <20200206202206.14770-4-sshivamurthy@micron.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_100736_657762_FA090388 
X-CRM114-Status: GOOD (  21.63  )
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

On Thu,  6 Feb 2020 21:22:04 +0100
shiva.linuxworks@gmail.com wrote:

> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> Add SPINAND_HAS_CR_FEAT_BIT flag to identify the SPI NAND device with
> the Continuous Read mode.
> 
> Some of the Micron SPI NAND devices have the "Continuous Read" feature
> enabled by default, which does not fit the subsystem needs.
> 
> In this mode, the READ CACHE command doesn't require the starting column
> address. The device always output the data starting from the first
> column of the cache register, and once the end of the cache register
> reached, the data output continues through the next page. With the
> continuous read mode, it is possible to read out the entire block using
> a single READ command, and once the end of the block reached, the output
> pins become High-Z state. However, during this mode the read command
> doesn't output the OOB area.
> 
> Hence, we disable the feature at probe time.
> 
> Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> ---
>  drivers/mtd/nand/spi/micron.c | 16 ++++++++++++++++
>  include/linux/mtd/spinand.h   |  1 +
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 5fd1f921ef12..a8e947609cd9 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -18,6 +18,8 @@
>  #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
>  #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
>  
> +#define MICRON_CFG_CONTI_READ		BIT(0)

Let's try to use consistent names. The feature bit is
SPINAND_HAS_CR_FEAT_BIT, so maybe MICRON_CFG_CR. BTW, is this really a
micron-specific bit?

> +
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> @@ -153,8 +155,22 @@ static int micron_spinand_detect(struct spinand_device *spinand)
>  	return 1;
>  }
>  
> +static int micron_spinand_init(struct spinand_device *spinand)
> +{
> +	/*
> +	 * M70A device series enable Continuous Read feature at Power-up,
> +	 * which is not supported. Disable this bit to avoid any possible
> +	 * failure.
> +	 */
> +	if (spinand->flags == SPINAND_HAS_CR_FEAT_BIT)

	if (spinand->flags & SPINAND_HAS_CR_FEAT_BIT)

> +		return spinand_upd_cfg(spinand, MICRON_CFG_CONTI_READ, 0);
> +
> +	return 0;
> +}
> +
>  static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
>  	.detect = micron_spinand_detect,
> +	.init = micron_spinand_init,
>  };
>  
>  const struct spinand_manufacturer micron_spinand_manufacturer = {
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 4ea558bd3c46..333149b2855f 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -270,6 +270,7 @@ struct spinand_ecc_info {
>  };
>  
>  #define SPINAND_HAS_QE_BIT		BIT(0)
> +#define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
>  
>  /**
>   * struct spinand_info - Structure used to describe SPI NAND chips


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
