Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZs-00038B-4e
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:09 +0000
Received: by wevm14 with SMTP id m14so42571910wev.8
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:46 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 06/60] mtd: devices: mtd_dataflash: drop owner assignment
Date: Tue,  3 Mar 2015 22:39:50 +0100
Message-Id: <1425418844-25177-7-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 0099aba..ca5ae8e 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -647,7 +647,6 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 	device->size = nr_pages * pagesize;
 	device->erasesize = pagesize;
 	device->writesize = pagesize;
-	device->owner = THIS_MODULE;
 	device->type = MTD_DATAFLASH;
 	device->flags = MTD_WRITEABLE;
 	device->_erase = dataflash_erase;
-- 
2.2.2
