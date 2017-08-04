Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddY1E-0003QZ-GM
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 08:31:41 +0000
Date: Fri, 4 Aug 2017 10:30:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: stefan@agner.ch, linux-mtd@lists.infradead.org, Fabio Estevam
 <fabio.estevam@nxp.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: vf610: Check the return value from
 clk_prepare_enable()
Message-ID: <20170804103041.6c10a51d@bbrezillon>
In-Reply-To: <1500339248-18132-1-git-send-email-festevam@gmail.com>
References: <1500339248-18132-1-git-send-email-festevam@gmail.com>
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

On Mon, 17 Jul 2017 21:54:07 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> clk_prepare_enable() may fail, so we should better check its return value
> and propagate it in the case of error.
> 

Applied both.

Thanks,

Boris

> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - None
> 
>  drivers/mtd/nand/vf610_nfc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 744ab10..9e49672 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -814,12 +814,16 @@ static int vf610_nfc_suspend(struct device *dev)
>  
>  static int vf610_nfc_resume(struct device *dev)
>  {
> +	int err;
> +
>  	struct mtd_info *mtd = dev_get_drvdata(dev);
>  	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>  
>  	pinctrl_pm_select_default_state(dev);
>  
> -	clk_prepare_enable(nfc->clk);
> +	err = clk_prepare_enable(nfc->clk);
> +	if (err)
> +		return err;
>  
>  	vf610_nfc_preinit_controller(nfc);
>  	vf610_nfc_init_controller(nfc);
