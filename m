Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq5os-0006be-Gv
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 18:44:39 +0000
Received: by mail-ie0-f174.google.com with SMTP id at1so6594413iec.5
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 10:44:17 -0800 (PST)
Date: Mon, 9 Dec 2013 10:44:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Leon Pollak <leonp@plris.com>
Subject: Re: Erase error does not mark smth in BBT
Message-ID: <20131209184410.GP27149@ld-irv-0074.broadcom.com>
References: <1885453.87ds9Vg2nc@leonp.plris.com>
 <CAFLxGvyvB_tTsVm1j6H26W+its4+ko8Ug5vmSBk0zRp-t3HGuw@mail.gmail.com>
 <2617855.2mDaZaEr79@leonp.plris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2617855.2mDaZaEr79@leonp.plris.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 05:02:29PM +0200, Leon Pollak wrote:
> On Sunday 08 December 2013 15:43:33 Richard Weinberger wrote:
> > On Sun, Dec 8, 2013 at 10:51 AM, Leon Pollak <leonp@plris.com> wrote:
> > > I am studying the code in nand_base.c
> > > I thought that when erase command ends with an error, the
> > > corresponding block will be marked as bad or in OOB or in BBT or in
> > > both.
> > > I think I walked through the code carefully, but did not find this
> > > BBT/OOB treatment.
> > > 
> > > Please, help me - where is my error?
> > 
> > You're looking at the wrong layer. :-)
> > Look at the users of mtd_block_markbad().
> 
> Yes, I understood my problem - I expected to see the BBT update on 
> erasure failure in the kernel driver.
> But, as I understood after your hint and code study, the BBT update is 
> totally on the "user's" responsibility.
> 
> ---
> So, I went to the mtd-utils package.

The mtd_block_markbad() API is actually still a kernel-internal API, so
Richard was probably pointing you to the few in-kernel users, like UBI
(drivers/mtd/ubi/io.c) and other filesystems (e.g., JFFS2) or
translation layers (NFTL?).

The mtd-utils package may be a worse example, and they aren't actually
used for "regular wear" -- they are mostly for initial flashing and for
debugging. As you notice, flash_erase.c has some flaws (no bad block
marking). But the kernel UBI layer, the JFFS2 filesystem, the nandwrite
utility, and the user-space UBI utilities should be good examples.

> And there I have the similar problem - when looking into the 
> flash_erase.c file I see the following:
> 
> if (mtd_erase(mtd_desc, &mtd, fd, eb) != 0) {
>    sys_errmsg("%s: MTD Erase failure", mtd_device);
>    continue;
> }
> and I was not able to find any usage of mtd_mark_bad.

Correct, flash_erase.c does not automatically mark blocks bad. Perhaps
that would be a good flag to add, similar to nandwrite --markbad.

> Contrary, analyzing the nandwrite.c file, I found that the logic is as 
> following (lines 537-555):
> 1. Try to write block data.
> 2. If failed, try to erase this block.
> 3. If erased failed (EIO) mark the block as bad and restart from (1).

Your step 3 is wrong. If you're using the --markbad option, then this
step is just:

  3. If step (1) failed, mark the block as bad and continue from (1).

(Notice how we only error out if the erase in (2) fails for something
*besides* EIO.)

> ---
> 
> So, here the question comes:
> If the block erasure already failed once (in flash_erase.c) - doesn't 
> this require the BBT update at this point?

Yes, flash_erase.c probably should have the option to automatically mark
failed blocks as bad.

> Why do one need to retry to erase/program it?

nandwrite.c is a separate utility from flash_erase.c. nandwrite.c only
tries to erase a partially-failed write. But then it will still
unconditionally mark the block as bad. It is not retrying the
erase/program.

> AFAIK, most of NAND vendors state that the block once not erased is bad 
> and even if you succeeded to erase it afterwords, it is dangerous to 
> continue to use it.

Yes, very true. AFAICT, flash_erase.c is the only tool that is missing
this aspect, as it does not have a --markbad option.

Brian
