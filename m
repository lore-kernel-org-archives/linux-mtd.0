Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StzMc-0000rA-ME
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2012 11:02:53 +0000
Received: by wgbez12 with SMTP id ez12so433750wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2012 04:02:42 -0700 (PDT)
Date: Wed, 25 Jul 2012 14:02:33 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
Message-ID: <20120725140233.7dc4ca8a@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE8GMMn+sPu4trUH_iT3=5uh_Of=bsYzXX50E3dyPfKitg@mail.gmail.com>
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
 <20120628213146.7d929204@halley> <4FED6A2E.9010603@parrot.com>
 <20120630230252.58ca6bb4@halley> <4FF15BD1.9010109@parrot.com>
 <CAN8TOE8GMMn+sPu4trUH_iT3=5uh_Of=bsYzXX50E3dyPfKitg@mail.gmail.com>
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

On Mon, 23 Jul 2012 20:53:56 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> Now, I have a separate question:
> Suppose we replace some nand_bbt code with the nand_block_bad code in
> nand_base.c, and we make use of badblockbits to solve the bitflip
> problems I brought up. I still don't see a reason we can't read/write
> with MTD_OPS_PLACE_OOB instead of MTD_OPS_RAW. There is *no*
> difference between these options for most current implementations,
> regarding ECC protecting OOB as remarked previously. But it provides
> only *benefit* for my driver and allows other systems (e.g., docg3,
> docg4) to do the same if desired. So why can't the default
> implementation use both badblockbits and MTD_OPS_PLACE_OOB
> simultaneously?

Well, I can't tell for sure.

But as I'm rethinking this, I'm getting more convinced MTD_OPS_RAW
should be used.
(took me a while to understand Matthieu's arguments...)

1. Factory marked bad blocks

For the blocks factory marked bad, the manufacturers simply state
"read position X in OOB, and if not entirely 0xff - consider the
block bad".
I guess they provide no guarantees regarding the page content in
general, and specifically the ECC part (as they usually don't even
know what ECC layout and algorithm is going to be used).
So applying ECC on the read makes no sense.

2. Blocks that go bad during use

Suppose you had a one system software, with an OOB BBM setup, running
and using the nand chip, and then you boot using a new system software
that uses BBT (hence scans and builds the BBT on first boot).

Usually, the manufacturers state "if erase has failed, software must
mark the block bad".
Suppose software adhere to that recommendation.

Now for those blocks marked bad by 1st system, you have NO guarantees
regarding the content of the block, because the last erase operation
(the one that lead the SW to mark the block bad) did not complete
succesfully.

(BTW, in a recent patch of yours, nand_default_block_markbad attempts to
erase the block PRIOR writing the BBM to the OOB; but this is not a
must on SLC, older linux systems lacked this patch, and obviously even
if we attempt the "last erase prior mark" we have no guarantees that the
last erase will indeed succeed this time)

Point is, again, no guarantees on block content (including OOB portion).
So applying ECC on read, by the second system scanning the nand, makes
no sense (would produce bogus results).

(Also, some software systems even mark the block bad if page-program
operation had failed, probably without erasing it first).


To conclude, MTD_OPS_RAW seems more correct IMO. It is simplistic by
nature, not relying on page content, OOB content or ECC.

As I understand, the motivation using MTD_OPS_PLACE_OOB is to overcome a
false positive condition, where a good block is accidentally considered
bad by the software, due to a bitflip (1 to 0) in the badblockpos.

I guess utilizing badblockbits may provide good coverage to that
condition.

Regards,
Shmulik
