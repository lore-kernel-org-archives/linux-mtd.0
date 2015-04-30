Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnpWv-0005aP-T8
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 14:33:37 +0000
Message-Id: <55132b4496e7fe73f949186c0f140f3e4fd4e2c7.1430403750.git.hramrach@gmail.com>
In-Reply-To: <cover.1430403750.git.hramrach@gmail.com>
References: <cover.1430403750.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 15:33:47 +0200
Subject: [PATCH 1/3] MTD: m25p80: fix write return value.
To: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
  Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
  Huang Shijie <b32955@freescale.com>, Michal Suchanek <hramrach@gmail.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Ben Hutchings <ben@decadent.org.uk>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Mika Westerberg <mika.westerberg@linux.intel.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The size of written data was added to user supplied value rather than
written at the provided address.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
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
