Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qf4wY-0004Pp-BJ
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 06:53:42 +0000
Date: Fri, 8 Jul 2011 08:53:37 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v6 1/4] ARM: mxs: add GPMI-NAND support for imx23/imx28
Message-ID: <20110708065337.GN29624@pengutronix.de>
References: <1310102885-4102-1-git-send-email-b32955@freescale.com>
	<1310102885-4102-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1310102885-4102-2-git-send-email-b32955@freescale.com>
Cc: arnd@arndb.de, s.hauer@pengutronix.de, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang,

On Fri, Jul 08, 2011 at 01:28:02PM +0800, Huang Shijie wrote:
> +/* The size of the resource is fixed. */
> +#define RES_SIZE	6
This name is too generic. Maybe GPMI_NAND_RES_SIZE?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
