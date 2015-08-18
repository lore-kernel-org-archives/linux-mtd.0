Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRhVC-0000gE-6r
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 14:04:37 +0000
Message-ID: <55D33B4F.8020602@ti.com>
Date: Tue, 18 Aug 2015 17:03:59 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Axel Lin <axel.lin@ingics.com>, Brian Norris <computersforpeace@gmail.com>
CC: Frans Klaver <frans.klaver@xsens.com>, =?UTF-8?B?RXplcXVpZWwgR2FyY8Ot?=
 =?UTF-8?B?YQ==?= <ezequiel@vanguardiasur.com.ar>, David Woodhouse
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: omap_elm: Fix module alias
References: <1439902993.15765.1.camel@ingics.com>
In-Reply-To: <1439902993.15765.1.camel@ingics.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18/08/15 16:03, Axel Lin wrote:
> Remove extra space after the "platform:" prefix and make the alias matches
> driver name.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger

> ---
>  drivers/mtd/nand/omap_elm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/omap_elm.c b/drivers/mtd/nand/omap_elm.c
> index 376bfe1..235ec79 100644
> --- a/drivers/mtd/nand/omap_elm.c
> +++ b/drivers/mtd/nand/omap_elm.c
> @@ -574,5 +574,5 @@ module_platform_driver(elm_driver);
>  
>  MODULE_DESCRIPTION("ELM driver for BCH error correction");
>  MODULE_AUTHOR("Texas Instruments");
> -MODULE_ALIAS("platform: elm");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
>  MODULE_LICENSE("GPL v2");
> 
