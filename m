Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSTNs-00020Z-7m
	for linux-mtd@lists.infradead.org; Mon, 11 Aug 2008 09:08:12 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw01.freescale.net (8.12.11/az33egw01) with ESMTP id
	m7B9892f005927 for <linux-mtd@lists.infradead.org>;
	Mon, 11 Aug 2008 02:08:09 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m7B985aB007178
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Aug 2008 04:08:08 -0500 (CDT)
From: Chen Gong <g.chen@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] [MTD] m25p80.c code cleanup
Date: Mon, 11 Aug 2008 16:59:14 +0800
Message-Id: <1218445155-6238-3-git-send-email-g.chen@freescale.com>
In-Reply-To: <1218445155-6238-2-git-send-email-g.chen@freescale.com>
References: <1218445155-6238-1-git-send-email-g.chen@freescale.com>
	<1218445155-6238-2-git-send-email-g.chen@freescale.com>
Cc: Chen Gong <g.chen@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

code cleanup for m25p80.c

Signed-off-by: Chen Gong <g.chen@freescale.com>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 8fbd1b5..b2b58c1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -134,7 +134,7 @@ static inline int write_enable(struct m25p *flash)
 {
 	u8	code = OPCODE_WREN;
 
-	return spi_write_then_read(flash->spi, &code, 1, NULL, 0);
+	return spi_write(flash->spi, &code, 1);
 }
 
 
-- 
1.5.4
