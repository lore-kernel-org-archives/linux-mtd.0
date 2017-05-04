Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d6CLb-000683-Id
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 08:42:53 +0000
Date: Thu, 4 May 2017 10:42:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Thibaud Cornic
 <thibaud_cornic@sigmadesigns.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] tango_nand.c: fix ecc.stats_corrected in empty flash case
Message-ID: <20170504104216.0969423f@bbrezillon>
In-Reply-To: <20170503200427.GC17315@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
 <20170503200427.GC17315@amd>
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

On Wed, 3 May 2017 22:04:27 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> On Mon 2017-04-24 10:58:47, Marc Gonzalez wrote:
> > [ Trimming CC list ]
> > 
> > On 22/04/2017 12:40, Pavel Machek wrote:
> >   
> > > Fix ecc.stats_corrected in empty flash case.
> > > 
> > > Signed-off-by: Pavel Machek <pavel@denx.de>
> > > 
> > > ---
> > > 
> > > This was suggested by Boris Brezillon in another context. Not tested;
> > > I don't have the hardware.
> > > 
> > > diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> > > index 4a5e948..db4bff4 100644
> > > --- a/drivers/mtd/nand/tango_nand.c
> > > +++ b/drivers/mtd/nand/tango_nand.c
> > > @@ -193,6 +193,8 @@ static int check_erased_page(struct nand_chip *chip, u8 *buf)
> > >  						  chip->ecc.strength);
> > >  		if (res < 0)
> > >  			mtd->ecc_stats.failed++;
> > > +		else
> > > +			mtd->ecc_stats.corrected += res;
> > >  
> > >  		bitflips = max(res, bitflips);
> > >  		buf += pkt_size;
> > >   
> > 
> > Hello Pavel,
> > 
> > You may have noticed that ecc_stats.corrected is not updated in
> > decode_error_report() which is the main code path, i.e. the path
> > that will succeed 99.99% of the time (HW read).
> > 
> > It turns out that the HW does not report the number of errors
> > corrected in a page... Instead it reports two values:
> > 1) U = number of errors corrected in the first packet/step
> > 2) V = max number of errors corrected in other packets/steps
> > 
> > Thus, it is not possible to determine the actual number of errors
> > corrected in a page (unless V is 0). Otherwise, we just have an
> > interval; let n be the number of packets/steps:
> > 
> > U + V <= corrected errors count <= U + (n-1)*V
> > 
> > In my opinion, it is better to provide no information than to
> > provide incorrect information. Therefore, I did not update
> > ecc_stats.corrected in decode_error_report().  
> 
> Well... Having corrected ECC errors is pretty rare, right?

Depends on the NAND chip. On modern SLC NAND chips requiring
ECC of 8bits/512bytes are likely to have frequent bitflips.

> So one
> solution would be to re-compute ECCs in software if we see U or V >
> 0...

Hm, not sure it's worth the trouble for statistics that are anyway
rarely used, and when they are, are only used has a metric to determine
how worn the NAND is.

I'd prefer to see a better user-space interface returning the
max_bitflips information when someone reads from an MTD device (see [1])
rather than trying to fix drivers to return the exact number of
corrected bitflips (which might be impossible for some of them anyway).

[1]http://lists.infradead.org/pipermail/linux-mtd/2016-April/067187.html
