Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5UKY-0006lv-Ls
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 09:42:52 +0000
Date: Tue, 2 May 2017 11:42:28 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-mtd <linux-mtd@lists.infradead.org>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] tango_nand.c: fix ecc.stats_corrected in empty flash case
Message-ID: <20170502114228.299fc862@bbrezillon>
In-Reply-To: <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
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

Hi Marc,

On Mon, 24 Apr 2017 10:58:47 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> [ Trimming CC list ]
> 
> On 22/04/2017 12:40, Pavel Machek wrote:
> 
> > Fix ecc.stats_corrected in empty flash case.
> > 
> > Signed-off-by: Pavel Machek <pavel@denx.de>
> > 
> > ---
> > 
> > This was suggested by Boris Brezillon in another context. Not tested;
> > I don't have the hardware.
> > 
> > diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> > index 4a5e948..db4bff4 100644
> > --- a/drivers/mtd/nand/tango_nand.c
> > +++ b/drivers/mtd/nand/tango_nand.c
> > @@ -193,6 +193,8 @@ static int check_erased_page(struct nand_chip *chip, u8 *buf)
> >  						  chip->ecc.strength);
> >  		if (res < 0)
> >  			mtd->ecc_stats.failed++;
> > +		else
> > +			mtd->ecc_stats.corrected += res;
> >  
> >  		bitflips = max(res, bitflips);
> >  		buf += pkt_size;
> >   
> 
> Hello Pavel,
> 
> You may have noticed that ecc_stats.corrected is not updated in
> decode_error_report() which is the main code path, i.e. the path
> that will succeed 99.99% of the time (HW read).
> 
> It turns out that the HW does not report the number of errors
> corrected in a page... Instead it reports two values:
> 1) U = number of errors corrected in the first packet/step
> 2) V = max number of errors corrected in other packets/steps
> 
> Thus, it is not possible to determine the actual number of errors
> corrected in a page (unless V is 0). Otherwise, we just have an
> interval; let n be the number of packets/steps:
> 
> U + V <= corrected errors count <= U + (n-1)*V
> 
> In my opinion, it is better to provide no information than to
> provide incorrect information. Therefore, I did not update
> ecc_stats.corrected in decode_error_report().

Hm, not sure I agree with that. The situation is far from ideal, but
some userspace tools query the number of corrected bits before and
after doing a read operation to report the number of bitflips that
have been correcte. Letting users think there were no bitflips at all is
not a good thing IMO.

> 
> One could argue that updating ecc_stats.corrected in
> check_erased_page() sets the correct value, since the error
> counts are computed in software for each step. But updating
> the value here is IMO pointless if we can't do it in the main
> code path.

Well, it's not pointless if you want to inform the user that some
bitflips were present on the NAND. Yes, the numbers you report
won't be accurate in your case, but at least the user can tell when
bitflips were discovered.

Note that ideally, we should have per-page (or per-block) max-bitflips
information (where max-bitflips is the number returned by
ecc->read_page()), because counting the total number of corrected bits
is certainly not helping when it comes to checking how reliable a NAND
page/eraseblock is.

Regards,

Boris
