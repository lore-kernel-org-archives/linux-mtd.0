Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Yqadr-0000k6-SE
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 05:16:08 +0000
Date: Fri, 8 May 2015 07:15:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2 0/4] mtd: mxc_nand: fix 8 bit ECC and large oob
Message-ID: <20150508051538.GW6325@pengutronix.de>
References: <cover.1430636819.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1430636819.git.baruch@tkos.co.il>
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 03, 2015 at 10:18:50AM +0300, Baruch Siach wrote:
> This patch series fixes mxc_nand bugs that I encountered while trying to use 8
> bit ECC mode on i.MX25 with the Micron MT29F8G08ABABA flash chip.
> 
> Many thanks to Uwe Kleine-König for guiding me through the process of
> debugging and fixing, and for contributing a clean-up patch to this series.
> 
> This series applies and tested on v4.1-rc1.
> 
> This is version 2 of the patch series, addressing the comments and suggestion
> of Uwe Kleine-König on the first series
> (http://thread.gmane.org/gmane.linux.ports.arm.kernel/408635). See each patch
> for detailed per-patch changelog.
> 
> Baruch Siach (3):
>   mtd: mxc_nand: limit the size of used oob
>   mtd: mxc_nand: fix truncate of unaligned oob copying
>   mtd: mxc_nand: generate nand_ecclayout for 8 bit ECC
> 
> Uwe Kleine-König (1):
>   mtd: nand: mxc_nand: cleanup copy_spare function

I looked at this version and have only found some minor coding style
violations (spaces missing on both sides of operators).

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
