Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V94cs-0003Vj-Vt
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 02:46:28 +0000
Received: by mail-pa0-f52.google.com with SMTP id kq13so8260757pab.11
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 19:46:05 -0700 (PDT)
Date: Mon, 12 Aug 2013 19:46:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: fixup kerneldoc, rename parameter
Message-ID: <20130813024601.GH7267@brian-ubuntu>
References: <1376007742-19392-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F22DA@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F22DA@DBDE04.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

I'm not all that familiar with subpage programming, and my NAND
controller is best used without partial-page programming. Plus, it's
easy to get wrong, since many NAND these days (all MLC and even some
SLC) have NOP=1. But I can still try to contribute to the discussion.

On Fri, Aug 09, 2013 at 03:25:51AM +0000, Gupta, Pekon wrote:
> Thanks for review.. And few more thoughts and queries which came to my mind
> while writing down subpage-write support. I think its time to address those also.
> 
> > First, the function argument is 'offset' not 'column'.
> > 
> > Second, the 'data_buf' name is inconsistent with the rest of this file.
> > Just use 'buf'.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Gupta, Pekon <pekon@ti.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 8f04fb0..49ca737 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -1980,13 +1980,14 @@ static int nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
> >   * nand_write_subpage_hwecc - [REPLACABLE] hardware ECC based subpage write
> >   * @mtd:       mtd info structure
> >   * @chip:      nand chip info structure
> > - * @column:    column address of subpage within the page
> > + * @offset:    column address of subpage within the page
> >   * @data_len:  data length
> > + * @buf:       data buffer
> >   * @oob_required: must write chip->oob_poi to OOB
> >   */
> >  static int nand_write_subpage_hwecc(struct mtd_info *mtd,
> >                                 struct nand_chip *chip, uint32_t offset,
> > -                               uint32_t data_len, const uint8_t *data_buf,
> > +                               uint32_t data_len, const uint8_t *buf,
> >                                 int oob_required)
> >  {
> >         uint8_t *oob_buf  = chip->oob_poi;
> > @@ -2005,20 +2006,20 @@ static int nand_write_subpage_hwecc(struct mtd_info *mtd,
> >                 chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
> > 
> >                 /* write data (untouched subpages already masked by 0xFF) */
> > -               chip->write_buf(mtd, data_buf, ecc_size);
> > +               chip->write_buf(mtd, buf, ecc_size);
> > 
> >                 /* mask ECC of un-touched subpages by padding 0xFF */
> >                 if ((step < start_step) || (step > end_step))
> >                         memset(ecc_calc, 0xff, ecc_bytes);
> 
> [Pekon]: In above implementation ..
> even though only single subpage data needs to be written, still whole
> page is programmed with other 'untouched' subpage data masked with 0xFF.
> This is not the efficient way, as it does not give any performance benefit.

I don't believe partial page programming is intended for performance,
really. It's primarily useful for space savings -- when a filesystem can
program metadata to the same page (different subpages) at different
different points in time, it can optimize its space usage. See:

  http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead

> Is it possible tht specific sub-pages inside a page can be addressed, read & written
> independently?
> I have not found any NAND devices supporting subpages (partial pages),
> and having a separate command 'SUBPAGE_PROGRAM' in addition to PAGE_PROGRAM.

I think you should read through some datasheets that support sub-pages.
It looks to me like you can program pages arbitrarily, to the level of
byte granularity, actually. But we try to stick to aligning "subpages"
according to NOP (Number Or Partial-programs).

Particularly, you should look at the description of PAGE_PROGRAM.
According to my reading of a random Spansion SLC NAND datasheet
(S34ML01G2) it can handle
(1) an unaligned column address
(2) Random Data Input (RNDIN, 0x85) commands, so data can be filled to
    various parts of the page as needed
(3) only the data you need to program

Quote:

  "The words other than those to be programmed do not need to be loaded.
  The device supports Random Data Input within a page. The column
  address of next data, which will be entered, may be changed to the
  address that follows the Random Data Input command (85h). Random Data
  Input may be performed as many times as needed."

So fundamentally, when NOP > 1, NAND can be programmed (and read)
"independently" as you are suggesting.

(For further support, see the subpage_read implementation:

    ...
    /* If we read not a page aligned data */
    if (data_col_addr != 0)
            chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
    ...
)

> If indepedent subpage programming was allowed (as per actual subpage definition),
> and there was a independent NAND command SUBPAGE_PROGRAM then,
> we could just just change mtd->writesize == subpage_size (partial-page-size),
> and then eveything should work seemlessly.. correct ?

No, I don't think you want writesize == subpage size. Partial page
programs are not equivalent to a full page program. As I understand it,
the flash is still programming the whole page for you, even if you only
program part of the page with new data. And I believe each partial page
program has the *potential* to disturb previous programs to the same
page, although the NOP > 1 specification means that this shouldn't be a
problem.

> >                 else
> > -                       chip->ecc.calculate(mtd, data_buf, ecc_calc);
> > +                       chip->ecc.calculate(mtd, buf, ecc_calc);
> > 
> >                 /* mask OOB of un-touched subpages by padding 0xFF */
> >                 /* if oob_required, preserve OOB metadata of written subpage */
> >                 if (!oob_required || (step < start_step) || (step > end_step))
> >                         memset(oob_buf, 0xff, oob_bytes);
> > 
> [Pekon]: same it the case for OOB data, untouched OOB bits are masked with 0xFF.
> Also File-systems storing their metadata in OOB area might have some problem with using 
> subpages, because currently our ECC layouts are not uniformly distributed across subpage
> boundaries. Though this is also the problem with ECC also.

Yeah, I really don't know that much about how spare area would play into
this. That's part of why I don't support partial page programming on my
NAND controller.

Can you explain how it makes sense to do partial page programming for
spare area, other than at offset 0? Beyond offset 0, the layout is very
much implementation defined (each driver has a different layout). So
this seems to be falling into the realm of MTD_OPS_AUTO_OOB.

> Hence going forward, I would suggest to have at-least _ecc_bytes_ eqully distributed
> and aligned to subpage boundaries .. thoughts ??

I'm not sure what you're saying here.

> > -               data_buf += ecc_size;
> > +               buf += ecc_size;
> >                 ecc_calc += ecc_bytes;
> >                 oob_buf  += oob_bytes;
> >         }

Please feel free to rebut any of my points above, or to provide
alternate/improved explanations. I could be off-base on some points, and
I know that I'm underinformed about some things.

Brian
