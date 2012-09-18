Received: from metis.ext.pengutronix.de ([92.198.50.35])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDscc-0007aD-AM
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2012 07:53:30 +0000
Date: Tue, 18 Sep 2012 09:52:13 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 00/34] i.MX multi-platform support
Message-ID: <20120918075213.GD24458@pengutronix.de>
References: <1347860103-4141-1-git-send-email-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1347860103-4141-1-git-send-email-shawn.guo@linaro.org>
Cc: alsa-devel@alsa-project.org,
 Mark Brown <broonie@opensource.wolfsonmicro.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-fbdev@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, Chris Ball <cjb@laptop.org>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 rtc-linux@googlegroups.com, Rob Herring <rob.herring@calxeda.com>,
 linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Vinod Koul <vinod.koul@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>,
 Javier Martin <javier.martin@vista-silicon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shawn,

On Mon, Sep 17, 2012 at 01:34:29PM +0800, Shawn Guo wrote:
> The series enables multi-platform support for imx.  Since the required
> frameworks (clk, pwm) and spare_irq have already been adopted on imx,
> the series is all about cleaning up mach/* headers.  Along with the
> changes, arch/arm/plat-mxc gets merged into arch/arm/mach-imx.
> 
> It's based on a bunch of branches (works from others), Rob's initial
> multi-platform series, Arnd's platform-data and smp_ops (Marc's) and
> imx 3.7 material (Sascha and myself).
> 
> It's available on branch below.
> 
>   git://git.linaro.org/people/shawnguo/linux-2.6.git imx/multi-platform
> 
> It's been tested on imx5 and imx6, and only compile-tested on imx2 and
> imx3, so testing on imx2/3 are appreciated.
> 
> Subsystem maintainers,
> 
> I plan to send the whole series via arm-soc tree at the end of 3.7
> merge window when all dependant bits hit mainline.  Please have a
> look at the patches you get copied and provide ACKs if the changes
> are good.  Thanks.

I just had a look at the remaining initcalls in arch-imx. Most of them
are protected with a cpu_is_*, but this one should be fixed before i.MX
is enabled for multi platform:

arch/arm/mach-imx/devices/devices.c:48:core_initcall(mxc_device_init);

I think this won't harm others directly, but it will register i.MX
related devices on foreign platforms.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
