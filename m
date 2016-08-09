Received: from mail-pf0-f195.google.com ([209.85.192.195])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXDua-00033z-8F
 for linux-mtd@lists.infradead.org; Tue, 09 Aug 2016 20:46:08 +0000
Received: by mail-pf0-f195.google.com with SMTP id y134so1441319pfg.3
 for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2016 13:45:47 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Jagan Teki <jteki@openedev.com>
Subject: [PATCH 0/6] mtd: spi-nor: Add QPP support
Date: Wed, 10 Aug 2016 02:14:36 +0530
Message-Id: <1470775476-20313-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adding support for 4-wire quad page program(32h)
for supported flash chips.

Jagan Teki (6):
  mtd: spi-nor: Add quad page program support
  mtd: m25p80: Use spi-nor quad page program
  mtd: spi-nor: Enable QPP for macronix parts
  mtd: spi-nor: Enable QPP for micron parts
  mtd: spi-nor: Enable QPP for spansion parts
  mtd: spi-nor: Enable QPP for winbond parts

 drivers/mtd/devices/m25p80.c  |  2 +
 drivers/mtd/spi-nor/spi-nor.c | 87 +++++++++++++++++++++++++------------------
 include/linux/mtd/spi-nor.h   |  2 +
 3 files changed, 54 insertions(+), 37 deletions(-)

-- 
2.7.4
