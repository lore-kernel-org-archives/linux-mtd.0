Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12001a-0006NL-00
	for mtd-list@infradead.org; Mon, 20 Dec 1999 10:26:42 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12001Z-0006NF-00
	for mtd@infradead.org; Mon, 20 Dec 1999 10:26:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E11zRIX-0005Xl-00@infradead.org> 
References: <E11zRIX-0005Xl-00@infradead.org> 
To: "Dvir Oren" <dviro@ibm.net>
Cc: MTD <mtd@infradead.org>
Subject: Re: MTD compiled in the kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 20 Dec 1999 10:30:16 +0000
Message-Id: <E120052-0007CB-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dviro@ibm.net said:
> The drivers seem to load fine, but when I try to fdisk /dev/nftla, I
> get  "unable to read /dev/nftla".  Trying to mount /dev/nftla1 won't
> work  either. 

Odd. Did it really initialise? Did you see the printk as the kernel booted?
What's in /proc/mtd ? Can you post the entire dmesg?

I assume you've included this patch which fixes the initialisation order - 
register the block device before trying to find partitions on it...


Index: nftl.c
===================================================================
RCS file: /cvs/mtd/kernel/nftl.c,v
retrieving revision 1.9
diff -u -w -r1.9 nftl.c
--- nftl.c	1999/10/25 14:55:46	1.9
+++ nftl.c	1999/12/20 10:26:44
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


dviro@ibm.net said:
>  One other oddity, is that I get a strange error: "Changing size of
> flash from 7ce0 to 7ce0 for geometry reasons" (or something like that,
> quoting from memory). 

Mea culpa. Try this and it'll tell you the original numbers rather than 
setting the new value _before_ printing them :)

Can you let me know both figures, and the geometry that's reported in both 
Linux and DOS/Windows?

Index: nftl.c
===================================================================
RCS file: /cvs/mtd/kernel/nftl.c,v
retrieving revision 1.10
diff -u -w -r1.10 nftl.c
--- nftl.c	1999/12/20 10:27:27	1.10
+++ nftl.c	1999/12/20 10:28:39
@@ -133,11 +133,10 @@
 	if (thisNFTL->nr_sects != thisNFTL->heads * thisNFTL->cylinders *
 	    thisNFTL->sectors) {
 		printk("NFTL capacity reduced for geometry reasons from %lx to %lx sectors\n", thisNFTL->nr_sects, 
-		       thisNFTL->nr_sects = thisNFTL->heads * thisNFTL->cylinders * thisNFTL->sectors);
-	}
-
+		       thisNFTL->heads * thisNFTL->cylinders * thisNFTL->sectors);
 
-
+		thisNFTL->nr_sects = thisNFTL->heads * thisNFTL->cylinders * thisNFTL->sectors;
+	}
 
 	
 	thisNFTL->EUNtable = kmalloc( 2 * thisNFTL->numvunits,


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
