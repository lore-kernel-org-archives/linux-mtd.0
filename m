Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMcqG-0003Ff-8b
 for linux-mtd@lists.infradead.org; Sat, 14 Feb 2015 13:33:08 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/3] mtd: nand: provide a clear separation of chip and
 controller ops
Date: Sat, 14 Feb 2015 14:32:35 +0100
Message-Id: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm pretty sure I'm starting a controversial discussion here, but that's
something I am thinking about for quite a while now, and instead of working
on my own to provide a full solution I thought this would be good to share
my vision and hopefully get feedback from other developers (including
maintainers ;-)).

This patch series is an attempt to define a clear separation between NAND
chip methods (those that are really dependent on the discovered NAND chip),
and NAND controller merhods (those generic enough to access any NAND chip
connected to a NAND controller).

This separation is motivated by several things.

The first one being my current attempt to support MLC chips. These chips
need some extra care (like read-retry or paired pages detection to avoid
any data loss, and obviously other things I'm not yet aware of).
MLC vendors each implement these features in a non standard way,
meaning that NAND core (or, as I see it, vendor specific code) has to fill
those function pointers accordingly.
While the kernel documentation tries to specify which function should be
filled by the controller part, and which one should be filled by NAND core,
providing a clear separation would makes things even clearer.

The second aspect, which IHMO is less important, is that NAND controller
drivers that deal with multiple chips won't have to fill the chip
function each time they add one, and it would even save some space in this
case (though I don't know any board embedding several NAND chips yet :-().

There surely is other pros and cons to this approach, and I'm pretty sure
you will point plenty of them.

I'd like to discuss another thing, not directly related to the controller
ops separation: the automatic assignment of default methods done in by
the core.
I've done a few reviews and worked on a few NAND drivers lately, and I
noticed that a lot of them do not implement the raw access functions
(write/read_page_raw in nand_ecc_ctrl).
It's obviously a bad thing, but that's not my point :-).
Actually they all leave the read/write_page_raw unassigned and let NAND
core assign default values which will obviously not do what's expected
at all.
My point is, maybe we should provide default implementations to all drivers
(export GPL symbols) and let them fill their function pointer instead of
guessing what they want to do.
This way we would easily detect offending drivers and complain before they
can even register a NAND chip.


Now, let's talk about the implementation proposed in this RFC. It's not
complete yet, since the methods in nand_chip are still there (and
assigned to the NAND controller ops one), but my goal is to eventually
remove them.
Anyway, this implies modifying all the drivers and I'm not inclined to do
that until every body has agreed on something.

I've only extracted methods I was pretty sure they were related to the NAND
controller, but there may be other methods that could be moved out (or I
might have wrongly assumed some of them were related to NAND controllers).
Please share your opinion on that point.

The sunxi nand driver has been patched to make use of this new approach and
can be considered as a reference implementation.


That's all I got for now.
I'm waiting for your feedback.

Thanks.

Best Regards,

Boris

Boris Brezillon (3):
  mtd: nand: introduce NAND controller ops
  mtd: nand: export nand_wait so that NAND controller driver can use it
  mtd: nand: sunxi: define NAND controller ops instead of assigning chip
    functions

 drivers/mtd/nand/nand_base.c  | 26 +++++++++++++++++++++++++-
 drivers/mtd/nand/sunxi_nand.c | 15 ++++++++++-----
 include/linux/mtd/nand.h      | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 6 deletions(-)

-- 
1.9.1
