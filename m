Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvMTX-00056y-Fe
 for linux-mtd@lists.infradead.org; Fri, 13 Jun 2014 08:04:39 +0000
Date: Fri, 13 Jun 2014 01:04:09 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 14/36] ARM: OMAP2+: gpmc: Allow drivers to reconfigure
 GPMC settings & timings
Message-ID: <20140613080408.GR17845@atomide.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-15-git-send-email-rogerq@ti.com>
 <20140613072550.GM17845@atomide.com> <539AABE5.10907@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <539AABE5.10907@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [140613 00:46]:
> On 06/13/2014 10:25 AM, Tony Lindgren wrote:
> > * Roger Quadros <rogerq@ti.com> [140611 01:58]:
> >> Some devices (e.g. TUSB6010, omap-onenand) need to reconfigure the GPMC
> >> timings in order to operate with different peripheral clock frequencies.
> >> Introduce omap_gpmc_retime() to allow them to do that. The driver
> >> needs to pass the chips select number, GPMC settings and Device timings to
> >> omap_gpmc_retime().
> >>
> >> NOTE: Device tree and board code must still pass the most conservative
> >> timings to GPMC so that the device can be probed by the respective driver.
> >> e.g. Onenand must operate in asynchronous mode at bootup. The device driver
> >> can then request for more optimal timings via omap_gpmc_retime().
> > 
> > Hmm but many of the devices are Linux generic like sms91x and 8250 so it's
> > not nice to start stuffing omap bus specific data there.
> 
> Those drivers should never need to use this function. Hopefully they will work with a one time setup where we specify the timings in the DT. This function is primarily for use by omap-onenand and tusb6010, which are both OMAP specific.

Well those were the only ones so far that had to tolerate with L3
speed changes at some point, so others may need it potentially too.
And we could get rid of the omap specific onenand driver at some
point..

But yeah, I'm fine keeping those recalc functions in the device
drivers if it makes things simpler. Just something to consider in
any case.

Regards,

Tony
