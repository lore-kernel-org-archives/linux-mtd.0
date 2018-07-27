Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fixU6-0003zr-2l
 for linux-mtd@lists.infradead.org; Fri, 27 Jul 2018 07:48:23 +0000
Date: Fri, 27 Jul 2018 09:48:00 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 4/4] mtd: spi-nor: atmel-qspi: Include gpio/consumer.h
 instead of gpio.h
Message-ID: <20180727094800.3ab5ce9d@bbrezillon>
In-Reply-To: <20180720095741.6313-5-boris.brezillon@bootlin.com>
References: <20180720095741.6313-1-boris.brezillon@bootlin.com>
 <20180720095741.6313-5-boris.brezillon@bootlin.com>
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

On Fri, 20 Jul 2018 11:57:41 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> GPIO consumers now include <linux/gpio/consumer.h> instead of
> <linux/gpio.h> if they can.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied.

> ---
>  drivers/mtd/spi-nor/atmel-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
> index 6c5708bacad8..ce65c2b53ac1 100644
> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
> @@ -34,7 +34,7 @@
>  #include <linux/of.h>
>  
>  #include <linux/io.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  
>  /* QSPI register offsets */
>  #define QSPI_CR      0x0000  /* Control Register */
