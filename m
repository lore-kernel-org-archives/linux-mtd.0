Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TL8PY-0000U0-QZ
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 08:10:01 +0000
Message-ID: <50728A5E.3020102@parrot.com>
Date: Mon, 8 Oct 2012 10:10:06 +0200
From: =?UTF-8?B?R3LDqWdvciBCb2lyaWU=?= <gregor.boirie@parrot.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: m25p80: fix missing MTD module owner
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marek,

Sorry about that. I didn't really mean to submit an official patch at
first...
Nevermind, please find one just below.

Regards,
gregor

---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1924d24..06beb3f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -873,6 +873,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	else
 		flash->mtd.name = dev_name(&spi->dev);
 +	flash->mtd.owner = THIS_MODULE;
 	flash->mtd.type = MTD_NORFLASH;
 	flash->mtd.writesize = 1;
 	flash->mtd.flags = MTD_CAP_NORFLASH;
-- 
1.7.4.1
