Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSMjR-0007Cc-MY
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 05:15:38 +0000
Received: by pwi8 with SMTP id 8so1151133pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 22:15:35 -0700 (PDT)
Subject: [PATCH 2/2] mtd: fsmc_nand: fix a memory leak
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
In-Reply-To: <1307078050.4167.1.camel@phoenix>
References: <1307078050.4167.1.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 13:15:30 +0800
Message-ID: <1307078130.4167.3.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Viresh Kumar <viresh.kumar@st.com>,
	Linus Walleij <linus.walleij@stericsson.com>,
	Shiraz Hashim <shiraz.hashim@st.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In fsmc_nand_remove, we should call nand_release instead of
mtd_device_unregister to properly free bad block table memory
and bad block descriptor memory.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/fsmc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e9b275a..8a5f1aa 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -822,7 +822,7 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	if (host) {
-		mtd_device_unregister(&host->mtd);
+		nand_release(&host->mtd);
 		clk_disable(host->clk);
 		clk_put(host->clk);
 
-- 
1.7.4.1
