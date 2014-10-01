From: Arnd Bergmann <arnd@arndb.de>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] nand: omap2: fix building with CONFIG_MTD_NAND_OMAP_BCH=m
Date: Wed, 01 Oct 2014 12:46:39 +0200
Message-ID: <2061777.ebdfGlRHlL@wuerfel>
In-Reply-To: <20141001102419.GA2085@arch.hh.imgtec.org>
References: <1811108.CcWEs0vKNL@wuerfel> <1943672.dOtqDNIvT0@wuerfel>
 <20141001102419.GA2085@arch.hh.imgtec.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: pekon <pekon@pek-sem.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 01 October 2014 07:24:19 Ezequiel Garcia wrote:
> > 
> > config MTD_NAND_OMAP_BCH_BUILD
> >       def_tristate MTD_NAND_OMAP2 && MTD_NAND_OMAP_BCH
> > 
> > which makes it 'm' if MTD_NAND_OMAP_BCH is set to m.
> > 
> 
> Just to clarify, you are talking about this one being the correct one,
> right?
> 
> http://article.gmane.org/gmane.linux.ports.arm.omap/118488
> "[PATCH 3/3] mtd: nand: Force omap_elm to be built as a module if omap2_nand is a module"
> 
> 

Yes. The four lines you have in there

+config MTD_NAND_OMAP_BCH_BUILD
+	tristate
+	depends on MTD_NAND_OMAP2
+	default m if MTD_NAND_OMAP2=m && MTD_NAND_OMAP_BCH
+	default y if MTD_NAND_OMAP2=y && MTD_NAND_OMAP_BCH

should be entirely equivalent to the two lines I wrote above, so my version
is just a readability change, functionally they both are correct as far as
I can tell.

	Arnd
