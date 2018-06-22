Received: from botnar.kaiser.cx ([176.28.20.183])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWNR0-0007Ry-45
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 14:53:14 +0000
From: Martin Kaiser <martin@kaiser.cx>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] mtd: rawnand: mxc: remove __init qualifier from mxcnd_probe_dt
Date: Fri, 22 Jun 2018 16:50:25 +0200
Message-Id: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mxcnd_probe_dt is called from mxcnd_probe, which is not marked as __init.

Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
potentially be called at any time. After the __init functions are cleaned,
mxcnd_probe_dt is no longer available. Calling it anyway causes a crash.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
I hope that my understanding is correct.

In practice, I could not get the kernel to crash, my compiler would
inline mxcnd_probe_dt into mxcnd_probe and ignore the __init.

If I marked mxcnd_probe_dt as noinline, I could trigger a crash as
follows

[root@host ]# echo bb000000.nand > /sys/bus/platform/drivers/mxc_nand/unbind
[root@host ]# echo bb000000.nand > /sys/bus/platform/drivers/mxc_nand/bind
Internal error: Oops - undefined instruction: 0 [#1] ARM
...

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
