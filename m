Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ua77p-00061A-QF
 for linux-mtd@lists.infradead.org; Wed, 08 May 2013 16:21:54 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 74A8C33DFE8
 for <linux-mtd@lists.infradead.org>; Wed,  8 May 2013 16:21:22 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH [mtd-utils]] ftl_check/ftl_format/nftldump: use existing
 mtd_swab.h header
Date: Wed,  8 May 2013 12:21:23 -0400
Message-Id: <1368030083-28190-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We already have a helper header for swapping bytes as needed, so cut
the ftl tools over to that rather than re-implement things.

I don't actually have any devices with this kind of flash, so I can't
runtime test it.  But things *look* ok to me :).

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ftl_check.c  | 44 +++++++++++++++----------------------------
 ftl_format.c | 61 +++++++++++++++++++++++-------------------------------------
 nftldump.c   |  9 ++-------
 3 files changed, 40 insertions(+), 74 deletions(-)

diff --git a/ftl_check.c b/ftl_check.c
index 6d84785..0eada8f 100644
--- a/ftl_check.c
+++ b/ftl_check.c
@@ -50,24 +50,10 @@
 
 #include <mtd/mtd-user.h>
 #include <mtd/ftl-user.h>
+#include <mtd_swab.h>
 
-#include <byteswap.h>
-#include <endian.h>
 #include "common.h"
 
-#if __BYTE_ORDER == __LITTLE_ENDIAN
-# define TO_LE32(x) (x)
-# define TO_LE16(x) (x)
-#elif __BYTE_ORDER == __BIG_ENDIAN
-# define TO_LE32(x) (bswap_32(x))
-# define TO_LE16(x) (bswap_16(x))
-#else
-# error cannot detect endianess
-#endif
-
-#define FROM_LE32(x) TO_LE32(x)
-#define FROM_LE16(x) TO_LE16(x)
-
 /*====================================================================*/
 
 static void print_size(u_int s)
@@ -109,10 +95,10 @@ static void check_partition(int fd)
 			break;
 		}
 		read(fd, &hdr, sizeof(hdr));
-		if ((FROM_LE32(hdr.FormattedSize) > 0) &&
-				(FROM_LE32(hdr.FormattedSize) <= mtd.size) &&
-				(FROM_LE16(hdr.NumEraseUnits) > 0) &&
-				(FROM_LE16(hdr.NumEraseUnits) <= mtd.size/mtd.erasesize))
+		if ((le32_to_cpu(hdr.FormattedSize) > 0) &&
+				(le32_to_cpu(hdr.FormattedSize) <= mtd.size) &&
+				(le16_to_cpu(hdr.NumEraseUnits) > 0) &&
+				(le16_to_cpu(hdr.NumEraseUnits) <= mtd.size/mtd.erasesize))
 			break;
 	}
 	if (i == mtd.size/mtd.erasesize) {
@@ -122,9 +108,9 @@ static void check_partition(int fd)
 
 	printf("Partition header:\n");
 	printf("  Formatted size = ");
-	print_size(FROM_LE32(hdr.FormattedSize));
+	print_size(le32_to_cpu(hdr.FormattedSize));
 	printf(", erase units = %d, transfer units = %d\n",
-			FROM_LE16(hdr.NumEraseUnits), hdr.NumTransferUnits);
+			le16_to_cpu(hdr.NumEraseUnits), hdr.NumTransferUnits);
 	printf("  Erase unit size = ");
 	print_size(1 << hdr.EraseUnitSize);
 	printf(", virtual block size = ");
@@ -135,7 +121,7 @@ static void check_partition(int fd)
 	nbam = (mtd.erasesize >> hdr.BlockSize);
 	bam = malloc(nbam * sizeof(u_int));
 
-	for (i = 0; i < FROM_LE16(hdr.NumEraseUnits); i++) {
+	for (i = 0; i < le16_to_cpu(hdr.NumEraseUnits); i++) {
 		if (lseek(fd, (i << hdr.EraseUnitSize), SEEK_SET) == -1) {
 			perror("seek failed");
 			break;
@@ -149,12 +135,12 @@ static void check_partition(int fd)
 				(hdr2.NumEraseUnits != hdr.NumEraseUnits) ||
 				(hdr2.SerialNumber != hdr.SerialNumber))
 			printf("  Erase unit header is corrupt.\n");
-		else if (FROM_LE16(hdr2.LogicalEUN) == 0xffff)
-			printf("  Transfer unit, erase count = %d\n", FROM_LE32(hdr2.EraseCount));
+		else if (le16_to_cpu(hdr2.LogicalEUN) == 0xffff)
+			printf("  Transfer unit, erase count = %d\n", le32_to_cpu(hdr2.EraseCount));
 		else {
 			printf("  Logical unit %d, erase count = %d\n",
-					FROM_LE16(hdr2.LogicalEUN), FROM_LE32(hdr2.EraseCount));
-			if (lseek(fd, (i << hdr.EraseUnitSize)+FROM_LE32(hdr.BAMOffset),
+					le16_to_cpu(hdr2.LogicalEUN), le32_to_cpu(hdr2.EraseCount));
+			if (lseek(fd, (i << hdr.EraseUnitSize)+le32_to_cpu(hdr.BAMOffset),
 						SEEK_SET) == -1) {
 				perror("seek failed");
 				break;
@@ -165,11 +151,11 @@ static void check_partition(int fd)
 			}
 			free = deleted = control = data = 0;
 			for (j = 0; j < nbam; j++) {
-				if (BLOCK_FREE(FROM_LE32(bam[j])))
+				if (BLOCK_FREE(le32_to_cpu(bam[j])))
 					free++;
-				else if (BLOCK_DELETED(FROM_LE32(bam[j])))
+				else if (BLOCK_DELETED(le32_to_cpu(bam[j])))
 					deleted++;
-				else switch (BLOCK_TYPE(FROM_LE32(bam[j]))) {
+				else switch (BLOCK_TYPE(le32_to_cpu(bam[j]))) {
 					case BLOCK_CONTROL: control++; break;
 					case BLOCK_DATA: data++; break;
 					default: break;
diff --git a/ftl_format.c b/ftl_format.c
index 0ce601b..0f69b8f 100644
--- a/ftl_format.c
+++ b/ftl_format.c
@@ -50,22 +50,7 @@
 
 #include <mtd/mtd-user.h>
 #include <mtd/ftl-user.h>
-
-#include <byteswap.h>
-#include <endian.h>
-
-#if __BYTE_ORDER == __LITTLE_ENDIAN
-# define TO_LE32(x) (x)
-# define TO_LE16(x) (x)
-#elif __BYTE_ORDER == __BIG_ENDIAN
-# define TO_LE32(x) (bswap_32(x))
-# define TO_LE16(x) (bswap_16(x))
-#else
-# error cannot detect endianess
-#endif
-
-#define FROM_LE32(x) TO_LE32(x)
-#define FROM_LE16(x) TO_LE16(x)
+#include <mtd_swab.h>
 
 /*====================================================================*/
 
@@ -107,28 +92,28 @@ static void build_header(erase_unit_header_t *hdr, u_int RegionSize,
 	hdr->EraseUnitSize = 0;
 	for (i = BlockSize; i > 1; i >>= 1)
 		hdr->EraseUnitSize++;
-	hdr->EraseCount = TO_LE32(0);
-	hdr->FirstPhysicalEUN = TO_LE16(BootUnits);
-	hdr->NumEraseUnits = TO_LE16((RegionSize - BootSize) >> hdr->EraseUnitSize);
+	hdr->EraseCount = cpu_to_le32(0);
+	hdr->FirstPhysicalEUN = cpu_to_le16(BootUnits);
+	hdr->NumEraseUnits = cpu_to_le16((RegionSize - BootSize) >> hdr->EraseUnitSize);
 	hdr->NumTransferUnits = Spare;
 	__FormattedSize = RegionSize - ((Spare + BootUnits) << hdr->EraseUnitSize);
 	/* Leave a little bit of space between the CIS and BAM */
-	hdr->BAMOffset = TO_LE32(0x80);
+	hdr->BAMOffset = cpu_to_le32(0x80);
 	/* Adjust size to account for BAM space */
 	nbam = ((1 << (hdr->EraseUnitSize - hdr->BlockSize)) * sizeof(u_int)
-			+ FROM_LE32(hdr->BAMOffset) + (1 << hdr->BlockSize) - 1) >> hdr->BlockSize;
+			+ le32_to_cpu(hdr->BAMOffset) + (1 << hdr->BlockSize) - 1) >> hdr->BlockSize;
 
 	__FormattedSize -=
-		(FROM_LE16(hdr->NumEraseUnits) - Spare) * (nbam << hdr->BlockSize);
+		(le16_to_cpu(hdr->NumEraseUnits) - Spare) * (nbam << hdr->BlockSize);
 	__FormattedSize -= ((__FormattedSize * Reserve / 100) & ~0xfff);
 
-	hdr->FormattedSize = TO_LE32(__FormattedSize);
+	hdr->FormattedSize = cpu_to_le32(__FormattedSize);
 
 	/* hdr->FirstVMAddress defaults to erased state */
-	hdr->NumVMPages = TO_LE16(0);
+	hdr->NumVMPages = cpu_to_le16(0);
 	hdr->Flags = 0;
 	/* hdr->Code defaults to erased state */
-	hdr->SerialNumber = TO_LE32(time(NULL));
+	hdr->SerialNumber = cpu_to_le32(time(NULL));
 	/* hdr->AltEUHOffset defaults to erased state */
 
 } /* build_header */
@@ -170,11 +155,11 @@ static int format_partition(int fd, int quiet, int interrogate,
 		print_size(mtd.erasesize);
 		printf(", %d transfer units\n", spare);
 		if (bootsize != 0) {
-			print_size(FROM_LE16(hdr.FirstPhysicalEUN) << hdr.EraseUnitSize);
+			print_size(le16_to_cpu(hdr.FirstPhysicalEUN) << hdr.EraseUnitSize);
 			printf(" allocated for boot image\n");
 		}
 		printf("Reserved %d%%, formatted size = ", reserve);
-		print_size(FROM_LE32(hdr.FormattedSize));
+		print_size(le32_to_cpu(hdr.FormattedSize));
 		printf("\n");
 		fflush(stdout);
 	}
@@ -191,10 +176,10 @@ static int format_partition(int fd, int quiet, int interrogate,
 
 	/* Create basic block allocation table for control blocks */
 	nbam = ((mtd.erasesize >> hdr.BlockSize) * sizeof(u_int)
-			+ FROM_LE32(hdr.BAMOffset) + (1 << hdr.BlockSize) - 1) >> hdr.BlockSize;
+			+ le32_to_cpu(hdr.BAMOffset) + (1 << hdr.BlockSize) - 1) >> hdr.BlockSize;
 	bam = malloc(nbam * sizeof(u_int));
 	for (i = 0; i < nbam; i++)
-		bam[i] = TO_LE32(BLOCK_CONTROL);
+		bam[i] = cpu_to_le32(BLOCK_CONTROL);
 
 	/* Erase partition */
 	if (!quiet) {
@@ -202,8 +187,8 @@ static int format_partition(int fd, int quiet, int interrogate,
 		fflush(stdout);
 	}
 	erase.length = mtd.erasesize;
-	erase.start = mtd.erasesize * FROM_LE16(hdr.FirstPhysicalEUN);
-	for (i = 0; i < FROM_LE16(hdr.NumEraseUnits); i++) {
+	erase.start = mtd.erasesize * le16_to_cpu(hdr.FirstPhysicalEUN);
+	for (i = 0; i < le16_to_cpu(hdr.NumEraseUnits); i++) {
 		if (ioctl(fd, MEMERASE, &erase) < 0) {
 			if (!quiet) {
 				putchar('\n');
@@ -238,25 +223,25 @@ static int format_partition(int fd, int quiet, int interrogate,
 	}
 	lun = 0;
 	/* Distribute transfer units over the entire region */
-	step = (spare) ? (FROM_LE16(hdr.NumEraseUnits)/spare) : (FROM_LE16(hdr.NumEraseUnits)+1);
-	for (i = 0; i < FROM_LE16(hdr.NumEraseUnits); i++) {
-		off_t ofs = (off_t) (i + FROM_LE16(hdr.FirstPhysicalEUN)) << hdr.EraseUnitSize;
+	step = spare ? (le16_to_cpu(hdr.NumEraseUnits) / spare) : (le16_to_cpu(hdr.NumEraseUnits) + 1);
+	for (i = 0; i < le16_to_cpu(hdr.NumEraseUnits); i++) {
+		off_t ofs = (off_t) (i + le16_to_cpu(hdr.FirstPhysicalEUN)) << hdr.EraseUnitSize;
 		if (lseek(fd, ofs, SEEK_SET) == -1) {
 			perror("seek failed");
 			break;
 		}
 		/* Is this a transfer unit? */
 		if (((i+1) % step) == 0)
-			hdr.LogicalEUN = TO_LE16(0xffff);
+			hdr.LogicalEUN = cpu_to_le16(0xffff);
 		else {
-			hdr.LogicalEUN = TO_LE16(lun);
+			hdr.LogicalEUN = cpu_to_le16(lun);
 			lun++;
 		}
 		if (write(fd, &hdr, sizeof(hdr)) == -1) {
 			perror("write failed");
 			break;
 		}
-		if (lseek(fd, ofs + FROM_LE32(hdr.BAMOffset), SEEK_SET) == -1) {
+		if (lseek(fd, ofs + le32_to_cpu(hdr.BAMOffset), SEEK_SET) == -1) {
 			perror("seek failed");
 			break;
 		}
@@ -265,7 +250,7 @@ static int format_partition(int fd, int quiet, int interrogate,
 			break;
 		}
 	}
-	if (i < FROM_LE16(hdr.NumEraseUnits))
+	if (i < le16_to_cpu(hdr.NumEraseUnits))
 		return -1;
 	else
 		return 0;
diff --git a/nftldump.c b/nftldump.c
index 90ea072..32f4f2f 100644
--- a/nftldump.c
+++ b/nftldump.c
@@ -50,13 +50,8 @@ static int NumMedHeads;
 
 static unsigned char BadUnitTable[MAX_ERASE_ZONES];
 
-#if __BYTE_ORDER == __LITTLE_ENDIAN
-#define SWAP16(x) do { ; } while(0)
-#define SWAP32(x) do { ; } while(0)
-#else
-#define SWAP16(x) do { x = swab16(x); } while(0)
-#define SWAP32(x) do { x = swab32(x); } while(0)
-#endif
+#define SWAP16(x) do { x = le16_to_cpu(x); } while(0)
+#define SWAP32(x) do { x = le32_to_cpu(x); } while(0)
 
 /* VUCtable, store the Erase Unit Number of the first Erase Unit in the chain */
 static unsigned short *VUCtable;
-- 
1.8.2.1
