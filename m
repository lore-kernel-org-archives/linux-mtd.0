Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12AbAR-0002fi-00
	for mtd-list@infradead.org; Tue, 18 Jan 2000 16:07:39 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12AbAQ-0002fc-00
	for mtd@infradead.org; Tue, 18 Jan 2000 16:07:38 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12AbJJ-0003PL-00
	for mtd@infradead.org; Tue, 18 Jan 2000 16:16:49 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12AbJJ-0000N1-00; Tue, 18 Jan 2000 16:16:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: BOUNCE mtd@imladris.demon.co.uk: Admin request of type /^\s*get\s+\S+\s*$/i at (fwd)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jan 2000 16:16:49 +0000
Message-Id: <E12AbJJ-0000N1-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


/me kicks majordomo

I think this got bounced because it had 'get' at the beginning of a line.

------- Forwarded Message

From: Pavel Roskin <pavel_roskin@geocities.com>
To: mtd@infradead.org
Subject: Yet another minor patch
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hello!

I'm going to start more serious hacking, results of which will probably
remain closed-source :-(

I want to send you minor spelling/formatting changes, so that they don't
 get lost.

Regards,
Pavel Roskin

=== cut here ===
diff -ur mtd/mapped.c mtd1/mapped.c
- --- mtd/mapped.c	Mon Jan 17 12:59:09 2000
+++ mtd1/mapped.c	Tue Jan 18 10:34:06 2000
@@ -88,7 +88,7 @@
 									/*}}}*/
 // SetJedec - Set the jedec information for a chip			/*{{{*/
 // ---------------------------------------------------------------------
- -/* We track the configuration of each chip seperately in the chip list, 
+/* We track the configuration of each chip separately in the chip list, 
    each chip can have a different type and configuration to allow for 
    maximum flexability. */
 void set_jedec(struct mapped_mtd_info *map,unsigned chip,unsigned char mfr,
@@ -373,7 +373,7 @@
 	 if (page_jump(map,chip->base + chip->start + off,1,&base,0) != 0)
 	    return -EIO;
 	 
- -	 // Check to make sure we didnt timeout
+	 // Check to make sure we didn't timeout
 	 writeb(0x30,base);
 	 if ((readb(base) & (1 << 3)) != 0)
 	 {
diff -ur mtd/mtdblock.c mtd1/mtdblock.c
- --- mtd/mtdblock.c	Mon Jan 17 12:59:09 2000
+++ mtd1/mtdblock.c	Tue Jan 18 11:02:45 2000
@@ -7,9 +7,9 @@
 
    TODO:
      - Add a ioctl method to the mtd structure and move all flash related
- -       stuff into a new seperated structure so as not to pollute the 
+       stuff into a new separated structure so as not to pollute the 
        main mtd info.
- -     - Flexable partitioning
+     - Flexible partitioning
    
    ##################################################################### */
 									/*}}}*/
@@ -73,7 +73,7 @@
 	int dev;
 	struct mtd_info *mtd;
 
- -   	printk("mtdblock_open\n");
+   	printk("mtdblock_release\n");
 
 	if (inode == NULL)
 		return -ENODEV;
@@ -93,7 +93,7 @@
 
 	if (mtd->module)
 		__MOD_DEC_USE_COUNT(mtd->module);
- -printk("ok\n");
+	printk("ok\n");
 	MOD_DEC_USE_COUNT;
 	return 0;
 }  
@@ -182,7 +182,7 @@
 	    res = 0;
 	 break;
 	 
- -	 // Shouldnt happen
+	 // Shouldn't happen
 	 default:
 	 printk("mtd: unknown request\n");
 	 break;
=== cut here ===





------- End of Forwarded Message



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
