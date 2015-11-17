Date: Tue, 17 Nov 2015 10:05:03 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
cc: Brian Norris <computersforpeace@gmail.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com,
 Josh Wu <josh.wu@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org
Subject: Re: [PATCH 14/27] mtd: nand: use the mtd instance embedded in struct
 nand_chip
In-Reply-To: <20151117093836.052c86b5@bbrezillon>
Message-ID: <alpine.DEB.2.10.1511170957100.2455@hadrien>
References: <1447681080-31232-1-git-send-email-boris.brezillon@free-electrons.com>
 <1447681080-31232-15-git-send-email-boris.brezillon@free-electrons.com>
 <20151117030019.GY8456@google.com> <20151117093836.052c86b5@bbrezillon>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > (This isn't the worst one, but it just happens to be one of the first.)
> > There are many cases where the typical style would be to declare a new
> > variable at the top of the function, where you perform the
> > macro/function-call to convert from one abstraction to another. Like
> >
> > static int nfc_set_sram_bank(struct atmel_nand_host *host, unsigned int bank)
> > {
> > 	struct mtd_info *mtd = nand_to_mtd(&hot->nand_chip);
> > 	...
> >
> > and then use it later. Can that be done very easily?
> >
> > >  			return -EINVAL;
> > >  		nfc_writel(host->nfc->hsmc_regs, BANK, ATMEL_HSMC_NFC_BANK1);
> > >  	} else {
> >
> > ...
>
> Honestly, I don't know how to do that with a coccinelle script, and it
> will probably take me more time to find how to do it than addressing
> those problems manually.
>
> Julia, could you give us some hint?

Probably something like the following would be easiest.  You can just run
it after your other transformations:

@r exists@
identifier f;
expression e;
@@

f(...) { <+...  nand_to_mtd(e) ...+> }

@@
identifier r.f;
expression r.e;
@@

f(...) {
+ struct mtd_info *mtd = nand_to_mtd(e);
...
}

This won't work if there is more than one possible value of e.  If that is
likely, then I could come up with something more complex.  It also assumes
that you want to convert all such calls.  If you only want to convert calls
that occur in a particular context, eg a field reference, then you could
enhance the pattern inside the <+... ...+> in the first rule.

julia
