Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEyZR-0006VB-3U
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 08:26:47 +0000
Received: by lbbgf7 with SMTP id gf7so3484949lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 01:26:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120921080123.GM2450@S2101-09.ap.freescale.net>
References: <1348123547-31082-1-git-send-email-shawn.guo@linaro.org>
 <201209200739.34899.arnd@arndb.de>
 <20120920145342.GI2450@S2101-09.ap.freescale.net>
 <201209201556.57171.arnd@arndb.de>
 <20120921080123.GM2450@S2101-09.ap.freescale.net>
Date: Fri, 21 Sep 2012 01:26:43 -0700
Message-ID: <CAOesGMi6CbvFikycJVdE8W-DxLD3W7+CyScz+YT103dxR31U9g@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 00/34] i.MX multi-platform support
From: Olof Johansson <olof@lixom.net>
To: Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-fbdev@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 rtc-linux@googlegroups.com,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, Chris Ball <cjb@laptop.org>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>,
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

On Fri, Sep 21, 2012 at 1:01 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
> On Thu, Sep 20, 2012 at 03:56:56PM +0000, Arnd Bergmann wrote:
>> Ok, fair enough. I think we can put it in arm-soc/for-next as a staging
>> branch anyway to give it some exposure to linux-next, and then we can
>> decide whether a rebase is necessary before sending it to Linus.
>>
> I just saw the announcement from Olof - no more major merge for 3.7
> will be accepted from now on.  Can this be an exception or should I
> plan this for 3.8?


I'll take a look at merging it tomorrow after I've dealt with smp_ops;
if it looks reasonably conflict-free I'll pull it in. We need the
sound dependency sorted out (or agreed upon) first though.


-Olof
