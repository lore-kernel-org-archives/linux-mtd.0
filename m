Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDt2y-0004Br-EA
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2012 08:20:45 +0000
Received: by pbbrq8 with SMTP id rq8so11512750pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2012 01:20:42 -0700 (PDT)
Date: Tue, 18 Sep 2012 16:20:58 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 00/34] i.MX multi-platform support
Message-ID: <20120918082055.GD6377@S2101-09.ap.freescale.net>
References: <1347860103-4141-1-git-send-email-shawn.guo@linaro.org>
 <20120917075138.GN6180@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120917075138.GN6180@pengutronix.de>
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

On Mon, Sep 17, 2012 at 09:51:38AM +0200, Sascha Hauer wrote:
> I gave it a test on i.MX1, i.MX27, i.MX31 and i.MX35. All run fine, but
> the last patch breaks the imx_v4_v5_defconfig: Somehow it now defaults
> to ARMv7 based machines. I haven't looked into it, just reenabled
> ARMv4/ARMv5 and the boards again -> works. The config should be updated
> with the last patch.
> 
Yes, I will rework the patch with all these and Arnd's comment on the
last patch taken into account.

> I'm fine with the changes to mx2-camera, but Javier should give his ok
> to it, he has worked on it quite a lot recently.
> 
> One other issue related to imx-dma, see comment to that patch.
> 
> Otherwise:
> 
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
Thanks a lot.

Shawn
