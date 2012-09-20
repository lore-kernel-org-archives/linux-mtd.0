Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEgvr-0007v1-G5
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 13:36:44 +0000
Received: by pbbrq8 with SMTP id rq8so5318395pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 06:36:40 -0700 (PDT)
Date: Thu, 20 Sep 2012 21:36:32 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 00/34] i.MX multi-platform support
Message-ID: <20120920133630.GG2450@S2101-09.ap.freescale.net>
References: <1348123547-31082-1-git-send-email-shawn.guo@linaro.org>
 <201209200739.34899.arnd@arndb.de>
 <20120920114148.GH17666@opensource.wolfsonmicro.com>
 <20120920115213.GF2450@S2101-09.ap.freescale.net>
 <20120920124709.GN17666@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120920124709.GN17666@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-fbdev@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
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

On Thu, Sep 20, 2012 at 08:47:10AM -0400, Mark Brown wrote:
> On Thu, Sep 20, 2012 at 07:52:15PM +0800, Shawn Guo wrote:
> > On Thu, Sep 20, 2012 at 07:41:50AM -0400, Mark Brown wrote:
> 
> > > It's usually pretty early but Takashi will be on holiday this time so
> > > I'm not sure if things might be different (he was going to send the pull
> > > request from holiday).  I also didn't guarantee that it'll be stable
> > > yet, can someone please tell me what the depenency is here?
> 
> > We need the patch to have all imx drivers mach/* inclusion free,
> > so that we can enable multi-platform support for imx, which is the
> > whole point of the series.
> 
> That doesn't answer the question.  What is the dependency - what is it
> about this patch that something else depends on?  Your cover letters
> just say you'd like to do this but don't mention dependencies at all and
> when I asked the question last night you said the same thing.  I've not
> seen the rest of the series...
> 
Ah, right.  You did get copied on the whole series.  So the whole point
of patch "ASoC: mx27vis: retrieve gpio numbers from platform_data" is
to get rid of inclusion mach/iomux-mx27.h.  This has to be done before
we enable multi-platform support for imx, since mach/* has to be removed
completely for multi-platform build.

> > If your for-3.7 is not stable anyway, I guess the easiest the way
> 
> It probably *is* stable but I'm not enthused about people pulling
> unsigned tags.  I might rebase, though - I'm going to finalise the tree
> in the next few days.
> 
> > to do it might be you drop the patch "ASoC: mx27vis: retrieve gpio
> > numbers from platform_data" from your tree and I have it be part of
> > the series to go via arm-soc tree as a whole.  (This is the original
> > plan that I mentioned in v1 cover letter)
> 
> You just mentioned it as a preference (you said it's something you'd
> like to do), please if you're doing this sort of cross tree thing be
> explicit about what the inter-tree relationships are.  If things need to
> go in via the same tree say so explicitly (and ideally say way this is).
> 
Ok, my bad.

> The main reason I applied it straight away was that Javier mentioned
> that it was a bug fix and it's near the merge window and these random
> ARM cleanup serieses never seem to go in quickly.

The series is planned for 3.7 merge window.  Is it still possible for
you to drop the patch from your tree to ease the process?  Or I will
hold my pull-request to arm-soc until you tell me you have your tree
finalized.

Shawn
