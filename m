Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11ixHr-0006oz-00
	for mtd@infradead.org; Wed, 3 Nov 1999 10:05:03 +0000
To: Bob Canup <rcanup@go2fax.com>
Cc: mtd@infradead.org
Subject: Re: 19991025 driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 Nov 1999 10:05:02 +0000
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11ixHq-00057C-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rcanup@go2fax.com said:
>  nftla:<3>ll_rw_block: Trying to read nonexistent block-device 5d:00
> (0) unable to read partition table. 

Hmmm. My fault - I scan for NFTL partitions before actually registering the 
block device. 

Try this:

Index: nftl.c
===================================================================
RCS file: /cvs/mtd/kernel/nftl.c,v
retrieving revision 1.9
diff -u -w -r1.9 nftl.c
--- nftl.c	1999/10/25 14:55:46	1.9
+++ nftl.c	1999/11/03 10:04:35
@@ -1129,15 +1129,6 @@
 #ifdef PRERELEASE 
 	printk(KERN_INFO"$Id: nftl.c,v 1.9 1999/10/25 14:55:46 dwmw2 Exp $\n");
 #endif
-	register_mtd_notifier(&nftl_notifier);
-
-	for (i=0; i < MAX_MTD_DEVICES; i++) {
-		mtd = get_mtd_device(i);
-		
-		if (mtd) 
-			NFTL_notify_func(mtd, i);
-	}		
-
 
 	if (register_blkdev(NFTL_MAJOR, "nftl", &nftl_fops)){
 		printk("unable to register NFTL block device\n");
@@ -1150,6 +1141,14 @@
 		gendisk_head = &nftl_gendisk;
 	}
 	
+	register_mtd_notifier(&nftl_notifier);
+
+	for (i=0; i < MAX_MTD_DEVICES; i++) {
+		mtd = get_mtd_device(i);
+		
+		if (mtd) 
+			NFTL_notify_func(mtd, i);
+	}		
 	
 	return 0;
 }


----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
