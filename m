Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq5DT-0007VP-0A
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 20:47:20 +0000
Received: by mail-qg0-x235.google.com with SMTP id j35so27032361qge.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2016 13:46:58 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>,
	<linux-leds@vger.kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jacek Anaszewski <j.anaszewski@samsung.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 0/4] LED trigger on MTD activity
Date: Tue, 12 Apr 2016 17:46:38 -0300
Message-Id: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After our recent discussion [1], here's a proper patchset.

The first patch is a minor cleanup which moves mtd_write_oob
out of mtd.h header.

The second patch introduces the LED MTD trigger.

The third patch removes the "nand-disk" LED trigger
from the NAND core.

The fourth patch completes the series by calling ledtrig_mtd_activity
on all MTD I/O activity paths.

Changes from v1:

  * Split the patches, suggested by Boris.

Feedback is welcome!

[1] http://www.spinics.net/lists/linux-leds/msg05906.html

Ezequiel Garcia (4):
  mtd: Uninline mtd_write_oob and move it to mtdcore.c
  leds: trigger: Introduce a MTD (NAND/NOR) trigger
  mtd: nand: Remove the "nand-disk" LED trigger
  mtd: Hook I/O activity to the MTD LED trigger

 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 45 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c              | 19 ++++++++++++++++
 drivers/mtd/nand/nand_base.c       | 29 +-----------------------
 include/linux/leds.h               |  6 +++++
 include/linux/mtd/mtd.h            | 12 +---------
 7 files changed, 81 insertions(+), 39 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

-- 
2.7.0
