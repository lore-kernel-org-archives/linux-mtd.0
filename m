Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnwQV-0006oK-J8
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 21:55:26 +0000
Message-Id: <cover.1430430153.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 23:42:33 +0200
Subject: [PATCH 0/3] Minor fix and new Chip IDs for spi-nor.
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, <zajec5@gmail.com>,
 Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>,
 Michal Suchanek <hramrach@gmail.com>, Ben Hutchings <ben@decadent.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>,
 "grmoore@altera.com" <grmoore@altera.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I tried attaching random flash chips with an ICP cable and found that Linux does not have the chip IDs.

Thanks

Michal

Michal Suchanek (3):
  MTD: m25p80: fix write return value.
  MTD: spi-nor: Add Pm25LD020 and GD25Q41B chip ID.
  MTD: spi-nor: add flag to not use sector erase.

 drivers/mtd/devices/m25p80.c  | 2 +-
 drivers/mtd/spi-nor/spi-nor.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.1.4
