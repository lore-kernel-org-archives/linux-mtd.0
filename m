Received: from ag-out-0708.google.com ([72.14.246.240])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjkM0-0004SD-RF
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 01:14:08 +0000
Received: by ag-out-0708.google.com with SMTP id 22so5616663agd.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Mar 2009 18:13:55 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 17 Mar 2009 18:13:54 -0700
Message-ID: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
Subject: [PATCH] [MTD] mtd-utils: Use new 64-bit ioctls to access >4GiB
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

This patch depends on "CORE: New ioctl calls for >4GiB device support".

Use the new kernel ioctls to support >4GiB flash devices in mtd-utils.

Sanity tested using nandsim:

flash_eraseall
flash_erase
flashcp
mtd_debug
nanddump
nandwrite
nandtest

Untested:

flash_lock
flash_unlock

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 flash_erase.c          |   42 +++++++++++++++---------------
 flash_eraseall.c       |   20 +++++++-------
 flash_lock.c           |   20 +++++++-------
 flash_unlock.c         |    8 +++---
 flashcp.c              |   20 +++++++-------
 include/mtd/mtd-abi.h  |   42 ++++++++++++++++++++++++++++---
 include/mtd/mtd-user.h |    6 ++++
 mtd_debug.c            |   64 ++++++++++++++++++++++++------------------------
 nanddump.c             |   18 ++++++------
 nandtest.c             |   32 ++++++++++++------------
 nandwrite.c            |   42 +++++++++++++++---------------
 ubi-utils/src/libmtd.c |   12 ++++----
 12 files changed, 183 insertions(+), 143 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index fdf9918..b2ebcea 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -12,20 +12,20 @@
 #include <sys/mount.h>
 #include <mtd/mtd-user.h>

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
+		if(ioctl(Fd,MEMGETREGIONINFO64,&(reginfo[i])) != 0)
 			return 8;
 		else
-			printf("Region %d is at %d of %d sector and with sector "
+			printf("Region %d is at %lld of %d sector and with sector "
 					"size %x\n", i, reginfo[i].offset, reginfo[i].numblocks,
 					reginfo[i].erasesize);
 	}
@@ -34,7 +34,7 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)

 	for(i = 0; i < regcount; i++)
 	{ //Loop through the regions
-		region_info_t * r = &(reginfo[i]);
+		region_info64_t * r = &(reginfo[i]);

 		if((start >= reginfo[i].offset) &&
 				(start < (r->offset + r->numblocks*r->erasesize)))
@@ -43,7 +43,7 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)

 	if(i >= regcount)
 	{
-		printf("Starting offset %x not within chip.\n", start);
+		printf("Starting offset %llx not within chip.\n", start);
 		return 8;
 	}

@@ -52,25 +52,25 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)

 	for(j = 0; (j < count)&&(i < regcount); j++)
 	{
-		erase_info_t erase;
-		region_info_t * r = &(reginfo[i]);
+		erase_info64_t erase;
+		region_info64_t * r = &(reginfo[i]);

 		erase.start = start;
 		erase.length = r->erasesize;

 		if(unlock != 0)
 		{ //Unlock the sector first.
-			if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
+			if(ioctl(Fd, MEMUNLOCK64, &erase) != 0)
 			{
 				perror("\nMTD Unlock failure");
 				close(Fd);
 				return 8;
 			}
 		}
-		printf("\rPerforming Flash Erase of length %u at offset 0x%x",
+		printf("\rPerforming Flash Erase of length %llu at offset 0x%llx",
 				erase.length, erase.start);
 		fflush(stdout);
-		if(ioctl(Fd, MEMERASE, &erase) != 0)
+		if(ioctl(Fd, MEMERASE64, &erase) != 0)
 		{
 			perror("\nMTD Erase failure");
 			close(Fd);
@@ -91,28 +91,28 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)
 	return 0;
 }

-int non_region_erase(int Fd, int start, int count, int unlock)
+int non_region_erase(int Fd, long long start, int count, int unlock)
 {
-	mtd_info_t meminfo;
+	mtd_info64_t meminfo;

-	if (ioctl(Fd,MEMGETINFO,&meminfo) == 0)
+	if (ioctl(Fd,MEMGETINFO64,&meminfo) == 0)
 	{
-		erase_info_t erase;
+		erase_info64_t erase;

 		erase.start = start;

 		erase.length = meminfo.erasesize;

 		for (; count > 0; count--) {
-			printf("\rPerforming Flash Erase of length %u at offset 0x%x",
+			printf("\rPerforming Flash Erase of length %llu at offset 0x%llx",
 					erase.length, erase.start);
 			fflush(stdout);

 			if(unlock != 0)
 			{
 				//Unlock the sector first.
-				printf("\rPerforming Flash unlock at offset 0x%x",erase.start);
-				if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
+				printf("\rPerforming Flash unlock at offset 0x%llx",erase.start);
+				if(ioctl(Fd, MEMUNLOCK64, &erase) != 0)
 				{
 					perror("\nMTD Unlock failure");
 					close(Fd);
@@ -120,7 +120,7 @@ int non_region_erase(int Fd, int start, int count,
int unlock)
 				}
 			}

-			if (ioctl(Fd,MEMERASE,&erase) != 0)
+			if (ioctl(Fd,MEMERASE64,&erase) != 0)
 			{
 				perror("\nMTD Erase failure");
 				close(Fd);
@@ -137,7 +137,7 @@ int main(int argc,char *argv[])
 {
 	int regcount;
 	int Fd;
-	int start;
+	long long start;
 	int count;
 	int unlock;
 	int res = 0;
@@ -149,7 +149,7 @@ int main(int argc,char *argv[])
 	}

 	if (argc > 2)
-		start = strtol(argv[2], NULL, 0);
+		start = strtoll(argv[2], NULL, 0);
 	else
 		start = 0;

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..1a8109f 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -49,7 +49,7 @@ static int quiet;		/* true -- don't output progress */
 static int jffs2;		// format for jffs2 usage

 static void process_options (int argc, char *argv[]);
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase);
+void show_progress (mtd_info64_t *meminfo, erase_info64_t *erase);
 static void display_help (void);
 static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
@@ -57,9 +57,9 @@ int target_endian = __BYTE_ORDER;

 int main (int argc, char *argv[])
 {
-	mtd_info_t meminfo;
+	mtd_info64_t meminfo;
 	int fd, clmpos = 0, clmlen = 8;
-	erase_info_t erase;
+	erase_info64_t erase;
 	int isNAND, bbtest = 1;

 	process_options(argc, argv);
@@ -70,7 +70,7 @@ int main (int argc, char *argv[])
 	}


-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
+	if (ioctl(fd, MEMGETINFO64, &meminfo) != 0) {
 		fprintf(stderr, "%s: %s: unable to get MTD device info\n",
exe_name, mtd_device);
 		return 1;
 	}
@@ -130,7 +130,7 @@ int main (int argc, char *argv[])
 			int ret = ioctl(fd, MEMGETBADBLOCK, &offset);
 			if (ret > 0) {
 				if (!quiet)
-					printf ("\nSkipping bad block at 0x%08x\n", erase.start);
+					printf ("\nSkipping bad block at 0x%08llx\n", erase.start);
 				continue;
 			} else if (ret < 0) {
 				if (errno == EOPNOTSUPP) {
@@ -149,7 +149,7 @@ int main (int argc, char *argv[])
 		if (!quiet)
 			show_progress(&meminfo, &erase);

-		if (ioctl(fd, MEMERASE, &erase) != 0) {
+		if (ioctl(fd, MEMERASE64, &erase) != 0) {
 			fprintf(stderr, "\n%s: %s: MTD Erase failure: %s\n", exe_name,
mtd_device, strerror(errno));
 			continue;
 		}
@@ -164,7 +164,7 @@ int main (int argc, char *argv[])
 			oob.ptr = (unsigned char *) &cleanmarker;
 			oob.start = erase.start + clmpos;
 			oob.length = clmlen;
-			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
+			if (ioctl (fd, MEMWRITEOOB64, &oob) != 0) {
 				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name,
mtd_device, strerror(errno));
 				continue;
 			}
@@ -179,7 +179,7 @@ int main (int argc, char *argv[])
 			}
 		}
 		if (!quiet)
-			printf (" Cleanmarker written at %x.", erase.start);
+			printf (" Cleanmarker written at %llx.", erase.start);
 	}
 	if (!quiet) {
 		show_progress(&meminfo, &erase);
@@ -250,9 +250,9 @@ void process_options (int argc, char *argv[])
 	mtd_device = argv[optind];
 }

-void show_progress (mtd_info_t *meminfo, erase_info_t *erase)
+void show_progress (mtd_info64_t *meminfo, erase_info64_t *erase)
 {
-	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
+	printf("\rErasing %d Kibyte @ %llx -- %2llu %% complete.",
 		meminfo->erasesize / 1024, erase->start,
 		(unsigned long long) erase->start * 100 / meminfo->size);
 	fflush(stdout);
diff --git a/flash_lock.c b/flash_lock.c
index dca6794..b1681f2 100644
--- a/flash_lock.c
+++ b/flash_lock.c
@@ -19,10 +19,10 @@
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
@@ -45,17 +45,17 @@ int main(int argc, char *argv[])
 		exit(1);
 	}

-	if(ioctl(fd, MEMGETINFO, &mtdInfo))
+	if(ioctl(fd, MEMGETINFO64, &mtdInfo))
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

@@ -65,14 +65,14 @@ int main(int argc, char *argv[])
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
+	if(ioctl(fd, MEMLOCK64, &mtdLockInfo))
 	{
 		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
 		close(fd);
diff --git a/flash_unlock.c b/flash_unlock.c
index 648dc4f..5ca6bbc 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -19,8 +19,8 @@
 int main(int argc, char *argv[])
 {
 	int fd;
-	struct mtd_info_user mtdInfo;
-	struct erase_info_user mtdLockInfo;
+	struct mtd_info_user64 mtdInfo;
+	struct erase_info_user64 mtdLockInfo;

 	/*
 	 * Parse command line options
@@ -43,7 +43,7 @@ int main(int argc, char *argv[])
 		exit(1);
 	}

-	if(ioctl(fd, MEMGETINFO, &mtdInfo))
+	if(ioctl(fd, MEMGETINFO64, &mtdInfo))
 	{
 		fprintf(stderr, "Could not get MTD device info from %s\n", argv[1]);
 		close(fd);
@@ -52,7 +52,7 @@ int main(int argc, char *argv[])

 	mtdLockInfo.start = 0;
 	mtdLockInfo.length = mtdInfo.size;
-	if(ioctl(fd, MEMUNLOCK, &mtdLockInfo))
+	if(ioctl(fd, MEMUNLOCK64, &mtdLockInfo))
 	{
 		fprintf(stderr, "Could not unlock MTD device: %s\n", argv[1]);
 		close(fd);
diff --git a/flashcp.c b/flashcp.c
index 8775022..238716f 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -169,8 +169,8 @@ int main (int argc,char *argv[])
 	int i,flags = FLAG_NONE;
 	ssize_t result;
 	size_t size,written;
-	struct mtd_info_user mtd;
-	struct erase_info_user erase;
+	struct mtd_info_user64 mtd;
+	struct erase_info_user64 erase;
 	struct stat filestat;
 	unsigned char src[BUFSIZE],dest[BUFSIZE];

@@ -226,7 +226,7 @@ int main (int argc,char *argv[])

 	/* get some info about the flash device */
 	dev_fd = safe_open (device,O_SYNC | O_RDWR);
-	if (ioctl (dev_fd,MEMGETINFO,&mtd) < 0)
+	if (ioctl (dev_fd,MEMGETINFO64,&mtd) < 0)
 	{
 		DEBUG("ioctl(): %m\n");
 		log_printf (LOG_ERROR,"This doesn't seem to be a valid MTD flash device!\n");
@@ -261,18 +261,18 @@ int main (int argc,char *argv[])
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
+			if (ioctl (dev_fd,MEMERASE64,&erase) < 0)
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
@@ -282,11 +282,11 @@ int main (int argc,char *argv[])
 	else
 	{
 		/* if not, erase the whole chunk in one shot */
-		if (ioctl (dev_fd,MEMERASE,&erase) < 0)
+		if (ioctl (dev_fd,MEMERASE64,&erase) < 0)
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
index 86defe1..10ebb7c 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -1,6 +1,4 @@
 /*
- * $Id: mtd-abi.h,v 1.13 2005/11/07 11:14:56 gleixner Exp $
- *
  * Portions of MTD ABI definition which are shared by kernel and user space
  */

@@ -12,10 +10,21 @@ struct erase_info_user {
 	uint32_t length;
 };

+struct erase_info_user64 {
+	uint64_t start;
+	uint64_t length;
+};
+
 struct mtd_oob_buf {
 	uint32_t start;
 	uint32_t length;
-	unsigned char *ptr;
+	unsigned char __user *ptr;
+};
+
+struct mtd_oob_buf64 {
+	uint64_t start;
+	uint32_t length;
+	unsigned char __user *ptr;
 };

 #define MTD_ABSENT		0
@@ -29,7 +38,7 @@ struct mtd_oob_buf {
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
-#define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
+#define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */

 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
@@ -62,6 +71,15 @@ struct mtd_info_user {
 	uint32_t eccsize;
 };

+struct mtd_info_user64 {
+	uint32_t type;
+	uint32_t flags;
+	uint64_t size;	 // Total size of the MTD
+	uint32_t erasesize;
+	uint32_t writesize;
+	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
+};
+
 struct region_info_user {
 	uint32_t offset;		/* At which this region starts,
 					 * from the beginning of the MTD */
@@ -70,6 +88,14 @@ struct region_info_user {
 	uint32_t regionindex;
 };

+struct region_info_user64 {
+	uint64_t offset;		/* At which this region starts,
+					 * from the beginning of the MTD */
+	uint32_t erasesize;		/* For this region */
+	uint32_t numblocks;		/* Number of blocks in this region */
+	uint32_t regionindex;
+};
+
 struct otp_info {
 	uint32_t start;
 	uint32_t length;
@@ -96,6 +122,14 @@ struct otp_info {
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)

+#define MEMGETINFO64		_IOR('M', 20, struct mtd_info_user64)
+#define MEMERASE64		_IOW('M', 21, struct erase_info_user64)
+#define MEMWRITEOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MEMREADOOB64		_IOWR('M', 23, struct mtd_oob_buf64)
+#define MEMLOCK64		_IOW('M', 24, struct erase_info_user64)
+#define MEMUNLOCK64		_IOW('M', 25, struct erase_info_user64)
+#define MEMGETREGIONINFO64	_IOWR('M', 26, struct region_info_user64)
+
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
diff --git a/include/mtd/mtd-user.h b/include/mtd/mtd-user.h
index 713f34d..3a89862 100644
--- a/include/mtd/mtd-user.h
+++ b/include/mtd/mtd-user.h
@@ -9,6 +9,8 @@

 #include <stdint.h>

+#define __user
+
 /* This file is blessed for inclusion by userspace */
 #include <mtd/mtd-abi.h>

@@ -18,4 +20,8 @@ typedef struct region_info_user region_info_t;
 typedef struct nand_oobinfo nand_oobinfo_t;
 typedef struct nand_ecclayout nand_ecclayout_t;

+typedef struct mtd_info_user64 mtd_info64_t;
+typedef struct erase_info_user64 erase_info64_t;
+typedef struct region_info_user64 region_info64_t;
+
 #endif /* __MTD_USER_H__ */
diff --git a/mtd_debug.c b/mtd_debug.c
index 85d48e9..6c5a246 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -39,26 +39,26 @@
 #include <mtd/mtd-user.h>

 /*
- * MEMGETINFO
+ * MEMGETINFO64
  */
-static int getmeminfo (int fd,struct mtd_info_user *mtd)
+static int getmeminfo (int fd,struct mtd_info_user64 *mtd)
 {
-	return (ioctl (fd,MEMGETINFO,mtd));
+	return (ioctl (fd,MEMGETINFO64,mtd));
 }

 /*
- * MEMERASE
+ * MEMERASE64
  */
-static int memerase (int fd,struct erase_info_user *erase)
+static int memerase (int fd,struct erase_info_user64 *erase)
 {
-	return (ioctl (fd,MEMERASE,erase));
+	return (ioctl (fd,MEMERASE64,erase));
 }

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
@@ -66,16 +66,16 @@ static int getregions (int fd,struct
region_info_user *regions,int *n)
 	for (i = 0; i < *n; i++)
 	{
 		regions[i].regionindex = i;
-		err = ioctl (fd,MEMGETREGIONINFO,&regions[i]);
+		err = ioctl (fd,MEMGETREGIONINFO64,&regions[i]);
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
 	erase.start = offset;
 	erase.length = bytes;
 	err = memerase (fd,&erase);
@@ -84,26 +84,26 @@ int erase_flash (int fd,u_int32_t offset,u_int32_t bytes)
 		perror ("MEMERASE");
 		return (1);
 	}
-	fprintf (stderr,"Erased %d bytes from address 0x%.8x in
flash\n",bytes,offset);
+	fprintf (stderr,"Erased %lld bytes from address 0x%.8llx in
flash\n",bytes,offset);
 	return (0);
 }

-void printsize (u_int32_t x)
+void printsize (u_int64_t x)
 {
 	int i;
 	static const char *flags = "KMGT";
-	printf ("%u ",x);
+	printf ("%llu ",x);
 	for (i = 0; x >= 1024 && flags[i] != '\0'; i++) x /= 1024;
 	i--;
-	if (i >= 0) printf ("(%u%c)",x,flags[i]);
+	if (i >= 0) printf ("(%llu%c)",x,flags[i]);
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
@@ -158,7 +158,7 @@ retry:
 	if (buf != NULL)
 		free (buf);
 	close (outfd);
-	printf ("Copied %d bytes from address 0x%.8x in flash to
%s\n",len,offset,filename);
+	printf ("Copied %d bytes from address 0x%.8llx in flash to
%s\n",len,offset,filename);
 	return (0);

 err2:
@@ -170,13 +170,13 @@ err0:
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
@@ -227,20 +227,20 @@ retry:
 	if (buf != NULL)
 		free (buf);
 	fclose (fp);
-	printf ("Copied %d bytes from %s to address 0x%.8x in
flash\n",len,filename,offset);
+	printf ("Copied %d bytes from %s to address 0x%.8llx in
flash\n",len,filename,offset);
 	return (0);
 }

 int showinfo (int fd)
 {
 	int i,err,n;
-	struct mtd_info_user mtd;
-	static struct region_info_user region[1024];
+	struct mtd_info_user64 mtd;
+	static struct region_info_user64 region[1024];

 	err = getmeminfo (fd,&mtd);
 	if (err < 0)
 	{
-		perror ("MEMGETINFO");
+		perror ("MEMGETINFO64");
 		return (1);
 	}

@@ -301,7 +301,7 @@ int showinfo (int fd)
 			{ "MTD_WRITEABLE", MTD_WRITEABLE },
 			{ "MTD_BIT_WRITEABLE", MTD_BIT_WRITEABLE },
 			{ "MTD_NO_ERASE", MTD_NO_ERASE },
-			{ "MTD_STUPID_LOCK", MTD_STUPID_LOCK },
+			{ "MTD_POWERUP_LOCK", MTD_POWERUP_LOCK },
 			{ NULL, -1 }
 		};
 		for (i = 0; flags[i].name != NULL; i++)
@@ -309,7 +309,7 @@ int showinfo (int fd)
 			{
 				if (first)
 				{
-					printf (flags[i].name);
+					printf ("%s", flags[i].name);
 					first = 0;
 				}
 				else printf (" | %s",flags[i].name);
@@ -335,7 +335,7 @@ int showinfo (int fd)

 	for (i = 0; i < n; i++)
 	{
-		printf ("region[%d].offset = 0x%.8x\n"
+		printf ("region[%d].offset = 0x%.8llx\n"
 				"region[%d].erasesize = ",
 				i,region[i].offset,i);
 		printsize (region[i].erasesize);
@@ -399,13 +399,13 @@ int main (int argc,char *argv[])
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

diff --git a/nanddump.c b/nanddump.c
index 678d684..a4c5c3d 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -182,11 +182,11 @@ static unsigned char oobbuf[128];
  */
 int main(int argc, char * const argv[])
 {
-	unsigned long ofs, end_addr = 0;
+	unsigned long long ofs, end_addr = 0;
 	unsigned long long blockstart = 1;
 	int ret, i, fd, ofd, bs, badblock = 0;
-	struct mtd_oob_buf oob = {0, 16, oobbuf};
-	mtd_info_t meminfo;
+	struct mtd_oob_buf64 oob = {0, 16, oobbuf};
+	mtd_info64_t meminfo;
 	char pretty_buf[80];
 	int oobinfochanged = 0 ;
 	struct nand_oobinfo old_oobinfo;
@@ -202,8 +202,8 @@ int main(int argc, char * const argv[])
 	}

 	/* Fill in MTD device capability structure */
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		perror("MEMGETINFO");
+	if (ioctl(fd, MEMGETINFO64, &meminfo) != 0) {
+		perror("MEMGETINFO64");
 		close(fd);
 		exit (EXIT_FAILURE);
 	}
@@ -320,11 +320,11 @@ int main(int argc, char * const argv[])
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
@@ -359,8 +359,8 @@ int main(int argc, char * const argv[])
 		} else {
 			/* Read OOB data and exit on failure */
 			oob.start = ofs;
-			if (ioctl(fd, MEMREADOOB, &oob) != 0) {
-				perror("ioctl(MEMREADOOB)");
+			if (ioctl(fd, MEMREADOOB64, &oob) != 0) {
+				perror("ioctl(MEMREADOOB64)");
 				goto closeall;
 			}
 		}
diff --git a/nandtest.c b/nandtest.c
index 7613a52..646a392 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -28,7 +28,7 @@ void usage(void)
 	exit(1);
 }

-struct mtd_info_user meminfo;
+struct mtd_info_user64 meminfo;
 struct mtd_ecc_stats oldstats, newstats;
 int fd;
 int markbad=0;
@@ -36,26 +36,26 @@ int seed;

 int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 {
-	struct erase_info_user er;
+	struct erase_info_user64 er;
 	ssize_t len;
 	int i;

-	printf("\r%08x: erasing... ", (unsigned)ofs);
+	printf("\r%08llx: erasing... ", ofs);
 	fflush(stdout);

 	er.start = ofs;
 	er.length = meminfo.erasesize;

-	if (ioctl(fd, MEMERASE, &er)) {
-		perror("MEMERASE");
+	if (ioctl(fd, MEMERASE64, &er)) {
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
@@ -132,8 +132,8 @@ int main(int argc, char **argv)
 	int pass;
 	int nr_passes = 1;
 	int keep_contents = 0;
-	uint32_t offset = 0;
-	uint32_t length = -1;
+	uint64_t offset = 0;
+	uint64_t length = -1;

 	for (;;) {
 		static const char *short_options="hkl:mo:p:s:";
@@ -175,11 +175,11 @@ int main(int argc, char **argv)
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
@@ -193,8 +193,8 @@ int main(int argc, char **argv)
 		exit(1);
 	}
 	
-	if (ioctl(fd, MEMGETINFO, &meminfo)) {
-		perror("MEMGETINFO");
+	if (ioctl(fd, MEMGETINFO64, &meminfo)) {
+		perror("MEMGETINFO64");
 		close(fd);
 		exit(1);
 	}
@@ -203,17 +203,17 @@ int main(int argc, char **argv)
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
index 0b2a9ee..85a6bbe 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -114,7 +114,7 @@ static void display_version (void)

 static const char	*standard_input = "-";
 static const char	*mtd_device, *img;
-static int		mtdoffset = 0;
+static long long	mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
 static bool		autoplace = false;
@@ -195,7 +195,7 @@ static void process_options (int argc, char * const argv[])
 				pad = true;
 				break;
 			case 's':
-				mtdoffset = strtol (optarg, NULL, 0);
+				mtdoffset = strtoll (optarg, NULL, 0);
 				break;
 			case 'b':
 				blockalign = atoi (optarg);
@@ -207,7 +207,7 @@ static void process_options (int argc, char * const argv[])
 	}

 	if (mtdoffset < 0) {
-		fprintf(stderr, "Can't specify a negative device offset `%d'\n",
+		fprintf(stderr, "Can't specify a negative device offset `%lld'\n",
 				mtdoffset);
 		exit (EXIT_FAILURE);
 	}
@@ -253,9 +253,9 @@ int main(int argc, char * const argv[])
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
@@ -278,8 +278,8 @@ int main(int argc, char * const argv[])
 	}

 	/* Fill in MTD device capability structure */
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		perror("MEMGETINFO");
+	if (ioctl(fd, MEMGETINFO64, &meminfo) != 0) {
+		perror("MEMGETINFO64");
 		close(fd);
 		exit (EXIT_FAILURE);
 	}
@@ -425,7 +425,7 @@ int main(int argc, char * const argv[])

 	// Check, if length fits into device
 	if ( ((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
-		fprintf (stderr, "Image %d bytes, NAND page %d bytes, OOB area %u
bytes, device size %u bytes\n",
+		fprintf (stderr, "Image %d bytes, NAND page %d bytes, OOB area %u
bytes, device size %llu bytes\n",
 				imglen, pagelen, meminfo.writesize, meminfo.size);
 		perror ("Input file does not fit into device");
 		goto closeall;
@@ -450,7 +450,7 @@ int main(int argc, char * const argv[])
 			offs = blockstart;
 			baderaseblock = false;
 			if (!quiet)
-				fprintf (stdout, "Writing data to block %d at offset 0x%x\n",
+				fprintf (stdout, "Writing data to block %lld at offset 0x%llx\n",
 						 blockstart / meminfo.erasesize, blockstart);

 			/* Check all the blocks in an erase block for bad blocks */
@@ -462,9 +462,9 @@ int main(int argc, char * const argv[])
 				if (ret == 1) {
 					baderaseblock = true;
 					if (!quiet)
-						fprintf (stderr, "Bad block at %x, %u block(s) "
-								"from %x will be skipped\n",
-								(int) offs, blockalign, blockstart);
+						fprintf (stderr, "Bad block at %llx, %u block(s) "
+								"from %llx will be skipped\n",
+								offs, blockalign, blockstart);
 				}

 				if (baderaseblock) {
@@ -571,8 +571,8 @@ int main(int argc, char * const argv[])
 			}
 			/* Write OOB data first, as ecc will be placed in there*/
 			oob.start = mtdoffset;
-			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
-				perror ("ioctl(MEMWRITEOOB)");
+			if (ioctl(fd, MEMWRITEOOB64, &oob) != 0) {
+				perror ("ioctl(MEMWRITEOOB64)");
 				goto closeall;
 			}
 			imglen -= meminfo.oobsize;
@@ -582,7 +582,7 @@ int main(int argc, char * const argv[])
 		if (pwrite(fd, writebuf, meminfo.writesize, mtdoffset) !=
meminfo.writesize) {
 			int rewind_blocks;
 			off_t rewind_bytes;
-			erase_info_t erase;
+			erase_info64_t erase;

 			perror ("pwrite");
 			/* Must rewind to blockstart if we can */
@@ -597,16 +597,16 @@ int main(int argc, char * const argv[])
 			}
 			erase.start = blockstart;
 			erase.length = meminfo.erasesize;
-			fprintf(stderr, "Erasing failed write from %08lx-%08lx\n",
-				(long)erase.start, (long)erase.start+erase.length-1);
-			if (ioctl(fd, MEMERASE, &erase) != 0) {
-				perror("MEMERASE");
+			fprintf(stderr, "Erasing failed write from %08llx-%08llx\n",
+				erase.start, erase.start+erase.length-1);
+			if (ioctl(fd, MEMERASE64, &erase) != 0) {
+				perror("MEMERASE64");
 				goto closeall;
 			}

 			if (markbad) {
 				loff_t bad_addr = mtdoffset & (~(meminfo.erasesize / blockalign) + 1);
-				fprintf(stderr, "Marking block at %08lx bad\n", (long)bad_addr);
+				fprintf(stderr, "Marking block at %08llx bad\n", bad_addr);
 				if (ioctl(fd, MEMSETBADBLOCK, &bad_addr)) {
 					perror("MEMSETBADBLOCK");
 					/* But continue anyway */
diff --git a/ubi-utils/src/libmtd.c b/ubi-utils/src/libmtd.c
index b60ddbd..22a3844 100644
--- a/ubi-utils/src/libmtd.c
+++ b/ubi-utils/src/libmtd.c
@@ -45,7 +45,7 @@
 int mtd_get_info(const char *node, struct mtd_info *mtd)
 {
 	struct stat st;
-	struct mtd_info_user ui;
+	struct mtd_info_user64 ui;
 	int ret;
 	loff_t offs = 0;

@@ -73,8 +73,8 @@ int mtd_get_info(const char *node, struct mtd_info *mtd)
 	if (mtd->fd == -1)
 		return sys_errmsg("cannot open \"%s\"", node);

-	if (ioctl(mtd->fd, MEMGETINFO, &ui)) {
-		sys_errmsg("MEMGETINFO ioctl request failed");
+	if (ioctl(mtd->fd, MEMGETINFO64, &ui)) {
+		sys_errmsg("MEMGETINFO64 ioctl request failed");
 		goto out_close;
 	}

@@ -159,11 +159,11 @@ out_close:
  */
 int mtd_erase(const struct mtd_info *mtd, int eb)
 {
-	struct erase_info_user ei;
+	struct erase_info_user64 ei;

-	ei.start = eb * mtd->eb_size;;
+	ei.start = eb * mtd->eb_size;
 	ei.length = mtd->eb_size;
-	return ioctl(mtd->fd, MEMERASE, &ei);
+	return ioctl(mtd->fd, MEMERASE64, &ei);
 }

 /**
-- 
1.5.6.3
