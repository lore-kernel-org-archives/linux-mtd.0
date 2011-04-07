Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7qhP-0008NM-3g
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 15:00:45 +0000
Received: by ewy3 with SMTP id 3so864908ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 08:00:41 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] flashcp: improve speed & some clean ups
Date: Thu,  7 Apr 2011 17:04:01 +0200
Message-Id: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

the speed of the program is improved by:
- checking if a block needs to be erased before actually erasing it
- only writing blocks that are not modified

In order to implement this, the main loop of the program has
been reworked. I have tried to stay in the style of the
original author

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 flashcp.c |  266 ++++++++++++++++++++++++++++++------------------------------
 1 files changed, 133 insertions(+), 133 deletions(-)

diff --git a/flashcp.c b/flashcp.c
index d58c81b..d3bec5e 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -1,6 +1,7 @@
 /*
  * Copyright (c) 2d3D, Inc.
  * Written by Abraham vd Merwe <abraham@2d3d.co.za>
+ * Almost full rewrte of the main loop: Frans Meulenbroeks
  * All rights reserved.
  *
  * Renamed to flashcp.c to avoid conflicts with fcp from fsh package
@@ -47,9 +48,6 @@ typedef int bool;
 #define true 1
 #define false 0
 
-#define EXIT_FAILURE 1
-#define EXIT_SUCCESS 0
-
 /* for debugging purposes only */
 #ifdef DEBUG
 #undef DEBUG
@@ -62,15 +60,10 @@ typedef int bool;
 #define KB(x) ((x) / 1024)
 #define PERCENTAGE(x,total) (((x) * 100) / (total))
 
-/* size of read/write buffer */
-#define BUFSIZE (10 * 1024)
-
 /* cmd-line flags */
 #define FLAG_NONE		0x00
 #define FLAG_VERBOSE	0x01
 #define FLAG_HELP		0x02
-#define FLAG_FILENAME	0x04
-#define FLAG_DEVICE		0x08
 
 /* error levels */
 #define LOG_NORMAL	1
@@ -86,7 +79,7 @@ static void log_printf (int level,const char *fmt, ...)
 	fflush (fp);
 }
 
-static void showusage(bool error)
+static void showusage (const char *progname,bool error)
 {
 	int level = error ? LOG_ERROR : LOG_NORMAL;
 
@@ -94,15 +87,15 @@ static void showusage(bool error)
 			"\n"
 			"Flash Copy - Written by Abraham van der Merwe <abraham@2d3d.co.za>\n"
 			"\n"
-			"usage: %1$s [ -v | --verbose ] <filename> <device>\n"
-			"       %1$s -h | --help\n"
+			"usage: %s [ -v | --verbose ] <filename> <device>\n"
+			"       %s -h | --help\n"
 			"\n"
 			"   -h | --help      Show this help message\n"
 			"   -v | --verbose   Show progress reports\n"
 			"   <filename>       File which you want to copy to flash\n"
 			"   <device>         Flash device to write to (e.g. /dev/mtd0, /dev/mtd1, etc.)\n"
 			"\n",
-			PROGRAM_NAME);
+			progname,progname);
 
 	exit (error ? EXIT_FAILURE : EXIT_SUCCESS);
 }
@@ -146,11 +139,11 @@ static void safe_read (int fd,const char *filename,void *buf,size_t count,bool v
 	}
 }
 
-static void safe_rewind (int fd,const char *filename)
+static void safe_seek (int fd,off_t offset,int whence,const char *filename)
 {
-	if (lseek (fd,0L,SEEK_SET) < 0)
+	if (lseek (fd,offset,whence) < 0)
 	{
-		log_printf (LOG_ERROR,"While seeking to start of %s: %m\n",filename);
+		log_printf (LOG_ERROR,"While seeking with offset %ld (whence = %d) in %s: %m\n", (long)offset,whence,filename);
 		exit (EXIT_FAILURE);
 	}
 }
@@ -165,16 +158,62 @@ static void cleanup (void)
 	if (fil_fd > 0) close (fil_fd);
 }
 
+/*
+  The compare function below checks if we need to erase the block.
+  if writing the block only will turn bits from 1 to 0 we do not
+  need to erase.
+  Most likely this is because the block is already erased, but it
+  could be that we are e.g. just appending.
+  This is tested by doing a src AND dest and verifying that
+  this is indeed src.
+  And if we are writing data that is already present in that
+  form we do not need to write at all
+*/
+#define CMP_ERASE 1
+#define CMP_WRITE 2
+
+static int compare(unsigned char *src, unsigned char *dst, ssize_t len)
+{
+	int rv = 0;
+	unsigned long long *sp = (unsigned long long *)src;
+	unsigned long long *dp = (unsigned long long *)dst;
+	unsigned long long *ep; /* end ptr */
+	
+	len = len / sizeof(unsigned long long);
+	ep = sp + len;
+
+	while (sp < ep)
+	{
+		/* if src AND dst == src we do not need to erase */
+		if ((*sp & *dp) != *sp)
+		{
+			rv = CMP_ERASE | CMP_WRITE;
+			return rv;
+		}
+		if (*sp != *dp)
+		{
+			rv = CMP_WRITE;
+		}
+		sp++;
+		dp++;
+	}
+	return rv;
+}
+
 int main (int argc,char *argv[])
 {
-	const char *filename = NULL,*device = NULL;
+	const char *progname,*filename = NULL,*device = NULL;
 	int i,flags = FLAG_NONE;
 	ssize_t result;
-	size_t size,written;
+	size_t size,written,todo;
 	struct mtd_info_user mtd;
 	struct erase_info_user erase;
 	struct stat filestat;
-	unsigned char src[BUFSIZE],dest[BUFSIZE];
+	unsigned char *src, *dest;
+	int blocks;
+	int cmp;
+
+	(progname = strrchr (argv[0],'/')) ? progname++ : (progname = argv[0]);
 
 	/*********************
 	 * parse cmd-line
@@ -206,26 +245,28 @@ int main (int argc,char *argv[])
 				break;
 			default:
 				DEBUG("Unknown parameter: %s\n",argv[option_index]);
-				showusage(true);
+				showusage (progname,true);
 		}
 	}
+
+	if (flags & FLAG_HELP)
+		showusage (progname, false);
+
 	if (optind+2 == argc) {
-		flags |= FLAG_FILENAME;
 		filename = argv[optind];
 		DEBUG("Got filename: %s\n",filename);
 
-		flags |= FLAG_DEVICE;
 		device = argv[optind+1];
 		DEBUG("Got device: %s\n",device);
 	}
 
-	if (flags & FLAG_HELP || device == NULL)
-		showusage(flags != FLAG_HELP);
+	if (progname == NULL || device == NULL)
+		showusage (progname, true);
 
 	atexit (cleanup);
 
+	dev_fd = safe_open (device, O_SYNC | O_RDWR);
 	/* get some info about the flash device */
-	dev_fd = safe_open (device,O_SYNC | O_RDWR);
 	if (ioctl (dev_fd,MEMGETINFO,&mtd) < 0)
 	{
 		DEBUG("ioctl(): %m\n");
@@ -249,142 +290,101 @@ int main (int argc,char *argv[])
 	}
 
 	/*****************************************************
-	 * erase enough blocks so that we can write the file *
+	 * allocate buffers				     *
 	 *****************************************************/
 
+	src = malloc(2 * mtd.erasesize + sizeof(unsigned long long));
+	if (!src)
+	{
+		log_printf (LOG_ERROR,"not enough memory for two %d byte buffers!\n", mtd.erasesize);
+		exit (EXIT_FAILURE);
+	}
+	/* align on unsigned long long boundary */
+	src = (unsigned long long *)(((unsigned long)src + sizeof(unsigned long long)) & (~(sizeof(unsigned long long) - 1))); 
+	dest = src + mtd.erasesize;
+	size = filestat.st_size;
+
 #warning "Check for smaller erase regions"
 
 	erase.start = 0;
-	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
-	erase.length *= mtd.erasesize;
+        erase.length = filestat.st_size & ~(mtd.erasesize - 1);
+        if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
 
-	if (flags & FLAG_VERBOSE)
+	blocks = erase.length / mtd.erasesize;
+	erase.length = mtd.erasesize;
+
+	for (i = 1; i <= blocks; i++)
 	{
-		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
-		int blocks = erase.length / mtd.erasesize;
-		erase.length = mtd.erasesize;
-		log_printf (LOG_NORMAL,"Erasing blocks: 0/%d (0%%)",blocks);
-		for (i = 1; i <= blocks; i++)
+		if (size < mtd.erasesize)
+		{
+			todo = size;
+		}
+		else
+		{
+			todo = mtd.erasesize;
+		}
+		if (flags & FLAG_VERBOSE)
+		{
+			log_printf (LOG_NORMAL,"\rProcessing block: %d/%d (%d%%)",i,blocks,PERCENTAGE (i,blocks));
+		}
+		/* read from filename */
+		safe_read (fil_fd,filename,src,todo,flags & FLAG_VERBOSE);
+
+		/* read from device */
+		safe_read (dev_fd,device,dest,todo,flags & FLAG_VERBOSE);
+
+		cmp = compare(src,dest,todo);
+		if (cmp & CMP_ERASE)
 		{
-			log_printf (LOG_NORMAL,"\rErasing blocks: %d/%d (%d%%)",i,blocks,PERCENTAGE (i,blocks));
 			if (ioctl (dev_fd,MEMERASE,&erase) < 0)
 			{
-				log_printf (LOG_NORMAL,"\n");
+				if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"\n");
 				log_printf (LOG_ERROR,
 						"While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
 						(unsigned int) erase.start,(unsigned int) (erase.start + erase.length),device);
 				exit (EXIT_FAILURE);
 			}
-			erase.start += mtd.erasesize;
 		}
-		log_printf (LOG_NORMAL,"\rErasing blocks: %d/%d (100%%)\n",blocks,blocks);
-	}
-	else
-	{
-		/* if not, erase the whole chunk in one shot */
-		if (ioctl (dev_fd,MEMERASE,&erase) < 0)
+		if (cmp & CMP_WRITE)
 		{
-			log_printf (LOG_ERROR,
-					"While erasing blocks from 0x%.8x-0x%.8x on %s: %m\n",
-					(unsigned int) erase.start,(unsigned int) (erase.start + erase.length),device);
-			exit (EXIT_FAILURE);
-		}
-	}
-	DEBUG("Erased %u / %luk bytes\n",erase.length,filestat.st_size);
-
-	/**********************************
-	 * write the entire file to flash *
-	 **********************************/
-
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%luk (0%%)",KB (filestat.st_size));
-	size = filestat.st_size;
-	i = BUFSIZE;
-	written = 0;
-	while (size)
-	{
-		if (size < BUFSIZE) i = size;
-		if (flags & FLAG_VERBOSE)
-			log_printf (LOG_NORMAL,"\rWriting data: %dk/%luk (%lu%%)",
-					KB (written + i),
-					KB (filestat.st_size),
-					PERCENTAGE (written + i,filestat.st_size));
-
-		/* read from filename */
-		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
+			safe_seek (dev_fd,(off_t)erase.start,SEEK_SET,device);
+		    	result = write (dev_fd,src,todo);
+			if (todo != result)
+			{
+				if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"\n");
+				if (result < 0)
+				{
+					log_printf (LOG_ERROR,
+							"While writing data to 0x%.8x-0x%.8x on %s: %m\n",
+							written,written + i,device);
+					exit (EXIT_FAILURE);
+				}
+				log_printf (LOG_ERROR,
+						"Short write count returned while writing to x%.8x-0x%.8x on %s: %d/%lu bytes written to flash\n",
+						erase.start,erase.start + todo,device,erase.start + result,filestat.st_size);
+				exit (EXIT_FAILURE);
+			}
+			/* verify */
+			safe_seek (dev_fd,(off_t)erase.start,SEEK_SET,device);
+			safe_read (dev_fd,device,dest,todo,flags & FLAG_VERBOSE);
 
-		/* write to device */
-		result = write (dev_fd,src,i);
-		if (i != result)
-		{
-			if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"\n");
-			if (result < 0)
+			/* compare buffers */
+			if (memcmp (src,dest,todo))
 			{
 				log_printf (LOG_ERROR,
-						"While writing data to 0x%.8x-0x%.8x on %s: %m\n",
-						written,written + i,device);
+						"File does not seem to match flash data. First mismatch at 0x%.8x-0x%.8x\n",
+						written,written + i);
 				exit (EXIT_FAILURE);
 			}
-			log_printf (LOG_ERROR,
-					"Short write count returned while writing to x%.8x-0x%.8x on %s: %d/%lu bytes written to flash\n",
-					written,written + i,device,written + result,filestat.st_size);
-			exit (EXIT_FAILURE);
 		}
-
-		written += i;
-		size -= i;
+		erase.start += mtd.erasesize;
+		size -= todo;
 	}
+
 	if (flags & FLAG_VERBOSE)
-		log_printf (LOG_NORMAL,
-				"\rWriting data: %luk/%luk (100%%)\n",
-				KB (filestat.st_size),
-				KB (filestat.st_size));
-	DEBUG("Wrote %d / %luk bytes\n",written,filestat.st_size);
-
-	/**********************************
-	 * verify that flash == file data *
-	 **********************************/
-
-	safe_rewind (fil_fd,filename);
-	safe_rewind (dev_fd,device);
-	size = filestat.st_size;
-	i = BUFSIZE;
-	written = 0;
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%luk (0%%)",KB (filestat.st_size));
-	while (size)
 	{
-		if (size < BUFSIZE) i = size;
-		if (flags & FLAG_VERBOSE)
-			log_printf (LOG_NORMAL,
-					"\rVerifying data: %dk/%luk (%lu%%)",
-					KB (written + i),
-					KB (filestat.st_size),
-					PERCENTAGE (written + i,filestat.st_size));
-
-		/* read from filename */
-		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
-
-		/* read from device */
-		safe_read (dev_fd,device,dest,i,flags & FLAG_VERBOSE);
-
-		/* compare buffers */
-		if (memcmp (src,dest,i))
-		{
-			log_printf (LOG_ERROR,
-					"File does not seem to match flash data. First mismatch at 0x%.8x-0x%.8x\n",
-					written,written + i);
-			exit (EXIT_FAILURE);
-		}
-
-		written += i;
-		size -= i;
+		log_printf (LOG_NORMAL,"\n");
 	}
-	if (flags & FLAG_VERBOSE)
-		log_printf (LOG_NORMAL,
-				"\rVerifying data: %luk/%luk (100%%)\n",
-				KB (filestat.st_size),
-				KB (filestat.st_size));
-	DEBUG("Verified %d / %luk bytes\n",written,filestat.st_size);
 
 	exit (EXIT_SUCCESS);
 }
-
-- 
1.7.0.4
