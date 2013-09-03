Received: from if05-mail-sr03-mia.mta.terra.com ([208.84.243.60])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGzzc-0006O8-Gu
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2013 23:26:44 +0000
Received: from 155.tpn.terra.com (unknown [10.235.200.47])
 by mail-sr03-mia.tpn.terra.com (Postfix) with ESMTP id 03F922002194
 for <linux-mtd@lists.infradead.org>; Tue,  3 Sep 2013 23:26:16 +0000 (UTC)
From: Flavio Silveira <fggs@terra.com.br>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: m25p80: Add support for ESMT F25L32PA
Date: Tue,  3 Sep 2013 20:25:54 -0300
Message-Id: <1378250755-2674-1-git-send-email-fggs@terra.com.br>
In-Reply-To: <n>
References: <n>
Cc: Flavio Silveira <fggs@terra.com.br>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This flashchip is used in D-Link DIR-610 A1 router board 
and maybe several others, yet is not kernel upstream.

So add support for it according to datasheet [0], making it easier
to support other boards using this flashchip in the future.

Changelog v2:
 - Better description
 - Datasheet link at the bottom, similar to other patches.

[0] http://www.esmt.com.tw/DB/manager/upload/F25L32PA.pdf 

Signed-off-by: Flavio Silveira <fggs@terra.com.br>
---
 drivers/mtd/devices/m25p80.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2f3d2a5..3a3cf2d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -731,6 +731,9 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "en25qh256", INFO(0x1c7019, 0, 64 * 1024, 512, 0) },
 
+	/* ESMT */
+	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
+
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
 
-- 
1.7.10.4
