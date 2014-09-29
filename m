Message-ID: <54291A84.5080109@atmel.com>
Date: Mon, 29 Sep 2014 10:38:28 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>, <computersforpeace@gmail.com>,
 <akpm@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: add atmel nand driver maintainer entry
References: <1411979763-1449-1-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1411979763-1449-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29/09/2014 10:36, Josh Wu :
> This patch adds an entry in MAINTAINERS file for ATMEL nand driver.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3705430..1bdf3bf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1698,6 +1698,12 @@ M:	Nicolas Ferre <nicolas.ferre@atmel.com>
>  S:	Supported
>  F:	drivers/net/ethernet/cadence/
>  
> +ATMEL NAND DRIVER
> +M:	Josh Wu <josh.wu@atmel.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Supported
> +F:	drivers/mtd/nand/atmel_nand*
> +
>  ATMEL SPI DRIVER
>  M:	Nicolas Ferre <nicolas.ferre@atmel.com>
>  S:	Supported
> 


-- 
Nicolas Ferre
