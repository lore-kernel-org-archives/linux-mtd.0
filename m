Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hq2dG-0006ak-6m
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 03:48:49 -0400
Received: from c220-237-181-46.eburwd3.vic.optusnet.com.au ([220.237.181.46]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Hq2dC-0006cE-Fo
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 02:48:39 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.67)
	(envelope-from <hamish@cloud.net.au>) id 1Hq2d0-0008Iq-TY
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 17:48:26 +1000
Date: Mon, 21 May 2007 17:48:26 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] support zlib decompression in flashcp
Message-ID: <20070521074826.GA31844@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here's a patch which allows flashcp to decompress .gz files on the fly
using zlib. It's against the git tree from a week or two ago.

It adds a new command line switch -z (or --gzip).
The zlib functions allow transparent access to uncompressed files.
However rather than using this I force the user to request
decompression; this is so that you can still write .gz files 
directly to flash without decompression if that is what you want (eg 
a gzip-compressed ramdisk image).

I shouldn't really use <asm/byteorder.h>, but I need __le32_to_cpu
or an equivalent. Is there a better approach?

Comments welcome?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>


Index: Makefile
===================================================================
--- Makefile	(revision 1097)
+++ Makefile	(working copy)
@@ -96,6 +96,9 @@
 $(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
+$(BUILDDIR)/flashcp: $(BUILDDIR)/flashcp.o
+	$(CC) $(LDFLAGS) -o $@ $^ -lz
+
 install: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
Index: flashcp.c
===================================================================
--- flashcp.c	(revision 1097)
+++ flashcp.c	(working copy)
@@ -42,6 +42,9 @@
 #include <unistd.h>
 #include <mtd/mtd-user.h>
 #include <getopt.h>
+#include <errno.h>
+#include <zlib.h>
+#include <asm/byteorder.h>
 
 typedef int bool;
 #define true 1
@@ -71,6 +74,7 @@
 #define FLAG_HELP		0x02
 #define FLAG_FILENAME	0x04
 #define FLAG_DEVICE		0x08
+#define FLAG_GZIP	0x10
 
 /* error levels */
 #define LOG_NORMAL	1
@@ -99,6 +103,7 @@
 			"\n"
 			"   -h | --help      Show this help message\n"
 			"   -v | --verbose   Show progress reports\n"
+			"   -z | --gzip      Decompress gzip file on the fly\n"
 			"   <filename>       File which you want to copy to flash\n"
 			"   <device>         Flash device to write to (e.g. /dev/mtd0, /dev/mtd1, etc.)\n"
 			"\n",
@@ -146,6 +151,24 @@
 	}
 }
 
+static void safe_gzread (gzFile gz,const char *filename,void *buf,size_t count,bool verbose)
+{
+	ssize_t result;
+
+	result = gzread (gz,buf,count);
+	if (count != result)
+	{
+		if (verbose) log_printf (LOG_NORMAL,"\n");
+		if (result < 0)
+		{
+			log_printf (LOG_ERROR,"While reading data from %s: %m\n",filename);
+			exit (EXIT_FAILURE);
+		}
+		log_printf (LOG_ERROR,"Short read count returned while reading from %s\n",filename);
+		exit (EXIT_FAILURE);
+	}
+}
+
 static void safe_rewind (int fd,const char *filename)
 {
 	if (lseek (fd,0L,SEEK_SET) < 0)
@@ -155,9 +178,18 @@
 	}
 }
 
+static void safe_gzrewind (gzFile gz,const char *filename)
+{
+	if (gzrewind(gz))
+	{
+		log_printf (LOG_ERROR,"While seeking to start of %s: %m\n",filename);
+		exit (EXIT_FAILURE);
+	}
+}
 /******************************************************************************/
 
 static int dev_fd = -1,fil_fd = -1;
+static gzFile fil_gz = NULL;
 
 static void cleanup (void)
 {
@@ -170,7 +202,7 @@
 	const char *progname,*filename = NULL,*device = NULL;
 	int i,flags = FLAG_NONE;
 	ssize_t result;
-	size_t size,written;
+	size_t size, written, total_size = 0;
 	struct mtd_info_user mtd;
 	struct erase_info_user erase;
 	struct stat filestat;
@@ -184,10 +216,11 @@
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "hv";
+		static const char *short_options = "hvz";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 'h'},
 			{"verbose", no_argument, 0, 'v'},
+			{"gzip", no_argument, 0, 'z'},
 			{0, 0, 0, 0},
 		};
 
@@ -206,6 +239,10 @@
 				flags |= FLAG_VERBOSE;
 				DEBUG("Got FLAG_VERBOSE\n");
 				break;
+			case 'z':
+				flags |= FLAG_GZIP;
+				DEBUG("Got FLAG_GZIP\n");
+				break;
 			default:
 				DEBUG("Unknown parameter: %s\n",argv[option_index]);
 				showusage (progname,true);
@@ -221,7 +258,7 @@
 		DEBUG("Got device: %s\n",device);
 	}
 
-	if (flags & FLAG_HELP || progname == NULL || device == NULL)
+	if (flags & FLAG_HELP || filename == NULL || device == NULL)
 		showusage (progname,flags != FLAG_HELP);
 
 	atexit (cleanup);
@@ -237,14 +274,47 @@
 
 	/* get some info about the file we want to copy */
 	fil_fd = safe_open (filename,O_RDONLY);
-	if (fstat (fil_fd,&filestat) < 0)
-	{
-		log_printf (LOG_ERROR,"While trying to get the file status of %s: %m\n",filename);
-		exit (EXIT_FAILURE);
+
+	if (flags & FLAG_GZIP) {
+		/* Check the header */
+		safe_read(fil_fd, filename, src, 2, false);
+		if (memcmp(src, "\037\213", 2) != 0) {
+			log_printf (LOG_ERROR,"This doesn't seem to be a valid gzip file\n");
+			exit (EXIT_FAILURE);
+		}
+
+		/* Get the file size from the trailer */
+		if (lseek(fil_fd, -4, SEEK_END) == -1L) {
+			log_printf (LOG_ERROR, "Could not seek to end of file: %s\n", sys_errlist[errno]);
+			exit (EXIT_FAILURE);
+		}
+
+		safe_read(fil_fd, filename, src, 4, false);
+		memcpy(&total_size, src, 4);
+		total_size = __le32_to_cpu(total_size);
+		safe_rewind(fil_fd, filename);
+
+		log_printf(LOG_NORMAL, "File size is %d\n", total_size);
+
+		if ((fil_gz = gzdopen(fil_fd, "r")) == NULL)
+		{
+			log_printf (LOG_ERROR,"While trying to initialize gzip\n");
+			exit (EXIT_FAILURE);
+		}
+
+	} else {
+
+		if (fstat (fil_fd,&filestat) < 0)
+		{
+			log_printf (LOG_ERROR,"While trying to get the file status of %s: %m\n",filename);
+			exit (EXIT_FAILURE);
+		}
+		total_size = filestat.st_size;
+
 	}
 
 	/* does it fit into the device/partition? */
-	if (filestat.st_size > mtd.size)
+	if (total_size > mtd.size)
 	{
 		log_printf (LOG_ERROR,"%s won't fit into %s!\n",filename,device);
 		exit (EXIT_FAILURE);
@@ -257,8 +327,8 @@
 #warning "Check for smaller erase regions"
 
 	erase.start = 0;
-	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
-	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
+	erase.length = total_size & ~(mtd.erasesize - 1);
+	if (total_size % mtd.erasesize) erase.length += mtd.erasesize;
 	if (flags & FLAG_VERBOSE)
 	{
 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
@@ -291,14 +361,14 @@
 			exit (EXIT_FAILURE);
 		}
 	}
-	DEBUG("Erased %u / %luk bytes\n",erase.length,filestat.st_size);
+	DEBUG("Erased %u / %luk bytes\n",erase.length,total_size);
 
 	/**********************************
 	 * write the entire file to flash *
 	 **********************************/
 
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%luk (0%%)",KB (filestat.st_size));
-	size = filestat.st_size;
+	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%luk (0%%)",KB (total_size));
+	size = total_size;
 	i = BUFSIZE;
 	written = 0;
 	while (size)
@@ -307,11 +377,14 @@
 		if (flags & FLAG_VERBOSE)
 			log_printf (LOG_NORMAL,"\rWriting data: %dk/%luk (%lu%%)",
 					KB (written + i),
-					KB (filestat.st_size),
-					PERCENTAGE (written + i,filestat.st_size));
+					KB (total_size),
+					PERCENTAGE (written + i,total_size));
 
 		/* read from filename */
-		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
+		if (flags & FLAG_GZIP)
+			safe_gzread (fil_gz,filename,src,i,flags & FLAG_VERBOSE);
+		else
+			safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
 
 		/* write to device */
 		result = write (dev_fd,src,i);
@@ -327,7 +400,7 @@
 			}
 			log_printf (LOG_ERROR,
 					"Short write count returned while writing to x%.8x-0x%.8x on %s: %d/%lu bytes written to flash\n",
-					written,written + i,device,written + result,filestat.st_size);
+					written,written + i,device,written + result,total_size);
 			exit (EXIT_FAILURE);
 		}
 
@@ -337,20 +410,24 @@
 	if (flags & FLAG_VERBOSE)
 		log_printf (LOG_NORMAL,
 				"\rWriting data: %luk/%luk (100%%)\n",
-				KB (filestat.st_size),
-				KB (filestat.st_size));
-	DEBUG("Wrote %d / %luk bytes\n",written,filestat.st_size);
+				KB (total_size),
+				KB (total_size));
+	DEBUG("Wrote %d / %luk bytes\n",written,total_size);
 
 	/**********************************
 	 * verify that flash == file data *
 	 **********************************/
 
-	safe_rewind (fil_fd,filename);
+	if (flags & FLAG_GZIP)
+		safe_gzrewind (fil_gz,filename);
+	else
+		safe_rewind (fil_fd,filename);
+
 	safe_rewind (dev_fd,device);
-	size = filestat.st_size;
+	size = total_size;
 	i = BUFSIZE;
 	written = 0;
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%luk (0%%)",KB (filestat.st_size));
+	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%luk (0%%)",KB (total_size));
 	while (size)
 	{
 		if (size < BUFSIZE) i = size;
@@ -358,11 +435,14 @@
 			log_printf (LOG_NORMAL,
 					"\rVerifying data: %dk/%luk (%lu%%)",
 					KB (written + i),
-					KB (filestat.st_size),
-					PERCENTAGE (written + i,filestat.st_size));
+					KB (total_size),
+					PERCENTAGE (written + i,total_size));
 
 		/* read from filename */
-		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
+		if (flags & FLAG_GZIP)
+			safe_gzread (fil_gz,filename,src,i,flags & FLAG_VERBOSE);
+		else
+			safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
 
 		/* read from device */
 		safe_read (dev_fd,device,dest,i,flags & FLAG_VERBOSE);
@@ -382,9 +462,9 @@
 	if (flags & FLAG_VERBOSE)
 		log_printf (LOG_NORMAL,
 				"\rVerifying data: %luk/%luk (100%%)\n",
-				KB (filestat.st_size),
-				KB (filestat.st_size));
-	DEBUG("Verified %d / %luk bytes\n",written,filestat.st_size);
+				KB (total_size),
+				KB (total_size));
+	DEBUG("Verified %d / %luk bytes\n",written,total_size);
 
 	exit (EXIT_SUCCESS);
 }
