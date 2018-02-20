Received: from mx-ginzinger.sigmacloud.services ([185.154.235.147])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eo35d-0005TS-Jt
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 08:15:55 +0000
From: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Subject: [PATCH] mtd: nand: gpmi: fix edo mode for non fully ONFI compliant
 flashes
To: Han Xu <han.xu@nxp.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Manfred Schlaegl
 <manfred.schlaegl@ginzinger.com>
Message-ID: <2e12a84b-b4cb-f0ff-f3c9-173def6b5bd2@ginzinger.com>
Date: Tue, 20 Feb 2018 09:15:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In enable_edo_mode the timing mode feature is set according to previously
read capabilities of the parameter page ("Timing mode support"). After
the value was set, it is read back to provide a "double-check".
If the "double check" fails, the whole function returns with an error,
which leads to a very slow (non-edo) fallback timing.

The problem here is, that there seem to be some NAND flashes, which are
not fully ONFI 1.0 compliant.
One of these is Winbond W29N04GV. According to datasheet and parameter
page, the flash supports timing mode 4 (edo), but the timing mode feature
is simply missing.

It seems that setting a non-existing feature is simply ignored. The real
problem occurs, when the feature is read back: W29N04GV always delivers
zero, which causes the "double-check" to fail. This leads to very slow
timing and therefore to poor performance.

To solve this, we simply remove the double-check, which is a paranoia
check anyways.

The modification was intensively tested on i.MX6 with linux-4.1, Winbond
W29N04GV and Micron MT29F4G08ABADAH4.

Signed-off-by: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 97787246af41..40fba96df215 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -939,16 +939,9 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 	if (ret)
 		goto err_out;
 
-	/* [2] send GET FEATURE command to double-check the timing mode */
-	memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
-	ret = nand->onfi_get_features(mtd, nand,
-				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
-	if (ret || feature[0] != mode)
-		goto err_out;
-
 	nand->select_chip(mtd, -1);
 
-	/* [3] set the main IO clock, 100MHz for mode 5, 80MHz for mode 4. */
+	/* [2] set the main IO clock, 100MHz for mode 5, 80MHz for mode 4. */
 	rate = (mode == 5) ? 100000000 : 80000000;
 	clk_set_rate(r->clock[0], rate);
 
-- 
2.11.0
