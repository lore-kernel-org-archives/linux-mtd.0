Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enuUF-0006nN-DK
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 23:04:45 +0000
Date: Tue, 20 Feb 2018 00:04:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nftl/inftl: check mtd_erase() return value
Message-ID: <20180220000430.7b3febe1@xps13>
In-Reply-To: <20180212134101.571f46d6@bbrezillon>
References: <20180124232434.32023-1-miquel.raynal@free-electrons.com>
 <20180212134101.571f46d6@bbrezillon>
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

Hi Boris,

On Mon, 12 Feb 2018 13:41:01 +0100, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Thu, 25 Jan 2018 00:24:34 +0100
> Miquel Raynal <miquel.raynal@free-electrons.com> wrote:
> 
> > Since the creation of mtd_erase(), the function can return a negative
> > error code without updating the instr->state flag. This happens for
> > instance when ->_erase() is not implemented or ->erasesize has an invalid
> > value. The calling function should error out in this case.
> > 
> > Functions in nftlmount/inftlmount call mtd_erase() without checking the
> > return code. The instr->state flag is checked but might not have been
> > updated depending on the error path.
> > 
> > Add checks on the returned value of mtd_erase().
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > ---
> >  drivers/mtd/inftlmount.c | 7 +++++--
> >  drivers/mtd/nftlmount.c  | 3 ++-
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
> > index 8d6bb189ea8e..cab4a0b9f881 100644
> > --- a/drivers/mtd/inftlmount.c
> > +++ b/drivers/mtd/inftlmount.c
> > @@ -219,7 +219,9 @@ static int find_boot_record(struct INFTLrecord *inftl)
> >  				 */
> >  				instr->addr = ip->Reserved0 * inftl->EraseSize;
> >  				instr->len = inftl->EraseSize;
> > -				mtd_erase(mtd, instr);
> > +				ret = mtd_erase(mtd, instr);
> > +				if (ret < 0)
> > +					return ret;
> >  			}
> >  			if ((ip->lastUnit - ip->firstUnit + 1) < ip->virtualUnits) {
> >  				printk(KERN_WARNING "INFTL: Media Header "
> > @@ -393,7 +395,8 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
> >  	   mark only the failed block in the bbt. */
> >  	for (physblock = 0; physblock < inftl->EraseSize;
> >  	     physblock += instr->len, instr->addr += instr->len) {
> > -		mtd_erase(inftl->mbd.mtd, instr);
> > +		if (mtd_erase(inftl->mbd.mtd, instr < 0))  
> 
> 		    ^ mtd_erase(inftl->mbd.mtd, instr) < 0
> 
> which means you did not even compile test your patch :P.

/o\ shame on me... I feel I've been cheated by my conf :)

> 
> > +			goto fail;
> >  
> >  		if (instr->state == MTD_ERASE_FAILED) {
> >  			printk(KERN_WARNING "INFTL: error while formatting block %d\n",
> > diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
> > index 184c8fbfe465..8dbc40ab7d73 100644
> > --- a/drivers/mtd/nftlmount.c
> > +++ b/drivers/mtd/nftlmount.c
> > @@ -331,7 +331,8 @@ int NFTL_formatblock(struct NFTLrecord *nftl, int block)
> >  	instr->mtd = nftl->mbd.mtd;
> >  	instr->addr = block * nftl->EraseSize;
> >  	instr->len = nftl->EraseSize;
> > -	mtd_erase(mtd, instr);
> > +	if (mtd_erase(mtd, instr) < 0)
> > +		goto fail;
> >  
> >  	if (instr->state == MTD_ERASE_FAILED) {
> >  		printk("Error while formatting block %d\n", block);  
> 
> 
> 



-- 
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
