Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnwQV-0006oF-Ix
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 21:55:26 +0000
Message-Id: <02f7510acb9b6dbb3a5a6cd5bb287762eb4d22c1.1430430153.git.hramrach@gmail.com>
In-Reply-To: <cover.1430430153.git.hramrach@gmail.com>
References: <cover.1430430153.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 15:33:47 +0200
Subject: [PATCH 1/3] MTD: m25p80: fix write return value.
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

The 'retlen' points to a variable representing the number of data bytes
written/read (see include/linux/mtd/mtd.h) by the current invocation of
the function. This variable must be set, not incremented.

v2: clearer commit message

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Acked-by: Marek Vasut <marex@denx.de>
---
 drivers/mtd/devices/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7c8b169..0b2bc21 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -102,7 +102,7 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 
 	spi_sync(spi, &m);
 
-	*retlen += m.actual_length - cmd_sz;
+	*retlen = m.actual_length - cmd_sz;
 }
 
 static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
-- 
2.1.4
