Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPgZj-0001XO-Kf
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 23:04:08 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <87bnx9eqel.fsf@nbsps.com> <20140317194658.GD3834@ld-irv-0074>
Date: Mon, 17 Mar 2014 18:55:15 -0400
In-Reply-To: <20140317194658.GD3834@ld-irv-0074> (Brian Norris's message of
 "Mon, 17 Mar 2014 12:46:58 -0700")
Message-ID: <87wqfs8mgc.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Thu, Mar 13, 2014 at 05:32:02PM -0400, Bill Pringlemeir wrote:

>> One issue is that a raw read will never see 'stuck at one' errors.  I
>> believe that Elie had a good diagnosis of the issue,

On 17 Mar 2014, computersforpeace@gmail.com wrote:

> I'm not aware of Elie's diagnosis of 'stuck at one' errors. Perhaps it
> is lost somewhere in the many revisions of Eli's original patch series?

> But I think that's a good point. We can't allow 100% of the
> potentially-correctible flips to be 1->0 flips, since we may see more
> 0->1 flips once we try to program.

Well, that is my point (about 'stuck at one').  Elie's point was just
the need to discern,

 An almost all xff page with errors beyond ECC strength.

vs.

 An erased page with almost all bits xff.

Ie, it is either un-correctable or erased.  Some controllers can detect
all xff, others can't.  However, it seems that even this feature is not
enough as some erase pages can have the 'stuck at zero' bits.  Maybe
that is obvious; but it was a good point for me.

>> For 3.b, the permitted value of bitflips should probably be based on the
>> flash device and not the ECC controller.  If the chip is giving bit
>> flips on an SLC NAND device, do we wish to continue on 3.b?  I believe
>> that maybe only some MLC NAND devices might want to permit this.

> I don't think your belief matches reality ;) I have seen reports from
> users that very much looked like bitflips in an erased page (I didn't
> personally diagnose it), and they were using SLC NAND. I don't think
> that the SLC vs. MLC distinction is really so strong in some of these
> scenarios.

Ok.  But I think that the amount of 'stuck at zero' permitted is most
likely to be flash device based as opposed to controller based.
Probably I am technically wrong about SLC vs MLC.  Just the main point
is it is NAND chip based and not related to the controller.

> Subpage writing is performed within the MTD layer. Do you have any
> examples aside from subpage writes? I really don't know the specifics of
> how UBIFS tries to read blank pages (I think Artem replied pretty
> in-depth to Pekon's UBIFS patches about this; I'll have to re-read), but
> I did not understand them to be in the hot path.

[snip]

> I'm curious: which drivers are you looking at?

> If MTD drivers are doing "subpage" writing by doing read/modify/write,
> that does indeed seem to be rather broken. Or at least, it doesn't seem
> very maintainable in the presence of bitflips like this. Can't subpage
> writes be done where all "unprogrammed" data is assumed to be 0xff? (I'm
> admittedly not very familiar with subpage programming implementations.)

Sub page writing seems to be like this for many Freescale controllers
(the only ones I am familiar with).  I don't think the controllers can
read a partial page.  It must read/write full pages.  As the MTD has no
state about how many sub-pages are written, it does a
'read-modify-write' to ensure that already written data is preserved.
Zero to three sub-pages may have already been written with 2k pages and
512 byte sub-pages chips.

See:
 https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/mxc_nand.c#n1099

I beleive that the 'NAND_CMD_SEQIN' is sent before a
'NAND_CMD_PAGEPROG', by the MTD/nand base.  This will read the page
before programming it so that sub-pages are done correctly.

Also, I have benchmarked them and read performance is about 2x the write
performance.  When I look at the chip data sheet, this didn't seem to
have to be this way.  Optimizing the read performance also increases the
write performance.  In live systems I have, it seems common to read
erased pages with sub-pages enabled and UBI/UbiFs.

This is fine, it increases information on the device and I don't know of
any other way to work around it?  The controller's only read/write full
pages, so it seems that RMW cycle must be done (unless we had cached
them).  Adding a 2nd read with hardware ECC would be painful, beyond
initial boot scanning.  I have benchmarks that seem to indicate this and
in order to do subpages on yet another controller, I did this 'RMW'.  It
led me to comment on Huang Shijie's patches; mainly to try to figure out
what the best practice is.

Unfortunately, the controller tries to correct the erased page when it
is read with HW ECC.  The first few bytes usually have 'ECC strength'
zeros, before it decided that it can not correct it.  Raw reads are the
fool-proof way to tell the difference.. and the only way without
assumptions on the ECC mathematics (and maybe the only way at all?).

Fwiw,
Bill Pringlemeir.
