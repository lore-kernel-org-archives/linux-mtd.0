Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czPAU-0004PF-5J
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 14:59:19 +0000
Received: by mail-wm0-x242.google.com with SMTP id d79so2686444wmi.2
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 07:58:57 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: nand: gpmi: Kill gpmi_nand_exit()
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1491813318-4417-1-git-send-email-boris.brezillon@free-electrons.com>
 <1491813318-4417-2-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <329243f7-ca5d-7a26-5db0-617868607f37@gmail.com>
Date: Sat, 15 Apr 2017 16:58:43 +0200
MIME-Version: 1.0
In-Reply-To: <1491813318-4417-2-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/10/2017 10:35 AM, Boris Brezillon wrote:
> The only user of gpmi_nand_exit() is gpmi_nand_remove(). Move its content
> to the caller.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Super, thanks.

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 92279a0d52f1..f22eeedc728f 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1929,12 +1929,6 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
>  	return gpmi_alloc_dma_buffer(this);
>  }
>  
> -static void gpmi_nand_exit(struct gpmi_nand_data *this)
> -{
> -	nand_release(nand_to_mtd(&this->nand));
> -	gpmi_free_dma_buffer(this);
> -}
> -
>  static int gpmi_init_last(struct gpmi_nand_data *this)
>  {
>  	struct nand_chip *chip = &this->nand;
> @@ -2131,7 +2125,8 @@ static int gpmi_nand_remove(struct platform_device *pdev)
>  {
>  	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
>  
> -	gpmi_nand_exit(this);
> +	nand_release(nand_to_mtd(&this->nand));
> +	gpmi_free_dma_buffer(this);
>  	release_resources(this);
>  	return 0;
>  }
> 


-- 
Best regards,
Marek Vasut
