Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFM6j-0005PS-Ks
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 09:34:46 +0000
Received: by pbbrq8 with SMTP id rq8so9655066pbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 22 Sep 2012 02:34:39 -0700 (PDT)
Date: Sat, 22 Sep 2012 17:34:32 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH v2 00/34] i.MX multi-platform support
Message-ID: <20120922093430.GC5394@S2101-09.ap.freescale.net>
References: <1348123547-31082-1-git-send-email-shawn.guo@linaro.org>
 <201209200739.34899.arnd@arndb.de>
 <20120920145342.GI2450@S2101-09.ap.freescale.net>
 <201209201556.57171.arnd@arndb.de>
 <20120921080123.GM2450@S2101-09.ap.freescale.net>
 <CAOesGMi6CbvFikycJVdE8W-DxLD3W7+CyScz+YT103dxR31U9g@mail.gmail.com>
 <20120921164622.GA5394@S2101-09.ap.freescale.net>
 <20120921165305.GB5394@S2101-09.ap.freescale.net>
 <CAOesGMiHJnt7zq19ZycxaNUD64QzLYw7o79pP-Y91-zi60ny6g@mail.gmail.com>
 <CAOesGMg+FvoVmiCee5hhe+_ZtBpvsnsi2N3vvLmZz1Tq3pOBWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMg+FvoVmiCee5hhe+_ZtBpvsnsi2N3vvLmZz1Tq3pOBWw@mail.gmail.com>
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

On Sat, Sep 22, 2012 at 01:09:27AM -0700, Olof Johansson wrote:
> > I've pulled this in now as staging/imx-multiplatform.
> >
> > As you mention, it might or might not make sense to send this up. It
> > also accrued a few more merge conflicts with other branches in
> > arm-soc, so we'll see how things play out.
> >
> > Either way, we'll for sure queue it for 3.8.
> 
> Hmm. Pulling it in gives me a few new build errors, in particular on
> the configs that Russell use to build test omap3, as well as one of
> his vexpress configs. So I dropped it again for now.
> 
> Let's have the current contents sit in linux-next for at least one
> release before we bring in anything more, especially since it brings
> in dependencies on external trees, and it also has a handful of new
> merge conflicts. We're already exposing Stephen Rothwell to more merge
> conflicts than I'm entirely comfortable with.
> 
Ok.  I will rebase the series against 3.7-rc1 and then send you then.

Shawn
