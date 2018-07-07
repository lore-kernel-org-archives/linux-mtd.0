Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbqx3-0003bq-W1
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 17:24:55 +0000
Received: by mail-vk0-x244.google.com with SMTP id y9-v6so8467112vky.3
 for <linux-mtd@lists.infradead.org>; Sat, 07 Jul 2018 10:24:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@bootlin.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 2/2] mtd: rawnand: mxc: Switch to SPDX identifier
Date: Sat,  7 Jul 2018 14:25:21 -0300
Message-Id: <1530984321-29242-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1530984321-29242-1-git-send-email-festevam@gmail.com>
References: <1530984321-29242-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

Adopt the SPDX license identifier headers to ease license compliance
management.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- None. Newly introduced on this version

 drivers/mtd/nand/raw/mxc_nand.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 90cfb5e..48083d0 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1,20 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2004-2007 Freescale Semiconductor, Inc. All Rights Reserved.
  * Copyright 2008 Sascha Hauer, kernel@pengutronix.de
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version 2
- * of the License, or (at your option) any later version.
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
- * MA 02110-1301, USA.
  */
 
 #include <linux/delay.h>
-- 
2.7.4
