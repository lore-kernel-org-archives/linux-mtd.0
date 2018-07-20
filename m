From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: [RFC PATCH 8/8] mtd: rawnand: ams-delta: Use GPIO callbacks for
 data I/O
Date: Fri, 20 Jul 2018 20:38:15 +0200
Message-ID: <2165137.iTHcPHRtIn@z50>
In-Reply-To: <20180719084749.25ca96a6@bbrezillon>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180718235710.18242-9-jmkrzyszt@gmail.com>
 <20180719084749.25ca96a6@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, July 19, 2018 8:47:49 AM CEST Boris Brezillon wrote:
> On Thu, 19 Jul 2018 01:57:10 +0200
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> 
> > Don't readw()/writew() data directly from/to GPIO port which is under
> > control of gpio-omap driver, use GPIO chip callbacks instead.
> > 
> > Thanks to utilization of get/set_multiple() callbacks, performance
> > degrade is minor for typical data transfers.
> 
> Same comment here, don't use the gpio_chip hooks directly, use the
> consumer API instead.

I tired but performance was not acceptable.

I see your point but please understand, what I'm trying to do here is not to 
develop a shiny general purpose fully GPIO based NAND driver, I'm trying to 
resolve issues with NAND driver for Amstrad Delta I like to play with, without 
loosing much performance.

I'm going to reconsider all possible options, not only doing data I/O over 
GPIO inside the driver, to have the task completed.  Once done,  I can get 
back to the GPIO based code I developed so far and create a new generic driver 
as my free time permits, or anyone can do that if needed, the code is open 
source after all. 

Thanks,
Janusz
