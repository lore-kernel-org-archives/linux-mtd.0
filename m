Received: from smtp5-g21.free.fr ([212.27.42.5])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0CjR-0006Df-MI
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2014 16:08:50 +0000
From: Denis Carikli <denis@eukrea.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCHv3][ 1/2] mtd: nand: mxc_nand: Enforce a minimum mtd_info
 writesize default value.
Date: Mon,  6 Jan 2014 17:02:36 +0100
Message-Id: <1389024157-19279-1-git-send-email-denis@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Denis Carikli <denis@eukrea.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The linux/mtd/mtd.h header has a comment in the
  mtd_info struct definition that says that
  having a writesize of 0 is illegal.

When nand_flash_detect_onfi is called (in the case
  of an ONFI flash), it will call the function
  pointed by read_buf in order to get some parameters
  of the flash chip, including its writesize.

Before decoding the writesize value that was retrived
  with that read, the mxc_nand's mtd_info struct had
  a writesize set to zero.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Eric Bénard <eric@eukrea.com>
Signed-off-by: Denis Carikli <denis@eukrea.com>
---
ChangeLog v2->v3:
New patch in this serie.
---
 drivers/mtd/nand/mxc_nand.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 567a5e5..d4d8d66 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1415,6 +1415,9 @@ static int mxcnd_probe(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 	mtd->name = DRIVER_NAME;
 
+	/* Enforce a minimum writesize */
+	mtd->writesize = 512;
+
 	/* 50 us command delay time */
 	this->chip_delay = 5;
 
-- 
1.7.9.5
