Received: from ns39351.ovh.net ([91.121.21.191])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGvcB-0002Qp-PV
	for linux-mtd@lists.infradead.org; Sat, 05 Dec 2009 14:28:08 +0000
Received: from localhost (87-98-128-90.ovh.net [87.98.128.90])
	by ns39351.ovh.net (Postfix) with ESMTPSA id C7B5D1D287
	for <linux-mtd@lists.infradead.org>;
	Sat,  5 Dec 2009 15:28:00 +0100 (CET)
From: Simon Guinot <sguinot@lacie.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: add support for Macronix MX25L4005A
Date: Sat,  5 Dec 2009 15:28:00 +0100
Message-Id: <1260023280-5224-1-git-send-email-sguinot@lacie.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Simon Guinot <sguinot@lacie.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 8f8c249..ae1bfb2 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -638,6 +638,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "at26df321",  INFO(0x1f4701, 0, 64 * 1024, 64, SECT_4K) },
 
 	/* Macronix */
+	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, 0) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, 0) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
-- 
1.6.3.1
