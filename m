Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5394C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:30:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BBE60F58
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95BBE60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkLA4a7ctc8EbjVQMVRWZ6RLSZqJTxE/BwN7oF7j0t0=; b=lUwz83uDb9mTdH
	aE0//bHAcVOzED1cu3bIPZrhcU2E9uZ6poVjYVT/tYM/dfcrs83nDfg1+g0AKuiOrwv7SbTi1uedk
	lqnsocdX7R+Gof9Ew2cTVDXgy0FD4R9Bs3ySeQr97vZV34OgHPdMJdl6Vn0CgyKDY1rKjCEX6lsVy
	aLh8XZt/u9nzEqoQ9AFs2jwZGzR5L2M43Q6HG/4h3NAWEP+VqcQRO39+sXjNS+GVIrYz/ZyTQE8tL
	B/jrhLfmqb0I8IGfwLHLm6Dv9erBdX7XDzBAQRr0EHlNAHM0DtP15UM1QVHKgUXNwjtljCZBNDC4y
	DtYaJMeewSaHx5CNWpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFdcJ-00HFoM-5N; Mon, 16 Aug 2021 14:29:31 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFdaI-00HF8j-Lv
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 14:27:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A0FFE100006;
 Mon, 16 Aug 2021 14:27:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jaime Liao <jaimeliao@mxic.com.tw>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Cc: zhengxunli@mxic.com.tw,
	ycllin@mxic.com.tw
Subject: Re: [PATCH] mtd: spinand: macronix: Add Quad support for serial NAND
 flash
Date: Mon, 16 Aug 2021 16:27:23 +0200
Message-Id: <20210816142723.15295-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1628472472-32008-1-git-send-email-jaimeliao@mxic.com.tw>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c26b316307ff6ec4aa045872e58a5d2bd8ccbb02'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_072727_034172_D4E39C7E 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, 2021-08-09 at 01:27:52 UTC, Jaime Liao wrote:
> Adding FLAG "SPINAND_HAS_QE_BIT" for Quad mode support on Macronix
> Serial Flash.
> Validated via normal(default) and QUAD mode by read, erase, read back,
> on Xilinx Zynq PicoZed FPGA board which included Macronix
> SPI Host(drivers/spi/spi-mxic.c).
> ---
>  drivers/mtd/nand/spi/macronix.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
> index a989035..3f31f13 100644
> --- a/drivers/mtd/nand/spi/macronix.c
> +++ b/drivers/mtd/nand/spi/macronix.c
> @@ -126,7 +126,7 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
>  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>  					      &write_cache_variants,
>  					      &update_cache_variants),
> -		     0,
> +		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>  				     mx35lf1ge4ab_ecc_get_status)),
>  	SPINAND_INFO("MX35LF4GE4AD",
> @@ -136,7 +136,7 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
>  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>  					      &write_cache_variants,
>  					      &update_cache_variants),
> -		     0,
> +		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>  				     mx35lf1ge4ab_ecc_get_status)),
>  	SPINAND_INFO("MX35LF1G24AD",
> @@ -146,16 +146,16 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
>  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>  					      &write_cache_variants,
>  					      &update_cache_variants),
> -		     0,
> +		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
>  	SPINAND_INFO("MX35LF2G24AD",
>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24),
> -		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
>  		     NAND_ECCREQ(8, 512),
>  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>  					      &write_cache_variants,
>  					      &update_cache_variants),
> -		     0,
> +		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
>  	SPINAND_INFO("MX35LF4G24AD",
>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35),
> @@ -164,7 +164,7 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
>  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>  					      &write_cache_variants,
>  					      &update_cache_variants),
> -		     0,
> +		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
>  	SPINAND_INFO("MX31LF1GE4BC",
>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
> @@ -173,7 +173,7 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
>  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>  					      &write_cache_variants,
>  					      &update_cache_variants),
> -		     0 /*SPINAND_HAS_QE_BIT*/,
> +		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>  				     mx35lf1ge4ab_ecc_get_status)),
>  	SPINAND_INFO("MX31UF1GE4BC",
> @@ -183,7 +183,7 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
>  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>  					      &write_cache_variants,
>  					      &update_cache_variants),
> -		     0 /*SPINAND_HAS_QE_BIT*/,
> +		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>  				     mx35lf1ge4ab_ecc_get_status)),
>  
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
