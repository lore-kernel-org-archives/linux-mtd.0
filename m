Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrB31-0002Op-B9
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 20:40:48 +0000
Received: by pabla5 with SMTP id la5so39527286pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 13:40:26 -0700 (PDT)
Date: Tue, 27 Oct 2015 13:40:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Clay McClure <clay@daemons.net>
Cc: Ray Jui <rjui@broadcom.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
Message-ID: <20151027204023.GV13239@google.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
 <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
 <20151026181430.GA13239@google.com> <562E7667.5050406@broadcom.com>
 <CAOVqfW8g2w=u8fO5GTa=5Hw_OOPS6NcGFg3TiLbCPny14id0VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOVqfW8g2w=u8fO5GTa=5Hw_OOPS6NcGFg3TiLbCPny14id0VQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm not sure I can properly answer all of Ray's questions, but I'll try
to come back to them. There is at least one wrong statement here to
correct, and perhaps that can help inform Ray before we return to his
questions.

On Mon, Oct 26, 2015 at 01:08:41PM -0700, Clay McClure wrote:
> The bug in read_byte() is due to the fact that it currently assumes
> the host CPU byte order is big-endian (i.e., it always extracts byte 0
> from the high bits of the word).

No, the bug isn't really in read_byte() specifically, and it definitely
isn't about the CPU being big-endian. As I said before, this is
primarily tested on *little* endian MIPS and ARM STB chips.

It appears that on these SoCs, at least, somehow (I have to wave my
hands here; I really don't know why; I can only presume poor HW design)
the PARAMETER_READ command fills the flash cache with big endian -like
data. So when I looked at the parameter page in a register viewer, I'd
see data like this:

FLASH_CACHE[0] = 0x4f4e4649  (i.e., "ONFI")
FLASH_CAHCE[1] = ....

That is, byte[0] is 0x49 ("I"), byte[1] is 0x46 ("F"), byte[2] is 0x4e
("N"), byte[3] is 0x4f ("O"), and so on. That means this data needs to
be byte-swapped before we can push it out of the brcmnand driver. There
are no sideband toggles to reconfigure buses or anything, so the driver
must do the swap on its own. Currently, that is done via ugly word
shifting, but it can be more clearly done with this patch [1]. Note that
this patch [1] just a simple refactoring and does not actually fix
anything. It is just to clarify the logic.

(Incidentally, I believe the above is all correct even for STB
big-endian MIPS too, but I haven't tested.)

> If we continue to use LE APB
> transfers, then I think we can exclude the be32_to_cpu() call from
> Brian's patch.

I don't believe we can safely drop the be32_to_cpu(). That is just a
refactoring of the existing logic. Please stop suggesting ways to break
STB SoCs.

> Converting flash_cache to a byte array I believe is all
> we need to solve the problem with nand_flash_detect_onfi(). That
> function already includes the necessary byte-order conversions for
> big-endian machines.

How we pull data out of our NAND controller core is completely
orthogonal to the data structure contained within that data. i.e., it
has nothing to do with ONFI standards and nand_flash_detect_onfi()'s
byte swapping. It just means we need to get (the right) byte[0] into
byte[0], byte[1] into byte[1], etc.

Thus, the byte-order conversions in nand_flash_detect_onfi() shouldn't
really have much to do with this conversation. They just make sure that
after *we* pull the data out correctly, nand_base interprets it
correctly.

> Brian, I'll test a variation of this patch on our iProc-based
> platforms and report back.

OK, getting testing feedback from an iProc-based system using ONFI would
be somewhat illuminating.

Brian

> Thanks,
> 
> Clay

[1] http://patchwork.ozlabs.org/patch/536148/
