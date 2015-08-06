Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNIMC-0007S7-ST
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 10:25:06 +0000
Date: Thu, 6 Aug 2015 11:22:25 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, "R, Vignesh" <vigneshr@ti.com>,
 devicetree <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 1/5] spi: introduce flag for memory mapped read
Message-ID: <20150806102225.GI7576@n2100.arm.linux.org.uk>
References: <20150731181745.GM20873@sirena.org.uk> <55BEF4AF.5090704@ti.com>
 <20150804155148.GR20873@sirena.org.uk> <55C0FD98.1090107@ti.com>
 <20150805115013.GJ20873@sirena.org.uk>
 <CAOMqctQXwcHyiWBwtugSDSE_k65qrNfrwnhjQMDJkLoJMmGzUw@mail.gmail.com>
 <20150805124412.GN20873@sirena.org.uk>
 <CAOMqctS9Y5FxpUCCJew6+cnjH5iTvbzkH3g-8yrXs4OuS2pSGA@mail.gmail.com>
 <20150806090202.GO20873@sirena.org.uk>
 <CAOMqctQZRZ4zG_yYy=CeX3DX4NVNWN1COP4Q-2YvMun9xYOA7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMqctQZRZ4zG_yYy=CeX3DX4NVNWN1COP4Q-2YvMun9xYOA7g@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 06, 2015 at 12:01:37PM +0200, Michal Suchanek wrote:
> Disclaimer: I am not familiar with the hardware for which this patch
> adds support.
> 
> However, I am familiar m25p80.c and as I understand it the controller
> is basically supposed to implement m25p80.c in hardware when this flag
> is set.

That, to me, sounds like what you have is:

---m25p80 specific interface--->SPI bus--->m25p80 device

Where the m25p80 specific interface does not expose direct access to the
SPI bus?

If that's the case, then maybe you should consider whether using the SPI
bus infrastructure is really the best way forward.  Would it make more
sense instead to adopt a different software structure, something more
high-level like:

     +-------------------------------------------+
     |          m25p80 high-level driver         |
     +----------------------+--------------------+
     |   SPI m25p80 driver  |                    |
     +----------------------+                    |
     |      SPI layer       |  Special driver    |
     +----------------------+                    |
     |    SPI bus driver    |                    |
     +----------------------+--------------------+
     |     SPI hardware     |  Special hardware  |
     +----------------------+--------------------+

Rather than what you seem to be trying to do, which seems to be:

     +----------------------+
     |   SPI m25p80 driver  |
     +----------------------+
     |      SPI layer       |
     +----------------------+
     |  Translation driver  |
     +----------------------+
     |   Special hardware   |
     +----------------------+

where this requires M25P80 specific hacks to be introduced into the SPI
layer so that you can communicate additional information between the SPI
M25P80 driver and the translation driver.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
