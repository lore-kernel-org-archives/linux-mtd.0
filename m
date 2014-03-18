Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPpyb-00039n-5C
 for linux-mtd@lists.infradead.org; Tue, 18 Mar 2014 09:06:26 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so6947937pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2014 02:06:01 -0700 (PDT)
Date: Tue, 18 Mar 2014 02:05:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC PATCH v2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140318090554.GY31517@norris-Latitude-E6410>
References: <1394803700-29467-1-git-send-email-pekon@ti.com>
 <20140317184130.GA3834@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EAB3DE3@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB3DE3@DBDE04.ent.ti.com>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Frederic HOUR <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 18, 2014 at 06:23:10AM +0000, Pekon Gupta wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >>On Fri, Mar 14, 2014 at 06:58:20PM +0530, Pekon Gupta wrote:
> >>> From: Brian Norris <computersforpeace@gmail.com>
> >>
> >>
> >> *changes v1 -> v2*
> >> Tried optimizing for performance by making following updates
> >>  - *read_data and *read_oob passed as arguments to nand_verify_erased_page()
> >>    to avoid re-reading the page from device chip->ecc.read_page_raw()
> >
> >This is not valid for all drivers. See the 'oob_required' parameter to
> >read_page(). This means that if we can't verify for sure that it's
> >uncorrectable without looking at the OOB, we have to re-read to include
> >the OOB.
> >
> Ok.. But then your v1 patch does not, work as-it-is with OMAP NAND driver.

Why, exactly? What ECC modes did you test? And what did you see?

> I think the problem is same as that of GPMI driver, there is difference in
> Page layout when using ecc.read_page_raw() and ecc.read_page().

Are you sure? omap2.c looks like it either uses nand_base defaults, or
it uses omap_read_page_bch(), which pulls data directly into the data
'buf' -- it doesn't do any major concatenation/rearranging of data. So
at most, I think there would be a small (probably negligible)
inconsistency between the layout that my patch assumes and the layout
that omap2.c uses.

> >>  - if erased-page is detected then clean only read_data
> >>    ?? need to see if OOB cleaning affects file-system metadata like JFFS2 cleanmarker
> >
> >Nak. We must clean both OOB and data buffers if we are doing this
> >"correction". We don't put FS-specific hacks here. I don't know the
> >specifics of JFFS2 cleanmarkers, but JFFS2 should have valid ECC bytes
> >present whenever it expects a (non-raw) read to retain a few 0 bits. Or
> >else it should be using a raw read mode.
> >
> This is important, we cannot just ignore it.
> JFFS2 writes a signature just after erase in oobfree[] area [a], this helps
> to identify that block-erase was completed successfully. Now there are two
> issues here:
> 
> (1) If you count complete spare area (which includes JFFS2 cleanmarker) then
> you would always see more lot of bit-flips > ecc.strength.

That's not a problem with our MTD-layer solution; it's a problem with
JFFS2. After you've programmed anything to the flash (without proper ECC
parity), you cannot expect to ever "correct" data.

> (2) If after detection of erased-page if you memset(OOB, oob, mtd->oobsize)
> Then you are clearing off this JFFS2 marker also, and the JFFS2 FS *may* crib
> (however, I think JFFS2 uses chip->ecc.read_oob_raw() to read OOB, so it
>  Should not be a problem).

It does not use read_oob_raw(). The cleanmarker checks use
mtd_read_oob() with MTD_OPS_AUTO_OOB, which filters down to
nand_do_read_oob() and ecc.read_oob(). So incidentally, it never touches
the code I'm adding, although it would probably be good to add
protection in nand_do_read_oob() as well (which then might cause the
problem you are theorizing).

But here's the crucial point: JFFS2 assumes that drivers do not do error
correction on the spare bytes!!! This is a bad assumption today, and I'm
not really interested in correcting it. If this assumption becomes a
problem, then we have an either-or: either a driver chooses to support
the legacy of JFFS2 (it's already broken in many respects on many NAND),
or it chooses to support erased-page correction.

> - Therefore in my earlier patch [2] I was just counting bit-flips in read_ecc[]
>   *not* read_oob[].

You can't have your cake and eat it too. You're trying to support
intentionally programming bitflips (i.e., the 'cleanmarker') to spare
area, but you're also trying to correct bits in such a page. Pick one.
Or improve the JFFS2 / MTD API so that JFFS2 can communicate when it
does and doesn't want error correction, rather than making assumptions.

> - Also, 'oob_required=1' may not be used by user-space utilities, unless 
>    in specific  conditions like 'nanddump' || 'nandread --raw'.

I don't understand what you're saying here.

>  [...]
> 
> >> +			else {
> >>  				ret = chip->ecc.read_page(mtd, chip, bufpoi,
> >>  							  oob_required, page);
> >> +				/* Check if its an erased-page with bit-flips */
> >> +				if ((chip->options & NAND_ECC_NEED_CHECK_FF) &&
> >> +					mtd->ecc_stats.failed - ecc_failures) {
> >> +					ret = nand_verify_erased_page(mtd, chip,
> >> +							bufpoi, chip->oob_poi);
> >
> >You have corrupted my patch so that now it does not handle the subpage
> >case.
> >
> I think handling sub-page reads should be handled separately, because using
> chip->ecc.read_page_raw() when sub-page is enabled, may not be a good.

Why not? nand_do_read_ops() is written so that it can handle either
full- or sub-page reads, so there doesn't seem to be a fundamental
limitation.


> [...]
> 
> >
> >Anyway, I have already heard comments from several people (including
> >you), but you have only addressed some of them in your version of my
> >patch. Please, let me send my own patches, and you can provide your
> >feedback there.
> >
> Yes for sure.. I was just trying to show the changes which worked for
> OMAP NAND. I had anyways reverted the changes, NAKed by you,
> before taking the performance numbers.

But why did you say you were reporting numbers for [2], when I nak'd it?

> However, lets first get this working for all other drivers as well.
> (And please do pay attention to JFFS2 clean-marker query).

Brian

[2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051585.html
