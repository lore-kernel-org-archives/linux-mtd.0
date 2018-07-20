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
Subject: Re: [RFC PATCH 3/8] mtd: rawnand: ams-delta: Set port direction once
 per transfer
Date: Fri, 20 Jul 2018 20:12:05 +0200
Message-ID: <90128326.sKM4evrj8F@z50>
In-Reply-To: <20180719082318.290abee1@bbrezillon>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180718235710.18242-4-jmkrzyszt@gmail.com>
 <20180719082318.290abee1@bbrezillon>
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

On Thursday, July 19, 2018 8:23:18 AM CEST Boris Brezillon wrote:
> On Thu, 19 Jul 2018 01:57:05 +0200
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> 
> > In its current shape, the driver sets data port direction before each
> > byte read/write operation, even during multi-byte transfers.  Optimize
> > that by setting the port direction only on first byte of each transfer.
> 
> Sounds like premature optimization for something you'll rework when
> fully switching to the GPIO consumer API to control the DATA bus.

Indeed, this optimization was crucial for getting acceptable performance of 
data transfers over GPIO.  I'm only not sure if there is any action in 
response to your comment expected on my side, e.g., did you want to say I 
should modify the patch description, or change the order of patches?

Thanks,
Janusz
