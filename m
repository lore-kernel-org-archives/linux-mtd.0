Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfWWk-00047l-3y
 for linux-mtd@lists.infradead.org; Thu, 01 Sep 2016 18:15:51 +0000
Received: by mail-pf0-x230.google.com with SMTP id h186so33683337pfg.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2016 11:15:29 -0700 (PDT)
Date: Thu, 1 Sep 2016 11:15:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 George Spelvin <linux@sciencehorizons.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: introduce the mtd_pairing_scheme concept
Message-ID: <20160901181524.GA22366@localhost>
References: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
 <1466430618-9713-2-git-send-email-boris.brezillon@free-electrons.com>
 <20160804043751.GA914@localhost>
 <20160809004218.672bc924@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160809004218.672bc924@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've had this on my plate to respond to for a while now, and I haven't
brought myself to actually care that much about the choice. So I'll
respond now to keep from leaving you hanging, but I'm not sure I'm that
helpful :(

On Tue, Aug 09, 2016 at 12:42:18AM +0200, Boris Brezillon wrote:
> On Thu, 4 Aug 2016 12:37:51 +0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Jun 20, 2016 at 03:50:16PM +0200, Boris Brezillon wrote:
> 
> > 
> > > + * (3 bits in a single cell). A pair should regroup all pages that are sharing
> > > + * the same cell. Pairs are then indexed in ascending order.
> > > + *
> > > + * @group is defining the position of a page in a given pair. It can also be
> > > + * seen as the bit position in the cell: page attached to bit 0 belongs to
> > > + * group 0, page attached to bit 1 belongs to group 1, etc.
> > > + *
> > > + * Example:
> > > + * The H27UCG8T2BTR-BC datasheet describes the following pairing scheme:
> > > + *
> > > + *		group-0		group-1
> > > + *
> > > + *  pair-0	page-0		page-4
> > > + *  pair-1	page-1		page-5
> > > + *  pair-2	page-2		page-8
> > > + *  ...
> > > + *  pair-127	page-251	page-255
> > > + *
> > > + *
> > > + * Note that the "group" and "pair" terms were extracted from Samsung and
> > > + * Hynix datasheets, and might be referenced under other names in other
> > > + * datasheets (Micron is describing this concept as "shared pages").  
> > 
> > Very, very helpful (to me, even though I'm moderately familiar with the
> > concepts, but hopefully moreso for others who want to read and
> > understand this). Thanks for writing this up.
> 
> Actually, the more I think about it, the more I doubt those terms are
> appropriate (even if they are widely used in technical documents).
> 
> How about using the following names instead:
> 
> struct mtd_cell_sharing_scheme {
> 	...
> };
> 
> struct mtd_cell_sharing_info {
> 	/* the bit position in the cell */
> 	int bitpos;
> 	/*
> 	 * What was previously known as 'pair': an id representing a

Wait, so you're replacing the literature's "pair" term with "group", but
the literature already used "group" to mean something else? That seems
to be an unwise choice. (Or I'm misreading you.)

> 	 * group of cells forming a 'pair of pages'.
> 	 * I can't find a good description/word for this concept. Do
> 	 * you have better ideas?
> 	 */
> 	int group;
> };
> 
> What do you think?

I think there's something to be said for matching the literature out
there, and I personally thought that simply providing a little bit of
clarifying explanation in the comments was sufficient. But if you feel
like choosing a more generic name is better, then that's probably OK
too. So other than the above comment (don't overload terms too freely!),
I'd use your judgment.

FWIW, it still takes me a while to parse what the "pair" and "group" (or
"bitpos" and "group" -- although "bitpos" is actually quite clear, so I
guess I like that) actually mean, so I tend to refer back to these
comments every time I'm reading it.

Brian
