Date: Fri, 20 Jul 2018 21:25:21 +0200
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
Subject: Re: [RFC PATCH 0/8] mtd: rawnand: ams-delta: Use gpio-omap
 accessors for data I/O
Message-ID: <20180720212521.483d27a5@bbrezillon>
In-Reply-To: <6335220.Jscgez8sxx@z50>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180719081508.5dafebde@bbrezillon> <6335220.Jscgez8sxx@z50>
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

On Fri, 20 Jul 2018 19:55:42 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Hi Boris,
> 
> On Thursday, July 19, 2018 8:15:08 AM CEST Boris Brezillon wrote:
> > Hi Janusz,
> > 
> > On Thu, 19 Jul 2018 01:57:02 +0200
> > Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> >   
> > > Implement the idea suggested by Artem Bityutskiy and Tony Lindgren
> > > described in commit b027274d2e3a ("mtd: ams-delta: fix
> > > request_mem_region() failure").  
> > 
> > Thanks for doing that. I'll review the patches, but I already have a
> > extra request: can you convert this driver to ->exec_op()? It does not
> > necessarily have to be done in this patchset, but, that'd be great to
> > have one more driver converted to the new interface.  
> 
> OK, I'll have a look as my free time permits.
> 
> > BTW, there seems to be a nand_gpio driver, maybe we should merge
> > ams-delta code into nand_gpio after it's been patched to use the GPIO
> > consumer API.  
> 
> nand_gpio uses a form of read()/write() on a single bidirectional register for 
> data transfer, not GPIO, and it does not make use of NRE / NWE signals.  Maybe 
> the two drivers could be merged to some extent but not entirely, I think.

Well, yes, right now the nand-gpio driver is assuming the data bus
is not bit-banged, but that's something we can easily add. Anyway, my
remark was more a "nice to have" not a hard requirement. 
