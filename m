Received: from mordell.elzevir.fr ([92.243.3.74])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDsXA-0005lV-G7
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 11:33:45 +0000
From: =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
To: kamlakant.patel@broadcom.com
Cc: gregkh@linuxfoundation.org, manonuevo@micron.com,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
Subject: [PATCH 2/4] staging: mt29f: fix unchecked malloc()
Date: Tue, 29 Dec 2015 12:32:20 +0100
Message-Id: <1451388742-22964-2-git-send-email-mpg@elzevir.fr>
In-Reply-To: <1451388742-22964-1-git-send-email-mpg@elzevir.fr>
References: <1451388742-22964-1-git-send-email-mpg@elzevir.fr>
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

The pointer is unconditionally dereferenced a few lines later, we need to make
sure it isn't NULL.

Signed-off-by: Manuel Pégourié-Gonnard <mpg@elzevir.fr>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index dc2b1fc995c2..c4a3236dd566 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -483,8 +483,11 @@ static int spinand_program_page(struct spi_device *spi_nand,
 #ifdef CONFIG_MTD_SPINAND_ONDIEECC
 	unsigned int i, j;
 
-	enable_read_hw_ecc = 0;
 	wbuf = devm_kzalloc(&spi_nand->dev, CACHE_BUF, GFP_KERNEL);
+	if (!wbuf)
+		return -ENOMEM;
+
+	enable_read_hw_ecc = 0;
 	spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
 
 	for (i = offset, j = 0; i < len; i++, j++)
-- 
2.6.4
