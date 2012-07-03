Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Slx8t-0005qM-71
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 07:03:24 +0000
Date: Tue, 3 Jul 2012 09:03:00 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Select the driver via ARCH_MXC
Message-ID: <20120703070300.GE22016@pengutronix.de>
References: <1341266419-21321-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1341266419-21321-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Fabio,

On Mon, Jul 02, 2012 at 07:00:19PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> With device tree support in place, we should not use IMX_HAVE_PLATFORM_MXC_NAND
> as a dependency for selecting the mxc_nand driver.
> 
> Use ARCH_MXC symbol instead, so that the driver can be even selected when a single device-tree
> machine is selected.
the obvious alternative is to select IMX_HAVE_PLATFORM_MXC_NAND for the
dt-based machines, too.

Or make it:

	depends on IMX_HAVE_PLATFORM_MXC_NAND || DT || COMPILE_COVERAGE

(COMPILE_COVERAGE doesn't exist AFAIK, but IMHO it's sensible to
introduce it.)

Best regards
Uwe


-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
