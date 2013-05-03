Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY9af-0000kD-KF
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 06:35:39 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 1/4] mtd: add a new field to mtd_info{}
Date: Fri, 3 May 2013 14:21:41 +0800
Message-ID: <1367562104-8955-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1367562104-8955-1-git-send-email-b32955@freescale.com>
References: <1367562104-8955-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to implement the NAND boot for some Freescale's chips, such as
imx23/imx28/imx50/imx6, we use a tool (called kobs-ng) to burn the uboot
and some metadata to nand chip. And the ROM code will use the metadata to
configrate the BCH, and to find the uboot.

The ECC information(ecc step size, ecc strength) which is used to configrate
the BCH is part of the metadata. The kobs-ng can gets the ecc strength from
the sys node /sys/*/ecc_strength now. But it can not gets the ecc step size.

This patch adds a new field to store the ecc step size in mtd_info{}, and
it makes preparation for the next patches.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/mtd.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 183a304..b93035f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -173,6 +173,9 @@ struct mtd_info {
 	/* ECC layout structure pointer - read only! */
 	struct nand_ecclayout *ecclayout;
 
+	/* the ecc step size. */
+	unsigned int ecc_size;
+
 	/* max number of correctible bit errors per ecc step */
 	unsigned int ecc_strength;
 
-- 
1.7.1
