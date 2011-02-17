Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pq2I9-00083Q-Q2
	for linux-mtd@lists.infradead.org; Thu, 17 Feb 2011 11:45:03 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: new option is added to control onenand init unlocking
Date: Thu, 17 Feb 2011 13:44:40 +0200
Message-Id: <1297943082-398-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

New variable skip_initial_unlocking is added to the omap_onenand_platform_data and
new option ONENAND_SKIP_INITIAL_UNLOCKING is added to struct onenand_chip. 
This is used to to skip onenand unlocking when it is initialized.

Roman Tereshonkov (2):
  mtd: onenand: add new option to control initial onenand unlocking
  mtd: omap: add new variable to platform data to control onenand
    unlocking

 arch/arm/plat-omap/include/plat/onenand.h |    1 +
 drivers/mtd/onenand/omap2.c               |    7 +++++--
 drivers/mtd/onenand/onenand_base.c        |    3 ++-
 include/linux/mtd/onenand.h               |    1 +
 4 files changed, 9 insertions(+), 3 deletions(-)
