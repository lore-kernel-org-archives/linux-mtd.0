Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SyVft-0005zY-68
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2012 22:21:21 +0000
Received: by yenr9 with SMTP id r9so3346860yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 06 Aug 2012 15:21:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120725140233.7dc4ca8a@pixies.home.jungo.com>
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
 <20120628213146.7d929204@halley> <4FED6A2E.9010603@parrot.com>
 <20120630230252.58ca6bb4@halley> <4FF15BD1.9010109@parrot.com>
 <CAN8TOE8GMMn+sPu4trUH_iT3=5uh_Of=bsYzXX50E3dyPfKitg@mail.gmail.com>
 <20120725140233.7dc4ca8a@pixies.home.jungo.com>
Date: Mon, 6 Aug 2012 15:21:19 -0700
Message-ID: <CAN8TOE9fxLbYCc2MeLaqV2WA2ch9Dm9xnyPvY7LBOZ0guB-d0Q@mail.gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Shmulik,

On Wed, Jul 25, 2012 at 4:02 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Mon, 23 Jul 2012 20:53:56 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
>> Now, I have a separate question:
>> Suppose we replace some nand_bbt code with the nand_block_bad code in
>> nand_base.c, and we make use of badblockbits to solve the bitflip
>> problems I brought up. I still don't see a reason we can't read/write
>> with MTD_OPS_PLACE_OOB instead of MTD_OPS_RAW. There is *no*
>> difference between these options for most current implementations,
>> regarding ECC protecting OOB as remarked previously. But it provides
>> only *benefit* for my driver and allows other systems (e.g., docg3,
>> docg4) to do the same if desired. So why can't the default
>> implementation use both badblockbits and MTD_OPS_PLACE_OOB
>> simultaneously?
>
> Well, I can't tell for sure.
>
> But as I'm rethinking this, I'm getting more convinced MTD_OPS_RAW
> should be used.
> (took me a while to understand Matthieu's arguments...)
>
> 1. Factory marked bad blocks
...
> So applying ECC on the read makes no sense.

Yes, that is understood. But in that case, shouldn't any ECC algorithm
simply return the raw data, with a -EBADMSG? So we're no worse off
than with MTD_OPS_RAW mode.

> 2. Blocks that go bad during use
>
> Suppose you had a one system software, with an OOB BBM setup, running
> and using the nand chip, and then you boot using a new system software
> that uses BBT (hence scans and builds the BBT on first boot).
>
> Usually, the manufacturers state "if erase has failed, software must
> mark the block bad".
> Suppose software adhere to that recommendation.

Just a side, pedantic note: the datasheet specification given doesn't
specify *how* you mark the block bad. Specifically, it really isn't
required to be in the OOB area of the bad block. That area was only
specified for factory-marked bad blocks, and it seems to been extended
as an established convention in MTD/NAND. It could just as well be
*only* a flash-based bad block table: hence, the NAND_BBT_NO_OOB_BBM
option (see include/linux/mtd/bbm.h).

> Now for those blocks marked bad by 1st system, you have NO guarantees
> regarding the content of the block, because the last erase operation
> (the one that lead the SW to mark the block bad) did not complete
> succesfully.

(Another side note:)
Right, we can't guarantee the erase, nor can we even 100% guarantee
that the bad block marker writes properly. Instead, my patches have
made attempts to improve flash-based BBT in conjunction with OOB BBMs.
When writing BBM to a true bad block, I think we can only make a best
effort.

> (BTW, in a recent patch of yours, nand_default_block_markbad attempts to
> erase the block PRIOR writing the BBM to the OOB; but this is not a
> must on SLC, older linux systems lacked this patch, and obviously even
> if we attempt the "last erase prior mark" we have no guarantees that the
> last erase will indeed succeed this time)

I think I understand your point here, but to confirm: you're not
suggesting that it is *bad* to try to erase before writing BBM, are
you? I was attempting this as a best-effort to cleanly write BBM, and
we don't care if the erase actually fails.

> To conclude, MTD_OPS_RAW seems more correct IMO. It is simplistic by
> nature, not relying on page content, OOB content or ECC.
>
> As I understand, the motivation using MTD_OPS_PLACE_OOB is to overcome a
> false positive condition, where a good block is accidentally considered
> bad by the software, due to a bitflip (1 to 0) in the badblockpos.
>
> I guess utilizing badblockbits may provide good coverage to that
> condition.

Yes, I agree that badblockbits is a good solution. I'm still not sure
that any of the above arguments really suggest that we *can't* apply
ECC, but for any important case, badblockbits would be more robust. I
think I will look into fleshing out Matthieu's RFC at some point,
unless he's already working on it.

Brian
