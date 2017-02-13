Received: from [92.243.34.74] (helo=mail.osadl.at)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdBCo-000855-30
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 07:37:52 +0000
Date: Mon, 13 Feb 2017 07:37:26 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] spi-nor: use true/false for bool
Message-ID: <20170213073726.GB23235@osadl.at>
References: <1486917811-23525-1-git-send-email-der.herr@hofr.at>
 <20170212225044.17a10ee1@bbrezillon>
 <20170212230144.22188f98@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170212230144.22188f98@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 12, 2017 at 11:01:44PM +0100, Boris Brezillon wrote:
> +Mika
> 
> On Sun, 12 Feb 2017 22:50:44 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > On Sun, 12 Feb 2017 17:43:31 +0100
> > Nicholas Mc Guire <der.herr@hofr.at> wrote:
> > 
> > > writeable in struct intel_spi is a boolean and assignment should be to 
> > > true/false not 1/0 as recommended by boolinit.cocci.
> > > 
> > > Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>  
> > 
> > Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> As asked in my other review, please use the 'mtd: spi-nor: intel'
> prefix (or anything that would clarify the scope of this patch, like
> 'mtd: spi-nor/intel: ').
>

yup - will fix it up - just not yet clear how
to find the proper prefix next time - the method I
had been using seems insufficient.

thx!
hofrat
 
> 
> > 
> > > ---
> > > 
> > > make coccicheck complained with:
> > >  ./drivers/mtd/spi-nor/intel-spi.c:707:3-18: WARNING: Assignment of bool to 0/1
> > > 
> > > Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)
> > > 
> > > Patch is against 4.10-rc6 (localversion-next is next-20170210)
> > > 
> > >  drivers/mtd/spi-nor/intel-spi.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> > > index a10f602..e43ce63 100644
> > > --- a/drivers/mtd/spi-nor/intel-spi.c
> > > +++ b/drivers/mtd/spi-nor/intel-spi.c
> > > @@ -704,7 +704,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
> > >  		 * whole partition read-only to be on the safe side.
> > >  		 */
> > >  		if (intel_spi_is_protected(ispi, base, limit))
> > > -			ispi->writeable = 0;
> > > +			ispi->writeable = false;
> > >  
> > >  		end = (limit << 12) + 4096;
> > >  		if (end > part->size)  
> > 
> 
