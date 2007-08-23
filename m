Received: from fk-out-0910.google.com ([209.85.128.184])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOMb8-0002X3-Pr
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 20:00:24 -0400
Received: by fk-out-0910.google.com with SMTP id 19so996925fkr
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 17:00:21 -0700 (PDT)
Resent-Message-ID: <200708240148.56168.jesper.juhl@gmail.com>
Message-Id: <7ce3fff85ac7859141ad1035c6c037dffeec9b66.1187912217.git.jesper.juhl@gmail.com>
In-Reply-To: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Fri, 24 Aug 2007 01:50:33 +0200
Subject: [PATCH 07/30] mtd: Get rid of pointless cast of kzalloc() return
	value in AT26xxx driver
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Jesper Juhl <jesper.juhl@gmail.com>,
	Hans J Koch <hjk@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kzalloc() returns a void pointer - no need to cast it in
 drivers/mtd/devices/at91_dataflash26.c::add_dataflash()

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---
 drivers/mtd/devices/at91_dataflash26.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/at91_dataflash26.c b/drivers/mtd/devices/at91_dataflash26.c
index 64ce37f..9c4aac4 100644
--- a/drivers/mtd/devices/at91_dataflash26.c
+++ b/drivers/mtd/devices/at91_dataflash26.c
@@ -360,8 +360,7 @@ static int __init add_dataflash(int channel, char *name, int nr_pages,
 	device->read = at91_dataflash26_read;
 	device->write = at91_dataflash26_write;
 
-	priv = (struct dataflash_local *)kzalloc(sizeof(struct dataflash_local),
-		GFP_KERNEL);
+	priv = kzalloc(sizeof(struct dataflash_local), GFP_KERNEL);
 	if (!priv) {
 		kfree(device);
 		return -ENOMEM;
-- 
1.5.2.2
