Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHqJb-0006U2-6D
 for linux-mtd@lists.infradead.org; Thu, 14 Aug 2014 08:23:19 +0000
Received: by mail-wg0-f49.google.com with SMTP id k14so744528wgh.8
 for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2014 01:22:56 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: bcm47xxpart: find NVRAM partitions in middle blocks
Date: Thu, 14 Aug 2014 10:22:46 +0200
Message-Id: <1408004566-22271-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Old devices used to have NVRAM at the very end of flash and they could
be unaligned (starting at some offset in a block).
In new devices NVRAM can be located quite randomly, however it seems to
always start at the beginning of a block. For example Netgear R6250 has
NVRAM located right after the bootloader, before the kernel partition.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index adfa74c..407a444 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -199,6 +199,13 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 
+		/* New (ARM?) devices may have NVRAM in some middle block */
+		if (buf[0x000 / 4] == NVRAM_HEADER) {
+			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
+					     offset, 0);
+			continue;
+		}
+
 		/* Read middle of the block */
 		if (mtd_read(master, offset + 0x8000, 0x4,
 			     &bytes_read, (uint8_t *)buf) < 0) {
-- 
1.8.4.5
