Date: Fri, 13 Jun 2014 00:25:50 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 14/36] ARM: OMAP2+: gpmc: Allow drivers to reconfigure
 GPMC settings & timings
Message-ID: <20140613072550.GM17845@atomide.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-15-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402477001-31132-15-git-send-email-rogerq@ti.com>
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

* Roger Quadros <rogerq@ti.com> [140611 01:58]:
> Some devices (e.g. TUSB6010, omap-onenand) need to reconfigure the GPMC
> timings in order to operate with different peripheral clock frequencies.
> Introduce omap_gpmc_retime() to allow them to do that. The driver
> needs to pass the chips select number, GPMC settings and Device timings to
> omap_gpmc_retime().
> 
> NOTE: Device tree and board code must still pass the most conservative
> timings to GPMC so that the device can be probed by the respective driver.
> e.g. Onenand must operate in asynchronous mode at bootup. The device driver
> can then request for more optimal timings via omap_gpmc_retime().

Hmm but many of the devices are Linux generic like sms91x and 8250 so it's
not nice to start stuffing omap bus specific data there.

I wonder if we should just keep device specific gpmc-smc91x.c etc
in drivers/memory?

Regards,

Tony
