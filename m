Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190q2l-0007Pa-8Z
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 22:45:15 +0100
Received: from air-2.osdl.org ([65.172.181.6] helo=doc.pdx.osdl.net)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 190q2j-0000xo-00
	for linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 22:45:13 +0100
Date: Wed, 2 Apr 2003 13:45:11 -0800
From: Bob Miller <rem@osdl.org>
To: torvalds@transmeta.com
Message-ID: <20030402214511.GC17147@doc.pdx.osdl.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2.5.66] Convert sbc_gxx to to remove check_region().
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


diff -Nru a/drivers/mtd/maps/sbc_gxx.c b/drivers/mtd/maps/sbc_gxx.c
--- a/drivers/mtd/maps/sbc_gxx.c	Wed Apr  2 10:57:40 2003
+++ b/drivers/mtd/maps/sbc_gxx.c	Wed Apr  2 10:57:40 2003
@@ -240,7 +240,7 @@
 
 int __init init_sbc_gxx(void)
 {
-	if (check_region(PAGE_IO,PAGE_IO_SIZE) != 0) {
+	if (!request_region(PAGE_IO,PAGE_IO_SIZE,"SBC-GXx flash")) {
 		printk( KERN_ERR"%s: IO ports 0x%x-0x%x in use\n",
 			sbc_gxx_map.name,
 			PAGE_IO, PAGE_IO+PAGE_IO_SIZE-1 );
@@ -250,10 +250,9 @@
 	if (!iomapadr) {
 		printk( KERN_ERR"%s: failed to ioremap memory region\n",
 			sbc_gxx_map.name );
+		release_region(PAGE_IO,PAGE_IO_SIZE);
 		return -EIO;
 	}
-	
-	request_region( PAGE_IO, PAGE_IO_SIZE, "SBC-GXx flash" );
 	
 	printk( KERN_INFO"%s: IO:0x%x-0x%x MEM:0x%x-0x%x\n",
 		sbc_gxx_map.name,
