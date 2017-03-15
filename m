Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1co3mr-0001Cp-5B
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 07:56:03 +0000
Date: Wed, 15 Mar 2017 08:55:21 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] mtd: nand: use .read_oob() instead of .cmdfunc() for
 bad block check
Message-ID: <20170315085521.16914ec2@bbrezillon>
In-Reply-To: <CAK7LNAT3dBOHxFUWJ9Tvs7cQ9sAi71RDBHu3MkqJf2LHPQzYZQ@mail.gmail.com>
References: <1489513548-3248-1-git-send-email-yamada.masahiro@socionext.com>
 <20170314215839.1df07d13@bbrezillon>
 <CAK7LNAT3dBOHxFUWJ9Tvs7cQ9sAi71RDBHu3MkqJf2LHPQzYZQ@mail.gmail.com>
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

On Wed, 15 Mar 2017 09:55:13 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> Thanks for your review.
> 
> 2017-03-15 5:58 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Wed, 15 Mar 2017 02:45:48 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> The nand_default_block_markbad() is the default implementation of
> >> chip->block_markbad().  This is called for marking a block as bad.
> >> It invokes nand_do_write_oob(), then calls a higher level accessor
> >> ecc->write_oob().
> >>
> >> On the other hand, when reading BBM from the OOB, chip->block_bad()
> >> is called, and nand_block_bad() is the default implementation.  This
> >> function calls a lower level chip->cmdfunc().  If a driver wants to
> >> re-use nand_block_bad(), it is required to support NAND_CMD_READOOB
> >> in its cmdfunc().  
> >
> > This is part of the basic/mandatory operations that should be supported
> > by all drivers.  
> 
> 
> My main motivation of this patch is to save NAND_CMD_READOOB
> implemenation in cmdfunc().
> 
> 
> Please look at line 1292 of drivers/mtd/nand/denali.c
> 
>         case NAND_CMD_READOOB:
>                 /* TODO: Read OOB data */
>                 break;
> 

Yes, I know, and unfortunately that's not the only driver to partially
implement the set of operation the core assume to be always supported.

> 
> Currently, this driver can not check BBM at all.
> 
> 
> If all drivers should support NAND_CMD_READOOB
> regardless of this patch, my main motivation of this patch will be lost.

Well, I see another reason to move to the ecc->read_oob() approach:
some NAND controllers are protecting the BBM with ECC, if you just use
->cmdfunc(READOOB) + ->read_buf() you don't get this ECC protection.

> 
> 
> >> This is strange.  If the controller supports
> >> optimized read operation and the driver has its own ecc->read_oob(),
> >> it should be able to use it.  
> >
> > I agree with this one. I guess the idea behind this default
> > implementation was to avoid reading the whole OOB area, or maybe this
> > function was implemented before we had ECC support. Anyway, the
> > overhead should be negligible with your approach.
> >  
> >> Besides, NAND_CMD_READOOB (0x50) is
> >> not a real command for large page devices.  So, recent drivers may
> >> not be happy to handle this command.  
> >
> > Well, that's the whole problem with the ->cmdfunc() hook, even if it's
> > passed raw NAND command identifiers, these are actually encoding NAND
> > operations, and not necessarily the exact command that should be sent to
> > the NAND.  
> 
> 
> I was misunderstanding this.
> 
> If operations are hooked by higher level accessors
> and some low-level commands never get chance to be executed,
> I thought I need not implement them.

That's true for some of them (for example ->onfi_set/get_features()),
but there's no clear rule saying which commands have to be supported in
->cmdfunc() and which one can be implemented as high-level hooks.

Most of the time, I recommend to implement ->cmd_ctrl() and rely on the
default ->cmdfunc() implementation, so that, each time a new feature
(support for a new NAND operation) is added to the core your driver will
support it natively.

I know some controllers are not fitting so well in this model, but most
of them do.

> 
> > See what's done in nand_command_lp(), and how some commands are
> > actually generating a sequence of 2 commands [1], or how
> > NAND_CMD_READOOB is transformed into NAND_CMD_READ0 [2].  
> 
> So, what should I do for denali.c?
> 
> Maybe, copy the most logic of nand_command_lp() into denali_cmdfunc()?

Ideally, get rid of denali_cmdfunc() and implement denali_cmd_ctrl(),
but I'm not sure how feasible this is.

> 
> 
> 
> >>       if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> >>               ofs += mtd->erasesize - mtd->writesize;
> >> @@ -364,30 +364,26 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
> >>       page = (int)(ofs >> chip->page_shift) & chip->pagemask;
> >>
> >>       do {
> >> -             if (chip->options & NAND_BUSWIDTH_16) {
> >> -                     chip->cmdfunc(mtd, NAND_CMD_READOOB,
> >> -                                     chip->badblockpos & 0xFE, page);
> >> -                     bad = cpu_to_le16(chip->read_word(mtd));
> >> -                     if (chip->badblockpos & 0x1)
> >> -                             bad >>= 8;
> >> +             res = chip->ecc.read_oob(mtd, chip, page);
> >> +             if (!res) {
> >> +                     bad = chip->oob_poi[chip->badblockpos];  
> >
> > Hm, even if the current code is only testing one byte, I wonder
> > if we shouldn't test the 2 bytes here when we're dealing with 16bits
> > NANDs.  
> 
> 
> 
> I was not quite sure about this, so I tried my best
> to keep the current behavior.

I'll check in the ONFI spec.

> 
> 
> 
> >>
> >> -             if (likely(chip->badblockbits == 8))
> >> -                     res = bad != 0xFF;
> >> -             else
> >> -                     res = hweight8(bad) < chip->badblockbits;
> >> -             ofs += mtd->writesize;
> >> -             page = (int)(ofs >> chip->page_shift) & chip->pagemask;
> >> +             if (!ret)
> >> +                     ret = res;  
> >
> > Hm, I'm not sure I understand what you're doing here. If res is != 0,
> > then an error occurred when reading the OOB area and you should
> > probably return the error code directly instead of trying to read the
> > OOB from next page. On the other hand, if res is 0, then ret will
> > always be 0, so I don't think this extra ret variable is needed.  
> 
> My understanding of NAND_BBT_SCAN2NDPAGE is,
> if at least one page can be read as bad,
> the corresponding block should be assumed bad.
> 
> So, I tried to save this case:
>    1st loop fails to execute chip->ecc.read_oob()
>    2nd loop succeeds, and the page is marked as bad.
> 
> 
> nand_default_block_markbad() does a similar thing; it continues
> even if the first loop fails.
> 
> 
> If this is a over-care, the code can be more simplified.

Actually, I think this is the opposite. Hiding the fact ->read_oob()
failed sounds dangerous to me. If we don't return directly we should at
least have an error message.

> 
> 
> 
> >> +
> >> +             page++;
> >>               i++;
> >> -     } while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
> >> +     } while (chip->bbt_options & NAND_BBT_SCAN2NDPAGE && i < 2);  
> >
> > A for loop would probably make more sense here, but that's just a
> > detail.
> >  
> 
> I just chose less-invasive approach.
> I do not have a strong opinion about this.

Yep, as I said, I'm just nitpicking, but I think the loop would be
clearer with a for loop.

> 
> 
> >[3]https://github.com/bbrezillon/linux-sunxi/blob/nand-core-rework-v2/include/linux/mtd/nand2.h  
> 
> 
> Is this related to your talk in ELCE 2016?

Yep.

> http://events.linuxfoundation.org/sites/events/files/slides/brezillon-nand-framework.pdf
> 
> 
> Unfortunately I could not attend the last ELCE,
> but I just skimmed over your slides, and your work looks exciting.

As I said at the end of the talk, any help is welcome, so, if you feel
your denali driver could benefit from this approach and you have time,
don't hesitate to work on it.

Regards,

Boris
