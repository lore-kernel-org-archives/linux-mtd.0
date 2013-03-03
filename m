Received: from svenfoo.org ([82.94.215.22] helo=mail.zonque.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCGFb-0001QF-Fj
 for linux-mtd@lists.infradead.org; Sun, 03 Mar 2013 21:15:20 +0000
From: Daniel Mack <zonque@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: devices: elm: check for device's presence before
 configuration
Date: Sun,  3 Mar 2013 22:12:58 +0100
Message-Id: <1362345178-12536-1-git-send-email-zonque@gmail.com>
Cc: dwmw2@infradead.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Daniel Mack <zonque@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case the driver is not probed - due to config mismatches or errors
in the DTS files - dev_get_drvdata() returns NULL, leading to an Ooops
during boot. Better bail out with a warning in such cases.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Cc: Philip Avinash <avinashphilip@ti.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/elm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 2ec5da9..a9b6d04 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -86,6 +86,11 @@ void elm_config(struct device *dev, enum bch_ecc bch_type)
 	u32 reg_val;
 	struct elm_info *info = dev_get_drvdata(dev);
 
+	if (!info) {
+		dev_err(dev, "Unable to configure elm - device not probed?\n");
+		return;
+	}
+
 	reg_val = (bch_type & ECC_BCH_LEVEL_MASK) | (ELM_ECC_SIZE << 16);
 	elm_write_reg(info, ELM_LOCATION_CONFIG, reg_val);
 	info->bch_type = bch_type;
-- 
1.8.1.4
