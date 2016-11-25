Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAKL9-0001bT-FV
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 17:31:17 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/2] common: Fix 'unchecked return code' warnings
Date: Fri, 25 Nov 2016 18:30:41 +0100
Message-Id: <1480095041-25627-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1480095041-25627-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1480095041-25627-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Several tools are simply not checking return code of functions marked
with 'warn_unused_result'.

Provide wrappers for the read/write functions to avoid patching old
code and providing proper error handling.
Fix the remaining ones (calls to fgets() and system()).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 include/common.h          | 33 +++++++++++++++++++++++++++++++++
 jffsX-utils/jffs2dump.c   | 32 ++++++++++++++++----------------
 jffsX-utils/jffs2reader.c |  2 +-
 misc-utils/docfdisk.c     |  6 +++++-
 misc-utils/ftl_check.c    |  2 +-
 nand-utils/nftl_format.c  | 24 ++++++++++++------------
 nand-utils/nftldump.c     | 10 ++++++----
 tests/ubi-tests/integ.c   | 10 ++++++++--
 8 files changed, 82 insertions(+), 37 deletions(-)

diff --git a/include/common.h b/include/common.h
index 93ef7f347ffb..32b5d231be7e 100644
--- a/include/common.h
+++ b/include/common.h
@@ -28,6 +28,7 @@
 #include <errno.h>
 #include <features.h>
 #include <inttypes.h>
+#include <unistd.h>
 #include <sys/sysmacros.h>
 
 #include "config.h"
@@ -226,6 +227,38 @@ long long util_get_bytes(const char *str);
 void util_print_bytes(long long bytes, int bracket);
 int util_srand(void);
 
+/*
+ * The following helpers are here to avoid compiler complaints about unchecked
+ * return code.
+ * FIXME: The proper fix would be to check the return code in all those places,
+ * but it's usually placed in old code which have no proper exit path and
+ * handling  errors requires rewriting a lot of code.
+ *
+ * WARNING: Please do not use these helpers in new code. Instead, make sure
+ * you check the function return code and provide coherent error handling in
+ * case of error.
+ */
+static inline ssize_t read_nocheck(int fd, void *buf, size_t count)
+{
+	return read(fd, buf, count);
+}
+
+static inline ssize_t write_nocheck(int fd, void *buf, size_t count)
+{
+	return write(fd, buf, count);
+}
+
+static inline ssize_t pread_nocheck(int fd, void *buf, size_t count,
+				    off_t offset)
+{
+	return pread(fd, buf, count, offset);
+}
+
+static inline ssize_t pwrite_nocheck(int fd, void *buf, size_t count,
+				     off_t offset)
+{
+	return pwrite(fd, buf, count, offset);
+}
 #ifdef __cplusplus
 }
 #endif
diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index 4b3164bb0a21..a8d082bf1e39 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -498,7 +498,7 @@ void do_endianconvert (void)
 
 		/* Skip empty space */
 		if (je16_to_cpu (node->u.magic) == 0xFFFF && je16_to_cpu (node->u.nodetype) == 0xFFFF) {
-			write (fd, p, 4);
+			write_nocheck (fd, p, 4);
 			p += 4;
 			continue;
 		}
@@ -507,7 +507,7 @@ void do_endianconvert (void)
 			printf ("Wrong bitmask  at  0x%08zx, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
 			newnode.u.magic = cnv_e16 (node->u.magic);
 			newnode.u.nodetype = cnv_e16 (node->u.nodetype);
-			write (fd, &newnode, 4);
+			write_nocheck (fd, &newnode, 4);
 			p += 4;
 			continue;
 		}
@@ -550,8 +550,8 @@ void do_endianconvert (void)
 
 				newnode.i.node_crc = cpu_to_e32 (mtd_crc32 (0, &newnode, sizeof (struct jffs2_raw_inode) - 8));
 
-				write (fd, &newnode, sizeof (struct jffs2_raw_inode));
-				write (fd, p + sizeof (struct jffs2_raw_inode), PAD (je32_to_cpu (node->i.totlen) -  sizeof (struct jffs2_raw_inode)));
+				write_nocheck (fd, &newnode, sizeof (struct jffs2_raw_inode));
+				write_nocheck (fd, p + sizeof (struct jffs2_raw_inode), PAD (je32_to_cpu (node->i.totlen) -  sizeof (struct jffs2_raw_inode)));
 
 				p += PAD(je32_to_cpu (node->i.totlen));
 				break;
@@ -575,8 +575,8 @@ void do_endianconvert (void)
 				else
 					newnode.d.name_crc = cnv_e32 (node->d.name_crc);
 
-				write (fd, &newnode, sizeof (struct jffs2_raw_dirent));
-				write (fd, p + sizeof (struct jffs2_raw_dirent), PAD (je32_to_cpu (node->d.totlen) -  sizeof (struct jffs2_raw_dirent)));
+				write_nocheck (fd, &newnode, sizeof (struct jffs2_raw_dirent));
+				write_nocheck (fd, p + sizeof (struct jffs2_raw_dirent), PAD (je32_to_cpu (node->d.totlen) -  sizeof (struct jffs2_raw_dirent)));
 				p += PAD(je32_to_cpu (node->d.totlen));
 				break;
 
@@ -596,8 +596,8 @@ void do_endianconvert (void)
 					newnode.x.data_crc = cnv_e32 (node->x.data_crc);
 				newnode.x.node_crc = cpu_to_e32 (mtd_crc32 (0, &newnode, sizeof (struct jffs2_raw_xattr) - sizeof (newnode.x.node_crc)));
 
-				write (fd, &newnode, sizeof (struct jffs2_raw_xattr));
-				write (fd, p + sizeof (struct jffs2_raw_xattr), PAD (je32_to_cpu (node->d.totlen) -  sizeof (struct jffs2_raw_xattr)));
+				write_nocheck (fd, &newnode, sizeof (struct jffs2_raw_xattr));
+				write_nocheck (fd, p + sizeof (struct jffs2_raw_xattr), PAD (je32_to_cpu (node->d.totlen) -  sizeof (struct jffs2_raw_xattr)));
 				p += PAD(je32_to_cpu (node->x.totlen));
 				break;
 
@@ -620,10 +620,10 @@ void do_endianconvert (void)
 				newnode.u.totlen = cnv_e32 (node->u.totlen);
 				newnode.u.hdr_crc = cpu_to_e32 (mtd_crc32 (0, &newnode, sizeof (struct jffs2_unknown_node) - 4));
 
-				write (fd, &newnode, sizeof (struct jffs2_unknown_node));
+				write_nocheck (fd, &newnode, sizeof (struct jffs2_unknown_node));
 				len = PAD(je32_to_cpu (node->u.totlen) - sizeof (struct jffs2_unknown_node));
 				if (len > 0)
-					write (fd, p + sizeof (struct jffs2_unknown_node), len);
+					write_nocheck (fd, p + sizeof (struct jffs2_unknown_node), len);
 
 				p += PAD(je32_to_cpu (node->u.totlen));
 				break;
@@ -716,15 +716,15 @@ void do_endianconvert (void)
 														  je32_to_cpu (node->s.totlen) - sizeof (struct jffs2_raw_summary)));
 
 											  // write out new node header
-											  write(fd, &newnode, sizeof (struct jffs2_raw_summary));
+											  write_nocheck(fd, &newnode, sizeof (struct jffs2_raw_summary));
 											  // write out new summary data
-											  write(fd, &node->s.sum, sum_len + sizeof (struct jffs2_sum_marker));
+											  write_nocheck(fd, &node->s.sum, sum_len + sizeof (struct jffs2_sum_marker));
 
 											  break;
 										  }
 
 			case 0xffff:
-										  write (fd, p, 4);
+										  write_nocheck (fd, p, 4);
 										  p += 4;
 										  break;
 
@@ -772,8 +772,8 @@ int main(int argc, char **argv)
 		printf ("Peeling data out of combined data/oob image\n");
 		while (len) {
 			// read image data
-			read (fd, &data[idx], datsize);
-			read (fd, oob, oobsize);
+			read_nocheck (fd, &data[idx], datsize);
+			read_nocheck (fd, oob, oobsize);
 			idx += datsize;
 			imglen -= oobsize;
 			len -= datsize + oobsize;
@@ -781,7 +781,7 @@ int main(int argc, char **argv)
 
 	} else {
 		// read image data
-		read (fd, data, imglen);
+		read_nocheck (fd, data, imglen);
 	}
 	// Close the input file
 	close(fd);
diff --git a/jffsX-utils/jffs2reader.c b/jffsX-utils/jffs2reader.c
index 09d1d8996197..16870ba7d86b 100644
--- a/jffsX-utils/jffs2reader.c
+++ b/jffsX-utils/jffs2reader.c
@@ -859,7 +859,7 @@ void catfile(char *o, size_t size, char *path, char *b, size_t bsize,
 	ri = find_raw_inode(o, size, ino);
 	putblock(b, bsize, rsize, ri);
 
-	write(1, b, *rsize);
+	write_nocheck(1, b, *rsize);
 }
 
 /* usage example */
diff --git a/misc-utils/docfdisk.c b/misc-utils/docfdisk.c
index 9956de5d504f..b363662c2d0a 100644
--- a/misc-utils/docfdisk.c
+++ b/misc-utils/docfdisk.c
@@ -275,7 +275,11 @@ int main(int argc, char **argv)
 	show_header(mhoffs);
 
 	printf("\nReady to update device.  Type 'yes' to proceed, anything else to abort: ");
-	fgets(line, sizeof(line), stdin);
+	if (!fgets(line, sizeof(line), stdin)) {
+		printf("Failed to retrieve input chars!\n");
+		return 1;
+	}
+
 	if (strcmp("yes\n", line))
 		return 0;
 	printf("Updating MediaHeader...\n");
diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
index d7d2e8be18ba..970d968b8cbf 100644
--- a/misc-utils/ftl_check.c
+++ b/misc-utils/ftl_check.c
@@ -95,7 +95,7 @@ static void check_partition(int fd)
 			perror("seek failed");
 			break;
 		}
-		read(fd, &hdr, sizeof(hdr));
+		read_nocheck(fd, &hdr, sizeof(hdr));
 		if ((le32_to_cpu(hdr.FormattedSize) > 0) &&
 				(le32_to_cpu(hdr.FormattedSize) <= mtd.size) &&
 				(le16_to_cpu(hdr.NumEraseUnits) > 0) &&
diff --git a/nand-utils/nftl_format.c b/nand-utils/nftl_format.c
index 8485553726f1..a329c59fc504 100644
--- a/nand-utils/nftl_format.c
+++ b/nand-utils/nftl_format.c
@@ -93,15 +93,15 @@ static unsigned char check_block_2(unsigned long block)
 	erase.start = ofs;
 
 	for (blockofs = 0; blockofs < meminfo.erasesize; blockofs += 512) {
-		pread(fd, readbuf, 512, ofs + blockofs);
+		pread_nocheck(fd, readbuf, 512, ofs + blockofs);
 		if (memcmp(readbuf, writebuf[0], 512)) {
 			/* Block wasn't 0xff after erase */
 			printf(": Block not 0xff after erase\n");
 			return ZONE_BAD_ORIGINAL;
 		}
 
-		pwrite(fd, writebuf[1], 512, blockofs + ofs);
-		pread(fd, readbuf, 512, blockofs + ofs);
+		pwrite_nocheck(fd, writebuf[1], 512, blockofs + ofs);
+		pread_nocheck(fd, readbuf, 512, blockofs + ofs);
 		if (memcmp(readbuf, writebuf[1], 512)) {
 			printf(": Block not zero after clearing\n");
 			return ZONE_BAD_ORIGINAL;
@@ -114,8 +114,8 @@ static unsigned char check_block_2(unsigned long block)
 		return ZONE_BAD_ORIGINAL;
 	}
 	for (blockofs = 0; blockofs < meminfo.erasesize; blockofs += 512) {
-		pwrite(fd, writebuf[2], 512, blockofs + ofs);
-		pread(fd, readbuf, 512, blockofs + ofs);
+		pwrite_nocheck(fd, writebuf[2], 512, blockofs + ofs);
+		pread_nocheck(fd, readbuf, 512, blockofs + ofs);
 		if (memcmp(readbuf, writebuf[2], 512)) {
 			printf(": Block not 0x5a after writing\n");
 			return ZONE_BAD_ORIGINAL;
@@ -127,8 +127,8 @@ static unsigned char check_block_2(unsigned long block)
 		return ZONE_BAD_ORIGINAL;
 	}
 	for (blockofs = 0; blockofs < meminfo.erasesize; blockofs += 512) {
-		pwrite(fd, writebuf[3], 512, blockofs + ofs);
-		pread(fd, readbuf, 512, blockofs + ofs);
+		pwrite_nocheck(fd, writebuf[3], 512, blockofs + ofs);
+		pread_nocheck(fd, readbuf, 512, blockofs + ofs);
 		if (memcmp(readbuf, writebuf[3], 512)) {
 			printf(": Block not 0xa5 after writing\n");
 			return ZONE_BAD_ORIGINAL;
@@ -181,7 +181,7 @@ static int checkbbt(void)
 	unsigned char bits;
 	int i, addr;
 
-	if (pread(fd, bbt, 512, 0x800) < 0) {
+	if (pread_nocheck(fd, bbt, 512, 0x800) < 0) {
 		printf("%s: failed to read BBT, errno=%d\n", PROGRAM_NAME, errno);
 		return (-1);
 	}
@@ -402,9 +402,9 @@ int main(int argc, char **argv)
 
 	/* Phase 2. Writing NFTL Media Headers and Bad Unit Table */
 	printf("Phase 2.a Writing %s Media Header and Bad Unit Table\n", nftl);
-	pwrite(fd, writebuf[0], 512, MediaUnit1 * meminfo.erasesize + MediaUnitOff1);
+	pwrite_nocheck(fd, writebuf[0], 512, MediaUnit1 * meminfo.erasesize + MediaUnitOff1);
 	for (ezone = 0; ezone < (meminfo.size / meminfo.erasesize); ezone += 512) {
-		pwrite(fd, BadUnitTable + ezone, 512,
+		pwrite_nocheck(fd, BadUnitTable + ezone, 512,
 				(MediaUnit1 * meminfo.erasesize) + 512 * (1 + ezone / 512));
 	}
 
@@ -416,9 +416,9 @@ int main(int argc, char **argv)
 			le32_to_cpu(NFTLhdr->FormattedSize)/512);
 #endif
 	printf("Phase 2.b Writing Spare %s Media Header and Spare Bad Unit Table\n", nftl);
-	pwrite(fd, writebuf[0], 512, MediaUnit2 * meminfo.erasesize + MediaUnitOff2);
+	pwrite_nocheck(fd, writebuf[0], 512, MediaUnit2 * meminfo.erasesize + MediaUnitOff2);
 	for (ezone = 0; ezone < (meminfo.size / meminfo.erasesize); ezone += 512) {
-		pwrite(fd, BadUnitTable + ezone, 512,
+		pwrite_nocheck(fd, BadUnitTable + ezone, 512,
 				(MediaUnit2 * meminfo.erasesize + MediaUnitOff2) + 512 * (1 + ezone / 512));
 	}
 
diff --git a/nand-utils/nftldump.c b/nand-utils/nftldump.c
index 32f4f2f1a640..30332fedc304 100644
--- a/nand-utils/nftldump.c
+++ b/nand-utils/nftldump.c
@@ -39,6 +39,8 @@
 #include <mtd/nftl-user.h>
 #include <mtd_swab.h>
 
+#include "common.h"
+
 static struct NFTLMediaHeader MedHead[2];
 static mtd_info_t meminfo;
 
@@ -73,7 +75,7 @@ static unsigned int find_media_headers(void)
 
 	NumMedHeads = 0;
 	while (ofs < meminfo.size) {
-		pread(fd, &MedHead[NumMedHeads], sizeof(struct NFTLMediaHeader), ofs);
+		pread_nocheck(fd, &MedHead[NumMedHeads], sizeof(struct NFTLMediaHeader), ofs);
 		if (!strncmp(MedHead[NumMedHeads].DataOrgID, "ANAND", 6)) {
 			SWAP16(MedHead[NumMedHeads].NumEraseUnits);
 			SWAP16(MedHead[NumMedHeads].FirstPhysicalEUN);
@@ -93,7 +95,7 @@ static unsigned int find_media_headers(void)
 				/* read BadUnitTable, I don't know why pread() does not work for
 				   larger (7680 bytes) chunks */
 				for (i = 0; i < MAX_ERASE_ZONES; i += 512)
-					pread(fd, &BadUnitTable[i], 512, ofs + 512 + i);
+					pread_nocheck(fd, &BadUnitTable[i], 512, ofs + 512 + i);
 			} else
 				printf("Second NFTL Media Header found at offset 0x%08lx\n",ofs);
 			NumMedHeads++;
@@ -233,10 +235,10 @@ static void dump_virtual_units(void)
 				if (lastgoodEUN == 0xffff)
 					memset(readbuf, 0, 512);
 				else
-					pread(fd, readbuf, 512,
+					pread_nocheck(fd, readbuf, 512,
 							(lastgoodEUN * ERASESIZE) + (j * 512));
 
-				write(ofd, readbuf, 512);
+				write_nocheck(ofd, readbuf, 512);
 			}
 
 		}
diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
index 733f367a329a..94d546bb645c 100644
--- a/tests/ubi-tests/integ.c
+++ b/tests/ubi-tests/integ.c
@@ -496,7 +496,9 @@ static void operate_on_ubi_device(struct ubi_device_info *ubi_device)
 			/* FIXME: Correctly make node */
 			maj = ubi_major(ubi_device->device_file_name);
 			sprintf(dev_name, "mknod %s c %d %d", s->device_file_name, maj, req.vol_id + 1);
-			system(dev_name);
+			if (system(dev_name))
+				error_exit("Failed to create device file");
+
 		} else if (close(fd) == -1)
 			error_exit("Failed to close volume device file");
 	}
@@ -559,7 +561,11 @@ static void get_ubi_devices_info(void)
 
 static void load_ubi(void)
 {
-	system("rmmod ubi");
+	int ret;
+
+	if (system("modprobe -r ubi"))
+		error_exit("Failed to unload UBI module");
+
 	if (system(ubi_module_load_string) != 0)
 		error_exit("Failed to load UBI module");
 	sleep(1);
-- 
2.7.4
