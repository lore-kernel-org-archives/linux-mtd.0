Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDetQ-0000rO-06
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 20:59:49 +0000
Received: by mail-qg0-x22f.google.com with SMTP id 6so75971439qgy.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Dec 2015 12:59:27 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Stas Sergeev <stsp@list.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2] mtd: spi-nor: wait until lock/unlock operations are ready
Date: Mon, 28 Dec 2015 17:54:51 -0300
Message-Id: <1451336091-8210-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Micron and Numonyx devices, the status register write command
(WRSR), raises a work-in-progress bit (WIP) on the status register.
The datasheets for these devices specify that while the status
register write is in progress, the status register WIP bit can still
be read to check the end of the operation.

This commit adds a wait_till_ready call on lock/unlock operations,
only for these manufacturers. This is needed to prevent applications
from issuing erase or program operations before the unlock operation
is completed.

Reported-by: Stas Sergeev <stsp@list.ru>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
Changes from v1:
 * Simplify style by tail calling spi_nor_wait_till_ready
 
 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7e5051e604b0..835a010d9339 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -481,6 +481,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
+	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -519,7 +520,10 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		return -EINVAL;
 
 	write_enable(nor);
-	return write_sr(nor, status_new);
+	ret = write_sr(nor, status_new);
+	if (ret)
+		return ret;
+	return spi_nor_wait_till_ready(nor);
 }
 
 /*
@@ -533,6 +537,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
+	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -569,7 +574,10 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		return -EINVAL;
 
 	write_enable(nor);
-	return write_sr(nor, status_new);
+	ret = write_sr(nor, status_new);
+	if (ret)
+		return ret;
+	return spi_nor_wait_till_ready(nor);
 }
 
 /*
-- 
2.6.4
