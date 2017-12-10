Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eO3PX-0005R6-DP
 for linux-mtd@lists.infradead.org; Sun, 10 Dec 2017 15:21:03 +0000
Received: by mail-wr0-x244.google.com with SMTP id o2so15086329wro.5
 for <linux-mtd@lists.infradead.org>; Sun, 10 Dec 2017 07:20:38 -0800 (PST)
From: Antonio Borneo <borneo.antonio@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Andrew Lunn <andrew@lunn.ch>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Rob Herring <robh@kernel.org>, linux-mtd@lists.infradead.org
Cc: Antonio Borneo <borneo.antonio@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: mchp23k256: propagate return value of spi_sync()
Date: Sun, 10 Dec 2017 16:19:56 +0100
Message-Id: <20171210151956.2053-1-borneo.antonio@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The call to spi_sync() can fail.
Check the return value and propagate it.

Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
---
To: David Woodhouse <dwmw2@infradead.org>
To: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
To: Richard Weinberger <richard@nod.at>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Rob Herring <robh@kernel.org>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/devices/mchp23k256.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 787e9ec7..4c91c0e 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -68,6 +68,7 @@ static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_transfer transfer[2] = {};
 	struct spi_message message;
 	unsigned char command[MAX_CMD_SIZE];
+	int ret;
 
 	spi_message_init(&message);
 
@@ -84,12 +85,16 @@ static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	mutex_lock(&flash->lock);
 
-	spi_sync(flash->spi, &message);
+	ret = spi_sync(flash->spi, &message);
+
+	mutex_unlock(&flash->lock);
+
+	if (ret)
+		return ret;
 
 	if (retlen && message.actual_length > sizeof(command))
 		*retlen += message.actual_length - sizeof(command);
 
-	mutex_unlock(&flash->lock);
 	return 0;
 }
 
@@ -100,6 +105,7 @@ static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct spi_transfer transfer[2] = {};
 	struct spi_message message;
 	unsigned char command[MAX_CMD_SIZE];
+	int ret;
 
 	spi_message_init(&message);
 
@@ -117,12 +123,16 @@ static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	mutex_lock(&flash->lock);
 
-	spi_sync(flash->spi, &message);
+	ret = spi_sync(flash->spi, &message);
+
+	mutex_unlock(&flash->lock);
+
+	if (ret)
+		return ret;
 
 	if (retlen && message.actual_length > sizeof(command))
 		*retlen += message.actual_length - sizeof(command);
 
-	mutex_unlock(&flash->lock);
 	return 0;
 }
 
-- 
2.7.4
