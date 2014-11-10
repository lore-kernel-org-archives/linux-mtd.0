Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnrJh-0005nh-Bl
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 15:55:46 +0000
From: alison_chaiken@mentor.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: m25p80, spi-nor: Spansion S25FL132K plus fixup
Date: Mon, 10 Nov 2014 16:54:52 +0100
Message-Id: <1415634895-3082-1-git-send-email-alison_chaiken@mentor.com>
Cc: shijie8@gmail.com, computersforpeace@gmail.com, ben@decadent.org.uk,
 alison_chaiken@mentor.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alison Chaiken <alison_chaiken@mentor.com>

Add support for new chip and fix-up differences between spi_nor_ids
and m25p_ids created by a5b7616c "mtd: m25p80,spi-nor: Fix module
aliases for m25p80".

Alison Chaiken (1):
  MTD: m25p80: fix inconsistency in m25p_ids compared to spi_nor_ids

Knut Wohlrab (1):
  mtd: m25p80: Add support for serial flash Spansion S25FL132K

 drivers/mtd/devices/m25p80.c  | 10 ++++------
 drivers/mtd/spi-nor/spi-nor.c |  1 +
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.1.1
