Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbd-0007X3-71
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:10 +0000
Received: by mail-wi0-f177.google.com with SMTP id cc10so339978wib.4
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 16/47] mtd: nand: stm_nand_bch: derive some working variables
 for latter use
Date: Tue, 25 Mar 2014 08:19:33 +0000
Message-Id: <1395735604-26706-17-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few of the working variables can either be taken or derived from
existing knowledge about the connected chip. Rather than attempt to
provide each specification manually, here we make assumptions based
on information already obtained.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 93fe835..f5a3e80 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -783,6 +783,15 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* Derive some working variables */
+	nandi->sectors_per_page = mtd->writesize / NANDI_BCH_SECTOR_SIZE;
+	nandi->blocks_per_device = mtd->size >> chip->phys_erase_shift;
+	nandi->page_shift = chip->page_shift;
+	nandi->block_shift = chip->phys_erase_shift;
+	nandi->extra_addr = ((chip->chipsize >> nandi->page_shift) >
+			     0x10000) ? true : false;
+	mtd->writebufsize = mtd->writesize;
+
 	return 0;
 }
 
-- 
1.8.3.2
