Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1by99c-0001Mp-77
 for linux-mtd@lists.infradead.org; Sun, 23 Oct 2016 03:08:57 +0000
Received: by mail-wm0-x243.google.com with SMTP id o81so4514660wma.2
 for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2016 20:08:35 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: gpmi: disable the clocks on errors
To: Fabio Estevam <festevam@gmail.com>, boris.brezillon@free-electrons.com
References: <1477152922-6722-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, han.xu@nxp.com,
 linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <73e38ebd-3612-94c3-46bf-dc6e29925ee3@gmail.com>
Date: Sun, 23 Oct 2016 05:08:19 +0200
MIME-Version: 1.0
In-Reply-To: <1477152922-6722-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/22/2016 06:15 PM, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> We should disable the previously enabled GPMI clocks in the error paths.
> 
> Also, when gpmi_enable_clk() fails simply return the error
> code immediately rather than jumping to to the 'err_out' label.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Reviewed-by: Marek Vasut <marex@denx.de>

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
> 


-- 
Best regards,
Marek Vasut
