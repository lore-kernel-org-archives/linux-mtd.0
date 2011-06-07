Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QU5Hq-0002Fg-OC
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 23:02:15 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 0/4] debug, printk cleanup
Date: Tue, 7 Jun 2011 16:01:53 -0700
Message-ID: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches come from discussion at:
http://lists.infradead.org/pipermail/linux-mtd/2011-June/036161.html

They are based on the mtd-2.6 git tree, plus a few of the cleanup
patches already in Artem's l2 git tree.

Note:
The 4th patch adds the __func__ prefix to some print messages that
didn't have them previously. Thus, I'd be fine if the 4th patch is
dropped.

Thanks,
Brian

Brian Norris (4):
  mtd: remove printk's for [kv][mz]alloc failures
  mtd: nand: convert printk() to pr_*()
  mtd: nand: replace DEBUG() with dev_dbg()
  mtd: nand: define pr_fmt() to include __func__ in debug output

 drivers/mtd/cmdlinepart.c         |    3 -
 drivers/mtd/inftlcore.c           |    4 +-
 drivers/mtd/nand/nand_base.c      |   90 ++++++++++++++++++------------------
 drivers/mtd/nand/nand_bbt.c       |   66 +++++++++++---------------
 drivers/mtd/nand/rtc_from4.c      |    1 -
 drivers/mtd/nftlcore.c            |    4 +-
 drivers/mtd/onenand/onenand_bbt.c |    4 +-
 drivers/mtd/ssfdc.c               |   10 +---
 8 files changed, 78 insertions(+), 104 deletions(-)
