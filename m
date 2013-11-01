Received: from mail-qe0-x22a.google.com ([2607:f8b0:400d:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vc2Po-0005g4-R2
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 00:16:42 +0000
Received: by mail-qe0-f42.google.com with SMTP id gc15so2227772qeb.29
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2013 17:16:18 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 1 Nov 2013 08:16:18 +0800
Message-ID: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
Subject: [PATCH -next] mtd: nand: omap: fix error return code in
 omap_nand_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, jg1.han@samsung.com, zonque@gmail.com,
 avinashphilip@ti.com, computersforpeace@gmail.com,
 artem.bityutskiy@linux.intel.com, pekon@ti.com, tony@atomide.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/omap2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index ec40b8d..f777250 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1953,7 +1953,8 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.read_page	= omap_read_page_bch;
 		nand_chip->ecc.write_page	= omap_write_page_bch;
 		/* This ECC scheme requires ELM H/W block */
-		if (is_elm_present(info, pdata->elm_of_node, BCH8_ECC) < 0) {
+		err = is_elm_present(info, pdata->elm_of_node, BCH8_ECC);
+		if (err < 0) {
 			pr_err("nand: error: could not initialize ELM\n");
 			goto return_error;
 		}
