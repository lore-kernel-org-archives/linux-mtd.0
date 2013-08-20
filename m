Received: from mail-db9lp0249.outbound.messaging.microsoft.com
 ([213.199.154.249] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBet3-00028g-8Y
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 05:53:50 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [mtd-utils 0/4] about the SLC/MLC
Date: Tue, 20 Aug 2013 13:48:30 +0800
Message-ID: <1376977714-21767-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch set is just following the kernel changes about the SLC/MLC,
Please see:
  http://lists.infradead.org/pipermail/linux-mtd/2013-August/048160.html

This patch set tries to make the mtd-utils still runs in the _old_ logic
after we changed the code in kernel.

Huang Shijie (4):
  add the MTD_MLCNANDFLASH case
  mtd: mtd-abi: add a helper to detect the nand type
  Use the mtd_type_is_nand_user() to check the nand
  check the MLC nand type

 flash_otp_write.c     |    4 ++--
 include/mtd/mtd-abi.h |    5 +++++
 lib/libmtd.c          |    5 ++++-
 lib/libmtd_legacy.c   |    3 +++
 mtd_debug.c           |    3 +++
 ubi-utils/mtdinfo.c   |    2 +-
 6 files changed, 18 insertions(+), 4 deletions(-)
