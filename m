Received: from mail-ee0-f43.google.com ([74.125.83.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U83E9-00081N-Eb
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 06:32:26 +0000
Received: by mail-ee0-f43.google.com with SMTP id c50so4042458eek.16
 for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2013 22:32:23 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 2/3] mtd: bcm47xxsflash: keep a reference to the BCMA
 ChipCommon
Date: Wed, 20 Feb 2013 07:32:08 +0100
Message-Id: <1361341929-11153-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1361341929-11153-1-git-send-email-zajec5@gmail.com>
References: <1361341929-11153-1-git-send-email-zajec5@gmail.com>
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

To implement erase and write support we need to "talk" with ChipCommon
BCMA core which serial flash it attached to.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/devices/bcm47xxsflash.c |    2 ++
 drivers/mtd/devices/bcm47xxsflash.h |    6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 155a7ea..e04e2c5 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -70,6 +70,8 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 		break;
 	}
 
+	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
+
 	b47s->window = sflash->window;
 	b47s->blocksize = sflash->blocksize;
 	b47s->numblocks = sflash->numblocks;
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index 7d5654b..1574ea8 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -3,12 +3,18 @@
 
 #include <linux/mtd/mtd.h>
 
+struct bcma_drv_cc;
+
 enum bcm47xxsflash_type {
 	BCM47XXSFLASH_TYPE_ATMEL,
 	BCM47XXSFLASH_TYPE_ST,
 };
 
 struct bcm47xxsflash {
+	union {
+		struct bcma_drv_cc *bcma_cc;
+	};
+
 	enum bcm47xxsflash_type type;
 
 	u32 window;
-- 
1.7.10.4
