Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emdlV-0003aL-MO
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 11:01:23 +0000
Date: Fri, 16 Feb 2018 12:01:05 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v7 0/7] mtd: nand: Prepare things for SPI NAND support
Message-ID: <20180216120105.295e5f59@bbrezillon>
In-Reply-To: <20180205220205.3528-1-boris.brezillon@bootlin.com>
References: <20180205220205.3528-1-boris.brezillon@bootlin.com>
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

On Mon,  5 Feb 2018 23:01:58 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hello all,
> 
> I'm finally posting a v7 of the SPI NAND preparation patches. That's on
> my TODO list for quite some time, and I finally take the time to submit
> things that are pending in my development branch and are ready for
> submission (at least, that's my opinion :)).
> 
> Patches adding SPI NAND support have been ommited because I'm still not
> entirely happy with the SPI memories (NOR/NAND/SRAM) / QSPI controllers
> situation, and, despite what I said earlier, I think it's worth
> addressing the problem now.
> 
> What made me change my mind is the rework of the FSL QSPI driver
> initiated by Frieder to support NANDs. Looks like all other QSPI
> drivers will have to implement the same kind of hack to support both
> SPI NORs and SPI NANDs with a single driver, which implies a lot of
> duplicated code.
> 
> So, instead of making the situation worse by adding yet another level
> of complexity, I'd like to see if we can expose all QSPI NOR
> controllers as regular SPI controllers. Well, not exactly regular SPI
> controllers, in that they would not be able to do random SPI transfers,
> but instead high-level operations (an operation being a
> CMD[+ADDRS][+DUMMY][+DATA] sequence).
> 
> The idea is to extend the SPI framework to provide high-level APIs to
> execute such SPI operations. Then, each SPI controller would be able
> to implement the high-level interface directly (likely the chosen
> approach for advanced SPI controllers) or rely on the default
> implementation which creates regular SPI messages to do the operation.
> 
> Note that this high-level spi-mem interface would replace the
> spi_flash_read() APIs and handle optimizations of both read/write
> paths.
> 
> I'm currently working on a PoC to validate the feasability of this
> approach (I pushed my work here [1], but it's not yet in a clean
> state), but this will be part of a separate RFC.
> 
> Back to the initial topic. The patch series contains
> mechanical/straightforward changes to move existing NAND code to
> the raw subdir (patches 1 to 6) and a patch adding the generic NAND
> layer that is meant to be used by the SPI NAND framework, and at
> some point, by the raw NAND and OneNAND framework.

Applied the whole series.


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
