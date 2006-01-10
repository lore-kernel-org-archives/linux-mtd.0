Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EwKtJ-0000OR-BI
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2006 09:54:33 -0500
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1EwKtH-0000O4-EW
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2006 15:54:27 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.9.35) with SMTP id
	M2006011015542723418
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2006 15:54:27 +0100
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1EwKtH-0000Pb-Ak
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2006 15:54:27 +0100
Message-ID: <43C3CB22.7070606@inf.u-szeged.hu>
Date: Tue, 10 Jan 2006 15:56:34 +0100
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------010709070105090100020201"
Cc: 
Subject: Mount problem on latest mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010709070105090100020201
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi All!

I think we found reason of the previous mount problem! The problem is in
scan.c, where the jffs2_fill_scan_buf was replaced by
jffs2_read_flash_safe and during the replacement the 'ofs' paramater is
changed to 'buf_ofs' which is wrong.

I've attached the patch to the mail which fix this problem.

If nobody complains Ferenc can commit the patch into the CVS.

Zoltan

--------------010709070105090100020201
Content-Type: text/x-patch;
 name="jffs2-scan-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2-scan-fix.patch"

diff -Narup -x CVS Mtd-orig-20060105/fs/jffs2/scan.c mtd/fs/jffs2/scan.c
--- Mtd-orig-20060105/fs/jffs2/scan.c	2006-01-06 08:13:51.000000000 +0100
+++ mtd/fs/jffs2/scan.c	2006-01-10 14:53:29.000000000 +0100
@@ -454,7 +454,7 @@ scan_more:
 			buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
 			D1(printk(KERN_DEBUG "Fewer than %zd bytes (node header) left to end of buf. Reading 0x%x at 0x%08x\n",
 				  sizeof(struct jffs2_unknown_node), buf_len, ofs));
-			err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+			err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
 			if (err)
 				return err;
 			buf_ofs = ofs;
@@ -511,7 +511,7 @@ scan_more:
 				break;
 			}
 			D1(printk(KERN_DEBUG "Reading another 0x%x at 0x%08x\n", buf_len, ofs));
-			err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+			err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
 			if (err)
 				return err;
 			buf_ofs = ofs;
@@ -587,7 +587,7 @@ scan_more:
 				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
 				D1(printk(KERN_DEBUG "Fewer than %zd bytes (inode node) left to end of buf. Reading 0x%x at 0x%08x\n",
 					  sizeof(struct jffs2_raw_inode), buf_len, ofs));
-				err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+				err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
 				if (err)
 					return err;
 				buf_ofs = ofs;
@@ -603,7 +603,7 @@ scan_more:
 				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
 				D1(printk(KERN_DEBUG "Fewer than %d bytes (dirent node) left to end of buf. Reading 0x%x at 0x%08x\n",
 					  je32_to_cpu(node->totlen), buf_len, ofs));
-				err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+				err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
 				if (err)
 					return err;
 				buf_ofs = ofs;
@@ -650,7 +650,7 @@ scan_more:
 			} else {
 				if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
 					buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
-					err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+					err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
 					if (err)
 						return err;
 					buf_ofs = ofs;

--------------010709070105090100020201--
