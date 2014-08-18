Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJRYD-0007G5-Q4
 for linux-mtd@lists.infradead.org; Mon, 18 Aug 2014 18:21:02 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so4205977wiv.17
 for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2014 11:20:38 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH V2] mtd: bcm47xxpart: find NVRAM partitions in middle blocks
Date: Mon, 18 Aug 2014 20:20:27 +0200
Message-Id: <1408386027-12120-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1408004566-22271-1-git-send-email-zajec5@gmail.com>
References: <1408004566-22271-1-git-send-email-zajec5@gmail.com>
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
V2: Ignore last block to avoid having two "nvram" partitions.
---
 drivers/mtd/bcm47xxpart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 035690e..da641ac 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -224,6 +224,16 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 
+		/* New (ARM?) devices may have NVRAM in some middle block. Last
+		 * block will be checked later, so skip it.
+		 */
+		if (offset != master->size - blocksize &&
+		    buf[0x000 / 4] == NVRAM_HEADER) {
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
