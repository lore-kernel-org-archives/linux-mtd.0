Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VslRu-0007Di-4N
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 03:35:58 +0000
Received: by mail-bk0-f49.google.com with SMTP id my13so2622567bkb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 19:35:36 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Dec 2013 11:35:35 +0800
Message-ID: <CAPgLHd9khk_3eTMTVjgGA5f3=6=PTcUiuhf8Pxb0E_H75-4GCw@mail.gmail.com>
Subject: [PATCH] mtd: mxc_nand: add missing clk_disable_unprepare() in
 mxcnd_remove()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, grant.likely@linaro.org,
 robh+dt@kernel.org, m.grzeschik@pengutronix.de,
 thierry.reding@avionic-design.de, schneider@at.festo.com,
 michael.opdenacker@free-electrons.com, jg1.han@samsung.com,
 artem.bityutskiy@linux.intel.com, fabio.estevam@freescale.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

clock source is prepared and enabled by clk_prepare_enable() in
mxcnd_probe() function, but no disable/unprepare in mxcnd_remove().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/mxc_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 7a4e032..567a5e5 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1577,6 +1577,8 @@ static int mxcnd_remove(struct platform_device *pdev)
 	struct mxc_nand_host *host = platform_get_drvdata(pdev);
 
 	nand_release(&host->mtd);
+	if (host->clk_act)
+		clk_disable_unprepare(host->clk);
 
 	return 0;
 }
