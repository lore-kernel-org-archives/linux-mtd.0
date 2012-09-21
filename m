Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEyAz-00015Z-D6
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 08:01:30 +0000
Received: by pbbrq8 with SMTP id rq8so7295724pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 01:01:27 -0700 (PDT)
Date: Fri, 21 Sep 2012 16:01:26 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH v2 00/34] i.MX multi-platform support
Message-ID: <20120921080123.GM2450@S2101-09.ap.freescale.net>
References: <1348123547-31082-1-git-send-email-shawn.guo@linaro.org>
 <201209200739.34899.arnd@arndb.de>
 <20120920145342.GI2450@S2101-09.ap.freescale.net>
 <201209201556.57171.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201209201556.57171.arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-fbdev@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, Chris Ball <cjb@laptop.org>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 rtc-linux@googlegroups.com, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vinod.koul@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-mmc@vger.kernel.org,
 Wolfram Sang <w.sang@pengutronix.de>,
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

On Thu, Sep 20, 2012 at 03:56:56PM +0000, Arnd Bergmann wrote:
> Ok, fair enough. I think we can put it in arm-soc/for-next as a staging
> branch anyway to give it some exposure to linux-next, and then we can
> decide whether a rebase is necessary before sending it to Linus.
> 
I just saw the announcement from Olof - no more major merge for 3.7
will be accepted from now on.  Can this be an exception or should I
plan this for 3.8?

Shawn
