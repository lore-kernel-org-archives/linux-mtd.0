Received: from fk-out-0910.google.com ([209.85.128.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IP7UY-0005Nv-V9
	for linux-mtd@lists.infradead.org; Sat, 25 Aug 2007 22:04:46 -0400
Received: by fk-out-0910.google.com with SMTP id 19so1847684fkr
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Aug 2007 19:04:41 -0700 (PDT)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/4] mtd: convert some kmalloc()+memset() calls to kcalloc()
	in drivers/mtd/maps/pmcmsp-flash.c
Date: Sun, 26 Aug 2007 03:55:20 +0200
References: <200708260352.33343.jesper.juhl@gmail.com>
	<200708260354.27928.jesper.juhl@gmail.com>
In-Reply-To: <200708260354.27928.jesper.juhl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708260355.20916.jesper.juhl@gmail.com>
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


    mtd: convert some kmalloc()+memset() calls to kcalloc() in drivers/mtd/maps/pmcmsp-flash.c
    
    No point in doing kmalloc() followed by memset() when we have
    kcalloc() at our disposal.
    
    Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---
 drivers/mtd/maps/pmcmsp-flash.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index dfdb120..af72cdd 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -75,8 +75,7 @@ int __init init_msp_flash(void)
 	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
 	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
 	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
-	msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
-	memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));
+	msp_maps = kcalloc(fcnt, sizeof(struct mtd_info), GFP_KERNEL);
 
 	/* loop over the flash devices, initializing each */
 	for (i = 0; i < fcnt; i++) {
@@ -92,9 +91,8 @@ int __init init_msp_flash(void)
 			continue;
 		}
 
-		msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
+		msp_parts[i] = kcalloc(pcnt, sizeof(struct mtd_partition),
 			GFP_KERNEL);
-		memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));
 
 		/* now initialize the devices proper */
 		flash_name[5] = '0' + i;
