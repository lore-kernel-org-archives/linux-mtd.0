Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5DBC4828C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdvfKi89Nz83fqM+KHeFOVfrLamFtbkHZqeOuMREiUU=; b=EZt96OnxhW68M6J5huE7BrRNJJ
	Yt/+mB0pgqON1/AusEPqU/633Q0JEY0m26uMkBNQDCafqXFadqtd33r4lQ2VZqb+g8JatbkmpsVU5
	AHPI1GaBhmv55B566eX6qRNJYrgatsWs2liRpaQMMlDd4AT0OPbulF6kV6n5On0TCXWUE52R3hPWo
	Mg0PQRQj/xSuqyBwRB1dV4CjknO3vVWjKrcyUZYXnhPhc9gFzXFZ14UsZuWYDxdOIcJb2Q4D0n+1y
	HFH8iNXifbv7PR8ad9AWLfujta4qPaEnbBvUw3NOuYrec1jcE1A+t4rnhTQ1bOS9glNyiZVrm0eOk
	zU8IxYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXPt-00000008ANR-37pK;
	Thu, 01 Feb 2024 13:47:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXPq-00000008ALm-1hlP
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 13:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11929CE1EF0;
	Thu,  1 Feb 2024 13:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD6C433F1;
	Thu,  1 Feb 2024 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706795259;
	bh=6V78DR2Nb/jUbKBHuJ0negCG/TVk5A4NkslQ23DMV5E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ErIa5eCayveF4ltSAHPvQOQmDzAkzBDu7U5MABEd/JPZe40+Nh+k33hDl/FdkBMip
	 eWM1L9aAF9HwI30N861NZUw/FX7d3Fm27ztSE74DRh9SA4f6At1B9cVZIUyyIq30/F
	 Lxh+j5XqEFAhIvAuXR8yWhEMdItAHIRrjep2UiV9zZRHM8C+GzexQv60AChySCKQuS
	 UrR9fJ08zQM/z5w5DW1DK9FfQqJP1BlQ0SQdpQCD4CGpaTlP0X43Y9L6jxUpRfM6kb
	 fdX2kKbKO/QDpTDzNh40TimiqZcp+1aqvtAjPLTi9FlA+WI8Hky8jb9jXyn1vii7K4
	 pvDSjUUsc2YVw==
MIME-Version: 1.0
Date: Thu, 01 Feb 2024 14:47:34 +0100
From: Michael Walle <mwalle@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb entry
In-Reply-To: <20240201131710.797505-2-f.suligoi@asem.it>
References: <20240201131710.797505-1-f.suligoi@asem.it>
 <20240201131710.797505-2-f.suligoi@asem.it>
Message-ID: <9a22148dd786dd1c37f10412b574aae8@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_054742_677840_1802A133 
X-CRM114-Status: GOOD (  19.65  )
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

> Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
> Memory.

Out of curiosity, what is your use case here? Usually, I push back on
this small MRAM devices in SPI-NOR in favor of the at25 driver. But
this datasheet lists octal dtr with 200mhz, which seems a bit ridiculous
for 512kB. The at25 driver only supports single bit SPI of course.

I'm not sure in which mode you are using this device, though. The DS
shows a non-volatile configuration register (Table 10, offset 0) and
it's default value is single bit SPI.

> This device is JEDEC compatible (JESD251 and JESD251-1), but it is not
> able to provide SFDP information.
> 
> Link: https://www.everspin.com/file/158244/download

No newline.

> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  drivers/mtd/spi-nor/everspin.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/everspin.c 
> b/drivers/mtd/spi-nor/everspin.c
> index 5f321e24ae7d..4741930ce9a8 100644
> --- a/drivers/mtd/spi-nor/everspin.c
> +++ b/drivers/mtd/spi-nor/everspin.c
> @@ -31,6 +31,14 @@ static const struct flash_info everspin_nor_parts[] 
> = {
>  		.size = SZ_512K,
>  		.sector_size = SZ_512K,
>  		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +	}, {
> +		.id = SNOR_ID(0x6b, 0xbb, 0x13),
> +		.name = "em004lxb",

No name. We prefer to only have the ID for parts which has JEDED IDs.

> +		.size = SZ_512K,
> +		.sector_size = SZ_512K,

This should probably be removed (and then default to the 64k erase
size).

> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR | SPI_NOR_HAS_LOCK |

Don't use SPI_NOR_NO_ERASE for new devices. Eventually, I like to get 
rid of
this flag. This device is emulating the erase instruction, so it should 
work
without.

SPI_NOR_NO_FR is wrong here. The DS says it supports fast read.

Please also have a look at [1] for the required tests.

-michael

> +			 SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
> +		.no_sfdp_flags = SPI_NOR_SKIP_SFDP,
>  	}
>  };

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
