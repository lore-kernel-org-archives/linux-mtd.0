Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW8pO-0002Ji-6Z
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 18:59:14 +0000
Received: by mail-pa0-f48.google.com with SMTP id ey11so5652618pad.21
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 11:58:52 -0700 (PDT)
Date: Mon, 22 Sep 2014 11:58:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v4 5/5] mtd: nand: Constrain omap_elm to built-in
Message-ID: <20140922185849.GT1193@ld-irv-0074>
References: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1411231996-6387-6-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411231996-6387-6-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 20, 2014 at 05:53:16PM +0100, Ezequiel Garcia wrote:
> This fixes the following build error when omap2_nand is chosen built-in,
> and omap_elm is chosen as a module:
> 
>   drivers/mtd/nand/omap2.c:2010: undefined reference to `elm_config'
>   drivers/mtd/nand/omap2.c:1980: undefined reference to `elm_config'
>   drivers/mtd/nand/omap2.c:1927: undefined reference to `elm_config'
>   drivers/mtd/nand/omap2.c:1444: undefined reference to `elm_decode_bch_error_page'
> 
> Fix this by making omap_elm a 'bool' driver.

Hmm, so we're sacrificing a "feature" (that omap2 + omap_elm can both be
built as modules) because we haven't solved one particular developer UI
inconsistency (that we don't prevent the config combination of
MTD_NAND_OMAP2=y and MTD_NAND_OMAP_BCH=m)? I wouldn't tend to sacrifice
the feature for the sake of a bad config.

Do you have any guesstimate as to whether the linker failure affects
many people? Are people just hitting this with randconfig?

Do you know if anyone ships loadable modules for this driver? e.g., any
embedded distros?

I could go either way on this, but I just wasn't sure if these sorts of
questions had been asked/answered.

> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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

Brian
