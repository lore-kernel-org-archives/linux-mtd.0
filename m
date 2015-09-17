Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZchRC-0000Zo-4R
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 22:13:56 +0000
Received: by wiclk2 with SMTP id lk2so41823121wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2015 15:13:29 -0700 (PDT)
Sender: Luis de Bethencourt <bethencourt@gmail.com>
From: Luis de Bethencourt <luis@debethencourt.com>
Date: Fri, 18 Sep 2015 00:13:28 +0200
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Uwe =?unknown-8bit?B?S2xlaW5lLUvDg8K2bmln?= <u.kleine-koenig@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Baruch Siach <baruch@tkos.co.il>,
 "Koul, Vinod" <vinod.koul@intel.com>,
 Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] mtd: mxc_nand: Fix module autoload for OF platform driver
Message-ID: <20150917221328.GA9291@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This platform driver has a OF device ID table but the OF module
alias information is not created so module autoloading won't work.

Signed-off-by: Luis de Bethencourt <luisbg@osg.samsung.com>
---
 drivers/mtd/nand/mxc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 2426db8..ab281b6 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1458,6 +1458,7 @@ static const struct of_device_id mxcnd_dt_ids[] = {
 	},
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
 
 static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
 {
-- 
2.4.6
