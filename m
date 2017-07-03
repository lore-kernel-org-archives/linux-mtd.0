Date: Mon, 3 Jul 2017 13:54:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: nand: mtk: release lock on error path
Message-ID: <20170703104858.2226i5bmcvnhhy2x@mwanda>
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

We only want to hold the lock on the success path, not this error path.

Fixes: 7ec4a37c5d71 ("mtd: nand: mediatek: add support for different MTK NAND FLASH Controller IP")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index f38e2bb1953e..6c3a4aab0b48 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -273,8 +273,10 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 	mtk_ecc_wait_idle(ecc, op);
 
 	ret = mtk_ecc_config(ecc, config);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&ecc->lock);
 		return ret;
+	}
 
 	if (config->mode != ECC_NFI_MODE || op != ECC_ENCODE) {
 		init_completion(&ecc->done);
