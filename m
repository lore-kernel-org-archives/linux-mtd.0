Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lpppz-0007T6-Au
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 20:18:10 +0000
Received: by qw-out-1920.google.com with SMTP id 5so968116qwf.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Apr 2009 13:18:01 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 3 Apr 2009 13:18:01 -0700
Message-ID: <a95a62fe0904031318q21bb727ft297aaa5edc18e2a@mail.gmail.com>
Subject: [PATCHv4] mtd-utils: use new 64-bit ioctls + sysfs to support >4GiB
	devices
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the new kernel ioctls to erase/lock/unlock/readoob/writeoob >4GiB
flash devices.

Use the new sysfs interface to query device info.

Dependencies:

"4GiB" extended ioctls:
http://lists.infradead.org/pipermail/linux-mtd/2009-April/025122.html

Driver model updates 1/2: http://lkml.org/lkml/2009/4/3/477

Optional: Driver model updates 2/2:
http://lists.infradead.org/pipermail/linux-mtd/2009-March/025011.html

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 Makefile               |   19 +++-
 flash_erase.c          |   59 ++++++----
 flash_eraseall.c       |   31 +++--
 flash_lock.c           |   21 ++--
 flash_unlock.c         |    9 +-
 flashcp.c              |   22 ++--
 include/mtd/mtd-abi.h  |   24 ++++-
 include/mtd/mtd-user.h |    4 +-
 mtd_debug.c            |  114 ++++++++++---------
 mtd_ioctl.c            |  303 ++++++++++++++++++++++++++++++++++++++++++++++++
 mtd_ioctl.h            |   38 ++++++
 nanddump.c             |   23 +++--
 nandtest.c             |   35 +++---
 nandwrite.c            |   54 +++++----
 14 files changed, 585 insertions(+), 171 deletions(-)
 create mode 100644 mtd_ioctl.c
 create mode 100644 mtd_ioctl.h

diff --git a/Makefile b/Makefile
index 969ab87..8bf2695 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,24 @@ $(BUILDDIR)/mkfs.jffs2: $(addprefix $(BUILDDIR)/,\
 LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 LDLIBS_mkfs.jffs2  = -lz -llzo2

-$(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o $(BUILDDIR)/flash_eraseall.o
+$(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o $(BUILDDIR)/flash_eraseall.o \
+	$(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/flash_erase: $(BUILDDIR)/flash_erase.o $(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/nandwrite: $(BUILDDIR)/nandwrite.o $(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/nandtest: $(BUILDDIR)/nandtest.o $(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/nanddump: $(BUILDDIR)/nanddump.o $(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/flashcp: $(BUILDDIR)/flashcp.o $(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/flash_lock: $(BUILDDIR)/flash_lock.o $(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/flash_unlock: $(BUILDDIR)/flash_unlock.o $(BUILDDIR)/mtd_ioctl.o
+
+$(BUILDDIR)/mtd_debug: $(BUILDDIR)/mtd_debug.o $(BUILDDIR)/mtd_ioctl.o

 $(BUILDDIR)/jffs2reader: $(BUILDDIR)/jffs2reader.o
 LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
diff --git a/flash_erase.c b/flash_erase.c
index fdf9918..f689cf5 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -11,22 +11,25 @@
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 #include <mtd/mtd-user.h>
+#include "mtd_ioctl.h"

-int region_erase(int Fd, int start, int count, int unlock, int regcount)
+int region_erase(int Fd, long long start, int count, int unlock, int regcount)
 {
 	int i, j;
-	region_info_t * reginfo;
+	region_info64_t * reginfo;

 	reginfo = calloc(regcount, sizeof(region_info_t));

 	for(i = 0; i < regcount; i++)
 	{
 		reginfo[i].regionindex = i;
-		if(ioctl(Fd,MEMGETREGIONINFO,&(reginfo[i])) != 0)
+		if(mtd_ioctl_getregioninfo(Fd,&(reginfo[i])) != 0)
 			return 8;
 		else
-			printf("Region %d is at %d of %d sector and with sector "
-					"size %x\n", i, reginfo[i].offset, reginfo[i].numblocks,
+			printf("Region %d is at %lld of %d sector and with sector "
+					"size %x\n", i,
+					(unsigned long long)reginfo[i].offset,
+					reginfo[i].numblocks,
 					reginfo[i].erasesize);
 	}

@@ -34,7 +37,7 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)

 	for(i = 0; i < regcount; i++)
 	{ //Loop through the regions
-		region_info_t * r = &(reginfo[i]);
+		region_info64_t * r = &(reginfo[i]);

 		if((start >= reginfo[i].offset) &&
 				(start < (r->offset + r->numblocks*r->erasesize)))
@@ -43,7 +46,7 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)

 	if(i >= regcount)
 	{
-		printf("Starting offset %x not within chip.\n", start);
+		printf("Starting offset %llx not within chip.\n", start);
 		return 8;
 	}

@@ -52,25 +55,28 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)

 	for(j = 0; (j < count)&&(i < regcount); j++)
 	{
-		erase_info_t erase;
-		region_info_t * r = &(reginfo[i]);
+		erase_info64_t erase;
+		region_info64_t * r = &(reginfo[i]);
+		
+		memset(&erase, 0, sizeof(erase));

 		erase.start = start;
 		erase.length = r->erasesize;

 		if(unlock != 0)
 		{ //Unlock the sector first.
-			if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
+			if(mtd_ioctl_unlock(Fd, &erase) != 0)
 			{
 				perror("\nMTD Unlock failure");
 				close(Fd);
 				return 8;
 			}
 		}
-		printf("\rPerforming Flash Erase of length %u at offset 0x%x",
-				erase.length, erase.start);
+		printf("\rPerforming Flash Erase of length %llu at offset 0x%llx",
+				(unsigned long long)erase.length,
+				(unsigned long long)erase.start);
 		fflush(stdout);
-		if(ioctl(Fd, MEMERASE, &erase) != 0)
+		if(mtd_ioctl_erase(Fd, &erase) != 0)
 		{
 			perror("\nMTD Erase failure");
 			close(Fd);
@@ -91,28 +97,31 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)
 	return 0;
 }

-int non_region_erase(int Fd, int start, int count, int unlock)
+int non_region_erase(int Fd, long long start, int count, int unlock)
 {
-	mtd_info_t meminfo;
+	mtd_info64_t meminfo;

-	if (ioctl(Fd,MEMGETINFO,&meminfo) == 0)
+	if (mtd_ioctl_getinfo(Fd,&meminfo) == 0)
 	{
-		erase_info_t erase;
+		erase_info64_t erase;

-		erase.start = start;
+		memset(&erase, 0, sizeof(erase));

+		erase.start = start;
 		erase.length = meminfo.erasesize;

 		for (; count > 0; count--) {
-			printf("\rPerforming Flash Erase of length %u at offset 0x%x",
-					erase.length, erase.start);
+			printf("\rPerforming Flash Erase of length %llu at offset 0x%llx",
+					(unsigned long long)erase.length,
+					(unsigned long long)erase.start);
 			fflush(stdout);

 			if(unlock != 0)
 			{
 				//Unlock the sector first.
-				printf("\rPerforming Flash unlock at offset 0x%x",erase.start);
-				if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
+				printf("\rPerforming Flash unlock at offset 0x%llx",
+					(unsigned long long)erase.start);
+				if(mtd_ioctl_unlock(Fd, &erase) != 0)
 				{
 					perror("\nMTD Unlock failure");
 					close(Fd);
@@ -120,7 +129,7 @@ int non_region_erase(int Fd, int start, int count,
int unlock)
 				}
 			}

-			if (ioctl(Fd,MEMERASE,&erase) != 0)
+			if (mtd_ioctl_erase(Fd,&erase) != 0)
 			{
 				perror("\nMTD Erase failure");
 				close(Fd);
@@ -137,7 +146,7 @@ int main(int argc,char *argv[])
 {
 	int regcount;
 	int Fd;
-	int start;
+	long long start;
 	int count;
 	int unlock;
 	int res = 0;
@@ -149,7 +158,7 @@ int main(int argc,char *argv[])
 	}

 	if (argc > 2)
-		start = strtol(argv[2], NULL, 0);
+		start = strtoll(argv[2], NULL, 0);
 	else
 		start = 0;

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..8f44570 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -36,6 +36,7 @@
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 #include "crc32.h"
+#include "mtd_ioctl.h"

 #include <mtd/mtd-user.h>
 #include <mtd/jffs2-user.h>
@@ -49,7 +50,7 @@ static int quiet;		/* true -- don't output progress */
 static int jffs2;		// format for jffs2 usage

 static void process_options (int argc, char *argv[]);
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase);
+void show_progress (mtd_info64_t *meminfo, erase_info64_t *erase);
 static void display_help (void);
 static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
@@ -57,9 +58,9 @@ int target_endian = __BYTE_ORDER;

 int main (int argc, char *argv[])
 {
-	mtd_info_t meminfo;
+	mtd_info64_t meminfo;
 	int fd, clmpos = 0, clmlen = 8;
-	erase_info_t erase;
+	erase_info64_t erase;
 	int isNAND, bbtest = 1;

 	process_options(argc, argv);
@@ -70,11 +71,12 @@ int main (int argc, char *argv[])
 	}


-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
+	if (mtd_ioctl_getinfo(fd, &meminfo) != 0) {
 		fprintf(stderr, "%s: %s: unable to get MTD device info\n",
exe_name, mtd_device);
 		return 1;
 	}

+	memset(&erase, 0, sizeof(erase));
 	erase.length = meminfo.erasesize;
 	isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;

@@ -130,7 +132,8 @@ int main (int argc, char *argv[])
 			int ret = ioctl(fd, MEMGETBADBLOCK, &offset);
 			if (ret > 0) {
 				if (!quiet)
-					printf ("\nSkipping bad block at 0x%08x\n", erase.start);
+					printf ("\nSkipping bad block at 0x%08llx\n",
+						(unsigned long long)erase.start);
 				continue;
 			} else if (ret < 0) {
 				if (errno == EOPNOTSUPP) {
@@ -149,7 +152,7 @@ int main (int argc, char *argv[])
 		if (!quiet)
 			show_progress(&meminfo, &erase);

-		if (ioctl(fd, MEMERASE, &erase) != 0) {
+		if (mtd_ioctl_erase(fd, &erase) != 0) {
 			fprintf(stderr, "\n%s: %s: MTD Erase failure: %s\n", exe_name,
mtd_device, strerror(errno));
 			continue;
 		}
@@ -160,11 +163,12 @@ int main (int argc, char *argv[])

 		/* write cleanmarker */
 		if (isNAND) {
-			struct mtd_oob_buf oob;
-			oob.ptr = (unsigned char *) &cleanmarker;
+			struct mtd_oob_buf64 oob;
+			memset(&oob, 0, sizeof(oob));
+			oob.usr_ptr = (uintptr_t) &cleanmarker;
 			oob.start = erase.start + clmpos;
 			oob.length = clmlen;
-			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
+			if (mtd_ioctl_writeoob(fd, &oob) != 0) {
 				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name,
mtd_device, strerror(errno));
 				continue;
 			}
@@ -179,7 +183,8 @@ int main (int argc, char *argv[])
 			}
 		}
 		if (!quiet)
-			printf (" Cleanmarker written at %x.", erase.start);
+			printf (" Cleanmarker written at %llx.",
+				(unsigned long long)erase.start);
 	}
 	if (!quiet) {
 		show_progress(&meminfo, &erase);
@@ -250,10 +255,10 @@ void process_options (int argc, char *argv[])
 	mtd_device = argv[optind];
 }

-void show_progress (mtd_info_t *meminfo, erase_info_t *erase)
+void show_progress (mtd_info64_t *meminfo, erase_info64_t *erase)
 {
-	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
-		meminfo->erasesize / 1024, erase->start,
+	printf("\rErasing %d Kibyte @ %llx -- %2llu %% complete.",
+		meminfo->erasesize / 1024, (unsigned long long)erase->start,
 		(unsigned long long) erase->start * 100 / meminfo->size);
 	fflush(stdout);
 }
diff --git a/flash_lock.c b/flash_lock.c
index dca6794..37509bf 100644
--- a/flash_lock.c
+++ b/flash_lock.c
@@ -15,14 +15,15 @@
 #include <string.h>

 #include <mtd/mtd-user.h>
+#include "mtd_ioctl.h"

 int main(int argc, char *argv[])
 {
 	int fd;
-	struct mtd_info_user mtdInfo;
-	struct erase_info_user mtdLockInfo;
-	int num_sectors;
-	int ofs;
+	struct mtd_info_user64 mtdInfo;
+	struct erase_info_user64 mtdLockInfo;
+	long long num_sectors;
+	long long ofs;

 	/*
 	 * Parse command line options
@@ -45,17 +46,17 @@ int main(int argc, char *argv[])
 		exit(1);
 	}

-	if(ioctl(fd, MEMGETINFO, &mtdInfo))
+	if(mtd_ioctl_getinfo(fd, &mtdInfo))
 	{
 		fprintf(stderr, "Could not get MTD device info from %s\n", argv[1]);
 		close(fd);
 		exit(1);
 	}
-	sscanf(argv[2], "%x",&ofs);
-	sscanf(argv[3], "%d",&num_sectors);
+	sscanf(argv[2], "%llx",&ofs);
+	sscanf(argv[3], "%lld",&num_sectors);
 	if(ofs > mtdInfo.size - mtdInfo.erasesize)
 	{
-		fprintf(stderr, "%x is beyond device size %x\n",ofs,(unsigned
int)(mtdInfo.size - mtdInfo.erasesize));
+		fprintf(stderr, "%llx is beyond device size %llx\n",ofs,(unsigned
long long)(mtdInfo.size - mtdInfo.erasesize));
 		exit(1);
 	}

@@ -65,14 +66,14 @@ int main(int argc, char *argv[])
 	else {
 		if(num_sectors > mtdInfo.size/mtdInfo.erasesize)
 		{
-			fprintf(stderr, "%d are too many sectors, device only has
%d\n",num_sectors,(int)(mtdInfo.size/mtdInfo.erasesize));
+			fprintf(stderr, "%lld are too many sectors, device only has
%lld\n",num_sectors,(long long)(mtdInfo.size/mtdInfo.erasesize));
 			exit(1);
 		}
 	}

 	mtdLockInfo.start = ofs;
 	mtdLockInfo.length = num_sectors * mtdInfo.erasesize;
-	if(ioctl(fd, MEMLOCK, &mtdLockInfo))
+	if(mtd_ioctl_lock(fd, &mtdLockInfo))
 	{
 		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
 		close(fd);
diff --git a/flash_unlock.c b/flash_unlock.c
index 648dc4f..b7793b7 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -15,12 +15,13 @@
 #include <string.h>

 #include <mtd/mtd-user.h>
+#include "mtd_ioctl.h"

 int main(int argc, char *argv[])
 {
 	int fd;
-	struct mtd_info_user mtdInfo;
-	struct erase_info_user mtdLockInfo;
+	struct mtd_info_user64 mtdInfo;
+	struct erase_info_user64 mtdLockInfo;

 	/*
 	 * Parse command line options
@@ -43,7 +44,7 @@ int main(int argc, char *argv[])
 		exit(1);
 	}

-	if(ioctl(fd, MEMGETINFO, &mtdInfo))
+	if(mtd_ioctl_getinfo(fd, &mtdInfo))
 	{
 		fprintf(stderr, "Could not get MTD device info from %s\n", argv[1]);
 		close(fd);
@@ -52,7 +53,7 @@ int main(int argc, char *argv[])

 	mtdLockInfo.start = 0;
 	mtdLockInfo.length = mtdInfo.size;
-	if(ioctl(fd, MEMUNLOCK, &mtdLockInfo))
+	if(mtd_ioctl_unlock(fd, &mtdLockInfo))
 	{
 		fprintf(stderr, "Could not unlock MTD device: %s\n", argv[1]);
 		close(fd);
diff --git a/flashcp.c b/flashcp.c
index 8775022..d9bab84 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -40,6 +40,7 @@
 #include <unistd.h>
 #include <mtd/mtd-user.h>
 #include <getopt.h>
+#include "mtd_ioctl.h"

 typedef int bool;
 #define true 1
@@ -169,8 +170,8 @@ int main (int argc,char *argv[])
 	int i,flags = FLAG_NONE;
 	ssize_t result;
 	size_t size,written;
-	struct mtd_info_user mtd;
-	struct erase_info_user erase;
+	struct mtd_info_user64 mtd;
+	struct erase_info_user64 erase;
 	struct stat filestat;
 	unsigned char src[BUFSIZE],dest[BUFSIZE];

@@ -226,7 +227,7 @@ int main (int argc,char *argv[])

 	/* get some info about the flash device */
 	dev_fd = safe_open (device,O_SYNC | O_RDWR);
-	if (ioctl (dev_fd,MEMGETINFO,&mtd) < 0)
+	if (mtd_ioctl_getinfo (dev_fd,&mtd) < 0)
 	{
 		DEBUG("ioctl(): %m\n");
 		log_printf (LOG_ERROR,"This doesn't seem to be a valid MTD flash device!\n");
@@ -254,6 +255,7 @@ int main (int argc,char *argv[])

 #warning "Check for smaller erase regions"

+	memset(&erase, 0, sizeof(erase));
 	erase.start = 0;
 	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
 	erase.length *= mtd.erasesize;
@@ -261,18 +263,18 @@ int main (int argc,char *argv[])
 	if (flags & FLAG_VERBOSE)
 	{
 		/* if the user wants verbose output, erase 1 block at a time and
show him/her what's going on */
-		int blocks = erase.length / mtd.erasesize;
+		long long blocks = erase.length / mtd.erasesize;
 		erase.length = mtd.erasesize;
 		log_printf (LOG_NORMAL,"Erasing blocks: 0/%d (0%%)",blocks);
 		for (i = 1; i <= blocks; i++)
 		{
 			log_printf (LOG_NORMAL,"\rErasing blocks: %d/%d
(%d%%)",i,blocks,PERCENTAGE (i,blocks));
-			if (ioctl (dev_fd,MEMERASE,&erase) < 0)
+			if (mtd_ioctl_erase (dev_fd, &erase) < 0)
 			{
 				log_printf (LOG_NORMAL,"\n");
 				log_printf (LOG_ERROR,
-						"While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
-						(unsigned int) erase.start,(unsigned int) (erase.start +
erase.length),device);
+						"While erasing blocks 0x%.8llx-0x%.8llx on %s: %m\n",
+						erase.start, (erase.start + erase.length),device);
 				exit (EXIT_FAILURE);
 			}
 			erase.start += mtd.erasesize;
@@ -282,11 +284,11 @@ int main (int argc,char *argv[])
 	else
 	{
 		/* if not, erase the whole chunk in one shot */
-		if (ioctl (dev_fd,MEMERASE,&erase) < 0)
+		if (mtd_ioctl_erase (dev_fd, &erase) < 0)
 		{
 			log_printf (LOG_ERROR,
-					"While erasing blocks from 0x%.8x-0x%.8x on %s: %m\n",
-					(unsigned int) erase.start,(unsigned int) (erase.start +
erase.length),device);
+					"While erasing blocks from 0x%.8llx-0x%.8llx on %s: %m\n",
+					erase.start, (erase.start + erase.length),device);
 			exit (EXIT_FAILURE);
 		}
 	}
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 86defe1..5e336bf 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -1,23 +1,35 @@
 /*
- * $Id: mtd-abi.h,v 1.13 2005/11/07 11:14:56 gleixner Exp $
- *
  * Portions of MTD ABI definition which are shared by kernel and user space
  */

 #ifndef __MTD_ABI_H__
 #define __MTD_ABI_H__

+#include <linux/types.h>
+
 struct erase_info_user {
 	uint32_t start;
 	uint32_t length;
 };

+struct erase_info_user64 {
+	__u64    start;
+	__u64    length;
+};
+
 struct mtd_oob_buf {
 	uint32_t start;
 	uint32_t length;
 	unsigned char *ptr;
 };

+struct mtd_oob_buf64 {
+	__u64    start;
+	__u32    res0;
+	__u32    length;
+	__u64    usr_ptr;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -29,7 +41,7 @@ struct mtd_oob_buf {
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
-#define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
+#define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */

 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
@@ -96,6 +108,12 @@ struct otp_info {
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)

+#define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
+#define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
+#define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MEMLOCK64		_IOW('M', 23, struct erase_info_user64)
+#define MEMUNLOCK64		_IOW('M', 24, struct erase_info_user64)
+
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
diff --git a/include/mtd/mtd-user.h b/include/mtd/mtd-user.h
index 713f34d..a5ec18e 100644
--- a/include/mtd/mtd-user.h
+++ b/include/mtd/mtd-user.h
@@ -1,6 +1,4 @@
 /*
- * $Id: mtd-user.h,v 1.2 2004/05/05 14:44:57 dwmw2 Exp $
- *
  * MTD ABI header for use by user space only.
  */

@@ -18,4 +16,6 @@ typedef struct region_info_user region_info_t;
 typedef struct nand_oobinfo nand_oobinfo_t;
 typedef struct nand_ecclayout nand_ecclayout_t;

+typedef struct erase_info_user64 erase_info64_t;
+
 #endif /* __MTD_USER_H__ */
diff --git a/mtd_debug.c b/mtd_debug.c
index 85d48e9..7d7dc3b 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -37,28 +37,13 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <mtd/mtd-user.h>
-
-/*
- * MEMGETINFO
- */
-static int getmeminfo (int fd,struct mtd_info_user *mtd)
-{
-	return (ioctl (fd,MEMGETINFO,mtd));
-}
-
-/*
- * MEMERASE
- */
-static int memerase (int fd,struct erase_info_user *erase)
-{
-	return (ioctl (fd,MEMERASE,erase));
-}
+#include "mtd_ioctl.h"

 /*
  * MEMGETREGIONCOUNT
- * MEMGETREGIONINFO
+ * MEMGETREGIONINFO64
  */
-static int getregions (int fd,struct region_info_user *regions,int *n)
+static int getregions (int fd,struct region_info_user64 *regions,int *n)
 {
 	int i,err;
 	err = ioctl (fd,MEMGETREGIONCOUNT,n);
@@ -66,44 +51,48 @@ static int getregions (int fd,struct
region_info_user *regions,int *n)
 	for (i = 0; i < *n; i++)
 	{
 		regions[i].regionindex = i;
-		err = ioctl (fd,MEMGETREGIONINFO,&regions[i]);
+		err = mtd_ioctl_getregioninfo (fd,&regions[i]);
 		if (err) return (err);
 	}
 	return (0);
 }

-int erase_flash (int fd,u_int32_t offset,u_int32_t bytes)
+int erase_flash (int fd,u_int64_t offset,u_int64_t bytes)
 {
 	int err;
-	struct erase_info_user erase;
+	struct erase_info_user64 erase;
+
+	memset(&erase, 0, sizeof(erase));
 	erase.start = offset;
 	erase.length = bytes;
-	err = memerase (fd,&erase);
+
+	err = mtd_ioctl_erase (fd,&erase);
 	if (err < 0)
 	{
 		perror ("MEMERASE");
 		return (1);
 	}
-	fprintf (stderr,"Erased %d bytes from address 0x%.8x in
flash\n",bytes,offset);
+	fprintf (stderr,"Erased %lld bytes from address 0x%.8llx in flash\n",
+		(unsigned long long)bytes, (unsigned long long)offset);
 	return (0);
 }

-void printsize (u_int32_t x)
+void printsize (u_int64_t x)
 {
 	int i;
 	static const char *flags = "KMGT";
-	printf ("%u ",x);
+	printf ("%llu ", (unsigned long long)x);
 	for (i = 0; x >= 1024 && flags[i] != '\0'; i++) x /= 1024;
 	i--;
-	if (i >= 0) printf ("(%u%c)",x,flags[i]);
+	if (i >= 0) printf ("(%llu%c)",(unsigned long long)x,flags[i]);
 }

-int flash_to_file (int fd,u_int32_t offset,size_t len,const char *filename)
+int flash_to_file (int fd, off_t offset,size_t len,const char *filename)
 {
 	u_int8_t *buf = NULL;
 	int outfd,err;
-	int size = len * sizeof (u_int8_t);
-	int n = len;
+	size_t size = len * sizeof (u_int8_t);
+	size_t n = len;

 	if (offset != lseek (fd,offset,SEEK_SET))
 	{
@@ -121,10 +110,12 @@ retry:
 	if ((buf = (u_int8_t *) malloc (size)) == NULL)
 	{
 #define BUF_SIZE	(64 * 1024 * sizeof (u_int8_t))
-		fprintf (stderr, "%s: malloc(%#x)\n", __FUNCTION__, size);
+		fprintf (stderr, "%s: malloc(%#x)\n", __FUNCTION__,
+			(unsigned int)size);
 		if (size != BUF_SIZE) {
 			size = BUF_SIZE;
-			fprintf (stderr, "%s: trying buffer size %#x\n", __FUNCTION__, size);
+			fprintf (stderr, "%s: trying buffer size %#x\n",
+				__FUNCTION__, (unsigned int)size);
 			goto retry;
 		}
 		perror ("malloc()");
@@ -136,20 +127,25 @@ retry:
 		err = read (fd,buf,size);
 		if (err < 0)
 		{
-			fprintf (stderr, "%s: read, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf (stderr, "%s: read, size %#x, n %#x\n",
+				__FUNCTION__, (unsigned int)size,
+				(unsigned int)n);
 			perror ("read()");
 			goto err2;
 		}
 		err = write (outfd,buf,size);
 		if (err < 0)
 		{
-			fprintf (stderr, "%s: write, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf (stderr, "%s: write, size %#x, n %#x\n",
+				__FUNCTION__, (unsigned int)size,
+				(unsigned int)n);
 			perror ("write()");
 			goto err2;
 		}
 		if (err != size)
 		{
-			fprintf (stderr,"Couldn't copy entire buffer to %s. (%d/%d bytes
copied)\n",filename,err,size);
+			fprintf (stderr,"Couldn't copy entire buffer to %s. (%d/%d bytes copied)\n",
+				filename,err,(int)size);
 			goto err2;
 		}
 		n -= size;
@@ -158,7 +154,8 @@ retry:
 	if (buf != NULL)
 		free (buf);
 	close (outfd);
-	printf ("Copied %d bytes from address 0x%.8x in flash to
%s\n",len,offset,filename);
+	printf ("Copied %d bytes from address 0x%.8llx in flash to %s\n",
+		(int)len,(unsigned long long)offset,filename);
 	return (0);

 err2:
@@ -170,13 +167,13 @@ err0:
 	return (1);
 }

-int file_to_flash (int fd,u_int32_t offset,u_int32_t len,const char *filename)
+int file_to_flash (int fd, off_t offset, size_t len,const char *filename)
 {
 	u_int8_t *buf = NULL;
 	FILE *fp;
 	int err;
-	int size = len * sizeof (u_int8_t);
-	int n = len;
+	size_t size = len * sizeof (u_int8_t);
+	size_t n = len;

 	if (offset != lseek (fd,offset,SEEK_SET))
 	{
@@ -191,10 +188,12 @@ int file_to_flash (int fd,u_int32_t
offset,u_int32_t len,const char *filename)
 retry:
 	if ((buf = (u_int8_t *) malloc (size)) == NULL)
 	{
-		fprintf (stderr, "%s: malloc(%#x) failed\n", __FUNCTION__, size);
+		fprintf (stderr, "%s: malloc(%#x) failed\n",
+			__FUNCTION__, (int)size);
 		if (size != BUF_SIZE) {
 			size = BUF_SIZE;
-			fprintf (stderr, "%s: trying buffer size %#x\n", __FUNCTION__, size);
+			fprintf (stderr, "%s: trying buffer size %#x\n",
+				__FUNCTION__, (int)size);
 			goto retry;
 		}
 		perror ("malloc()");
@@ -206,7 +205,9 @@ retry:
 			size = n;
 		if (fread (buf,size,1,fp) != 1 || ferror (fp))
 		{
-			fprintf (stderr, "%s: fread, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf (stderr, "%s: fread, size %#x, n %#x\n",
+				__FUNCTION__, (unsigned int)size,
+				(unsigned int)n);
 			perror ("fread()");
 			free (buf);
 			fclose (fp);
@@ -215,7 +216,9 @@ retry:
 		err = write (fd,buf,size);
 		if (err < 0)
 		{
-			fprintf (stderr, "%s: write, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf (stderr, "%s: write, size %#x, n %#x\n",
+				__FUNCTION__, (unsigned int)size,
+				(unsigned int)n);
 			perror ("write()");
 			free (buf);
 			fclose (fp);
@@ -227,23 +230,26 @@ retry:
 	if (buf != NULL)
 		free (buf);
 	fclose (fp);
-	printf ("Copied %d bytes from %s to address 0x%.8x in
flash\n",len,filename,offset);
+	printf ("Copied %d bytes from %s to address 0x%.8llx in flash\n",
+		(int)len,filename,(unsigned long long)offset);
 	return (0);
 }

 int showinfo (int fd)
 {
 	int i,err,n;
-	struct mtd_info_user mtd;
-	static struct region_info_user region[1024];
+	struct mtd_info_user64 mtd;
+	static struct region_info_user64 region[1024];

-	err = getmeminfo (fd,&mtd);
+	err = mtd_ioctl_getinfo (fd,&mtd);
 	if (err < 0)
 	{
-		perror ("MEMGETINFO");
+		perror ("MEMGETINFO64");
 		return (1);
 	}

+	memset(region, 0, sizeof(region));
+
 	err = getregions (fd,region,&n);
 	if (err < 0)
 	{
@@ -301,7 +307,7 @@ int showinfo (int fd)
 			{ "MTD_WRITEABLE", MTD_WRITEABLE },
 			{ "MTD_BIT_WRITEABLE", MTD_BIT_WRITEABLE },
 			{ "MTD_NO_ERASE", MTD_NO_ERASE },
-			{ "MTD_STUPID_LOCK", MTD_STUPID_LOCK },
+			{ "MTD_POWERUP_LOCK", MTD_POWERUP_LOCK },
 			{ NULL, -1 }
 		};
 		for (i = 0; flags[i].name != NULL; i++)
@@ -309,7 +315,7 @@ int showinfo (int fd)
 			{
 				if (first)
 				{
-					printf (flags[i].name);
+					printf ("%s", flags[i].name);
 					first = 0;
 				}
 				else printf (" | %s",flags[i].name);
@@ -335,9 +341,9 @@ int showinfo (int fd)

 	for (i = 0; i < n; i++)
 	{
-		printf ("region[%d].offset = 0x%.8x\n"
+		printf ("region[%d].offset = 0x%.8llx\n"
 				"region[%d].erasesize = ",
-				i,region[i].offset,i);
+				i,(unsigned long long)region[i].offset,i);
 		printsize (region[i].erasesize);
 		printf ("\nregion[%d].numblocks = %d\n"
 				"region[%d].regionindex = %d\n",
@@ -399,13 +405,13 @@ int main (int argc,char *argv[])
 			showinfo (fd);
 			break;
 		case OPT_READ:
-			err = flash_to_file (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0),argv[5]);
+			err = flash_to_file (fd,strtoll (argv[3],NULL,0),strtoll
(argv[4],NULL,0),argv[5]);
 			break;
 		case OPT_WRITE:
-			err = file_to_flash (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0),argv[5]);
+			err = file_to_flash (fd,strtoll (argv[3],NULL,0),strtoll
(argv[4],NULL,0),argv[5]);
 			break;
 		case OPT_ERASE:
-			err = erase_flash (fd,strtol (argv[3],NULL,0),strtol (argv[4],NULL,0));
+			err = erase_flash (fd,strtoll (argv[3],NULL,0),strtoll (argv[4],NULL,0));
 			break;
 	}

diff --git a/mtd_ioctl.c b/mtd_ioctl.c
new file mode 100644
index 0000000..500a743
--- /dev/null
+++ b/mtd_ioctl.c
@@ -0,0 +1,303 @@
+/*
+ * mtd_ioctl.c - backward compatibility wrappers for MTD ioctls
+ */
+
+#include <unistd.h>
+#include <errno.h>
+#include <string.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+#include <sys/fcntl.h>
+#include <sys/stat.h>
+#include <mtd/mtd-user.h>
+#include "mtd_ioctl.h"
+
+#define BUF_LEN		64
+
+static int use_old_abi = 0;
+
+static int try_new_ioctl(int fd, unsigned int cmd, unsigned long arg,
int *retp)
+{
+	int ret;
+
+	if(use_old_abi)
+		return(0);
+	ret = ioctl(fd, cmd, arg);
+	if((ret < 0) && (errno == ENOTTY)) {
+		use_old_abi = 1;
+		return(0);
+	}
+	*retp = ret;
+	return(1);
+}
+
+/**
+ * mkpath - compose full path from 2 given components.
+ * @path: the first component
+ * @name: the second component
+ *
+ * This function returns the resulting path in case of success and %NULL in
+ * case of failure.
+ */
+static char *mkpath(const char *path, const char *name)
+{
+	char *n;
+	int len1 = strlen(path);
+	int len2 = strlen(name);
+
+	n = malloc(len1 + len2 + 2);
+	if (!n) {
+		return NULL;
+	}
+
+	memcpy(n, path, len1);
+	if (n[len1 - 1] != '/')
+		n[len1++] = '/';
+
+	memcpy(n + len1, name, len2 + 1);
+	return n;
+}
+
+/**
+ * read_data - read data from a file.
+ * @file: the file to read from
+ * @buf: the buffer to read to
+ * @buf_len: buffer length
+ *
+ * This function returns number of read bytes in case of success and %-1 in
+ * case of failure. Note, if the file contains more then @buf_len bytes of
+ * date, this function fails with %EINVAL error code.
+ */
+static int sysfs_get_str(const char *prefix, const char *element,
+	char *buf, int buf_len)
+{
+	int fd, rd, tmp, tmp1;
+	char *file = mkpath(prefix, element), *sep;
+
+	if(! file)
+		return -1;
+
+	fd = open(file, O_RDONLY);
+	if (fd == -1) {
+		free(file);
+		return -1;
+	}
+
+	rd = read(fd, buf, buf_len);
+	if (rd == -1) {
+		goto out_error;
+	}
+
+	/* Make sure all data is read */
+	tmp1 = read(fd, &tmp, 1);
+	if (tmp1 == 1) {
+		goto out_error;
+	}
+	if (tmp1) {
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (close(fd)) {
+		rd = -1;
+	}
+
+	sep = index(buf, '\n');
+	if(sep)
+		*sep = 0;
+	else
+		buf[buf_len - 1] = 0;
+
+	free(file);
+	return rd;
+
+out_error:
+	close(fd);
+	free(file);
+	return -1;
+}
+
+static int sysfs_get_ull(const char *prefix, const char *element,
+	unsigned long long *out)
+{
+	int ret;
+	char buf[BUF_LEN];
+
+	ret = sysfs_get_str(prefix, element, buf, BUF_LEN);
+	if(ret <= 0)
+		return(ret);
+	
+	if(sscanf(buf, "0x%llx", out) == 1)
+		return(0);
+	
+	if(sscanf(buf, "%llu", out) == 1)
+		return(0);
+
+	return(-1);
+}
+
+int mtd_ioctl_getinfo(int fd, struct mtd_info_user64 *arg)
+{
+	int ret;
+	struct mtd_info_user oldarg;
+	struct stat st;
+	char prefix[BUF_LEN], str[BUF_LEN];
+	unsigned long long tmp;
+
+	if((fstat(fd, &st) < 0) || !S_ISCHR(st.st_mode))
+		return(-1);
+	
+	snprintf(prefix, BUF_LEN, "/sys/class/mtd/mtd%d/",
+		minor(st.st_rdev) >> 1);
+
+	if(sysfs_get_str(prefix, "type", str, BUF_LEN) > 0) {
+		if(strcasecmp(str, "absent") == 0)
+			arg->type = MTD_ABSENT;
+		else if(strcasecmp(str, "ram") == 0)
+			arg->type = MTD_RAM;
+		else if(strcasecmp(str, "rom") == 0)
+			arg->type = MTD_ROM;
+		else if(strcasecmp(str, "nor") == 0)
+			arg->type = MTD_NORFLASH;
+		else if(strcasecmp(str, "nand") == 0)
+			arg->type = MTD_NANDFLASH;
+		else if(strcasecmp(str, "dataflash") == 0)
+			arg->type = MTD_DATAFLASH;
+		else if(strcasecmp(str, "ubi") == 0)
+			arg->type = MTD_UBIVOLUME;
+		else
+			return(-1);
+
+		if(sysfs_get_ull(prefix, "flags", &tmp) != 0)
+			return(-1);
+		arg->flags = tmp;
+
+		if(sysfs_get_ull(prefix, "size", &tmp) != 0)
+			return(-1);
+		arg->size = tmp;
+
+		if(sysfs_get_ull(prefix, "erasesize", &tmp) != 0)
+			return(-1);
+		arg->erasesize = tmp;
+
+		if(sysfs_get_ull(prefix, "writesize", &tmp) != 0)
+			return(-1);
+		arg->writesize = tmp;
+
+		if(sysfs_get_ull(prefix, "oobsize", &tmp) != 0)
+			return(-1);
+		arg->oobsize = tmp;
+
+		return(0);
+	}
+
+	ret = ioctl(fd, MEMGETINFO, (unsigned long)&oldarg);
+	if(ret < 0)
+		return(ret);
+	
+	arg->type = oldarg.type;
+	arg->flags = oldarg.flags;
+	arg->size = oldarg.size;
+	arg->erasesize = oldarg.erasesize;
+	arg->writesize = oldarg.writesize;
+	arg->oobsize = oldarg.oobsize;
+
+	return(ret);
+}
+
+int mtd_ioctl_erase(int fd, struct erase_info_user64 *arg)
+{
+	int ret;
+	struct erase_info_user oldarg;
+
+	if(try_new_ioctl(fd, MEMERASE64, (unsigned long)arg, &ret) != 0)
+		return(ret);
+	
+	oldarg.start = arg->start;
+	oldarg.length = arg->length;
+
+	return(ioctl(fd, MEMERASE, (unsigned long)&oldarg));
+}
+
+int mtd_ioctl_writeoob(int fd, struct mtd_oob_buf64 *arg)
+{
+	int ret;
+	struct mtd_oob_buf oldarg;
+
+	if(try_new_ioctl(fd, MEMWRITEOOB64, (unsigned long)arg, &ret) != 0)
+		return(ret);
+	
+	oldarg.start = arg->start;
+	oldarg.length = arg->length;
+	oldarg.ptr = (void *)(uintptr_t)arg->usr_ptr;
+
+	ret = ioctl(fd, MEMWRITEOOB, (unsigned long)&oldarg);
+
+	arg->length = oldarg.length;
+	return(ret);
+}
+
+int mtd_ioctl_readoob(int fd, struct mtd_oob_buf64 *arg)
+{
+	int ret;
+	struct mtd_oob_buf oldarg;
+
+	if(try_new_ioctl(fd, MEMREADOOB64, (unsigned long)arg, &ret) != 0)
+		return(ret);
+	
+	oldarg.start = arg->start;
+	oldarg.length = arg->length;
+	oldarg.ptr = (void *)(uintptr_t)arg->usr_ptr;
+
+	ret = ioctl(fd, MEMREADOOB, (unsigned long)&oldarg);
+
+	/* old ABI puts returned length in "start" */
+	arg->length = oldarg.start;
+	return(ret);
+}
+
+int mtd_ioctl_lock(int fd, struct erase_info_user64 *arg)
+{
+	int ret;
+	struct erase_info_user oldarg;
+
+	if(try_new_ioctl(fd, MEMLOCK64, (unsigned long)arg, &ret) != 0)
+		return(ret);
+	
+	oldarg.start = arg->start;
+	oldarg.length = arg->length;
+
+	return(ioctl(fd, MEMLOCK, (unsigned long)&oldarg));
+}
+
+int mtd_ioctl_unlock(int fd, struct erase_info_user64 *arg)
+{
+	int ret;
+	struct erase_info_user oldarg;
+
+	if(try_new_ioctl(fd, MEMUNLOCK64, (unsigned long)arg, &ret) != 0)
+		return(ret);
+	
+	oldarg.start = arg->start;
+	oldarg.length = arg->length;
+
+	return(ioctl(fd, MEMUNLOCK, (unsigned long)&oldarg));
+}
+
+int mtd_ioctl_getregioninfo(int fd, struct region_info_user64 *arg)
+{
+	int ret;
+	struct region_info_user oldarg;
+
+	oldarg.regionindex = arg->regionindex;
+
+	ret = ioctl(fd, MEMGETREGIONINFO, (unsigned long)&oldarg);
+
+	arg->offset = oldarg.offset;
+	arg->erasesize = oldarg.erasesize;
+	arg->numblocks = oldarg.numblocks;
+
+	return(ret);
+}
diff --git a/mtd_ioctl.h b/mtd_ioctl.h
new file mode 100644
index 0000000..2c62553
--- /dev/null
+++ b/mtd_ioctl.h
@@ -0,0 +1,38 @@
+/*
+ * mtd_ioctl.h - backward compatibility wrappers for MTD ioctls
+ */
+
+#ifndef _MTD_IOCTL_H
+#define _MTD_IOCTL_H
+
+#include <mtd/mtd-user.h>
+
+struct region_info_user64 {
+	uint64_t offset;		/* At which this region starts,
+					 * from the beginning of the MTD */
+	uint32_t erasesize;		/* For this region */
+	uint32_t numblocks;		/* Number of blocks in this region */
+	uint32_t regionindex;
+};
+
+struct mtd_info_user64 {
+	uint32_t type;
+	uint32_t flags;
+	uint64_t size;			/* Total size of the MTD */
+	uint32_t erasesize;
+	uint32_t writesize;
+	uint32_t oobsize;		/* OOB bytes per page (e.g. 16) */
+};
+
+typedef struct mtd_info_user64 mtd_info64_t;
+typedef struct region_info_user64 region_info64_t;
+
+int mtd_ioctl_getinfo(int fd, struct mtd_info_user64 *arg);
+int mtd_ioctl_erase(int fd, struct erase_info_user64 *arg);
+int mtd_ioctl_writeoob(int fd, struct mtd_oob_buf64 *arg);
+int mtd_ioctl_readoob(int fd, struct mtd_oob_buf64 *arg);
+int mtd_ioctl_lock(int fd, struct erase_info_user64 *arg);
+int mtd_ioctl_unlock(int fd, struct erase_info_user64 *arg);
+int mtd_ioctl_getregioninfo(int fd, struct region_info_user64 *arg);
+
+#endif /* !_MTD_IOCTL_H */
diff --git a/nanddump.c b/nanddump.c
index 678d684..fbe4f9a 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -29,6 +29,7 @@

 #include <asm/types.h>
 #include <mtd/mtd-user.h>
+#include "mtd_ioctl.h"

 #define PROGRAM "nanddump"
 #define VERSION "$Revision: 1.29 $"
@@ -182,11 +183,15 @@ static unsigned char oobbuf[128];
  */
 int main(int argc, char * const argv[])
 {
-	unsigned long ofs, end_addr = 0;
+	unsigned long long ofs, end_addr = 0;
 	unsigned long long blockstart = 1;
 	int ret, i, fd, ofd, bs, badblock = 0;
-	struct mtd_oob_buf oob = {0, 16, oobbuf};
-	mtd_info_t meminfo;
+	struct mtd_oob_buf64 oob = {	
+		.start = 0,
+		.length = 16,
+		.usr_ptr = (uintptr_t)oobbuf,
+	};
+	mtd_info64_t meminfo;
 	char pretty_buf[80];
 	int oobinfochanged = 0 ;
 	struct nand_oobinfo old_oobinfo;
@@ -202,8 +207,8 @@ int main(int argc, char * const argv[])
 	}

 	/* Fill in MTD device capability structure */
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		perror("MEMGETINFO");
+	if (mtd_ioctl_getinfo(fd, &meminfo) != 0) {
+		perror("MEMGETINFO64");
 		close(fd);
 		exit (EXIT_FAILURE);
 	}
@@ -320,11 +325,11 @@ int main(int argc, char * const argv[])
 			}
 			if (stat1.failed != stat2.failed)
 				fprintf(stderr, "ECC: %d uncorrectable bitflip(s)"
-						" at offset 0x%08lx\n",
+						" at offset 0x%08llx\n",
 						stat2.failed - stat1.failed, ofs);
 			if (stat1.corrected != stat2.corrected)
 				fprintf(stderr, "ECC: %d corrected bitflip(s) at"
-						" offset 0x%08lx\n",
+						" offset 0x%08llx\n",
 						stat2.corrected - stat1.corrected, ofs);
 			stat1 = stat2;
 		}
@@ -359,8 +364,8 @@ int main(int argc, char * const argv[])
 		} else {
 			/* Read OOB data and exit on failure */
 			oob.start = ofs;
-			if (ioctl(fd, MEMREADOOB, &oob) != 0) {
-				perror("ioctl(MEMREADOOB)");
+			if (mtd_ioctl_readoob(fd, &oob) != 0) {
+				perror("ioctl(MEMREADOOB64)");
 				goto closeall;
 			}
 		}
diff --git a/nandtest.c b/nandtest.c
index 7613a52..48ec1a7 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -14,6 +14,7 @@

 #include <asm/types.h>
 #include "mtd/mtd-user.h"
+#include "mtd_ioctl.h"

 void usage(void)
 {
@@ -28,7 +29,7 @@ void usage(void)
 	exit(1);
 }

-struct mtd_info_user meminfo;
+struct mtd_info_user64 meminfo;
 struct mtd_ecc_stats oldstats, newstats;
 int fd;
 int markbad=0;
@@ -36,26 +37,28 @@ int seed;

 int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 {
-	struct erase_info_user er;
+	struct erase_info_user64 er;
 	ssize_t len;
 	int i;

-	printf("\r%08x: erasing... ", (unsigned)ofs);
+	printf("\r%08llx: erasing... ", ofs);
 	fflush(stdout);

+	memset(&er, 0, sizeof(er));
+
 	er.start = ofs;
 	er.length = meminfo.erasesize;

-	if (ioctl(fd, MEMERASE, &er)) {
-		perror("MEMERASE");
+	if (mtd_ioctl_erase(fd, &er)) {
+		perror("MEMERASE64");
 		if (markbad) {
-			printf("Mark block bad at %08lx\n", (long)ofs);
+			printf("Mark block bad at %08llx\n", ofs);
 			ioctl(fd, MEMSETBADBLOCK, &ofs);
 		}
 		return 1;
 	}

-	printf("\r%08x: writing...", (unsigned)ofs);
+	printf("\r%08llx: writing...", ofs);
 	fflush(stdout);

 	len = pwrite(fd, data, meminfo.erasesize, ofs);
@@ -132,8 +135,8 @@ int main(int argc, char **argv)
 	int pass;
 	int nr_passes = 1;
 	int keep_contents = 0;
-	uint32_t offset = 0;
-	uint32_t length = -1;
+	uint64_t offset = 0;
+	uint64_t length = -1;

 	for (;;) {
 		static const char *short_options="hkl:mo:p:s:";
@@ -175,11 +178,11 @@ int main(int argc, char **argv)
 			break;

 		case 'o':
-			offset = atol(optarg);
+			offset = atoll(optarg);
 			break;

 		case 'l':
-			length = strtol(optarg, NULL, 0);
+			length = strtoll(optarg, NULL, 0);
 			break;
 			
 		}
@@ -193,8 +196,8 @@ int main(int argc, char **argv)
 		exit(1);
 	}
 	
-	if (ioctl(fd, MEMGETINFO, &meminfo)) {
-		perror("MEMGETINFO");
+	if (mtd_ioctl_getinfo(fd, &meminfo)) {
+		perror("MEMGETINFO64");
 		close(fd);
 		exit(1);
 	}
@@ -203,17 +206,17 @@ int main(int argc, char **argv)
 		length = meminfo.size;

 	if (offset % meminfo.erasesize) {
-		fprintf(stderr, "Offset %x not multiple of erase size %x\n",
+		fprintf(stderr, "Offset %llx not multiple of erase size %x\n",
 			offset, meminfo.erasesize);
 		exit(1);
 	}
 	if (length % meminfo.erasesize) {
-		fprintf(stderr, "Length %x not multiple of erase size %x\n",
+		fprintf(stderr, "Length %llx not multiple of erase size %x\n",
 			length, meminfo.erasesize);
 		exit(1);
 	}
 	if (length + offset > meminfo.size) {
-		fprintf(stderr, "Length %x + offset %x exceeds device size %x\n",
+		fprintf(stderr, "Length %llx + offset %llx exceeds device size %llx\n",
 			length, offset, meminfo.size);
 		exit(1);
 	}		
diff --git a/nandwrite.c b/nandwrite.c
index 0b2a9ee..4221722 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -38,6 +38,7 @@

 #include <asm/types.h>
 #include "mtd/mtd-user.h"
+#include "mtd_ioctl.h"

 #define PROGRAM "nandwrite"
 #define VERSION "$Revision: 1.32 $"
@@ -114,7 +115,7 @@ static void display_version (void)

 static const char	*standard_input = "-";
 static const char	*mtd_device, *img;
-static int		mtdoffset = 0;
+static long long	mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
 static bool		autoplace = false;
@@ -195,7 +196,7 @@ static void process_options (int argc, char * const argv[])
 				pad = true;
 				break;
 			case 's':
-				mtdoffset = strtol (optarg, NULL, 0);
+				mtdoffset = strtoll (optarg, NULL, 0);
 				break;
 			case 'b':
 				blockalign = atoi (optarg);
@@ -207,7 +208,7 @@ static void process_options (int argc, char * const argv[])
 	}

 	if (mtdoffset < 0) {
-		fprintf(stderr, "Can't specify a negative device offset `%d'\n",
+		fprintf(stderr, "Can't specify a negative device offset `%lld'\n",
 				mtdoffset);
 		exit (EXIT_FAILURE);
 	}
@@ -253,14 +254,13 @@ int main(int argc, char * const argv[])
 	int ifd = -1;
 	int imglen = 0, pagelen;
 	bool baderaseblock = false;
-	int blockstart = -1;
-	struct mtd_info_user meminfo;
-	struct mtd_oob_buf oob;
+	long long blockstart = -1;
+	struct mtd_info_user64 meminfo;
+	struct mtd_oob_buf64 oob;
 	loff_t offs;
 	int ret, readlen;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
-	int readcnt = 0;

 	process_options(argc, argv);

@@ -278,8 +278,8 @@ int main(int argc, char * const argv[])
 	}

 	/* Fill in MTD device capability structure */
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		perror("MEMGETINFO");
+	if (mtd_ioctl_getinfo(fd, &meminfo) != 0) {
+		perror("MEMGETINFO64");
 		close(fd);
 		exit (EXIT_FAILURE);
 	}
@@ -375,8 +375,9 @@ int main(int argc, char * const argv[])
 		}
 	}

+	memset(&oob, 0, sizeof(oob));
 	oob.length = meminfo.oobsize;
-	oob.ptr = noecc ? oobreadbuf : oobbuf;
+	oob.usr_ptr = (uintptr_t)(noecc ? oobreadbuf : oobbuf);

 	/* Determine if we are reading from standard input or from a file. */
 	if (strcmp(img, standard_input) == 0) {
@@ -425,8 +426,9 @@ int main(int argc, char * const argv[])

 	// Check, if length fits into device
 	if ( ((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
-		fprintf (stderr, "Image %d bytes, NAND page %d bytes, OOB area %u
bytes, device size %u bytes\n",
-				imglen, pagelen, meminfo.writesize, meminfo.size);
+		fprintf (stderr, "Image %d bytes, NAND page %d bytes, OOB area %u
bytes, device size %llu bytes\n",
+				imglen, pagelen, meminfo.writesize,
+				(unsigned long long)meminfo.size);
 		perror ("Input file does not fit into device");
 		goto closeall;
 	}
@@ -450,7 +452,7 @@ int main(int argc, char * const argv[])
 			offs = blockstart;
 			baderaseblock = false;
 			if (!quiet)
-				fprintf (stdout, "Writing data to block %d at offset 0x%x\n",
+				fprintf (stdout, "Writing data to block %lld at offset 0x%llx\n",
 						 blockstart / meminfo.erasesize, blockstart);

 			/* Check all the blocks in an erase block for bad blocks */
@@ -462,9 +464,10 @@ int main(int argc, char * const argv[])
 				if (ret == 1) {
 					baderaseblock = true;
 					if (!quiet)
-						fprintf (stderr, "Bad block at %x, %u block(s) "
-								"from %x will be skipped\n",
-								(int) offs, blockalign, blockstart);
+						fprintf (stderr, "Bad block at %llx, %u block(s) "
+								"from %llx will be skipped\n",
+								(unsigned long long)offs,
+								blockalign, blockstart);
 				}

 				if (baderaseblock) {
@@ -571,8 +574,8 @@ int main(int argc, char * const argv[])
 			}
 			/* Write OOB data first, as ecc will be placed in there*/
 			oob.start = mtdoffset;
-			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
-				perror ("ioctl(MEMWRITEOOB)");
+			if (mtd_ioctl_writeoob(fd, &oob) != 0) {
+				perror ("ioctl(MEMWRITEOOB64)");
 				goto closeall;
 			}
 			imglen -= meminfo.oobsize;
@@ -582,7 +585,7 @@ int main(int argc, char * const argv[])
 		if (pwrite(fd, writebuf, meminfo.writesize, mtdoffset) !=
meminfo.writesize) {
 			int rewind_blocks;
 			off_t rewind_bytes;
-			erase_info_t erase;
+			erase_info64_t erase;

 			perror ("pwrite");
 			/* Must rewind to blockstart if we can */
@@ -595,18 +598,21 @@ int main(int argc, char * const argv[])
 				fprintf(stderr, "Failed to seek backwards to recover from write error\n");
 				goto closeall;
 			}
+			memset(&erase, 0, sizeof(erase));
 			erase.start = blockstart;
 			erase.length = meminfo.erasesize;
-			fprintf(stderr, "Erasing failed write from %08lx-%08lx\n",
-				(long)erase.start, (long)erase.start+erase.length-1);
-			if (ioctl(fd, MEMERASE, &erase) != 0) {
-				perror("MEMERASE");
+			fprintf(stderr, "Erasing failed write from %08llx-%08llx\n",
+				(unsigned long long)erase.start,
+				(unsigned long long)(erase.start+erase.length-1));
+			if (mtd_ioctl_erase(fd, &erase) != 0) {
+				perror("MEMERASE64");
 				goto closeall;
 			}

 			if (markbad) {
 				loff_t bad_addr = mtdoffset & (~(meminfo.erasesize / blockalign) + 1);
-				fprintf(stderr, "Marking block at %08lx bad\n", (long)bad_addr);
+				fprintf(stderr, "Marking block at %08llx bad\n",
+					(unsigned long long)bad_addr);
 				if (ioctl(fd, MEMSETBADBLOCK, &bad_addr)) {
 					perror("MEMSETBADBLOCK");
 					/* But continue anyway */
-- 
1.5.6.3
