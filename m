Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190q22-0007Nh-V7
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 22:44:31 +0100
Received: from air-2.osdl.org ([65.172.181.6] helo=doc.pdx.osdl.net)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 190q21-0000xf-00
	for linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 22:44:29 +0100
Date: Wed, 2 Apr 2003 13:44:26 -0800
From: Bob Miller <rem@osdl.org>
To: torvalds@transmeta.com
Message-ID: <20030402214426.GB17147@doc.pdx.osdl.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2.5.66] Convert octagon-5066 to to remove check_region().
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Moved the request_region() call to replace check_region() and adds
release_region()'s in the error paths that occure before the old
call to request_region().

-- 
Bob Miller					Email: rem@osdl.org
Open Source Development Lab			Phone: 503.626.2455 Ext. 17


diff -Nru a/drivers/mtd/maps/octagon-5066.c b/drivers/mtd/maps/octagon-5066.c
--- a/drivers/mtd/maps/octagon-5066.c	Wed Apr  2 10:57:40 2003
+++ b/drivers/mtd/maps/octagon-5066.c	Wed Apr  2 10:57:40 2003
@@ -231,7 +231,7 @@
 	int i;
 	
 	// Do an autoprobe sequence
-	if (check_region(PAGE_IO,1) != 0)
+	if (!request_region(PAGE_IO,1,"Octagon SSD"))
 		{
 			printk("5066: Page Register in Use\n");
 			return -EAGAIN;
@@ -239,16 +239,16 @@
 	iomapadr = (unsigned long)ioremap(WINDOW_START, WINDOW_LENGTH);
 	if (!iomapadr) {
 		printk("Failed to ioremap memory region\n");
+		release_region(PAGE_IO,1);
 		return -EIO;
 	}
 	if (OctProbe() != 0)
 		{
 			printk("5066: Octagon Probe Failed, is this an Octagon 5066 SBC?\n");
 			iounmap((void *)iomapadr);
+			release_region(PAGE_IO,1);
 			return -EAGAIN;
 		}
-	
-	request_region(PAGE_IO,1,"Octagon SSD");
 	
 	// Print out our little header..
 	printk("Octagon 5066 SSD IO:0x%x MEM:0x%x-0x%x\n",PAGE_IO,WINDOW_START,
