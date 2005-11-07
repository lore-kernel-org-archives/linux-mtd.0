Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZEe7-0008Ar-Sb
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 16:35:24 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Tue, 8 Nov 2005 10:33:28 +1300
References: <200511071915.03263.tglx@linutronix.de>
	<436FBC6E.8050609@ru.mvista.com>
In-Reply-To: <436FBC6E.8050609@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511081033.28104.manningc2@actrix.gen.nz>
Cc: Thomas Gleixner <tglx@linutronix.de>, Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: MTD git repository status ==> oob_info & other methods
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 08 November 2005 09:43, Vitaly Wool wrote:
> Hi Thomas et al,
>
> >- [MTD] NAND: OOB changes
> >	Needs more thoughts. I'm particularly unhappy with the introduction of
> > new functions and the still pending problem of the automatic
> > placement/retrieval of oob data. The change should subsume and/or extend
> > the oob_info functionality rather than introducing a parallel solution.
>
> Yeah I do agree that this stuff has not been verified enough to go into
> git tree.
> And I do understand your concerns, so let me elaborate on all that once
> more.
>
> First, there's a hardware-driven need to support the OOB data
> distributed across the page. The fact is that nand_oobinfo *can't hold
> the info needed* for that since it implies that OOB data is contiguous.
> The adequate patcure can be derived only from nand_oobinfo plus
> eccsteps, but anyway handling all that in read/write functions will lead
> to the introduction of the structure similar to page_layout_item.
> So, rather then trying to revise nand_oobinfo, I was moving towards
> creation of a new data structure, more say 'linear' and straightforward.
> I think that layout structure well fits.
> Let's look at nand_oobinfo from the POV that page_layout_item has been
> introduced and autoplacement is the only option.
> In this case the whole nand_oobinfo becomes redundant and will go away,
> and that's what I'm targeting.

Yes, that is definitely the first prize goal,IMHO.

>
> I guess that the new functions introduced you're talking about are
> nand_read_oob_hwecc and nand_write_oob_hwecc.
> I think that nand_read_oob and nand_write_oob will soon go away, as soon
> as the two new functions prove they are working in all the HW ECC cases.
> Extending them to support SW ECC case is trivial.
> On the other hand, I do think that handling the layout in
> read_ecc/write_page should go to the separate function as now these two
> functions have become almost unreadable due to lotsa nesting levels.

The only way I see to cure this is to go toward better modularity. No actual 
fiddling with the low level reading in the do_read_ecc etc functions, but 
rather have do_read_ecc call read_data(), do_autoplace() etc functions. These 
worker-bee functions should have the understanding of nand_oobinfo or 
whatever.

A benefit of doing things this way is that it becomes easier to accomodate 
special cases or alternative strategies. You could still use current 
nand_oobinfo by plugging in worker-bee funtions that understand nand_oobinfo. 
To work with some other strategy (eg. hwecc or dma or something), you just 
plug in worker-bee functions that support that.

With a model like that you do not keep on trying to fit yet another strategy 
into a switch statement in nand_base. Instead you just write another few 
worker-bee functions. This has numerous benefits:
1) Cleaner code. Easier to write, less places for bugs to hide, faster 
execution, easier debugging.
2) Modularity. Adding a new strategy does not break an old one.

>
> Then, I'd like to point out once more that the approach introduced was
> intended to be absolutely transparent to both MTD users and particular
> NAND device drivers. 

OK, I'm biased, but I think the emphasis should be the other way around :-). A 
change that impacts on drivers is way smaller than one that is visible to 
others.

> This approach is capable of automated 
> placement/retrieval of OOB data but that's gonna be a new stage which I
> deliberately wanted to separate from the approach introduction.
> I can create a sort of design proposal for the OOB data handling and
> you/dedekind/Charles/whoever else will tear it apart :) We do need a
> good co-ordination on the changes that alter the behavior of MTD functions.

Sure, this is very important stuff and I am keen to review.

>
> Hope that all makes sense,

Yup.
