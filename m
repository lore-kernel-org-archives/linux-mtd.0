Received: from botnar.kaiser.cx ([176.28.20.183])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fY6F5-00074z-G7
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 08:56:08 +0000
From: Martin Kaiser <martin@kaiser.cx>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2] mtd: rawnand: mxc: remove __init qualifier from
 mxcnd_probe_dt
Date: Wed, 27 Jun 2018 10:52:37 +0200
Message-Id: <1530089557-30918-1-git-send-email-martin@kaiser.cx>
In-Reply-To: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
References: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
potentially be called at any time. After the __init functions are cleaned,
mxcnd_probe_dt is no longer available. Calling it anyway causes a crash.

mxcnd_probe used to be marked as __init, this was removed years ago.
Remove the __init qualifier from from mxcnd_probe_dt as well.

Fixes: 06f2551 ("mtd: remove use of __devinit")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
changes in v2
   - rephrased the commit message
   - added a Fixes: tag

 drivers/mtd/nand/raw/mxc_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 26cef21..90cfb5e 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,7 +1686,7 @@ static const struct of_device_id mxcnd_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
 
-static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
+static int mxcnd_probe_dt(struct mxc_nand_host *host)
 {
 	struct device_node *np = host->dev->of_node;
 	const struct of_device_id *of_id =
@@ -1700,7 +1700,7 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
 	return 0;
 }
 #else
-static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
+static int mxcnd_probe_dt(struct mxc_nand_host *host)
 {
 	return 1;
 }
-- 
2.1.4
