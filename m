From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 3/3] memory: atmel-ebi: Add PM ops
Date: Mon, 20 Feb 2017 18:22:02 +0100
Message-Id: <1487611322-12688-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1487611322-12688-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1487611322-12688-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a ->resume() hook to make sure the EBI dev configs are correctly
restored when resuming the platform.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/memory/atmel-ebi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 06a1a136d448..15120cb37cf0 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -506,6 +506,8 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	if (!ebi)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, ebi);
+
 	INIT_LIST_HEAD(&ebi->devs);
 	ebi->caps = match->data;
 	ebi->dev = dev;
@@ -578,10 +580,28 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	return of_platform_populate(np, NULL, NULL, dev);
 }
 
+static int atmel_ebi_resume(struct device *dev)
+{
+	struct atmel_ebi *ebi = dev_get_drvdata(dev);
+	struct atmel_ebi_dev *ebid;
+
+	list_for_each_entry(ebid, &ebi->devs, node) {
+		int i;
+
+		for (i = 0; i < ebid->numcs; i++)
+			ebid->ebi->caps->apply_config(ebid, &ebid->configs[i]);
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(atmel_ebi_pm_ops, NULL, atmel_ebi_resume);
+
 static struct platform_driver atmel_ebi_driver = {
 	.driver = {
 		.name = "atmel-ebi",
 		.of_match_table	= atmel_ebi_id_table,
+		.pm = &atmel_ebi_pm_ops,
 	},
 };
 builtin_platform_driver_probe(atmel_ebi_driver, atmel_ebi_probe);
-- 
2.7.4
