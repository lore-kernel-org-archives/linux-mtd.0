Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTtRM-0007Yj-FG
 for linux-mtd@lists.infradead.org; Sat, 29 Mar 2014 13:36:53 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 0/3] mtd: nand: introduce a READMODE command
Date: Sat, 29 Mar 2014 14:36:21 +0100
Message-Id: <1396100184-7110-1-git-send-email-gsi@denx.de>
Cc: Gerhard Sittig <gsi@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

this series does some minor cleanup in nand_command_lp() and then
introduces a NAND_CMD_READMODE opcode which is similar to the existing
NAND_CMD_READ0 but does not imply NAND_CMD_READSTART

such a READMODE command is useful in preparation of the pending
introduction of on-die-ECC support

I'd happily squash all the parts into a single patch if you feel that
the preparatory steps are too tiny to stand alone

while the code changes are straight forward, the respective comments
might be worth improving -- though I would not know how exactly, so
feedback on this aspect is very welcome


Gerhard Sittig (3):
  mtd: nand: comment update, the DEPLETE1 command has gone
  mtd: nand: re-introduce command bits masking
  mtd: nand: introduce a READMODE command

 drivers/mtd/nand/nand_base.c |   14 +++++++++++---
 include/linux/mtd/nand.h     |   11 +++++++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

-- 
1.7.10.4
