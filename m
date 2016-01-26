Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNs9a-0006Ap-3S
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 01:10:43 +0000
Received: by mail-wm0-x22d.google.com with SMTP id r129so85866517wmr.0
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2016 17:10:20 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 25 Jan 2016 17:10:19 -0800
Message-ID: <CA+ZsKJ53E33rWmwv-v=_b8OjHT_20UW7WqD9XhhHJ0aYxJc=cA@mail.gmail.com>
Subject: PMEM, DAX, MTD, and the quest for the Theory of Everything
From: Jared Hulbert <jaredeh@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Matthew Wilcox <matthew.r.wilcox@intel.com>, ross.zwisler@linux.intel.com,
 Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not seeing any traffic connecting MTD, PMEM, and DAX.  Any
discussions I should be aware of?

MTD devices like SPI-NOR and the inevitable spillover into the
embedded market of 3D Xpoint and similar technologies are excluded
from the DAX game.  Considering all the years we spent playing with
XIP in MTD...   well that's what happens when you disengage for
several years.

A few thoughts...

#1 - MTD provides various ways to partition memory semantic devices as
reprogramable ROMs for storage of bootloaders, kernel, rootfs images,
etc.  Does PMEM have anything to learn from this?  Or does the MTD
layer have an opportunity to gain something by using PMEM standards?

#2 - MTD has had an API that allowed direct access (see point() in
struct mtd_info) and block-ish semantic access of persistent memory
devices since, I dunno, before bitkeeper?  Can we hook this up with
DAX?  Read Only should be "trivial" especially if someone else does
it. :)

#3 - There has long been a desire to merge MTD with the block
subsystem with some members of the MTD community.  PMEM seems to
create a precedent for a block interface on a device that isn't
fundamentally block based.  Also the direct_access() in block has been
legitimized with the recent DAX stuff.   Is it time now?

My vision here is to enable Read-Only DAX images of EXT4, AXFS, PRAMFS
on ROM/NOR devices in a standard DAX way.

Thoughts?
