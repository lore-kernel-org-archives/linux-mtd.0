Received: from mail-ea0-x22d.google.com ([2a00:1450:4013:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJrv6-00016t-C5
 for linux-mtd@lists.infradead.org; Sun, 24 Mar 2013 20:53:37 +0000
Received: by mail-ea0-f173.google.com with SMTP id h14so2129315eak.32
 for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2013 13:53:33 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH V2 1/2] mtd: bcm47xxsflash: implement ChipCommon R/W ops
Date: Sun, 24 Mar 2013 21:53:24 +0100
Message-Id: <1364158404-22627-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1364158291-22591-1-git-send-email-zajec5@gmail.com>
References: <1364158291-22591-1-git-send-email-zajec5@gmail.com>
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

They are needed for erasing/writing. Use a magic pointers and small
functions to preapre code for adding other buses support in the future
(like SSB).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V2: fix typo in commit message
---
 drivers/mtd/devices/bcm47xxsflash.c |   13 +++++++++++++
 drivers/mtd/devices/bcm47xxsflash.h |    2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 18e7761..d1f0dec 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -48,6 +48,17 @@ static void bcm47xxsflash_fill_mtd(struct bcm47xxsflash *b47s)
  * BCMA
  **************************************************/
 
+static int bcm47xxsflash_bcma_cc_read(struct bcm47xxsflash *b47s, u16 offset)
+{
+	return bcma_cc_read32(b47s->bcma_cc, offset);
+}
+
+static void bcm47xxsflash_bcma_cc_write(struct bcm47xxsflash *b47s, u16 offset,
+					u32 value)
+{
+	bcma_cc_write32(b47s->bcma_cc, offset, value);
+}
+
 static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 {
 	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
@@ -62,6 +73,8 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	sflash->priv = b47s;
 
 	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
+	b47s->cc_read = bcm47xxsflash_bcma_cc_read;
+	b47s->cc_write = bcm47xxsflash_bcma_cc_write;
 
 	switch (b47s->bcma_cc->capabilities & BCMA_CC_CAP_FLASHT) {
 	case BCMA_CC_FLASHT_STSER:
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index f22f8c4..fe93daf 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -60,6 +60,8 @@ enum bcm47xxsflash_type {
 
 struct bcm47xxsflash {
 	struct bcma_drv_cc *bcma_cc;
+	int (*cc_read)(struct bcm47xxsflash *b47s, u16 offset);
+	void (*cc_write)(struct bcm47xxsflash *b47s, u16 offset, u32 value);
 
 	enum bcm47xxsflash_type type;
 
-- 
1.7.10.4
