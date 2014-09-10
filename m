Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRd3l-0004oT-DK
 for linux-mtd@lists.infradead.org; Wed, 10 Sep 2014 08:15:26 +0000
Date: Thu, 11 Sep 2014 00:12:37 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 7/8] mtd: spi-nor: factor out write_enable() for erase
 commands
Message-ID: <20140910161237.GB13736@shldeISGChi005.sh.intel.com>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
 <20140809105232.GA1571@localhost.localdomain>
 <20140811184818.GY3711@ld-irv-0074>
 <20140812005912.GA1850@shldeISGChi005.sh.intel.com>
 <20140910070537.GC5732@norris-Latitude-E6410>
 <20140910152021.GB13016@shldeISGChi005.sh.intel.com>
 <20140910074708.GD5732@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140910074708.GD5732@norris-Latitude-E6410>
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 zajec5@gmail.com, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 10, 2014 at 12:47:08AM -0700, Brian Norris wrote:
> On Wed, Sep 10, 2014 at 11:20:21PM +0800, Huang Shijie wrote:
> > On Wed, Sep 10, 2014 at 12:05:37AM -0700, Brian Norris wrote:
> > > On Tue, Aug 12, 2014 at 08:59:12AM +0800, Huang Shijie wrote:
> > > >    For the spi_nor_erase(), the patch should like this:
> > > > 
> > > > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > > > index c130bf7..26c48bc 100644
> > > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > > @@ -324,6 +324,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
> > > >  
> > > >  	/* whole-chip erase? */
> > > >  	if (len == mtd->size) {
> > > > +		write_enable(nor);
> > > >  		if (erase_chip(nor)) {
> > > >  			ret = -EIO;
> > > >  			goto erase_err;
> > > > @@ -337,6 +338,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
> > > >  	/* "sector"-at-a-time erase */
> > > >  	} else {
> > > >  		while (len) {
> > > > +			write_enable(nor);
> > The difference is here.
> 
> OK.
> 
> > you miss a write_enable for each sector's erase. 
> 
> But is that necessary? I thought 'write-enabled' was retained across
> operations, so why would you have to perform it before each sector's
> erase?
The legacy code did so.

> 
> Or do you have a flash datasheet which says you must send WREN before
> each sector erase?
See the belowing from Spansion Nor S25fl129:

"
The Sector Erase (SE) command sets all bits at all addresses within a
specified sector to a logic 1. A WREN
command is required prior to writing the SE command.
"

It does not tell we send a WREN for each sector erase, but i am not sure if we can remove it.

thanks
Huang Shijie

> 
> I do see, now that I'm looking a little closer, that spi-nor doesn't
> actually have any concurrency protection (!). So it looks like we could
> potentially have other operations interleaved in this sequence of sector
> erasures, potentially running a write_disable() in the midst of this loop.
> 
> I really hope I'm wrong about that last paragraph.
> 
> If I'm correct though, the solution to this is not, AIUI, to add more
> write_enable() calls in this loop; the solution is to add some kind of
> concurrency protections, a la nand_get_device().
