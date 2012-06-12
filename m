Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SePmh-0000l4-3P
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 12:01:21 +0000
Date: Tue, 12 Jun 2012 14:01:15 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Gershgorin <alexg@meprolight.com>
Subject: Re: [PATCH] mtd: nand: mxc_nand fix compiler warning
Message-ID: <20120612120115.GU22191@pengutronix.de>
References: <1339499887-17859-1-git-send-email-alexg@meprolight.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1339499887-17859-1-git-send-email-alexg@meprolight.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, s.hauer@pengutronix.de,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Tue, Jun 12, 2012 at 02:18:07PM +0300, Alex Gershgorin wrote:
> This patch removes the following warning:
> drivers/mtd/nand/mxc_nand.c:1246: warning: initialization discards qualifiers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1249: warning: initialization discards qualifiers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1252: warning: initialization discards qualifiers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1255: warning: initialization discards qualifiers from pointer target type
> 
> Signed-off-by: Alex Gershgorin <alexg@meprolight.com>
> 
> Applies to v3.5-rc2+
> ---
Better write the "Applies to" line after the tripple dash. Then this
info doesn't make it into the commit log. Instead point out the
offending commit.

Having said that, I prefer to have

	http://mid.gmane.org/1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de

(and the follow-ups) applied. Casting away consts is nearly always
wrong.

Best regards
Uwe

>  drivers/mtd/nand/mxc_nand.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index c58e6a9..74b6e75 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1243,16 +1243,16 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
>  static const struct of_device_id mxcnd_dt_ids[] = {
>  	{
>  		.compatible = "fsl,imx21-nand",
> -		.data = &imx21_nand_devtype_data,
> +		.data = (void *)&imx21_nand_devtype_data,
>  	}, {
>  		.compatible = "fsl,imx27-nand",
> -		.data = &imx27_nand_devtype_data,
> +		.data = (void *)&imx27_nand_devtype_data,
>  	}, {
>  		.compatible = "fsl,imx25-nand",
> -		.data = &imx25_nand_devtype_data,
> +		.data = (void *)&imx25_nand_devtype_data,
>  	}, {
>  		.compatible = "fsl,imx51-nand",
> -		.data = &imx51_nand_devtype_data,
> +		.data = (void *)&imx51_nand_devtype_data,
>  	},
>  	{ /* sentinel */ }
>  };
> -- 
> 1.7.0.4
> 
> 

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
