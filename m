Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRIeY-0002vp-1F
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 07:46:42 +0000
Received: by pbbrq13 with SMTP id rq13so6719017pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2012 00:46:40 -0700 (PDT)
Date: Mon, 7 May 2012 15:47:00 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [alsa-devel] [PATCH RESEND 0/9] Enable pinctrl support for
 mach-mxs
Message-ID: <20120507074658.GH19389@S2101-09.ap.freescale.net>
References: <1336353374-28939-1-git-send-email-shawn.guo@linaro.org>
 <20120507071400.GB23607@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120507071400.GB23607@shlinux2.ap.freescale.net>
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-mmc@vger.kernel.org,
 alsa-devel@alsa-project.org, Wolfram Sang <w.sang@pengutronix.de>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Olof Johansson <olof@lixom.net>, Chris Ball <cjb@laptop.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 07, 2012 at 03:14:00PM +0800, Dong Aisheng wrote:
> As IMX, basically i'd prefer to add pinctrl states in dts file at the
> same time within the patch or using a separate patch to add them before
> this series to avoid breaking the exist platforms.
> 
> However i noted that for mxs, most drivers here are still not dt capable,
> so it may be ok to not add their pinctrl state at this time.
> 
There no mxs driver on mainline that has been DT aware of.  What I'm
going to do is to ask Arnd abandon the mxs/dt branch I sent him before
and send him an updated one with the whole mxs DT support based on
mxs common clk and pinctrl series.

> But for the patch "serial: amba-pl011: adopt pinctrl support" since it is
> dt capable, so with this patch applied, the mx28 dt boot will fail.
> Maybe we should at least add pinctrl states for amba-pl011 first.
> 
The updated mxs/dt will have pinctrl defined in dts for each device
that is converted to DT.

> > Shawn Guo (9):
> >   ARM: mxs: enable pinctrl dummy states
> >   serial: amba-pl011: adopt pinctrl support
> BTW, will this one break other platforms using this driver?
> 
If the platforms do not turn on CONFIG_PINCTRL, they are fine.  If they
turn on the support, they should provide pinctrl state either dummy or
real one.

-- 
Regards,
Shawn
