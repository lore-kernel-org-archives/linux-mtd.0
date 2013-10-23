Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYzCK-0007i1-4J
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 14:14:08 +0000
Date: Wed, 23 Oct 2013 11:13:53 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v10 10/10] mtd: nand: omap: remove selection of BCH
 ecc-scheme via KConfig
Message-ID: <20131023141352.GG2458@localhost>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-11-git-send-email-pekon@ti.com>
 <20131023134450.GE2458@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA2A130@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2A130@DBDE04.ent.ti.com>
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
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
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

Pekon,

On Wed, Oct 23, 2013 at 01:55:58PM +0000, Gupta, Pekon wrote:
> > 
> > I'm wondering how are you testing this in your SOC_AM33XX board (which
> > is not ARCH_OMAP3). You probably have ARCH_OMAP3 always selected?
> > 
> Yes, omap2plus_defconfig is a super set..
> arch/arm/configs/omap2plus_defconfig automatically enables ARCH_OMAP3.
> 

Yes, but I always remove what I won't use to reduce build time.

And  now that you bring this issue. IMHO, the AM33xx family is going
to be more and more widely used, so maybe introducing an am33xx_defconfig
makes sense.

Or is the trend to have the least possible amount of defconfigs?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
