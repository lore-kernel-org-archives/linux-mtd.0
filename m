Received: from mail-eopbgr50129.outbound.protection.outlook.com
 ([40.107.5.129] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7geN-0004o6-ON
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 10:44:09 +0000
From: <marcin.krzeminski@nokia.com>
To: <linux-mtd@lists.infradead.org>
CC: <rfsw-patches@mlist.nokia.com>, <cyrille.pitchen@atmel.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <marek.vasut@gmail.com>
Subject: [PATCH v2 0/3] Introduce die erase command
Date: Fri, 18 Nov 2016 11:42:46 +0100
Message-ID: <1479465769-28276-1-git-send-email-marcin.krzeminski@nokia.com>
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

v2:
- from now die_erase function will call driver->erase hook if present
- fixed case when user want to disable chip erase and do not use die erase

Marcin Krzeminski (3):
  mtd: spi-nor: Add die_cnt field and flags
  mtd: spi-nor: Implement die erase command logic
  mtd: spi-nor: Enable die erase for Micron 1GiB

 drivers/mtd/spi-nor/spi-nor.c | 151 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |   5 ++
 2 files changed, 143 insertions(+), 13 deletions(-)

-- 
2.7.4
