Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddHvb-0001Mo-LV
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 15:20:49 +0000
Date: Thu, 3 Aug 2017 17:20:25 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr, narmstrong@baylibre.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] mtd: nand: vf610_nfc: Handle return value of
 clk_prepare_enable.
Message-ID: <20170803172025.1058d316@bbrezillon>
In-Reply-To: <1501587558-21227-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1501587558-21227-1-git-send-email-arvind.yadav.cs@gmail.com>
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

On Tue,  1 Aug 2017 17:09:18 +0530
Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> clk_prepare_enable() can fail here and we must check its return value.

You're just a few days late, this one has already been proposed by
Fabio [1] ;-).

I'll queue other patches from this patchset.

Thanks,

Boris

[1]https://patchwork.ozlabs.org/patch/789812/

> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/mtd/nand/vf610_nfc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 744ab10..db03d4f 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -816,10 +816,13 @@ static int vf610_nfc_resume(struct device *dev)
>  {
>  	struct mtd_info *mtd = dev_get_drvdata(dev);
>  	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int ret;
>  
>  	pinctrl_pm_select_default_state(dev);
>  
> -	clk_prepare_enable(nfc->clk);
> +	ret = clk_prepare_enable(nfc->clk);
> +	if (ret)
> +		return ret;
>  
>  	vf610_nfc_preinit_controller(nfc);
>  	vf610_nfc_init_controller(nfc);
