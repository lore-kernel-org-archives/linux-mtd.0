Received: from fk-out-0910.google.com ([209.85.128.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IP7l1-0005YF-9M
	for linux-mtd@lists.infradead.org; Sat, 25 Aug 2007 22:21:47 -0400
Received: by fk-out-0910.google.com with SMTP id 19so1852296fkr
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Aug 2007 19:21:42 -0700 (PDT)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/4] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
Date: Sun, 26 Aug 2007 03:54:27 +0200
References: <200708260352.33343.jesper.juhl@gmail.com>
In-Reply-To: <200708260352.33343.jesper.juhl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708260354.27928.jesper.juhl@gmail.com>
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	Jesper Juhl <jesper.juhl@gmail.com>,
	Marc St-Jean <stjeanma@pmc-sierra.com>, linux-mtd@lists.infradead.org,
	"Robert P. J. Day" <rpjday@mindspring.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


    mtd: Don't cast kmalloc() return value in drivers/mtd/maps/pmcmsp-flash.c
    
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
