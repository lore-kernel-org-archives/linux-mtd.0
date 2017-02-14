Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdZtv-0000To-Tc
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 10:00:01 +0000
Date: Tue, 14 Feb 2017 11:57:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Nicholas Mc Guire <der.herr@hofr.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] mtd: spi-nor: intel: use true/false for boolean
Message-ID: <20170214095725.GD15721@lahna.fi.intel.com>
References: <1486973636-1117-1-git-send-email-der.herr@hofr.at>
 <e6f01423-4ec7-33b3-b7a4-6af275525d2c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6f01423-4ec7-33b3-b7a4-6af275525d2c@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 14, 2017 at 05:52:48AM +0100, Marek Vasut wrote:
> On 02/13/2017 09:13 AM, Nicholas Mc Guire wrote:
> > writeable in struct intel_spi is a boolean and assignment should be to
> > true/false not 1/0 as recommended by boolinit.cocci.
> > 
> > Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
> > ---
> > 
> > make coccicheck complained with:
> >  ./drivers/mtd/spi-nor/intel-spi.c:707:3-18: WARNING: Assignment of bool to 0/1
> > 
> > Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)
> > 
> > Patch is against 4.10-rc7 (localversion-next is next-20170213)
> > 
> >  drivers/mtd/spi-nor/intel-spi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> > index 4630716..2956f2c 100644
> > --- a/drivers/mtd/spi-nor/intel-spi.c
> > +++ b/drivers/mtd/spi-nor/intel-spi.c
> > @@ -704,7 +704,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
> >  		 * whole partition read-only to be on the safe side.
> >  		 */
> >  		if (intel_spi_is_protected(ispi, base, limit))
> > -			ispi->writeable = 0;
> > +			ispi->writeable = false;
> >  
> >  		end = (limit << 12) + 4096;
> >  		if (end > part->size)
> > 
> 
> Looks OK, also this is the only place in the driver where writeable is
> assigned to an explicit true/false value.
> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>

Also

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> btw the variable should be renamed from writeable to writable ;-)

It is named like that because it follows MTD_WRITEABLE flag.
