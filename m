Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1corGO-0004AY-PP
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:45:51 +0000
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [RFC 2/6] mtd: spi-nor: change return value of read_xfer and
 write_xfer
Date: Fri, 17 Mar 2017 18:13:52 +0530
Message-ID: <1489754636-21461-3-git-send-email-rahul.bedarkar@imgtec.com>
In-Reply-To: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change return value of read_xfer and write_xfer to allow returning
amount of data transferred and errors as read(2)/write(2) does.

This makes read_xfer/write_xfer inline with read/write hooks.

Inspired-from: Commit 59451e1233bd ("mtd: spi-nor: change return value of read/write")
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 include/linux/mtd/spi-nor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 0be3f86..64b4a54 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -223,9 +223,9 @@ struct spi_nor {
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-	int (*read_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
+	ssize_t (*read_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
 			 u8 *buf, size_t len);
-	int (*write_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
+	ssize_t (*write_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
 			  u8 *buf, size_t len);
 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
-- 
2.6.2
