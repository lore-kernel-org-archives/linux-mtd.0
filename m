Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJex9-00005M-UY
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 13:30:05 +0000
Date: Mon, 5 Nov 2018 14:29:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devel@driverdev.osuosl.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] staging: Remove the mt29f_spinand driver
Message-ID: <20181105132949.GC20797@kroah.com>
References: <20181022201059.8630-1-boris.brezillon@bootlin.com>
 <20181105111227.7bf08cfa@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105111227.7bf08cfa@xps13>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 05, 2018 at 11:12:27AM +0100, Miquel Raynal wrote:
> Hi Greg,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 22 Oct 2018
> 22:10:59 +0200:
> 
> > A new SPI NAND subsystem has been added in drivers/mtd/nand/spi/ and
> > Micron's MT29F devices are now supported in
> > drivers/mtd/nand/spi/micron.c.
> > 
> > Remove the old driver.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> > Hello,
> > 
> > If anything is missing in drivers/mtd/nand/spi/micron.c to properly
> > support the devices supported by the mt29f_spinand driver, please let
> > me know.
> > I might accept to delay removal of this driver if I have some guarantees
> > that existing users will actually switch to the new driver at some
> > point.
> > 
> > Regards,
> > 
> > Boris
> > ---
> 
> I plan to apply this patch but I would like your approval first.
> 
> As a summary, the mt29f_spinand driver is a Micron SPI NAND chip
> driver interfacing with the raw NAND API (which is 'wrong').
> 
> Boris has recently contributed a SPI NAND framework supporting SPI
> NAND chips from several vendors, including Micron, that is supposed to
> take over this driver.
> 
> Do you see anything that should prevent us to remove it now?

Not at all, I was going to add this patch to my tree right now, as I
couldn't do anything until after 4.20-rc1 was out.  Any objection from
me just taking it that way and getting it into 4.20-final?

thanks,

greg k-h
