Received: from mail-ea0-x22b.google.com ([2a00:1450:4013:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKWOK-0000oa-Gc
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2013 16:38:45 +0000
Received: by mail-ea0-f171.google.com with SMTP id n15so705232ead.30
 for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2013 09:38:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] mtd: bcm47xxpart: detect Squashfs partition
Date: Fri, 13 Sep 2013 18:38:17 +0200
Message-Id: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
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


Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 9279a91..96f821a 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -32,6 +32,7 @@
 #define ML_MAGIC1			0x39685a42
 #define ML_MAGIC2			0x26594131
 #define TRX_MAGIC			0x30524448
+#define SQSH_MAGIC			0x71736873	/* shsq */
 
 struct trx_header {
 	uint32_t magic;
@@ -167,6 +168,13 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			offset = rounddown(offset + trx->length, blocksize);
 			continue;
 		}
+
+		/* Squashfs */
+		if (buf[0x000 / 4] == SQSH_MAGIC) {
+			bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
+					     offset, 0);
+			continue;
+		}
 	}
 
 	/* Look for NVRAM at the end of the last block. */
-- 
1.7.10.4
