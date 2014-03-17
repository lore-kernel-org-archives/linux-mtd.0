Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPdch-0005gq-Ih
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 19:55:00 +0000
Received: by mail-ig0-f174.google.com with SMTP id h18so6417898igc.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2014 12:54:38 -0700 (PDT)
Date: Mon, 17 Mar 2014 12:46:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140317194658.GD3834@ld-irv-0074>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <87bnx9eqel.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bnx9eqel.fsf@nbsps.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 13, 2014 at 05:32:02PM -0400, Bill Pringlemeir wrote:
> On 11 Mar 2014, Brian Norris wrote:
> > Upper layers (e.g., UBI/UBIFS) expect that pages that have been erased
> > will return all 1's (0xff). However, modern NAND (MLC, and even some
> > SLC) experience bitflips in unprogrammed pages, and so they may not read
> > back all 1's. This is problematic for drivers whose ECC cannot correct
> > bitflips in an all-0xff page, as they will report an ECC error
> > (-EBADMSG) when they come across such a page. This appears to UBIFS as
> > "corrupt empty space".
> 
> > Several others [1][2] are attempting to solve this problem, but none is
> > generically useful, and most (all?) have subtle bugs in their reasoning. Let's
> > implement a simple, generic, and correct solution instead.
> 
> > To handle such situations, we should implement the following software
> > workaround for drivers that need it: when the hardware driver reports an
> > ECC error, nand_base should "verify" this error by
> 
> > * Re-reading the page without ECC
> > * counting the number of 0 bits in each ECC sector (N[i], for i = 0, 1,
> > ..., chip->ecc.steps)
> > * If any N[i] exceeds the ECC strength (and thus, the maximum allowable
> > bitflips) then we consider this to be an uncorrectable sector.
> > * If all N[i] are less than the ECC strength, then we "correct" the
> > output to all-0xff and report max-bitflips appropriately
> 
> One issue is that a raw read will never see 'stuck at one' errors.  I
> believe that Elie had a good diagnosis of the issue,

I'm not aware of Elie's diagnosis of 'stuck at one' errors. Perhaps it
is lost somewhere in the many revisions of Eli's original patch series?

But I think that's a good point. We can't allow 100% of the
potentially-correctible flips to be 1->0 flips, since we may see more
0->1 flips once we try to program.

> > 3. I read something but failed to correct it.
> > The third case can have two causes:
> > 3.a you read valid data with bitflips exceeding what the BCH could
> >   correct
> > 3.b you read an erased page with bitflips.
> 
> For 3.b, the permitted value of bitflips should probably be based on the
> flash device and not the ECC controller.  If the chip is giving bit
> flips on an SLC NAND device, do we wish to continue on 3.b?  I believe
> that maybe only some MLC NAND devices might want to permit this.

I don't think your belief matches reality ;) I have seen reports from
users that very much looked like bitflips in an erased page (I didn't
personally diagnose it), and they were using SLC NAND. I don't think
that the SLC vs. MLC distinction is really so strong in some of these
scenarios.

> If the
> conclusion is that this is an erased page, then someone is going to write
> to it and possibly then see 'stuck at one' issues.  At first glance,
> using the ECC strength seems correct, but I don't think that this is
> simple data correction in this case.

1->0 and 0->1 flips don't make much difference to ECC; we can correct
either in a programmed page. You do have a good point that we shouldn't
"correct" the full ECC strength in an erased page, since you might see
additional 0->1 flips after you program. But I think this just means we
either have to do better error distribution modeling (not likely!) or
just pick a more reasonable threshold (ecc_strength / 2 ?).

> Another issue is that the management of flash is not at the MTD layer.
> The other layers general know when a sector is erased.  There is no hint
> ever given to the MTD driver.  For instance, many drivers implement
> sub-pages by doing a full page read followed by a sub-page write, where
> just the sub-page data is updated in the originally read page.  If this
> is happening multiple times (read page w ECC, read page w/o ECC, write
> page), the performance to write a sub-page in a known erased sector
> could be pretty horrid.  This maybe a fairly common case.

Subpage writing is performed within the MTD layer. Do you have any
examples aside from subpage writes? I really don't know the specifics of
how UBIFS tries to read blank pages (I think Artem replied pretty
in-depth to Pekon's UBIFS patches about this; I'll have to re-read), but
I did not understand them to be in the hot path.

> So, I think this statement,
> 
> > Obviously, this sequence can be compute intensive if applied heavily.
> > Ideally, MTD users should not need to read un-programmed pages very
> > often and would require this software check, for instance, only during
> > attach/mount checks or certain recovery situations.
> 
> ... is not quite correct.  It seems common for some upper layers to ask
> to read erased data during normal operation?

Is that a question or a statement? I don't think it is common, but feel
free to point out specifics where I'm wrong.

> Or the only MTD drivers I
> have looked at have sub-page handling broken and need to fixing.

I'm curious: which drivers are you looking at?

If MTD drivers are doing "subpage" writing by doing read/modify/write,
that does indeed seem to be rather broken. Or at least, it doesn't seem
very maintainable in the presence of bitflips like this. Can't subpage
writes be done where all "unprogrammed" data is assumed to be 0xff? (I'm
admittedly not very familiar with subpage programming implementations.)

> If this happens only at boot, then I don't think people would be as
> concerned about performance.

I still haven't seen anyone with numbers for real application
performance, not just benchmarks run specifically for erased areas.

> See: 
>  http://git.infradead.org/linux-mtd.git/blob/HEAD:/drivers/mtd/nand/fsmc_nand.c#l800
> 
> for another driver which is doing this check.

Thanks. Looks like the problem is more widespread (and ad-hoc) than I
thought.

> I think you are right to
> ask for an generic API solution to this issue.  However, I believe we
> only need to determine whether it is an all xff page or an erased page.
> If an upper layer gave a hint that this page is 'known to be written',
> then this could be avoided.  I don't think we have such hints?

Brian
