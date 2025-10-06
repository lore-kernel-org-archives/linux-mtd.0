Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084D3CCA471
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Oct 2025 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSDK05o0G9c1K6FYzDTmp+FUX8BZ60/Yltf1zRc10wQ=; b=f5UI9Jcl0aLO3D
	86rBMt6ZFNzIxuYusY63oFTrkS6LZC1DgBIJTvoAfr1FgoOruojN73Lzwtbr4bm99o6DAfUHTsYut
	aZKjGZ/praNYH3wKMEccarC1IEEXDkvMM1nz+mTff5FNx9xNVUTmHafu+Jo+pSrR5y0niZzJn6neX
	WzJSpMQRo4IavT3VBrgU+kq7vQ+eMKgo5HMtod740qqUjSMFzXmmM4BHg2R7qUsZj5kJWozaZn2KA
	58M6fNTjrvoHUIp8ppfV3JRYk3uvbAsXTeH6oLKIyRTS0FTrH+rBMDAasVCDdpCzReuNMB4iTsS8P
	nwlgUqZk5OzYIA1yRIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tqx-00000000vnP-0MbL;
	Mon, 06 Oct 2025 22:38:47 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tqt-00000000vmz-3x2c
	for linux-mtd@lists.infradead.org;
	Mon, 06 Oct 2025 22:38:45 +0000
Message-ID: <21760ebf-99f8-4ea3-8841-e023e00ae574@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759790310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOFih1hTDf2jYUgbN3HvZ18kSxomlomXmLCFXqJg8d4=;
	b=K3GK5gjDGx4ZJRh0lp7zOoB97hI8lH74FO15WAvIQ9Oz2QPqHxBjs16jyWnvb7uNwx0Wvc
	Q/KQQiPWNHzTsvkCb0NDH7fWCMtLGFZMzcNvu/zxnZ0qCrx3NVBzxdO39lh327DtG4OoaK
	DaqcNAcoNPT9p73/QxbwulUQA7OyvyE=
Date: Mon, 6 Oct 2025 18:38:27 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20251006223409.3475001-1-sean.anderson@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_153844_153092_05C77438 
X-CRM114-Status: GOOD (  15.00  )
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

On 10/6/25 18:34, Sean Anderson wrote:
> The datasheet for n25q00a shows that the status register has the same
> layout as for n25q00, so use the same flags to enable locking support.
> These flags should have been added back in commit 150ccc181588 ("mtd:
> spi-nor: Enable locking for n25q128a11"), but they were removed by the

Sorry, this should be commit f80ff13135cb ("mtd: spi-nor: micron-st: Enable locking for n25q00")

https://lore.kernel.org/all/20200421063313.32655-1-js07.lee@samsung.com/

> maintainer...
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> Tested with a mt25qu01gbbb, which shares the same flash ID.
> 
>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 187239ccd549..17c7d6322508 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -486,6 +486,8 @@ static const struct flash_info st_nor_parts[] = {
>  		.id = SNOR_ID(0x20, 0xbb, 0x21),
>  		.name = "n25q00a",
>  		.size = SZ_128M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> +			 SPI_NOR_BP3_SR_BIT6,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
>  		.mfr_flags = USE_FSR,
>  		.fixups = &n25q00_fixups,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
