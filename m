Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC80AC54E49
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXdBvQ2ekstWIrPELUOr6LD2QhzIDa8WOPCnLE5ldGs=; b=HwFhZW4usyueLt
	Qj7M8t5/CLomn4WQRUq7ru+ECy55C9ptmQ+jWHO40B7604LUIs6wopLkDURRy7kQGWpMeFnRTrRXv
	6a9NHoWUWR9Zu42/cfP0BEVKr3+83dX/0yQATKACEare9R722bpSkD8dq2FkQdjE7jVxyhEqJkYMt
	mwv4njA+VTNNr6HkBbTjHhA5M6/8GYQo7tC/fmVPe2M4k59vEuJ2es2hw/FsrG27o2AYXwLobdo35
	UssUjulY+9K/zvw6W/rqCEHk21ufkx4ANfdnkx+5mihOvh2TgG2bgirK313LttxmAwdGDdQMHZO2Z
	FEyELlOyw+sIXuSby1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSgA-00000008sw5-06Bg;
	Fri, 23 Feb 2024 10:21:18 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSg7-00000008sva-0ti0
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 10:21:16 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 84B034CC;
	Fri, 23 Feb 2024 11:21:10 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 23 Feb 2024 11:21:10 +0100
Message-Id: <CZCDT5LY82NZ.2DM5UZYSJX9VE@kernel.org>
Subject: Re: [PATCH v4 4/4] mtd: spi-nor: core: set mtd->eraseregions for
 non-uniform erase map
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
 <35d0962986e493b06c13bdf7ada8130a9966dc02.1708404584.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <35d0962986e493b06c13bdf7ada8130a9966dc02.1708404584.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_022115_444915_D6108D72 
X-CRM114-Status: GOOD (  18.04  )
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

On Tue Feb 20, 2024 at 9:34 AM CET, tkuw584924 wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Some of Infineon SPI NOR flash devices support hybrid sector layout that
> overlays 4KB sectors on a 256KB sector and SPI NOR framework recognizes
> that by parsing SMPT and construct params->erase_map. The hybrid sector
> layout is similar to CFI flash devices that have small sectors on top
> and/or bottom address. In case of CFI flash devices, the erase map
> information is parsed through CFI table and populated into
> mtd->eraseregions so that users can create MTD partitions that aligned
> with small sector boundaries. This patch provides the same capability to
> SPI NOR flash devices that have non-uniform erase map.
>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 58 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 21775d5eccd5..5ba570248cb9 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3349,7 +3349,54 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  	return info;
>  }
>  
> -static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +static u32
> +spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
> +			     const struct spi_nor_erase_type *erase_type)
> +{
> +	u8 i;
> +
> +	if (region->overlaid)
> +		return region->size;
> +
> +	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
> +		if (region->erase_mask & BIT(i))
> +			return erase_type[i].size;
> +	}

nit: You could drop the braces.

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
