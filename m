Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiMOu-0007YL-HL
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 16:12:35 +0000
Date: Wed, 25 Jul 2018 18:12:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: drop Wenyou Yang from Atmel NAND driver
 support
Message-ID: <20180725161211.GE3539@piout.net>
References: <20180725145628.6625-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180725145628.6625-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25/07/2018 16:56:28+0200, Miquel Raynal wrote:
> Mails to wenyou.yang@microchip.com are not deliverable.
> Drop him as Microchip/Atmel NAND controller driver maintainer.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 07d1576fc766..1e7bbd5843f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9345,7 +9345,6 @@ F:	drivers/media/platform/atmel/atmel-isc-regs.h
>  F:	devicetree/bindings/media/atmel-isc.txt
>  
>  MICROCHIP / ATMEL NAND DRIVER
> -M:	Wenyou Yang <wenyou.yang@microchip.com>
>  M:	Josh Wu <rainyfeeling@outlook.com>
>  L:	linux-mtd@lists.infradead.org
>  S:	Supported
> -- 
> 2.14.1
> 

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
