Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCKqp-0003vt-DR
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 05:55:56 +0000
Received: by mail-pa0-x242.google.com with SMTP id fg1so9729451pad.3
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jun 2016 22:55:35 -0700 (PDT)
Date: Sun, 12 Jun 2016 22:55:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: introduce the mtd_pairing_scheme concept
Message-ID: <20160613055532.GB107340@google.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
 <1461578481-26567-2-git-send-email-boris.brezillon@free-electrons.com>
 <20160611021715.GH89390@google.com>
 <20160611085408.74b2295f@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160611085408.74b2295f@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, Jun 11, 2016 at 08:54:08AM +0200, Boris Brezillon wrote:
> On Fri, 10 Jun 2016 19:17:15 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Apr 25, 2016 at 12:01:18PM +0200, Boris Brezillon wrote:
> > > MLC and TLC NAND devices are using NAND cells exposing more than one bit,
> > > but instead of attaching all the bits in a given cell to a single NAND
> > > page, each bit is usually attached to a different page. This concept is
> > > called 'page pairing', and has significant impacts on the flash storage
> > > usage.
> > > The main problem showed by these devices is that interrupting a page
> > > program operation may not only corrupt the page we are programming
> > > but also the page it is paired with, hence the need to expose to MTD
> > > users the pairing scheme information.
> > > 
> > > The pairing APIs allows one to query pairing information attached to a
> > > given page (here called wunit), or the other way around (the wunit
> > > pointed by pairing information).  
> > 
> > Why the "write unit" terminology? Is a write unit ever different from a
> > page?
> 
> Because there's no concept of pages at the MTD level. The page size is
> actually translated into writesize, so I thought keeping the same
> wording for pairing scheme would be more appropriate. Not sure other
> device types will need this pairing scheme feature though.

Ah, I suppose that makes sense.

> > 
> > > It also provides several helpers to help the conversion between absolute
> > > offsets and wunits, and query the number of pairing groups.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > ---
> > >  drivers/mtd/mtdcore.c   | 62 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  drivers/mtd/mtdpart.c   |  1 +
> > >  include/linux/mtd/mtd.h | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 127 insertions(+)
> > > 

[...]

> > > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > > index 29a1706..4961092 100644
> > > --- a/include/linux/mtd/mtd.h
> > > +++ b/include/linux/mtd/mtd.h
> > > @@ -127,6 +127,36 @@ struct mtd_ooblayout_ops {
> > >  		    struct mtd_oob_region *oobfree);
> > >  };
> > >  
> > > +/**
> > > + * struct mtd_pairing_info - Page pairing information
> > > + *
> > > + * @pair: represent the pair index in the paired pages table.For example, if  
> > 
> > Needs a space after the period.
> 
> Yep.
> 
> > 
> > > + *	  page 0 and page 2 are paired together they form the first pair.  
> > 
> > This example doesn't help. What would the value of @pair be in this
> > case? "First pair" doesn't translate to an integer unambiguously.
> 
> pair 0
> 
> > 
> > > + * @group: the group represent the bit position in the cell. For example,
> > > + *	   page 0 uses bit 0 and is thus part of group 0.  
> > 
> > I can barely understand what your description for these two fields
> > means. I think you need a much more verbose overall description for the
> > struct (some here, and maybe more in mtd_pairing_scheme?), and some
> > better specifics about what values to expect in the fields. For example
> > you might include language like: "this struct describes a single write
> > unit in terms of its page pairing geometry."
> > 
> > Also, the "pair" term (and examples you use) seem to imply 2-cell MLC,
> > whereas I believe you're trying to handle TLC too. I don't know if we
> > should drop the "pair" term, or just explain it better.
> 
> I clearly have some problems with the words I've chosen, but those terms
> were extracted from NAND datasheets (group and pair), and I think
> keeping the same wording help people converting datasheet specs into
> pairing scheme implementation.
> 
> Any suggestions to replace those 2 words?

I'm not sure we should replace the words (esp. if those are used by
multiple vendors). I just think you might need better examples -- for
instance, an example witih TLC. Also, (0, 0) is the trivial case;
perhaps a non-zero case?

I'm also wondering how I use this stuct and accompanying API to answer
questions like "what page(s) are paired with page X"? I understand I can
convert from a page number to a 'pairing_info', but how do I determine
the other pages in my pairing? I guess it's implied that I can modify
the 'group' to any other value in [0, ngroups) then run get_wunit() to
get the inverse? I can understand why you might do this instead of
passing back an array (for instance), but I think it deserves a little
bit of explanation.

> > 
> > You also need to steal more documentation from your commit message and
> > cover and put it somewhere, whether it's the comments or
> > Documentation/mtd/nand/.
> 
> Okay.
> 
> > 
> > > + */
> > > +struct mtd_pairing_info {
> > > +	int pair;
> > > +	int group;
> > > +};
> > > +
> > > +/**
> > > + * struct mtd_pairing_scheme - Page pairing information
> > > + *
> > > + * @ngroups: number of groups. Should be related to the number of bits
> > > + *	     per cell.
> > > + * @get_info: get the paring info of a given write-unit (ie page). This

s/ie/i.e.,/

> > > + *	      function should fill the info struct passed in argument.
> > > + * @get_page: convert paring information into a write-unit (page) number.
> > > + */
> > > +struct mtd_pairing_scheme {
> > > +	int ngroups;
> > > +	void (*get_info)(struct mtd_info *mtd, int wunit,
> > > +			 struct mtd_pairing_info *info);
> > > +	int (*get_wunit)(struct mtd_info *mtd,
> > > +			 const struct mtd_pairing_info *info);
> > > +};
> > > +
> > >  struct module;	/* only needed for owner field in mtd_info */
> > >  
> > >  struct mtd_info {
> > > @@ -188,6 +218,9 @@ struct mtd_info {
> > >  	/* OOB layout description */
> > >  	const struct mtd_ooblayout_ops *ooblayout;
> > >  
> > > +	/* NAND pairing scheme, only provided for MLC/TLC NANDs */
> > > +	const struct mtd_pairing_scheme *pairing;
> > > +
> > >  	/* the ecc step size. */
> > >  	unsigned int ecc_step_size;
> > >  
> > > @@ -312,6 +345,32 @@ static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
> > >  	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
> > >  }
> > >  
> > > +static inline int mtd_offset_to_wunit(struct mtd_info *mtd, loff_t offs)
> > > +{
> > > +	if (mtd->erasesize_mask)
> > > +		offs &= mtd->erasesize_mask;
> > > +	else
> > > +		offs = offs % mtd->erasesize;  
> > 
> > Since you're doing the in-place operators everywhere else, why not
> > 
> > 		offs %= mtd->erasesize;
> > 
> > ?
> > 
> > > +
> > > +	if (mtd->writesize_shift)
> > > +		offs >>= mtd->writesize_shift;
> > > +	else
> > > +		offs %= mtd->writesize;  
> > 
> > Uhh, this is wrong. You meant divide, not mod, right? And in that case,
> > why not just use:
> > 
> > 	return mtd_div_by_ws(offs, mtd);
> > 
> > ? Or even save yourself most of the trouble and replace the whole
> > function with this:
> > 
> > 	return mtd_mod_by_eb(mtd_div_by_ws(offs, mtd), mtd);
> 
> Definitely better, thanks.

Well, not really; mine is buggy too! I have those in the wrong order.
Should be:

 	return mtd_div_by_ws(mtd_mod_by_eb(offs, mtd), mtd);

Brian
