Received: from cluster-g.mailcontrol.com ([208.87.233.190])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsAWI-0000gL-U3
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 10:01:00 +0000
Received: from rly28g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
 by rly28g.srv.mailcontrol.com (MailControl) with ESMTP id
 q0VA0rqV013989
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 10:00:57 GMT
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly28g.srv.mailcontrol.com (MailControl) id q0VA0V2n013303
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 10:00:31 GMT
From: Barry Song <Barry.Song@csr.com>
To: Greg Kroah-Hartman <gregkh@suse.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] MTD: NAND: txx9ndfmc: move to use
 platform_devm_request_and_ioremap() helper
Date: Tue, 31 Jan 2012 18:00:02 +0800
Message-ID: <1328004002-24646-4-git-send-email-Barry.Song@csr.com>
In-Reply-To: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: David Woodhouse <dwmw2@infradead.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 linux-mtd@lists.infradead.org, workgroup.linux@csr.com,
 Barry Song <Baohua.Song@csr.com>
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
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/nand/txx9ndfmc.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index c7c4f1d..b285282 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -290,15 +290,11 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 	int i;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
-	struct resource *res;
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
 	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
-	drvdata->base = devm_request_and_ioremap(&dev->dev, res);
+	drvdata->base = platform_devm_request_and_ioremap(dev, 0);
 	if (!drvdata->base)
 		return -EBUSY;
 
-- 
1.7.1



Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
More information can be found at www.csr.com. Follow CSR on Twitter at http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
