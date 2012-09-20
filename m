Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEi8Y-0004VC-31
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 14:53:55 +0000
Received: by pbbrq8 with SMTP id rq8so5480067pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 07:53:52 -0700 (PDT)
Date: Thu, 20 Sep 2012 22:53:44 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/34] i.MX multi-platform support
Message-ID: <20120920145342.GI2450@S2101-09.ap.freescale.net>
References: <1348123547-31082-1-git-send-email-shawn.guo@linaro.org>
 <201209200739.34899.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201209200739.34899.arnd@arndb.de>
Cc: alsa-devel@alsa-project.org,
 Mark Brown <broonie@opensource.wolfsonmicro.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-fbdev@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, Chris Ball <cjb@laptop.org>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 rtc-linux@googlegroups.com, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org,
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

On Thu, Sep 20, 2012 at 07:39:34AM +0000, Arnd Bergmann wrote:
> The first five branches are scheduled to go through the arm-soc tree, so
> I'm fine with that. For the sound/for-3.7 branch, I'd like to know when
> to expect that hitting mainline. If it always gets in very early during the
> merge window, it's probably ok to put the imx/multi-platform patches into
> the same branch as the other ones in arm-soc and wait for the sound stuff
> to hit mainline first, otherwise I'd suggest we start a second
> next/multiplatform-2 branch for imx and send the first part early on
> but then wait with the second batch before sound gets in.
> 
It seems that we will have to go with next/multiplatform-2.  I just
tried to merge the series with linux-next together, and got some
non-trivial conflicts with media and mtd tree.  I might have to rebase
my series on top of these trees to sort out those conflicts.  That said,
I will have several dependencies outside arm-soc tree, and have to pend
my series until all those trees get merged into mainline.

Shawn
