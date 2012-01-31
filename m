Received: from cluster-g.mailcontrol.com ([208.87.233.190])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsAWB-0000bx-9B
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 10:00:53 +0000
Received: from rly32g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
 by rly32g.srv.mailcontrol.com (MailControl) with ESMTP id
 q0VA0jcr008948
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 10:00:48 GMT
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly32g.srv.mailcontrol.com (MailControl) id q0VA0RoA006213
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 10:00:27 GMT
From: Barry Song <Barry.Song@csr.com>
To: Greg Kroah-Hartman <gregkh@suse.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] GPIO: TEGRA: move to use
 platform_devm_request_and_ioremap() helper
Date: Tue, 31 Jan 2012 18:00:01 +0800
Message-ID: <1328004002-24646-3-git-send-email-Barry.Song@csr.com>
In-Reply-To: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Linus Walleij <linus.walleij@linaro.org>, workgroup.linux@csr.com,
 Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
 Barry Song <Baohua.Song@csr.com>, Erik Gilling <konkers@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Barry Song <Baohua.Song@csr.com>

Signed-off-by: Barry Song <Baohua.Song@csr.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Erik Gilling <konkers@google.com>
---
 drivers/gpio/gpio-tegra.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index bdc2937..118e367 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -355,13 +355,7 @@ static int __devinit tegra_gpio_probe(struct platform_device *pdev)
 		bank->irq = res->start;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Missing MEM resource\n");
-		return -ENODEV;
-	}
-
-	regs = devm_request_and_ioremap(&pdev->dev, res);
+	regs = platform_devm_request_and_ioremap(pdev, 0);
 	if (!regs) {
 		dev_err(&pdev->dev, "Couldn't ioremap regs\n");
 		return -ENODEV;
-- 
1.7.1



Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
More information can be found at www.csr.com. Follow CSR on Twitter at http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
