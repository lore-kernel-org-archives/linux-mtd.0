Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiOgQ-0004yM-Cp
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 18:38:48 +0000
Date: Wed, 25 Jul 2018 20:38:23 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Josh Wu <rainyfeeling@outlook.com>,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: drop Wenyou Yang from Atmel NAND driver
 support
Message-ID: <20180725203823.19a56d23@bbrezillon>
In-Reply-To: <20180725145628.6625-1-miquel.raynal@bootlin.com>
References: <20180725145628.6625-1-miquel.raynal@bootlin.com>
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

On Wed, 25 Jul 2018 16:56:28 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Mails to wenyou.yang@microchip.com are not deliverable.
> Drop him as Microchip/Atmel NAND controller driver maintainer.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
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

Hm, actually you can remove the entry completely. I doubt Josh will
keep maintaining this driver since he's no longer working at Microchip.

>  L:	linux-mtd@lists.infradead.org
>  S:	Supported
