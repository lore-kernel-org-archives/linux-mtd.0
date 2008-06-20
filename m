Received: from de01egw01.freescale.net ([192.88.165.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K9ejp-0001Kb-Q4
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 11:25:05 +0000
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by de01egw01.freescale.net (8.12.11/az33egw01) with ESMTP id
	m5KB9heZ012390 for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jun 2008 04:09:44 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m5KB9eeM002104
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jun 2008 06:09:42 -0500 (CDT)
From: Chen Gong <g.chen@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] [MTD] m25p80.c code cleanup
Date: Fri, 20 Jun 2008 19:04:41 +0800
Message-Id: <1213959882-12828-2-git-send-email-g.chen@freescale.com>
In-Reply-To: <1213959882-12828-1-git-send-email-g.chen@freescale.com>
References: <1213959882-12828-1-git-send-email-g.chen@freescale.com>
Cc: Chen Gong <g.chen@freescale.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Chen Gong <g.chen@freescale.com>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9632247..aae0d80 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -122,7 +122,7 @@ static inline int write_enable(struct m25p *flash)
 {
 	u8	code = OPCODE_WREN;
 
-	return spi_write_then_read(flash->spi, &code, 1, NULL, 0);
+	return spi_write(flash->spi, &code, 1);
 }
 
 
-- 
1.5.4
