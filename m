Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dccqt-00028E-Sy
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 19:29:13 +0000
Subject: Re: [PATCH 1/2] mtd: atmel-quadspi: Remove unneeded pinctrl header
To: Fabio Estevam <festevam@gmail.com>, boris.brezillon@free-electrons.com
Cc: matthias.bgg@gmail.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
References: <1500338499-17165-1-git-send-email-festevam@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <442a96a8-332a-9e54-bbc5-57bb44943ea7@wedev4u.fr>
Date: Tue, 1 Aug 2017 21:28:48 +0200
MIME-Version: 1.0
In-Reply-To: <1500338499-17165-1-git-send-email-festevam@gmail.com>
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

Le 18/07/2017 à 02:41, Fabio Estevam a écrit :
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> There is no need to include <linux/pinctrl/consumer.h> as no pinctrl
> function is used in this driver, so just remove it.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

series applied to the spi-nor/next branch of l2-mtd

Thanks!

> ---
>  drivers/mtd/spi-nor/atmel-quadspi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
> index ba76fa8..6c5708b 100644
> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
> @@ -35,7 +35,6 @@
>  
>  #include <linux/io.h>
>  #include <linux/gpio.h>
> -#include <linux/pinctrl/consumer.h>
>  
>  /* QSPI register offsets */
>  #define QSPI_CR      0x0000  /* Control Register */
> 
