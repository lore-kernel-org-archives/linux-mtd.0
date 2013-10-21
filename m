Received: from mail-ea0-x232.google.com ([2a00:1450:4013:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYMBt-0003Et-NM
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 20:35:06 +0000
Received: by mail-ea0-f178.google.com with SMTP id a15so3822587eae.9
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2013 13:34:42 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [RESEND][PATCH V2] mtd: bcm47xxpart: detect block aligned Squashfs
 partition
Date: Mon, 21 Oct 2013 22:34:37 +0200
Message-Id: <1382387677-22006-1-git-send-email-zajec5@gmail.com>
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

Most of the bcm47xx devices use TRX format for storing kernel and some
partition like Squashfs or JFFS2. This is pretty flexible solution, CFE
(the bootloader) just writes (and later boots) TRX at some hardcoded
place and paritions can vary in the size.

However some devices don't use TRX format. Very recently we have
discovered ZTE H218N that has kernel and rootfs partitions at some
"random" places.

This patch allows Linux find a rootfs partition after installing custom
image with a CFE bootloader.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 9279a91..61213f9 100644
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
+		/* Squashfs on devices not using TRX */
+		if (buf[0x000 / 4] == SQSH_MAGIC) {
+			bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
+					     offset, 0);
+			continue;
+		}
 	}
 
 	/* Look for NVRAM at the end of the last block. */
-- 
1.7.10.4
