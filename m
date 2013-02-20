Received: from mail-ea0-f179.google.com ([209.85.215.179])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U83E7-00081L-Bm
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 06:32:24 +0000
Received: by mail-ea0-f179.google.com with SMTP id d12so3073961eaa.38
 for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2013 22:32:18 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 1/3] mtd: bcm47xxsflash: store info about flash type
Date: Wed, 20 Feb 2013 07:32:07 +0100
Message-Id: <1361341929-11153-1-git-send-email-zajec5@gmail.com>
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

It's going to be needed for erase and write operations, they differ
between Atmel and ST flashes.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/devices/bcm47xxsflash.c |    9 +++++++++
 drivers/mtd/devices/bcm47xxsflash.h |    7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 9526628..155a7ea 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -61,6 +61,15 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	}
 	sflash->priv = b47s;
 
+	switch (b47s->bcma_cc->capabilities & BCMA_CC_CAP_FLASHT) {
+	case BCMA_CC_FLASHT_STSER:
+		b47s->type = BCM47XXSFLASH_TYPE_ST;
+		break;
+	case BCMA_CC_FLASHT_ATSER:
+		b47s->type = BCM47XXSFLASH_TYPE_ATMEL;
+		break;
+	}
+
 	b47s->window = sflash->window;
 	b47s->blocksize = sflash->blocksize;
 	b47s->numblocks = sflash->numblocks;
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index ebf6f71..7d5654b 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -3,7 +3,14 @@
 
 #include <linux/mtd/mtd.h>
 
+enum bcm47xxsflash_type {
+	BCM47XXSFLASH_TYPE_ATMEL,
+	BCM47XXSFLASH_TYPE_ST,
+};
+
 struct bcm47xxsflash {
+	enum bcm47xxsflash_type type;
+
 	u32 window;
 	u32 blocksize;
 	u16 numblocks;
-- 
1.7.10.4
