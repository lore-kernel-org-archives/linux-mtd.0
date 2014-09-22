Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVyoW-0002Pn-2Z
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 08:17:40 +0000
Message-ID: <541FDB09.1080209@ti.com>
Date: Mon, 22 Sep 2014 11:17:13 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 5/5] mtd: nand: Constrain omap_elm to built-in
References: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1411231996-6387-6-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1411231996-6387-6-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/20/2014 07:53 PM, Ezequiel Garcia wrote:
> This fixes the following build error when omap2_nand is chosen built-in,
> and omap_elm is chosen as a module:
> 
>   drivers/mtd/nand/omap2.c:2010: undefined reference to `elm_config'
>   drivers/mtd/nand/omap2.c:1980: undefined reference to `elm_config'
>   drivers/mtd/nand/omap2.c:1927: undefined reference to `elm_config'
>   drivers/mtd/nand/omap2.c:1444: undefined reference to `elm_decode_bch_error_page'
> 
> Fix this by making omap_elm a 'bool' driver.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: <rogerq@ti.com>

--
cheers,
-roger

> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f1cf503..549c0cb 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -96,7 +96,7 @@ config MTD_NAND_OMAP2
>  
>  config MTD_NAND_OMAP_BCH
>  	depends on MTD_NAND_OMAP2
> -	tristate "Support hardware based BCH error correction"
> +	bool "Support hardware based BCH error correction"
>  	default n
>  	select BCH
>  	help
> 
