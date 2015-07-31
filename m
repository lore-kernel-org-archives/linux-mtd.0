Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLHBp-0007EB-Kk
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 20:46:02 +0000
Received: by pdbbh15 with SMTP id bh15so47907662pdb.1
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 13:45:40 -0700 (PDT)
Date: Fri, 31 Jul 2015 13:45:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Cc: linux-mtd@lists.infradead.org, b45815@freescale.com, lznuaa@gmail.com
Subject: Re: [PATCH v3 3/8] mtd: spi-nor: fsl-quadspi: add imx7d support
Message-ID: <20150731204536.GD10676@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <1437761188-8179-4-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437761188-8179-4-git-send-email-Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forgot one thing:

On Sat, Jul 25, 2015 at 02:06:23AM +0800, Frank.Li@freescale.com wrote:
> From: Frank Li <Frank.Li@freescale.com>
> 
> Support i.mx7d.
> quadspi in i.mx7d increase rxfifo.
> require fill at least 16byte to trigger data transfer.
> 
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 5f31bc7..3fc94ad 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
...
> @@ -677,6 +702,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  static const struct of_device_id fsl_qspi_dt_ids[] = {
>  	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
>  	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
> +	{ .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },

^^ This compatible string needs to be documented in
Documentation/devicetree/bindings/...

Please add a patch for the new properties in your next revision.

Brian

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
> -- 
> 1.9.1
> 
