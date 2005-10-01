Received: from sccrmhc11.comcast.net ([204.127.202.55])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELZcN-0005us-RP
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2005 01:09:12 -0400
Date: Fri, 30 Sep 2005 22:00:03 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: Linus Torvalds <torvalds@osdl.org>
Message-ID: <20051001050003.GD11137@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [MTD] kmalloc + memzero -> kzalloc conversion
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We have the API, so use it.

Signed-off-by: Deepak Saxena <dsaxena@plexity.net>

diff --git a/drivers/mtd/maps/bast-flash.c b/drivers/mtd/maps/bast-flash.c
--- a/drivers/mtd/maps/bast-flash.c
+++ b/drivers/mtd/maps/bast-flash.c
@@ -123,14 +123,13 @@ static int bast_flash_probe(struct devic
 	struct resource *res;
 	int err = 0;
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
 		printk(KERN_ERR PFX "no memory for flash info\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
 
-	memzero(info, sizeof(*info));
 	dev_set_drvdata(dev, info);
 
 	res = pdev->resource;  /* assume that the flash has one resource */
diff --git a/drivers/mtd/maps/epxa10db-flash.c b/drivers/mtd/maps/epxa10db-flash.c
--- a/drivers/mtd/maps/epxa10db-flash.c
+++ b/drivers/mtd/maps/epxa10db-flash.c
@@ -142,8 +142,7 @@ static int __init epxa_default_partition
 
 	printk("Using default partitions for %s\n",BOARD_NAME);
 	npartitions=1;
-	parts = kmalloc(npartitions*sizeof(*parts)+strlen(name), GFP_KERNEL);
-	memzero(parts,npartitions*sizeof(*parts)+strlen(name));
+	parts = kzalloc(npartitions*sizeof(*parts)+strlen(name), GFP_KERNEL);
 	if (!parts) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/mtd/maps/ixp2000.c b/drivers/mtd/maps/ixp2000.c
--- a/drivers/mtd/maps/ixp2000.c
+++ b/drivers/mtd/maps/ixp2000.c
@@ -168,12 +168,11 @@ static int ixp2000_flash_probe(struct de
 		return -EIO;
 	}
 
-	info = kmalloc(sizeof(struct ixp2000_flash_info), GFP_KERNEL);
+	info = kzalloc(sizeof(struct ixp2000_flash_info), GFP_KERNEL);
 	if(!info) {
 		err = -ENOMEM;
 		goto Error;
 	}	
-	memzero(info, sizeof(struct ixp2000_flash_info));
 
 	dev_set_drvdata(&dev->dev, info);
 
diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -153,12 +153,11 @@ static int ixp4xx_flash_probe(struct dev
 			return err;
 	}
 
-	info = kmalloc(sizeof(struct ixp4xx_flash_info), GFP_KERNEL);
+	info = kzalloc(sizeof(struct ixp4xx_flash_info), GFP_KERNEL);
 	if(!info) {
 		err = -ENOMEM;
 		goto Error;
 	}	
-	memzero(info, sizeof(struct ixp4xx_flash_info));
 
 	dev_set_drvdata(&dev->dev, info);
 


-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

Even a stopped clock gives the right time twice a day.
