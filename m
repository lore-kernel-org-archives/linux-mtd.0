Received: from mail-eopbgr20092.outbound.protection.outlook.com ([40.107.2.92]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byevT-0007Y1-6I
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:04:31 +0000
From: <marcin.krzeminski@nokia.com>
To: <linux-mtd@lists.infradead.org>
CC: <rfsw-patches@mlist.nokia.com>, <cyrille.pitchen@atmel.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <marek.vasut@gmail.com>
Subject: [PATCH 0/3] Introduce die erase command
Date: Mon, 24 Oct 2016 15:03:31 +0200
Message-ID: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

This series introduce die erase command and new MT25Q00 Micron devices.

Marcin Krzeminski (3):
  mtd: spi-nor: Add die_cnt field and flags
  mtd: spi-nor: Implement die erase command logic
  mtd: spi-nor: Enable die erase for Micron 1GiB

 drivers/mtd/spi-nor/spi-nor.c | 128 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |   5 ++
 2 files changed, 122 insertions(+), 11 deletions(-)

-- 
2.7.4
