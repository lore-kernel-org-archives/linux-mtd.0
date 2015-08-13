Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPo09-00077G-Ue
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 08:36:42 +0000
Date: Thu, 13 Aug 2015 01:36:16 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/22] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20150813083616.GZ4215@atomide.com>
References: <1438938752-31010-1-git-send-email-rogerq@ti.com>
 <20150811124829.GM4215@atomide.com> <55CC43B1.4020409@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55CC43B1.4020409@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [150813 00:17]:
> On 11/08/15 15:48, Tony Lindgren wrote:
> > 
> > OK. Yeah let's make sure no regressions are caused by this.. We also
> > still have the omap3 legacy booting around, have you checked that it
> > keeps on working?
> 
> I don't have any omap3 board with legacy support with me. I have omap3-beagle
> but looks like legacy boot is dropped for it already.
> 
> I'll try to revert the patch that drops beagle support and test it on that one.

OK yeah that should work just fine.

Tony
