Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga0T7-0002aB-5B
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 15:42:38 +0000
Date: Thu, 20 Dec 2018 16:42:21 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "richard@nod.at" <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/3] mtd: rawnand: Support bad block markers in first,
 second or last page
Message-ID: <20181220164221.0fb76fe1@bbrezillon>
In-Reply-To: <d3fb9a2c-477e-8d7a-2c22-7b8348a67a1a@kontron.de>
References: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
 <1545061693-29216-2-git-send-email-frieder.schrempf@kontron.de>
 <20181220145954.55ae36e9@bbrezillon>
 <d3fb9a2c-477e-8d7a-2c22-7b8348a67a1a@kontron.de>
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

Hi Frieder,

On Thu, 20 Dec 2018 14:35:05 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> On 20.12.18 14:59, Boris Brezillon wrote:
> > On Mon, 17 Dec 2018 15:49:07 +0000
> > Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> >   
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> Currently supported bad block marker positions within the block are:
> >> * in first page only
> >> * in last page only
> >> * in first or second page
> >>
> >> Some ESMT NANDs are known to have been shipped by the manufacturer
> >> with bad block markers in the first or last page, instead of the
> >> first or second page.
> >>
> >> Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
> >> first, second *and* last page needs to be checked.
> >>
> >> Therefore we make it possible to set NAND_BBT_SCAN2NDPAGE and
> >> NAND_BBT_SCANLASTPAGE at the same time to scan/set all three pages.
> >>
> >> To simplify the code, the logic to evaluate the flags is moved to a
> >> a new function nand_bbm_page_offset().
> >>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>   drivers/mtd/nand/raw/internals.h |  1 +
> >>   drivers/mtd/nand/raw/nand_base.c | 72 ++++++++++++++++++++++++++---------
> >>   drivers/mtd/nand/raw/nand_bbt.c  | 30 +++++++--------
> >>   3 files changed, 68 insertions(+), 35 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> >> index 04c2cf7..8e4b168 100644
> >> --- a/drivers/mtd/nand/raw/internals.h
> >> +++ b/drivers/mtd/nand/raw/internals.h
> >> @@ -76,6 +76,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
> >>   
> >>   /* Core functions */
> >>   const struct nand_manufacturer *nand_get_manufacturer(u8 id);
> >> +int nand_bbm_page_offset(struct nand_chip *chip, int index);
> >>   int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
> >>   int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
> >>   		    int allowbbt);
> >> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> >> index 71050a0..388d9ed 100644
> >> --- a/drivers/mtd/nand/raw/nand_base.c
> >> +++ b/drivers/mtd/nand/raw/nand_base.c
> >> @@ -253,6 +253,45 @@ static void nand_release_device(struct mtd_info *mtd)
> >>   }
> >>   
> >>   /**
> >> + * nand_bbm_page_offset - Get the page offsets for bad block markers
> >> + * @chip: NAND chip object
> >> + * @index: Index for the page offset  
> > 
> > Hm, the meaning of index is far from obvious. How about passing the
> > current page instead (and return 1 if there are more pages to scan 0
> > otherwise)?  
> 
> Good idea.
> 
> > 
> > Something like:
> > 
> > static int nand_bbm_get_next_page(struct nand_chip *chip, int page)
> > {
> > 	struct mtd_info *mtd = nand_to_mtd(chip);
> > 	int last_page = ((mtd->erasesize - mtd->writesize) >>
> > 			 chip->page_shift) & chip->pagemask;
> > 
> > 	if (page < 0 && chip->bbt_options & NAND_BBT_SCANFIRSTPAGE)
> > 		return 0;
> > 	else if (page < 1 && chip->bbt_options & NAND_BBT_SCAN2NDPAGE)
> > 		return 1;
> > 	else if (page < last_page &&
> > 		 chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> > 		return last_page;
> > 
> > 	return -1;
> > }
> > 
> > And yes, that means defining NAND_BBT_SCANFIRSTPAGE and setting it when
> > appropriate.  
> 
> I tried to keep the existing flags and their current meanings, but you 
> are right. If we redefine the flags and add NAND_BBT_SCANFIRSTPAGE and 
> NAND_BBT_SCANFIRST2PAGES this will be much easier to read.
> 
> Also maybe renaming the flags to NAND_BBM_XXX would be even cleaner, as 
> we use them not only for scanning, but also for writing markers and they 
> are not directly related to the bad block table (BBT)?

Yep, and maybe move them to chip->options too.

> 
> By the way, what are your plans for using the common NAND layer (that is 
> used by the SPI NAND layer) for raw NAND?

I'd still like to have this done at some point, just don't have the
time to do it myself ;-). I started working on that a few weeks back
[1], but didn't have time to finish it.

> I'm thinking of SPI NANDs that might require things like this, too. 

Yes, probably.

> Currently they seem to have the markers in the first page only, but that 
> could change easily and in that case it would be nice to share the code.

Yes. Actually, that's the whole BBT + BBM scanning logic we should make
generic. But I'd like to take this as an opportunity to
cleanup/simplify the bbt code instead of simply porting it to the
generic NAND layer.

If you have some time, feel free to finish what I started.

Regards,

Boris

[1]https://github.com/bbrezillon/linux/commits/nand/cleanup
