Received: from polonez.inetia.pl ([195.114.161.60])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AE9H5-0006Zq-3c
	for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2003 15:27:19 +0000
Received: from www.n1.pl (www.n1.pl [195.114.173.151])
 by polonez.inetia.pl (Sun Internet Mail Server sims.4.0.1999.06.13.00.20)
 with ESMTP id <0HNF00G7X9KXLC@polonez.inetia.pl> for
 linux-mtd@lists.infradead.org; Mon, 27 Oct 2003 16:26:57 +0100 (MET)
Received: from localhost [127.0.0.1] (helo=localhost)
	linux-mtd@lists.infradead.org	id
	1AE9Fl-0008AK-00; Mon, 27 Oct 2003 16:25:57 +0100
Date: Mon, 27 Oct 2003 16:25:57 +0100
From: andrzej.mialkowski@inetia.pl
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-id: <1067268357.3f9d3905c3fc9@imail.internetia.pl>
MIME-version: 1.0
Content-type: MULTIPART/MIXED; BOUNDARY="Boundary_(ID_wsJQCFrCx7aYrO8xhw6/vQ)"
Subject: [PATCH] parse_redboot_partitions not always works correctly
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This message is in MIME format.

--Boundary_(ID_wsJQCFrCx7aYrO8xhw6/vQ)
Content-type: text/plain; charset=ISO-8859-2
Content-transfer-encoding: 7BIT

Hi,
 I just found that redboot_parse_partitions on my system (IXDP2801) builds 
incorrect list of partitions, base addresses of some partitions are wrong. I 
located a problem in following line in redboot.c:
		buf[i].flash_base &= master->size-1;
This line tries to relocate partition base address to be 0 based, by cutting 
off some high order bits. This expression works correctly if two assumptions 
are true:
 1) master->size should be power of 2
 2) base address must be aligned to map size
Unfortunately on my board both are false: I have 10 flash chips, and base 
address is not aligned to size even after number of chips align to 16 (because 
of banking).

On different platforms I sow different use of flash base address. Some platforms
are using 0 based addresses in redboot some other physical address of flash 
chip (my case). As far as I know base address used for building partition 
entries is not stored.

The most portable method that I found is use "FIS directory" entry for guessing 
value of flash base used during building partitions. Assumption here is simple:
FIS directory is located in known place at MTD level, in last erase block of 
map. Subtracting flash base address stored in this entry with actual location 
at map driver offset level should give base address used during creating 
partition table.
Of course all partition entries must be created with the same flash base 
address.
Did anybody have better idea? Patch attached.
Thanks in advance for comments.

	Andrzej Mialkowski


--Boundary_(ID_wsJQCFrCx7aYrO8xhw6/vQ)
Content-type: text/plain; name=mtd-redboot-parse.patch
Content-disposition: attachment; filename=mtd-redboot-parse.patch
Content-transfer-encoding: 7BIT

diff -Nru prev/drivers/mtd/redboot.c linux/drivers/mtd/redboot.c
--- prev/drivers/mtd/redboot.c	Fri Mar 14 16:30:08 2003
+++ linux/drivers/mtd/redboot.c	Mon Oct 27 14:53:17 2003
@@ -44,6 +44,7 @@
 	size_t retlen;
 	char *names;
 	int namelen = 0;
+	unsigned flash_base = 0;
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 
@@ -64,8 +65,12 @@
 
 	/* RedBoot image could appear in any of the first three slots */
 	for (i = 0; i < 3; i++) {
-		if (!memcmp(buf[i].name, "RedBoot", 8))
+		if (!memcmp(buf[i].name, "RedBoot", 8)) {
+			/* Legacy way of detecting flash base */
+			/* Use RedBoot to be sure that we are using valid entry */ 
+			flash_base = buf[i].flash_base & (master->size - 1);
 			break;
+		}
 	}
 	if (i == 3) {
 		/* Didn't find it */
@@ -75,6 +80,22 @@
 		goto out;
 	}
 
+	/* 
+	 * Legacy way of detecting flash base does not work in two cases:
+	 * 1) When map size (number of chips) is not equal power of 2
+	 * 2) When flash base is not aligned to map size
+	 */
+	/* Look for FIS directory in entire read area */	
+	for (i = 0; i < PAGE_SIZE / sizeof(struct fis_image_desc); i++) {
+		if (!memcmp(buf[i].name, "FIS directory", sizeof("FIS directory"))) {
+			flash_base = buf[i].flash_base - (master->size - master->erasesize);
+			break;
+		}
+	}
+	printk(KERN_DEBUG "RedBoot partition base 0x%08X\n",
+		       flash_base);
+
+
 	for (i = 0; i < PAGE_SIZE / sizeof(struct fis_image_desc); i++) {
 		struct fis_list *new_fl, **prev;
 
@@ -90,7 +111,7 @@
 			goto out;
 		}
 		new_fl->img = &buf[i];
-		buf[i].flash_base &= master->size-1;
+		buf[i].flash_base -= flash_base;
 
 		/* I'm sure the JFFS2 code has done me permanent damage.
 		 * I now think the following is _normal_

--Boundary_(ID_wsJQCFrCx7aYrO8xhw6/vQ)--
