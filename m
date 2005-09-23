Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIwyg-00054k-LU
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 19:29:19 -0400
Received: from pgrayson1.inrealm.net (unknown [66.239.3.2])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by ba.realmsys.com (Spam Firewall) with ESMTP id 990F71644B
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Sep 2005 17:29:12 -0600 (MDT)
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-L+G9gLlLWKeiYQ+ODp5P"
Date: Fri, 23 Sep 2005 17:29:14 -0600
Message-Id: <1127518154.6937.42.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [PATCH] nandbase performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-L+G9gLlLWKeiYQ+ODp5P
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Here is a patch against nand_base.c that improves partial page read
performance. The patch simply replaces a byte-by-byte copy in a for-loop
with a memcpy() call. Jffs2 does a lot of these partial page reads.

Pete

--=-L+G9gLlLWKeiYQ+ODp5P
Content-Disposition: attachment; filename=mtd-nandbase-performance.patch
Content-Type: text/x-patch; name=mtd-nandbase-performance.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

diff -uNr mtd/drivers/mtd/nand/nand_base.c mtd-nandbase/drivers/mtd/nand/nand_base.c
--- mtd/drivers/mtd/nand/nand_base.c	2005-09-16 15:30:32.000000000 -0600
+++ mtd-nandbase/drivers/mtd/nand/nand_base.c	2005-09-23 17:21:38.032055488 -0600
@@ -1311,8 +1311,9 @@
 	readdata:
 		/* Partial page read, transfer data into fs buffer */
 		if (!aligned) { 
-			for (j = col; j < end && read < len; j++)
-				buf[read++] = data_poi[j];
+			int bytes_to_copy = min(end - col, (int)len - read);
+			memcpy(&buf[read], &data_poi[col], bytes_to_copy);
+			read += bytes_to_copy;
 			this->pagebuf = realpage;	
 		} else		
 			read += mtd->oobblock;

--=-L+G9gLlLWKeiYQ+ODp5P--
