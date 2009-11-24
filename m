Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ND2ct-0003SU-DF
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 21:08:44 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/38] move excite_nand_remove to .devexit.text
Date: Tue, 24 Nov 2009 22:06:58 +0100
Message-Id: <1259096853-18909-3-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1259096853-18909-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1259096853-18909-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-2-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	Ming Lei <tom.leiming@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	linux-mtd@lists.infradead.org,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function excite_nand_remove is used only wrapped by __devexit_p so
define it using __devexit.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Ming Lei <tom.leiming@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: David Brownell <dbrownell@users.sourceforge.net>
Cc: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/excite_nandflash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/excite_nandflash.c b/drivers/mtd/nand/excite_nandflash.c
index 72446fb..af6a6a5 100644
--- a/drivers/mtd/nand/excite_nandflash.c
+++ b/drivers/mtd/nand/excite_nandflash.c
@@ -128,7 +128,7 @@ static int excite_nand_devready(struct mtd_info *mtd)
  * The binding to the mtd and all allocated
  * resources are released.
  */
-static int __exit excite_nand_remove(struct platform_device *dev)
+static int __devexit excite_nand_remove(struct platform_device *dev)
 {
 	struct excite_nand_drvdata * const this = platform_get_drvdata(dev);
 
-- 
1.6.5.2
