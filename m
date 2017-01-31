Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYalt-0001EN-7g
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 15:55:06 +0000
From: Colin King <colin.king@canonical.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: cqspi: remove redundant dead code on error
 return check
Date: Tue, 31 Jan 2017 15:53:17 +0000
Message-Id: <20170131155317.20106-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Checking for ret < 0 is redundant because a previous check on ret
being non-zero already handles the ret < 0 case. Remove the redundant
code. Found by CoverityScan, CID#1398863, CID#1398864

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 3fb7be8..9f8102d 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -893,7 +893,7 @@ static ssize_t cqspi_write(struct spi_nor *nor, loff_t to,
 	if (ret)
 		return ret;
 
-	return (ret < 0) ? ret : len;
+	return len;
 }
 
 static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
@@ -913,7 +913,7 @@ static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
 	if (ret)
 		return ret;
 
-	return (ret < 0) ? ret : len;
+	return len;
 }
 
 static int cqspi_erase(struct spi_nor *nor, loff_t offs)
-- 
2.10.2
