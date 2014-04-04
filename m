Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW2Zn-00071D-Vz
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 11:46:28 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/3] mtd: nand: introduce a READMODE command
Date: Fri,  4 Apr 2014 13:45:45 +0200
Message-Id: <1396611948-4523-1-git-send-email-gsi@denx.de>
Cc: Alexander Shiyan <shc_work@mail.ru>, David Mosberger <davidm@egauge.net>,
 Gerhard Sittig <gsi@denx.de>, Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
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

changes in v2:
- apply command bit masking in nand_command() as well, such that all
  cmdfunc() variants can accept all defined NAND commands
- reword the command bit masking comments and align their versions in
  the large page and non-large page cases
- rephrase the NAND_CMD_READMODE declaration to better reflect that it
  re-uses the NAND_CMD_READ0 opcode
- update commit messages, mention that for nand_command() the READMODE
  and READ0 commands result in identical behaviour, because there is no
  READSTART involved

Gerhard Sittig (3):
  mtd: nand: comment update, the DEPLETE1 command has gone
  mtd: nand: re-introduce command bits masking
  mtd: nand: introduce a READMODE command

 drivers/mtd/nand/nand_base.c |   23 ++++++++++++++++++-----
 include/linux/mtd/nand.h     |   11 +++++++++++
 2 files changed, 29 insertions(+), 5 deletions(-)

-- 
1.7.10.4
