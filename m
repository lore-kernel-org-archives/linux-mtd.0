Date: Mon, 2 Apr 2018 09:01:00 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sekhar Nori <nsekhar@ti.com>
Cc: David Lechner <david@lechnology.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Linux ARM Mailing List
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: davinci: don't acquire and enable clock
Message-ID: <20180402090100.28961677@bbrezillon>
In-Reply-To: <20180330143051.26423-1-nsekhar@ti.com>
References: <20180330143051.26423-1-nsekhar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 Mar 2018 20:00:51 +0530
Sekhar Nori <nsekhar@ti.com> wrote:

> NAND itself is an asynchronous interface, it does not have any
> clock input. DaVinci NAND driver acquires clock for AEMIF
> (asynchronous external memory interface) which is an on-chip
> IP to which NAND is connected.
> 
> The same clock is also enabled in AEMIF driver (either present
> drivers/memory or from machine code for some older platforms).
> AEMIF timing must be initialized before NAND can be accessed.
> This ensures that AEMIF clock is enabled too.
> 
> Remove the superfluous clock acquisition and enable in DaVinci
> NAND driver.
> 
> Tested on K2L, K2HK, K2E, DA850 EVM, DA850 LCDK in device-tree
> boot and DM644x EVM in legacy boot.
> 
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
> Hi Boris,
> 
> If/when this patch gets accepted,

I'll probably queue it just after v4.17-rc1 is out if nobody complains
about the change.

> it will nice to put this on
> an immutable branch others can merge. There is potential cleanup
> in drivers/clock and in DaVinci machine code that will depend
> on this.

Sure, I can do that. 

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
