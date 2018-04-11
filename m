Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f65xk-0002Nv-RW
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2018 02:58:22 +0000
Received: by mail-pl0-x242.google.com with SMTP id t20-v6so296841ply.9
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 19:58:08 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] mtd: nand: diskonchip: Replace mdelay with usleep_range in
 doc_probe
Date: Wed, 11 Apr 2018 10:57:57 +0800
Message-Id: <1523415477-2850-1-git-send-email-baijiaju1990@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

doc_probe() is never called in atomic context.

doc_probe() is only called by init_nanddoc(), which is only set as 
a parameter of module_init().
This function is not called in atomic context.

Despite never getting called from atomic context, doc_probe()
calls mdelay() to busily wait.
This is not necessary and can be replaced with usleep_range() to
avoid busy waiting.

This is found by a static analysis tool named DCNS written by myself.
And I also manually check it.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/mtd/nand/diskonchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index c3aa53c..2679bc4 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1482,12 +1482,12 @@ static int __init doc_probe(unsigned long physadr)
 		WriteDOC(tmp, virtadr, Mplus_DOCControl);
 		WriteDOC(~tmp, virtadr, Mplus_CtrlConfirm);
 
-		mdelay(1);
+		usleep_range(1000, 2000);
 		/* Enable the Millennium Plus ASIC */
 		tmp = DOC_MODE_NORMAL | DOC_MODE_MDWREN | DOC_MODE_RST_LAT | DOC_MODE_BDECT;
 		WriteDOC(tmp, virtadr, Mplus_DOCControl);
 		WriteDOC(~tmp, virtadr, Mplus_CtrlConfirm);
-		mdelay(1);
+		usleep_range(1000, 2000);
 
 		ChipID = ReadDOC(virtadr, ChipID);
 
-- 
1.9.1
