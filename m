Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0668EE7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwNAYn47B9QSqQ8pbQm86z3dvScvV3tB6DNZCT2J6/0=; b=yJMxXI5oJ9IGZd
	I8OqGrLKsNAznfDTjtNQrN9+Ah3JZ24MiymoabGi+Ox1cyfreHun7jBo6p6oc/EjGYiJpbZBzWeiX
	c421LkG8fXVZL8GpFx0fYMBCcT4FL4e8kCq752g0Xyj8AglICFLRqN8r6+CKMsZq5BVbhp1EV8sOe
	9N8XBLIuXivQQOswVKpah073k716k8/IujqkQei6Ujh+S9dnvp+Cbb3UHOYBB40/Y93NBqt9Pds81
	I9TkzJLy0M4U3Vx0W2NmerbnOIzOrxNyVJ5r9LZXe8Wg1NKm2XBWIZdh/Gdtg4rwzycF9r3hE6MV6
	4HBfrjptMlqM/XzWqLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAlT-0000000A2CJ-2NGL;
	Mon, 16 Dec 2024 13:03:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAlR-0000000A2AH-2A8P
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 13:03:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BD04A40FBE;
	Mon, 16 Dec 2024 13:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC86C4CED0;
	Mon, 16 Dec 2024 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734354235;
	bh=Jtst/oDEmOyqiNX2HND18yf4M0efdD9YXjGZnTbJufI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DASjVgbgaePWMRC6BaSfEDiWwTzOeE02WvQ+xsg4Mj6LFpFHYIlTsRGMbu4iyrSsq
	 gIfJOOCUL+kbgnM+l6I7Q/pzQyhP1elLdGVVG2SDHJWqLvoowlSIv+gkQSxGXHVYKg
	 MKTVLXvjU044blU789vTNtpFSi6ocTsv/p1zvrzhTwZDrgxYroT6fcqh5e0TBJhcaH
	 9KrsKscUt9xSvtEWanFCW3YUlc0gK3wHIkwwhl4IXltsHl2RYJUV3hcQ6fT1G+HYn7
	 VxJ3+bA80i49yDnY3kxGxvhUi36oRTHhydgHd0W9BkFTnce27Jf9VM41CxLvv54K9m
	 Is5pe40WSCiZw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: gcc-patches@gcc.gnu.org,  linux-mtd@lists.infradead.org,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add w25q01jv flash chip
In-Reply-To: <Z2AOeyPwYWaam_lX@monster.localdomain> (Wilken Gottwalt's message
	of "Mon, 16 Dec 2024 11:26:51 +0000")
References: <Z2AOeyPwYWaam_lX@monster.localdomain>
Date: Mon, 16 Dec 2024 13:03:53 +0000
Message-ID: <mafs0y10f230m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_050357_631912_562F1F63 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Wilken,

On Mon, Dec 16 2024, Wilken Gottwalt wrote:

> Add Winbond W25Q01JV 128 MiB SPI NOR flash chip, verified working on the
> Zynq-7000 platform QSPI controller. The flash chip has quite high read
> speeds (about 60+ MiB/s), but erasing is very slow. The slow erasing is
> by design.

Does the flash have support SFDP? If so, you likely don't need specify
the no_sfdp_flags, name, or size. Try the entry only with ID and flags,
and see if the flash continues to work fine for you.

Also see [0] for additional testing requirements.

[0] https://docs.kernel.org/driver-api/mtd/spi-nor.html

>
> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> ---
>  drivers/mtd/spi-nor/winbond.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 8d0a00d69e12..e2caf299d19a 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -146,6 +146,12 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.name = "w25q512jvq",
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x40, 0x21),
> +		.name = "w25q01jv",
> +		.size = SZ_128M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x50, 0x12),
>  		.name = "w25q20bw",

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
