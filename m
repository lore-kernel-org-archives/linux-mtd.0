Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKsFK-0000YK-FS
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 20:17:04 +0000
Received: from player734.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id B959A105DF4
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 22:16:38 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: Recover from Spansion/Cypress errors
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
References: <20170612150140.11278-1-alexander.sverdlin@nokia.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <db4607e1-e57b-185b-13a5-2d242642be79@wedev4u.fr>
Date: Tue, 13 Jun 2017 22:16:31 +0200
MIME-Version: 1.0
In-Reply-To: <20170612150140.11278-1-alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

this patch looks good to me.
If Marek is fine with as well, I can apply it.

Otherwise, if a new version is needed, then please note that this patch
doesn't apply directly on the spi-nor/next branch of the l2-mtd tree.

It can be fixed quite easily, I show you below the faulty chunk.

Le 12/06/2017 à 17:01, Alexander Sverdlin a écrit :
> S25FL{128|256|512}S datasheets say:
> "When P_ERR or E_ERR bits are set to one, the WIP bit will remain set to
> one indicating the device remains busy and unable to receive new operation
> commands. A Clear Status Register (CLSR) command must be received to return
> the device to standby mode."
> 
> Current spi-nor code works until first error occurs, but write/erase errors
> are not just rare hardware failures, they also occur if user tries to flash
> write-protected areas. After such attempt no SPI command can be executed
> any more and even read fails. This patch adds support for P_ERR and E_ERR
> bits in Status Register 1 (so that operation fails immediately and not
> after a long timeout) and proper recovery from the error condition.
> 
> Tested on Spansion S25FS128S, which is supported by S25FL129P entry.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++++++++++++--------
>  include/linux/mtd/spi-nor.h   |  5 +++++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index dea8c9c..efb3519 100644
[...]
> @@ -1641,6 +1652,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  		nor->flags |= SNOR_F_HAS_SR_TB;
>  	if (info->flags & NO_CHIP_ERASE)
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> +	if (info->flags & USE_CLSR)
> +		nor->flags |= SNOR_F_USE_CLSR;
>  
>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>  	/* prefer "small sector" erase if possible */

The 2 last lines of this chunk have changed, now they should be:
+	if (info->flags & SPI_NOR_NO_ERASE)
+		mtd->flags |= MTD_NO_ERASE;


Best regards,

Cyrille
