Received: from relmlor4.renesas.com ([210.160.252.174])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pn4yg-0000Mm-T7
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2011 08:00:43 +0000
Received: from relmlir4.idc.renesas.com ([10.200.68.154])
	by relmlor4.idc.renesas.com ( SJSMS)
	with ESMTP id <0LGC007FDBL0P960@relmlor4.idc.renesas.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Feb 2011 17:00:36 +0900 (JST)
Received: from relmlac2.idc.renesas.com ([10.200.69.22])
	by relmlir4.idc.renesas.com ( SJSMS)
	with ESMTP id <0LGC00M7DBKXY8A0@relmlir4.idc.renesas.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Feb 2011 17:00:36 +0900 (JST)
Message-id: <4D5249A1.3090605@renesas.com>
Date: Wed, 09 Feb 2011 17:00:33 +0900
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
MIME-version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 02/11] mtd: m25p80: add support for M25PX64
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mtd/devices/m25p80.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index e4eba6c..e35a370 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -728,6 +728,8 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
 	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },

+	{ "m25px64", INFO(0x207117,  0, 64 * 1024, 128, 0) },
+
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
 	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
-- 
1.7.1
