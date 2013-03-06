Received: from mail-ee0-f42.google.com ([74.125.83.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDCbA-0006fL-9Q
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 11:33:30 +0000
Received: by mail-ee0-f42.google.com with SMTP id b47so5413303eek.15
 for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2013 03:33:26 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH V3 1/3] mtd: bcm47xxsflash: keep a reference to the BCMA
Date: Wed,  6 Mar 2013 12:33:17 +0100
Message-Id: <1362569597-14889-1-git-send-email-zajec5@gmail.com>
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

To implement erase and write support we need to "talk" with ChipCommon
BCMA core which serial flash it attached to.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V3: don't use "union" for now
---
 drivers/mtd/devices/bcm47xxsflash.c |    2 ++
 drivers/mtd/devices/bcm47xxsflash.h |    4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 9526628..b22df6d 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -61,6 +61,8 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	}
 	sflash->priv = b47s;
 
+	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
+
 	b47s->window = sflash->window;
 	b47s->blocksize = sflash->blocksize;
 	b47s->numblocks = sflash->numblocks;
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index ebf6f71..e37285e 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -3,7 +3,11 @@
 
 #include <linux/mtd/mtd.h>
 
+struct bcma_drv_cc;
+
 struct bcm47xxsflash {
+	struct bcma_drv_cc *bcma_cc;
+
 	u32 window;
 	u32 blocksize;
 	u16 numblocks;
-- 
1.7.10.4
