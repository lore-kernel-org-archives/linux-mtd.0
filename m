Date: Fri, 13 Jun 2014 00:19:46 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 06/36] mtd: nand: omap: Move gpmc_update_nand_reg to nand
 driver
Message-ID: <20140613071945.GJ17845@atomide.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-7-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402477001-31132-7-git-send-email-rogerq@ti.com>
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
> GPMC and NAND drivers share the same register space but never use the
> same registers. As there is no clear address seperation between the
> registers for GPMC and NAND, we can't easily split it up into 2 regions
> i.e. one for GPMC and other for NAND. Instead, we simply remap the entire
> register space in both the drivers. The NAND driver doesn't re-request
> the region as it is already requested by the GPMC driver (parent).

Oh now, let's not do this. It's best to limit GPMC register access
to the GPMC driver. Even if we need to export few NAND specific
functions from the GPMC driver.

Regards,

Tony
