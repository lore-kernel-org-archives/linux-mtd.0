Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgckZ-0000EC-8x
 for linux-mtd@lists.infradead.org; Sun, 04 Sep 2016 19:06:40 +0000
Date: Sun, 4 Sep 2016 21:06:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, George Spelvin <linux@sciencehorizons.net>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 1/3] mtd: introduce the mtd_pairing_scheme concept
Message-ID: <20160904210615.4837825b@bbrezillon>
In-Reply-To: <20160901181524.GA22366@localhost>
References: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
 <1466430618-9713-2-git-send-email-boris.brezillon@free-electrons.com>
 <20160804043751.GA914@localhost>
 <20160809004218.672bc924@bbrezillon>
 <20160901181524.GA22366@localhost>
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

On Thu, 1 Sep 2016 11:15:24 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi,
> 
> I've had this on my plate to respond to for a while now, and I haven't
> brought myself to actually care that much about the choice. So I'll
> respond now to keep from leaving you hanging, but I'm not sure I'm that
> helpful :(

No problem. Actually, I've been busy with other problems too.

> 
> On Tue, Aug 09, 2016 at 12:42:18AM +0200, Boris Brezillon wrote:
> > On Thu, 4 Aug 2016 12:37:51 +0800
> > Brian Norris <computersforpeace@gmail.com> wrote:  
> > > On Mon, Jun 20, 2016 at 03:50:16PM +0200, Boris Brezillon wrote:  
> >   
> > >   
> > > > + * (3 bits in a single cell). A pair should regroup all pages that are sharing
> > > > + * the same cell. Pairs are then indexed in ascending order.
> > > > + *
> > > > + * @group is defining the position of a page in a given pair. It can also be
> > > > + * seen as the bit position in the cell: page attached to bit 0 belongs to
> > > > + * group 0, page attached to bit 1 belongs to group 1, etc.
> > > > + *
> > > > + * Example:
> > > > + * The H27UCG8T2BTR-BC datasheet describes the following pairing scheme:
> > > > + *
> > > > + *		group-0		group-1
> > > > + *
> > > > + *  pair-0	page-0		page-4
> > > > + *  pair-1	page-1		page-5
> > > > + *  pair-2	page-2		page-8
> > > > + *  ...
> > > > + *  pair-127	page-251	page-255
> > > > + *
> > > > + *
> > > > + * Note that the "group" and "pair" terms were extracted from Samsung and
> > > > + * Hynix datasheets, and might be referenced under other names in other
> > > > + * datasheets (Micron is describing this concept as "shared pages").    
> > > 
> > > Very, very helpful (to me, even though I'm moderately familiar with the
> > > concepts, but hopefully moreso for others who want to read and
> > > understand this). Thanks for writing this up.  
> > 
> > Actually, the more I think about it, the more I doubt those terms are
> > appropriate (even if they are widely used in technical documents).
> > 
> > How about using the following names instead:
> > 
> > struct mtd_cell_sharing_scheme {
> > 	...
> > };
> > 
> > struct mtd_cell_sharing_info {
> > 	/* the bit position in the cell */
> > 	int bitpos;
> > 	/*
> > 	 * What was previously known as 'pair': an id representing a  
> 
> Wait, so you're replacing the literature's "pair" term with "group", but
> the literature already used "group" to mean something else? That seems
> to be an unwise choice. (Or I'm misreading you.)
> 
> > 	 * group of cells forming a 'pair of pages'.
> > 	 * I can't find a good description/word for this concept. Do
> > 	 * you have better ideas?
> > 	 */
> > 	int group;
> > };
> > 
> > What do you think?  
> 
> I think there's something to be said for matching the literature out
> there, and I personally thought that simply providing a little bit of
> clarifying explanation in the comments was sufficient. But if you feel
> like choosing a more generic name is better, then that's probably OK
> too. So other than the above comment (don't overload terms too freely!),
> I'd use your judgment.
> 
> FWIW, it still takes me a while to parse what the "pair" and "group" (or
> "bitpos" and "group" -- although "bitpos" is actually quite clear, so I
> guess I like that) actually mean, so I tend to refer back to these
> comments every time I'm reading it.

Let's stick to my first proposal. I'll address you comment and send a
new version. If you're happy with it, I'll create a branch that we can
share and ask you to pull it.

Thanks,

Boris
