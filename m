Received: from mail-ee0-f44.google.com ([74.125.83.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDC6l-0003zR-J2
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 11:02:04 +0000
Received: by mail-ee0-f44.google.com with SMTP id l10so5409193eei.17
 for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2013 03:02:01 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH V2 2/3] mtd: bcm47xxsflash: store info about flash type
Date: Wed,  6 Mar 2013 12:01:34 +0100
Message-Id: <1362567695-17523-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
References: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
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
index b22df6d..2f9e629 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -63,6 +63,15 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 
 	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
 
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
index 9b79723..1574ea8 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -5,11 +5,18 @@
 
 struct bcma_drv_cc;
 
+enum bcm47xxsflash_type {
+	BCM47XXSFLASH_TYPE_ATMEL,
+	BCM47XXSFLASH_TYPE_ST,
+};
+
 struct bcm47xxsflash {
 	union {
 		struct bcma_drv_cc *bcma_cc;
 	};
 
+	enum bcm47xxsflash_type type;
+
 	u32 window;
 	u32 blocksize;
 	u16 numblocks;
-- 
1.7.10.4
