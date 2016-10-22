Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxyy3-0007t6-SH
 for linux-mtd@lists.infradead.org; Sat, 22 Oct 2016 16:16:20 +0000
Received: by mail-qt0-x244.google.com with SMTP id g49so4282700qtc.2
 for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2016 09:15:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] mtd: nand: gpmi: disable the clocks on errors
Date: Sat, 22 Oct 2016 14:15:22 -0200
Message-Id: <1477152922-6722-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

We should disable the previously enabled GPMI clocks in the error paths.

Also, when gpmi_enable_clk() fails simply return the error
code immediately rather than jumping to to the 'err_out' label.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 0f68a99..141bd70 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -161,7 +161,7 @@ int gpmi_init(struct gpmi_nand_data *this)
 
 	ret = gpmi_enable_clk(this);
 	if (ret)
-		goto err_out;
+		return ret;
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
 		goto err_out;
@@ -197,6 +197,7 @@ int gpmi_init(struct gpmi_nand_data *this)
 	gpmi_disable_clk(this);
 	return 0;
 err_out:
+	gpmi_disable_clk(this);
 	return ret;
 }
 
@@ -270,7 +271,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 
 	ret = gpmi_enable_clk(this);
 	if (ret)
-		goto err_out;
+		return ret;
 
 	/*
 	* Due to erratum #2847 of the MX23, the BCH cannot be soft reset on this
@@ -308,6 +309,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	gpmi_disable_clk(this);
 	return 0;
 err_out:
+	gpmi_disable_clk(this);
 	return ret;
 }
 
-- 
2.7.4
