Received: from fk-out-0910.google.com ([209.85.128.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IP7WV-0005Ov-MQ
	for linux-mtd@lists.infradead.org; Sat, 25 Aug 2007 22:06:47 -0400
Received: by fk-out-0910.google.com with SMTP id 19so1848163fkr
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Aug 2007 19:06:43 -0700 (PDT)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 4/4] mtd: Check for allocation failures and bail out
	appropriately in init_msp_flash()
Date: Sun, 26 Aug 2007 03:57:19 +0200
References: <200708260352.33343.jesper.juhl@gmail.com>
	<200708260355.20916.jesper.juhl@gmail.com>
	<200708260356.17664.jesper.juhl@gmail.com>
In-Reply-To: <200708260356.17664.jesper.juhl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708260357.20106.jesper.juhl@gmail.com>
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


    mtd: Check for allocation failures and bail out appropriately in init_msp_flash()
    
    Just trusting that a memory allocation succeeds is a bad habbit that
    can lead to null pointer dereferences fairly fast.
    In drivers/mtd/maps/pmcmsp-flash.c::init_msp_flash() there are a few
    allocations where I don't see anything guaranteeing that they will
    never fail, yet they are not checked for success...
    This patch adds checks for these allocations and also cleans up
    previous allocations properly in case one fails.
    
    Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---
 drivers/mtd/maps/pmcmsp-flash.c |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index b6d382a..5472547 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -57,6 +57,7 @@ int __init init_msp_flash(void)
 	char flash_name[] = "flash0";
 	char part_name[] = "flash0_0";
 	unsigned addr, size;
+	int err = 0;
 
 	/* If ELB is disabled by "ful-mux" mode, we can't get at flash */
 	if ((*DEV_ID_REG & DEV_ID_SINGLE_PC) &&
@@ -74,8 +75,14 @@ int __init init_msp_flash(void)
 
 	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
 	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
+	if (msp_flash == NULL)
+		goto out_mem;
 	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
+	if (msp_parts == NULL)
+		goto out_mem_flash;
 	msp_maps = kcalloc(fcnt, sizeof(struct mtd_info), GFP_KERNEL);
+	if (msp_maps == NULL)
+		goto out_mem_parts;
 
 	/* loop over the flash devices, initializing each */
 	for (i = 0; i < fcnt; i++) {
@@ -122,7 +129,7 @@ int __init init_msp_flash(void)
 
 		msp_maps[i].name = kmalloc(7, GFP_KERNEL);
 		if (msp_maps[i].name == NULL)
-			return -ENOMEM;
+			goto out_mem;
 		strncpy(msp_maps[i].name, flash_name, 7);
 
 		msp_maps[i].bankwidth = 1;
@@ -153,7 +160,15 @@ int __init init_msp_flash(void)
 		}
 	}
 
-	return 0;
+out:
+	return err;
+out_mem_parts:
+	kfree(parts);
+out_mem_flash:
+	kfree(flash);
+out_mem:
+	err = -ENOMEM;
+	goto out;
 }
 
 static void __exit cleanup_msp_flash(void)
