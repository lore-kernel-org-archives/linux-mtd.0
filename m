Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1w1-0005f2-NA
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:03:07 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 05/10] mtd: rawnand: fsmc: Add an SPDX tag to replace the
 license text
Date: Tue, 20 Nov 2018 10:02:34 +0100
Message-Id: <20181120090239.5792-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181120090239.5792-1-boris.brezillon@bootlin.com>
References: <20181120090239.5792-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an SPDX GPL-2.0 tag and update MODULE_LICENSE() to match the
license text.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v3:
- Use GPL-2.0 instead of GPL-2.0+
---
 drivers/mtd/nand/raw/fsmc_nand.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index db5174c336d4..3a4b80a121ad 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ST Microelectronics
  * Flexible Static Memory Controller (FSMC)
@@ -10,10 +11,6 @@
  * Based on drivers/mtd/nand/nomadik_nand.c (removed in v3.8)
  *  Copyright © 2007 STMicroelectronics Pvt. Ltd.
  *  Copyright © 2009 Alessandro Rubini
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>
@@ -1215,6 +1212,6 @@ static struct platform_driver fsmc_nand_driver = {
 
 module_platform_driver_probe(fsmc_nand_driver, fsmc_nand_probe);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Vipin Kumar <vipin.kumar@st.com>, Ashish Priyadarshi");
 MODULE_DESCRIPTION("NAND driver for SPEAr Platforms");
-- 
2.17.1
