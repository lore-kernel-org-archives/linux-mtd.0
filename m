Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZRAv-0003uR-FU
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 20:06:34 +0000
Date: Thu, 24 Oct 2013 17:05:57 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: [PATCH v10 10/10] mtd: nand: omap: remove selection of BCH
 ecc-scheme via KConfig
Message-ID: <20131024200556.GA2520@localhost>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-11-git-send-email-pekon@ti.com>
 <20131023134450.GE2458@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA2A130@DBDE04.ent.ti.com>
 <20131023141352.GG2458@localhost>
 <CAAwP0s0M=KruCVUana+5Nfm-0nkMGTg1OAatKzCrDeHOXuqd6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAwP0s0M=KruCVUana+5Nfm-0nkMGTg1OAatKzCrDeHOXuqd6A@mail.gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "Gupta, Pekon" <pekon@ti.com>, "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Javier,

On Thu, Oct 24, 2013 at 09:49:09PM +0200, Javier Martinez Canillas wrote:
> Hi Ezequiel
> 
> On Wed, Oct 23, 2013 at 4:13 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
> > Pekon,
> >
> > On Wed, Oct 23, 2013 at 01:55:58PM +0000, Gupta, Pekon wrote:
> >> >
> >> > I'm wondering how are you testing this in your SOC_AM33XX board (which
> >> > is not ARCH_OMAP3). You probably have ARCH_OMAP3 always selected?
> >> >
> >> Yes, omap2plus_defconfig is a super set..
> >> arch/arm/configs/omap2plus_defconfig automatically enables ARCH_OMAP3.
> >>
> >
> > Yes, but I always remove what I won't use to reduce build time.
> >
> > And  now that you bring this issue. IMHO, the AM33xx family is going
> > to be more and more widely used, so maybe introducing an am33xx_defconfig
> > makes sense.
> >
> > Or is the trend to have the least possible amount of defconfigs?
> 
> I'm not familiar with AM33xx so I don't know how similar is to OMAP3
> but we used to have different defconfigs for each OMAP board before
> and consolidated everything in only two defconfigs: omap1_defconfig to
> be used for all OMAP1 devices and omap2plus_defconfig to be used for
> all OMAP2+ (i.e: OMAP{2,3,4,5}) devices.
> 
> Those have all the common kconfig options and board vendors can
> customize to fit their needs and have a delta with something like:
> 
> $ ./scripts/kconfig/merge_config.sh
> arch/arm/configs/omap2plus_defconfig /foo/bar/igep_defconfig
> 
> Again I'm not familiar with AM33xx but what I do know is that we
> should keep defconfigs to a minimum.
> 

Fair enough.

It's just a bit annoying to have a bigger-than-minimal kernel,
and I get tired of stripping the options.

But I can't ask the kernel to hold my favorite picks either:
we have enough churn already ;-)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
