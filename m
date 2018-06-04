Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPxYE-0000m9-8b
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2018 22:02:08 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: DENALI: can't detect NAND chip
Date: Tue, 05 Jun 2018 00:01:51 +0200
Message-ID: <1864836.G720OGCVI0@blindfold>
In-Reply-To: <38227338.JIUUFn9IOS@blindfold>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <20180604225117.61d2c269@bbrezillon> <38227338.JIUUFn9IOS@blindfold>
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

Am Montag, 4. Juni 2018, 22:57:32 CEST schrieb Richard Weinberger:
> Am Montag, 4. Juni 2018, 22:51:17 CEST schrieb Boris Brezillon:
> > > According to the datasheet, the NAND clock rate should be 50Mhz, which is what
> > > is returned in both cases.
> > > So this does not really look invalid to me. :)
> > 
> > Did you try to put a scope on the RE or WE pin? The x2 factor looks too
> > perfect to be just a coincidence.
> 
> Not yet, but you are right the x2 factor is really interesting.

The NFC uses two clocks, nand_x_clk and nand_clk.
nand_clk is nand_x_clk / 4.
In the device tree nand_clk is referenced, and therefore used to calculate
the timings. So we might need to use the 200Mhz clock instead of the 50Mhz
for the calculation.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
