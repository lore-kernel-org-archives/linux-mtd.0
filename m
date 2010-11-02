Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDF0a-00083u-Ph
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 11:26:34 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] mtd: onenand: add cache program feature for 4kb page
	onenand
Date: Tue,  2 Nov 2010 13:25:27 +0200
Message-Id: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement cache program feature for 4KB page onenand.
This feature improves the write data performance.
The observed 128KB data program speed change is
from 8827KB/s to 14156 KB/s when the feature is enabled.

Roman Tereshonkov (3):
  mtd: onenand: add option and variable for cache program feature
  mtd: onenand: introduce not "real" commands for cache program
    feature.
  mtd: onenand: implement cache program feature for 4kb page onenand

 drivers/mtd/onenand/omap2.c        |   12 ++++++++--
 drivers/mtd/onenand/onenand_base.c |   39 ++++++++++++++++++++++++++++++++++-
 include/linux/mtd/onenand.h        |   12 +++++++++++
 include/linux/mtd/onenand_regs.h   |    2 +
 4 files changed, 60 insertions(+), 5 deletions(-)
