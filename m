Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qvk1C-000235-7T
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 05:59:23 +0000
Received: by ywp17 with SMTP id 17so5023749ywp.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 22:59:19 -0700 (PDT)
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 09:01:05 +0300
In-Reply-To: <CAN8TOE8c7ZoaHs+q76TWALNFZgtrjvNYAsqXphwd7HFUjY5KBw@mail.gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron>
	<CAN8TOE8c7ZoaHs+q76TWALNFZgtrjvNYAsqXphwd7HFUjY5KBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314079272.2645.52.camel@sauron>
Mime-Version: 1.0
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Ivan Djelic <ivan.djelic@parrot.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-22 at 16:42 -0700, Brian Norris wrote:
> On Mon, Aug 22, 2011 at 3:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> >> Does MTD_MODE_RAW imply MTD_OOB_RAW when OOB operations are involved?
> >
> > I would make sure these 2 set of macros have different prefixes.
> > Probably re-naming the internal ones is easier, but I'd anyway re-named
> > the external ones - indeed they are about access mode for a specific
> > file descriptor, so I'd use the "MTD_FILE_MODE_" prefix.
> 
> To be sure, are you categorizing the internal/external modes as follows?
> 
> External = MTD_MODE_NORMAL, MTD_MODE_RAW, etc.
> Internal = MTD_OOB_PLACE, MTD_OOB_AUTO, MTD_OOB_RAW

Yes :-)

> Because my proposal here is to move those Internal ones to becoming a
> new set of External modes for the purpose of the new MEMWRITEDATAOOB.

Right, I was talking about what is in mainline at the moment.

> Finding good names for them makes more sense now than after they
> become External. But as you say, renaming the *current* External modes
> could help clarify things as well.

I think you can re-name any of them nicely - we can always amend
mtd-utils.

> 
> >> Does MTD_MODE_RAW imply that no ECC is applied to data?
> >
> > Not sure, but judging from how it is used - no.
> 
> I see at least one instance of code that seems to assume the answer is
> "yes"; see the "noecc" code in nandwrite.c. Where do you find evidence
> that says "no"?

You are right, this looks like "no ECC" actually.

Well, my cscopes find only 2 places where this symbol is used in the
kernel:

   2    220  drivers/mtd/mtdchar.c <<mtd_read>>
             case MTD_MODE_RAW:
   3    316  drivers/mtd/mtdchar.c <<mtd_write>>
             case MTD_MODE_RAW:

So this is only about reading/writing and nothing else.

Then, let's look at one of them, say 3:

drivers/mtd/mtdchar.c: ret = mtd->write_oob(mtd, *ppos, &ops);

Then find out in nand_base.c that this maps to 'nand_write_oob()',
which, in-turn calls then 'nand_do_write_ops()', and which then calls,
_I guess_:

               ret = chip->write_page(mtd, chip, wbuf, page, cached,
                                       (ops->mode == MTD_OOB_RAW));

which then calls:

chip->ecc.write_page_raw(mtd, chip, buf);

which seems to be the "no ECC" write function.

But I guess MEMWRITEDATAOOB should anyway "override" the "global" mode.

> > I think MEMWRITEDATAOOB should ignore the mode.
> 
> Sure. May be easier said than done though. It looks like there are too
> many entry points into the MTD layer, with different ioctls plus the
> standard read/write controls. I'll see what I can do about keeping
> this under control.

Yeah, it is a mess, I agree :-(

> It looks like going forward, we should agree on something like the
> following, although the names still may change:
> 
> 1) the generic term "raw" mode means that we are writing or reading
> data exactly as-is to/from the flash, without error correction applied
> to it.

Right.

> 2) MTD_OOB_RAW means means that we read or write in raw mode. This can
> be directly user-controlled from the new MEMWRITEDATAOOB ioctl.

OK

> 3) MTD_MODE_RAW is used only with the MTDFILEMODE ioctl, and it *only*
> affects error correction for read() and write() calls to the
> corresponding file descriptor. Its sole purpose is to enable
> MTD_OOB_RAW during standard read/write operations (no OOB
> interaction).

OK

> Unfortunately, item 3 showcases our naming inconsistency, since
> MTD_OOB_RAW is actually utilized for a non-OOB operation. Perhaps this
> should be considered for renaming?

Probably the "OOB" part should go away? Give the "per-file" modes some
other name which suggests that these are old-fashioned and then use
MTD_RW_MODE_ or even just MTD_MODE_ for the "internal" constants?

> Speaking of renaming, I'm not so sure about the name I gave this
> ioctl; which of the following makes the most sense for naming the new
> ioctl? Speak soon or forever hold your peace.
> 1) MEMWRITEDATAOOB
> 2) MEMWRITE
> 3) MEMWRITEOPS
> 4) ...something else?

1 or 2 seems OK to me, but I do not have a strong opinion here.

-- 
Best Regards,
Artem Bityutskiy
