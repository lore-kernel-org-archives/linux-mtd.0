From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <galak@codeaurora.org>, <santosh.shilimkar@ti.com>
Subject: [PATCH 2/3] mtd: davinci-nand: add dts property for
 NAND_NO_SUBPAGE_WRITE option
Date: Thu, 20 Mar 2014 19:06:23 +0200
Message-ID: <1395335184-4745-3-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
References: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, Murali Karicheri <m-karicheri2@ti.com>,
 rob@landley.net, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Murali Karicheri <m-karicheri2@ti.com>

After testing NAND flash with ubifs for k2hk-emv board were committed
that flash doesn't support subpage writing, so we can fix it by
adding a property to disable subpage write.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 Documentation/devicetree/bindings/mtd/davinci-nand.txt | 2 ++
 drivers/mtd/nand/davinci_nand.c                        | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
index cfb18ab..50af930 100644
--- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
@@ -53,6 +53,8 @@ Recommended properties :
 				identifier is saved in OOB area. If not present
 				false.
 
+- ti,davinci-nosubpage-write:	disable subpage write for the device
+
 Deprecated properties:
 
 - ti,davinci-ecc-mode:		operation mode of the NAND ecc mode. ECC mode
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 4615d79..3ba058d 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -581,6 +581,9 @@ static struct davinci_nand_pdata
 		    of_property_read_bool(pdev->dev.of_node,
 			"ti,davinci-nand-use-bbt"))
 			pdata->bbt_options = NAND_BBT_USE_FLASH;
+		if (of_property_read_bool(pdev->dev.of_node,
+			"ti,davinci-no-subpage-write"))
+			pdata->options |= NAND_NO_SUBPAGE_WRITE;
 	}
 
 	return dev_get_platdata(&pdev->dev);
-- 
1.8.3.2
