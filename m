Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIkQd-0001mE-9D
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 06:05:25 -0400
Message-ID: <20050923100513.26965.qmail@mw-itcon.de>
From: "Peter Menzebach" <pm-mtd@mw-itcon.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 23 Sep 2005 12:05:13 +0200
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_0_26872_1127469913";
	charset="iso-8859-1"
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: [PATCH] fix for mtd partitions for erase_size != 2^X
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a MIME-formatted message.  If you see this text it means that your
mail software cannot handle MIME-formatted messages.

--=_0_26872_1127469913
Content-Type: text/plain; format=flowed; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Here a trivial patch,
which allows correct creation of mtd partitions, which have erase sizes 
which are not a power of 2. 

Best regards
Peter 



--=_0_26872_1127469913
Content-Disposition: inline; filename=patch.mtdpart.c
Content-Type: text/plain; charset="iso-8859-1"; name=patch.mtdpart.c
Content-Transfer-Encoding: 7bit

--- drivers/mtd/mtdpart.c.orig	2005-09-23 09:28:07.000000000 +0200
+++ drivers/mtd/mtdpart.c	2005-09-23 09:29:37.000000000 +0200
@@ -465,9 +465,9 @@
 		if (slave->offset == MTDPART_OFS_APPEND)
 			slave->offset = cur_offset;
 		if (slave->offset == MTDPART_OFS_NXTBLK) {
-			u_int32_t emask = master->erasesize-1;
-			slave->offset = (cur_offset + emask) & ~emask;
-			if (slave->offset != cur_offset) {
+			slave->offset = cur_offset;
+			if ((cur_offset % master->erasesize) != 0) {
+				slave->offset = ((cur_offset / master->erasesize) + 1) * master->erasesize;
 				printk(KERN_NOTICE "Moving partition %d: "
 				       "0x%08x -> 0x%08x\n", i,
 				       cur_offset, slave->offset);

--=_0_26872_1127469913--
