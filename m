Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zcocz-0001Ny-TY
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 05:54:34 +0000
Date: Fri, 18 Sep 2015 07:54:01 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Luis de Bethencourt <luis@debethencourt.com>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Baruch Siach <baruch@tkos.co.il>,
 "Koul, Vinod" <vinod.koul@intel.com>,
 Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 4/5] mtd: mxc_nand: Fix module autoload for OF platform
 driver
Message-ID: <20150918055401.GQ5327@pengutronix.de>
References: <20150917221328.GA9291@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150917221328.GA9291@goodgumbo.baconseed.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 12:13:28AM +0200, Luis de Bethencourt wrote:
> This platform driver has a OF device ID table but the OF module
> alias information is not created so module autoloading won't work.
> 
> Signed-off-by: Luis de Bethencourt <luisbg@osg.samsung.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

> ---
>  drivers/mtd/nand/mxc_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 2426db8..ab281b6 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1458,6 +1458,7 @@ static const struct of_device_id mxcnd_dt_ids[] = {
>  	},
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
>  
>  static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
>  {

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
