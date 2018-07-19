Date: Thu, 19 Jul 2018 08:47:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin
 Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>
Subject: Re: [RFC PATCH 8/8] mtd: rawnand: ams-delta: Use GPIO callbacks for
 data I/O
Message-ID: <20180719084749.25ca96a6@bbrezillon>
In-Reply-To: <20180718235710.18242-9-jmkrzyszt@gmail.com>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180718235710.18242-9-jmkrzyszt@gmail.com>
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

On Thu, 19 Jul 2018 01:57:10 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Don't readw()/writew() data directly from/to GPIO port which is under
> control of gpio-omap driver, use GPIO chip callbacks instead.
> 
> Thanks to utilization of get/set_multiple() callbacks, performance
> degrade is minor for typical data transfers.

Same comment here, don't use the gpio_chip hooks directly, use the
consumer API instead.

> 
> The driver should now work with any 8+-bit bidirectional GPIO port,
> not only OMAP.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> 
> # Conflicts:
> #	drivers/mtd/nand/raw/ams-delta.c

Oh, some leftovers from a conflict resolution :).
