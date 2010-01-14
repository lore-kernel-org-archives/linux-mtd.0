Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NVMt1-0001kn-Gt
	for linux-mtd@lists.infradead.org; Thu, 14 Jan 2010 10:25:07 +0000
Date: Thu, 14 Jan 2010 11:24:40 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 0/3] mx25: NAND support
Message-ID: <20100114102440.GE23110@pengutronix.de>
References: <cover.1263460321.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1263460321.git.baruch@tkos.co.il>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 14, 2010 at 11:24:12AM +0200, Baruch Siach wrote:
> This patch series add support for NAND chips on the i.MX25 platform, using the 
> recently merged support for this platform in the mxc_nand driver.
> 
> I tested this code on the i.MX25 PDK platform.
> 
> Baruch Siach (3):
>   mtd: mxc_nand: add MX25 to Kconfig
>   mx25: add NAND support
>   mx25pdk: add NAND device support

Ok, added to mxc-master.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
