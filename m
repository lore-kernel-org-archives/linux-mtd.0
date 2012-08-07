Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sydum-0002f8-Oy
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2012 07:09:17 +0000
Received: by wibhm11 with SMTP id hm11so1943074wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2012 00:09:14 -0700 (PDT)
Date: Tue, 7 Aug 2012 10:09:07 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
Message-ID: <20120807100907.647005af@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE9fxLbYCc2MeLaqV2WA2ch9Dm9xnyPvY7LBOZ0guB-d0Q@mail.gmail.com>
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
 <20120628213146.7d929204@halley> <4FED6A2E.9010603@parrot.com>
 <20120630230252.58ca6bb4@halley> <4FF15BD1.9010109@parrot.com>
 <CAN8TOE8GMMn+sPu4trUH_iT3=5uh_Of=bsYzXX50E3dyPfKitg@mail.gmail.com>
 <20120725140233.7dc4ca8a@pixies.home.jungo.com>
 <CAN8TOE9fxLbYCc2MeLaqV2WA2ch9Dm9xnyPvY7LBOZ0guB-d0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 6 Aug 2012 15:21:19 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> Hi Shmulik,
> 
> On Wed, Jul 25, 2012 at 4:02 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
> > But as I'm rethinking this, I'm getting more convinced MTD_OPS_RAW
> > should be used.
> > (took me a while to understand Matthieu's arguments...)
> >
> > 1. Factory marked bad blocks
> ...
> > So applying ECC on the read makes no sense.
> 
> Yes, that is understood. But in that case, shouldn't any ECC algorithm
> simply return the raw data, with a -EBADMSG? So we're no worse off
> than with MTD_OPS_RAW mode.

It should, probably.
But I found out that for particular inputs, there's an algorithm that
might incorrectly report EUCLEAN (correctable error) for multibit
errors.

> > 2. Blocks that go bad during use
> >
> > Suppose you had a one system software, with an OOB BBM setup, running
> > and using the nand chip, and then you boot using a new system software
> > that uses BBT (hence scans and builds the BBT on first boot).
> >
> > Usually, the manufacturers state "if erase has failed, software must
> > mark the block bad".
> > Suppose software adhere to that recommendation.
> 
> Just a side, pedantic note: the datasheet specification given doesn't
> specify *how* you mark the block bad. Specifically, it really isn't
> required to be in the OOB area of the bad block. That area was only
> specified for factory-marked bad blocks, and it seems to been extended
> as an established convention in MTD/NAND. It could just as well be
> *only* a flash-based bad block table: hence, the NAND_BBT_NO_OOB_BBM
> option (see include/linux/mtd/bbm.h).

Agreed, well known.
I'm specifically referring to the case SW uses OOB BBM, just to
emphasize the argument regarding no guarantees of the page/oob/ecc
content (where the BBM needs to be placed).

> > (BTW, in a recent patch of yours, nand_default_block_markbad attempts to
> > erase the block PRIOR writing the BBM to the OOB; but this is not a
> > must on SLC, older linux systems lacked this patch, and obviously even
> > if we attempt the "last erase prior mark" we have no guarantees that the
> > last erase will indeed succeed this time)
> 
> I think I understand your point here, but to confirm: you're not
> suggesting that it is *bad* to try to erase before writing BBM, are
> you? I was attempting this as a best-effort to cleanly write BBM, and
> we don't care if the erase actually fails.

No, I have no problem with the attempt to erase.

Again, just arguing that the page/oob/ecc content is unexpected and
as such, applying ECC is meaningless.

I think my 1st argument, regarding the content of factory marked blocks,
is the strongest and most relevant one; I simply tried to think of cases
where BBM is set by SW, and argue that these cases also does not provide
any guarantees that future ECC read on this page will give any
meaningful results.

Regards,
Shmulik
