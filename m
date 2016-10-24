Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byePd-00017U-Oo
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 12:31:38 +0000
Date: Mon, 24 Oct 2016 14:31:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: gpmi: disable the clocks on errors
Message-ID: <20161024143112.66bb705a@bbrezillon>
In-Reply-To: <1477152922-6722-1-git-send-email-festevam@gmail.com>
References: <1477152922-6722-1-git-send-email-festevam@gmail.com>
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

On Sat, 22 Oct 2016 14:15:22 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> We should disable the previously enabled GPMI clocks in the error paths.
> 
> Also, when gpmi_enable_clk() fails simply return the error
> code immediately rather than jumping to to the 'err_out' label.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, can you take this patch in the MTD tree and queue it for the
next -rc?

> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index 0f68a99..141bd70 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -161,7 +161,7 @@ int gpmi_init(struct gpmi_nand_data *this)
>  
>  	ret = gpmi_enable_clk(this);
>  	if (ret)
> -		goto err_out;
> +		return ret;
>  	ret = gpmi_reset_block(r->gpmi_regs, false);
>  	if (ret)
>  		goto err_out;
> @@ -197,6 +197,7 @@ int gpmi_init(struct gpmi_nand_data *this)
>  	gpmi_disable_clk(this);
>  	return 0;
>  err_out:
> +	gpmi_disable_clk(this);
>  	return ret;
>  }
>  
> @@ -270,7 +271,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  
>  	ret = gpmi_enable_clk(this);
>  	if (ret)
> -		goto err_out;
> +		return ret;
>  
>  	/*
>  	* Due to erratum #2847 of the MX23, the BCH cannot be soft reset on this
> @@ -308,6 +309,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  	gpmi_disable_clk(this);
>  	return 0;
>  err_out:
> +	gpmi_disable_clk(this);
>  	return ret;
>  }
>  
