Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCNuN-0000OE-4G
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 10:48:37 +0000
Date: Wed, 8 Nov 2017 11:48:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wenyou
 Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Kamal
 Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH v2 1/6] mtd: nand: provide several helpers to do
 common NAND operations
Message-ID: <20171108114803.402cd5bf@bbrezillon>
In-Reply-To: <20171107145419.22717-2-miquel.raynal@free-electrons.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-2-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue,  7 Nov 2017 15:54:14 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> This is part of the process of removing direct calls to ->cmdfunc()
> outside of the core in order to introduce a better interface to execute
> NAND operations.

I found a few more call-sites that should be patched (see this diff
[1]).

> 
> Here we provide several helpers and make use of them to remove all
> direct calls to ->cmdfunc(). This way, we can easily modify those
> helpers to make use of the new ->exec_op() interface when available.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> [miquel.raynal@free-electrons.com: rebased and fixed some conflicts]
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---

> @@ -1143,18 +1143,17 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
>  			/*
>  			 * Re-read the data with the randomizer disabled to
>  			 * identify bitflips in erased pages.
> +			 * TODO: use DMA to read page in raw mode
>  			 */
> -			if (randomized) {
> -				/* TODO: use DMA to read page in raw mode */
> -				nand->cmdfunc(mtd, NAND_CMD_RNDOUT,
> -					      data_off, -1);
> -				nand->read_buf(mtd, data, ecc->size);
> -			}
> +			if (randomized)
> +				nand_change_read_column_op(nand, data_off,
> +							   data, ecc->size

Missing comma at the end of this line.

> +							   false);
>  

[1]http://code.bulix.org/orw2mr-224038
