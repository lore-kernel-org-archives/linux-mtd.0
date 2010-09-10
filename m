Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OuDPb-0005uA-EP
	for linux-mtd@lists.infradead.org; Fri, 10 Sep 2010 23:53:43 +0000
Received: by vws11 with SMTP id 11so3439183vws.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Sep 2010 16:53:42 -0700 (PDT)
MIME-Version: 1.0
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 10 Sep 2010 19:53:22 -0400
Message-ID: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
Subject: linux equivalent of u-boot's "nand scrub" (erasing blocks even when
	OOB says "bad")
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ive come across a situation where it would have been invaluable to
have the ability to "scrub" the nand flash while running linux.
unfortunately, while i can see options to mark blocks as bad, there
doesnt appear to be any ioctls to mark blocks as good.  this applies
both to the userspace api as well as the kernel api.

further, it seems like if (for whatever reason)  the bad block marker
in the oob region got screwed, there is absolutely no way to recover
(when not using a dedicated bbt).  in
drivers/mtd/nand/nand_base.c:nand_erase_nand(), the very first thing
it does is call nand_block_checkbad().  without a bbt, it'll tail into
chip->block_bad and the default nand_block_bad() reads the bad block
marker out of the oob.  but if the oob region has been screwed, the
block will be thought of as bad, and so you're stuck in a loop.  you
cant reset the oob to 0xff because the oob isnt 0xff ...

the logical thing in my mind would be to extend the userspace mtd abi
to allow a "do the erase even if people think it's bad" option.
perhaps MEMSCRUB ?
-mike
