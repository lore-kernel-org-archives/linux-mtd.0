Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOqHe-0002jG-IU
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 14:41:44 +0000
Date: Wed, 25 Sep 2013 11:41:18 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mtd: pxa3xx_nand: fix compilation error
Message-ID: <20130925144118.GE2418@localhost>
References: <1380118794-846-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1380118794-846-1-git-send-email-linus.walleij@linaro.org>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, stable@vger.kernel.org,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

On Wed, Sep 25, 2013 at 04:19:54PM +0200, Linus Walleij wrote:
> When building the pxa3xx defconfig without device tree support
> (i.e. the pxa3xx_defconfig) the build fails like this:
> 
> drivers/mtd/nand/pxa3xx_nand.c: In function ‘pxa3xx_nand_probe’:
> drivers/mtd/nand/pxa3xx_nand.c:1325:2: error: implicit declaration of function ‘pxa3xx_nand_get_variant’ [-Werror=implicit-function-declaration]
>   info->variant = pxa3xx_nand_get_variant(pdev);
>   ^
> cc1: some warnings being treated as errors
> make[5]: *** [drivers/mtd/nand/pxa3xx_nand.o] Error 1
> make[4]: *** [drivers/mtd/nand] Error 2
> make[4]: *** Waiting for unfinished jobs....
> 
> Fix it up by returning the PXA variant on non-DT boots.
> 
> This appears to have been broken since
> commit c0f3b8643a6fa2461d70760ec49d21d2b031d611
> "mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string"
> 
> Cc: stable@vger.kernel.org
> Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Cc: Daniel Mack <zonque@gmail.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 5db900d..e7a403f 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1285,6 +1285,12 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
>  	return 0;
>  }
>  #else
> +static enum pxa3xx_nand_variant
> +pxa3xx_nand_get_variant(struct platform_device *pdev)
> +{
> +	return PXA3XX_NAND_VARIANT_PXA;
> +}
> +
>  static inline int pxa3xx_nand_probe_dt(struct platform_device *pdev)
>  {
>  	return 0;
> -- 

There's already a fix for this in v3.12-rc2:

  commit ab5be58833455dd2f942b9e2e5fcc8d9b4c7c9e6
  Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
  Date:   Mon Aug 12 14:14:46 2013 -0300

  mtd: nand: pxa3xx: Remove unneeded ifdef CONFIG_OF

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
