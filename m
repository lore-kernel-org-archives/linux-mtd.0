Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHzMH-0004mD-1z
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 17:30:25 +0000
Received: by mail-wg0-f49.google.com with SMTP id y10so5024376wgg.16
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2014 09:29:59 -0800 (PST)
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 0/2] mtd: nand: add manafacturer specific handling
Date: Mon, 24 Feb 2014 18:29:51 +0100
Message-Id: <1393262993-22040-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is a proposal to add support for manufacturer specific handling of
NAND chips.

Currently the only ones allowed to modify how NAND chips are accessed are
NAND controllers (by modifying the nand_chip callbacks) and NAND core code
(by setting default callbacks when these are not specified by the NAND
controller).

This series adds support for manufacturer/vendor specific handling, which is
particularly useful for read retry implementation that are (at least for
the moment) manufacturer specific.

I know there was a debate on how we should support all these READ RETRY
implementations (see http://permalink.gmane.org/gmane.linux.drivers.mtd/50603),
so please tell if I'm wrong.

Best Regards,

Boris


Boris BREZILLON (2):
  mtd: nand: add manufacturer specific init infrastructure
  mtd: nand: add hynix specific initializer

 drivers/mtd/nand/Makefile     |    2 +-
 drivers/mtd/nand/nand_base.c  |    7 ++
 drivers/mtd/nand/nand_hynix.c |  151 +++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/nand_ids.c   |    3 +-
 include/linux/mtd/nand.h      |    6 ++
 5 files changed, 167 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_hynix.c

-- 
1.7.9.5
