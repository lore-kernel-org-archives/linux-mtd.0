Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eaip2-0007Mp-CK
 for linux-mtd@lists.infradead.org; Sun, 14 Jan 2018 13:59:42 +0000
Date: Sun, 14 Jan 2018 14:59:17 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Add entry for Marvell NAND controller driver
Message-ID: <20180114145917.3d0304a5@bbrezillon>
In-Reply-To: <20180113105410.2555-1-miquel.raynal@free-electrons.com>
References: <20180113105410.2555-1-miquel.raynal@free-electrons.com>
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

On Sat, 13 Jan 2018 11:54:10 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Add entry for Marvell NAND controller driver and its bindings which will
> soon replace the old driver pxa3xx_nand.c.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa71ab52fd76..ca8bb8077e70 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8409,6 +8409,13 @@ L:	linux-wireless@vger.kernel.org
>  S:	Odd Fixes
>  F:	drivers/net/wireless/marvell/mwl8k.c
>  
> +MARVELL NAND CONTROLLER DRIVER
> +M:	Miquel Raynal <miquel.raynal@free-electrons.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Maintained
> +F:	drivers/mtd/nand/marvell_nand.c
> +F:	Documentation/devicetree/bindings/mtd/marvell-nand.txt
> +
>  MARVELL SOC MMC/SD/SDIO CONTROLLER DRIVER
>  M:	Nicolas Pitre <nico@fluxnic.net>
>  S:	Odd Fixes
