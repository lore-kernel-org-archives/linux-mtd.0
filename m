Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9JkB-0002k2-JK
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 15:41:24 +0000
Subject: [PATCH 1/4] mtd: cfi_util: add support for switching SST 39VF640xB
	chips into QRY mode
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 22 Oct 2010 17:40:15 +0200
Message-ID: <20101022154015.11097.94660.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: fggs@terra.com.br, zhangyd6@gmail.com, w.sang@pengutronix.de,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_util.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index e503b2c..360525c 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -77,6 +77,13 @@ int __xipram cfi_qry_mode_on(uint32_t base, struct map_info *map,
 	cfi_send_gen_cmd(0x98, 0x5555, base, map, cfi, cfi->device_type, NULL);
 	if (cfi_qry_present(map, base, cfi))
 		return 1;
+	/* SST 39VF640xB */
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, 0x555, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, 0x2AA, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
+	if (cfi_qry_present(map, base, cfi))
+		return 1;
 	/* QRY not found */
 	return 0;
 }
