Received: from fk-out-0910.google.com ([209.85.128.191])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOMdA-0002YQ-Kl
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 20:02:30 -0400
Received: by fk-out-0910.google.com with SMTP id 19so997497fkr
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 17:02:27 -0700 (PDT)
Resent-Message-ID: <200708240152.02705.jesper.juhl@gmail.com>
Message-Id: <5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
In-Reply-To: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Fri, 24 Aug 2007 01:52:57 +0200
Subject: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Jesper Juhl <jesper.juhl@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kmalloc() returns a void pointer.
No need to cast it.

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---
 drivers/mtd/maps/pmcmsp-flash.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 7e0377e..dfdb120 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -73,12 +73,9 @@ int __init init_msp_flash(void)
 		return -ENXIO;
 
 	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
-	msp_flash = (struct mtd_info **)kmalloc(
-			fcnt * sizeof(struct map_info *), GFP_KERNEL);
-	msp_parts = (struct mtd_partition **)kmalloc(
-			fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
-	msp_maps = (struct map_info *)kmalloc(
-			fcnt * sizeof(struct mtd_info), GFP_KERNEL);
+	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
+	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
+	msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
 	memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));
 
 	/* loop over the flash devices, initializing each */
@@ -95,8 +92,8 @@ int __init init_msp_flash(void)
 			continue;
 		}
 
-		msp_parts[i] = (struct mtd_partition *)kmalloc(
-			pcnt * sizeof(struct mtd_partition), GFP_KERNEL);
+		msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
+			GFP_KERNEL);
 		memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));
 
 		/* now initialize the devices proper */
-- 
1.5.2.2
