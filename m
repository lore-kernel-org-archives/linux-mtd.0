Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsp3f-0003Tp-TD
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 07:27:15 +0000
Received: by mail-pd0-f182.google.com with SMTP id v10so6400861pde.41
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 23:26:50 -0800 (PST)
Date: Mon, 16 Dec 2013 23:26:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: add missing clk_disable_unprepare() in
 mxcnd_remove()
Message-ID: <20131217072646.GH12034@norris-Latitude-E6410>
References: <CAPgLHd9khk_3eTMTVjgGA5f3=6=PTcUiuhf8Pxb0E_H75-4GCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd9khk_3eTMTVjgGA5f3=6=PTcUiuhf8Pxb0E_H75-4GCw@mail.gmail.com>
Cc: fabio.estevam@freescale.com, jg1.han@samsung.com,
 m.grzeschik@pengutronix.de, michael.opdenacker@free-electrons.com,
 Sascha Hauer <s.hauer@pengutronix.de>, thierry.reding@avionic-design.de,
 schneider@at.festo.com, yongjun_wei@trendmicro.com.cn, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, artem.bityutskiy@linux.intel.com,
 grant.likely@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Sascha

On Tue, Dec 17, 2013 at 11:35:35AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> clock source is prepared and enabled by clk_prepare_enable() in
> mxcnd_probe() function, but no disable/unprepare in mxcnd_remove().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Looks good, thanks. Applied to l2-mtd.git.

> ---
>  drivers/mtd/nand/mxc_nand.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 7a4e032..567a5e5 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1577,6 +1577,8 @@ static int mxcnd_remove(struct platform_device *pdev)
>  	struct mxc_nand_host *host = platform_get_drvdata(pdev);
>  
>  	nand_release(&host->mtd);
> +	if (host->clk_act)
> +		clk_disable_unprepare(host->clk);
>  
>  	return 0;
>  }
> 

Brian
