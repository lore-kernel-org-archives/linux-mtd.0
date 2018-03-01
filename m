Received: from smtp.transmode.se ([31.15.61.139])
 by casper.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erORG-00076k-Gz
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 13:40:09 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 0/3] mtd: fix AMD/Intel flash bugs
Date: Thu,  1 Mar 2018 14:39:38 +0100
Message-Id: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a bug which allows read/write to a erase block currently
erasing.
Also works around a chip bug in Micron 28F00AP30 chips.

Joakim Tjernlund (3):
  cfi_cmdset_0001: Do not allow read/write to suspend erase block.
  cfi_cmdset_0001: Workaround Micron Erase suspend bug.
  cfi_cmdset_0002: Do not allow read/write to suspend erase block.

 drivers/mtd/chips/cfi_cmdset_0001.c | 33 ++++++++++++++++++++++++++++-----
 drivers/mtd/chips/cfi_cmdset_0002.c |  9 ++++++---
 include/linux/mtd/flashchip.h       |  1 +
 3 files changed, 35 insertions(+), 8 deletions(-)

-- 
2.13.6
