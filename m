Received: from ns1.thmulti.com ([141.11.234.67])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1912x9-0001sM-G2
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 12:32:19 +0100
Received: from smtprelay.thmulti.com (smtprelay [141.11.194.9])
	by ns1.thmulti.com (8.9.3/8.9.1) with ESMTP id NAA24050
	for <linux-mtd@lists.infradead.org>;
	Thu, 3 Apr 2003 13:31:46 +0200 (MET DST)
Received: from thomson.net (localhost [127.0.0.1])
	by smtprelay.thmulti.com (8.9.3/8.9.1) with ESMTP id NAA05407
	for <linux-mtd@lists.infradead.org>;
	Thu, 3 Apr 2003 13:31:45 +0200 (MET DST)
Received: (from fillods@localhost)h2V9q9432532
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2003 11:52:09 +0200
Date: Mon, 31 Mar 2003 11:52:08 +0200
From: Stephane Fillod <stephane.fillod@thomson.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20030331115208.A32408@bond.rennes.thmulti.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: multipart/mixed; boundary="SLDf9lqlvOQaIe6s"
Subject: Misc util patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please find attached a patch against mtd-snapshot-20030325.

Fixes:
* typo in eraseall.c, enable short option 'j', make cleanmarker to work:
  this was obviously NOT tested. Now, it's okay.
* potential bug fix in mkfs.jffs2.c, because cpu_to_je32 can be a macro.
  BTW, this cleans a warning under ppcboot about unexpected node version.
* undefined prototypes in compr_rtime.c
* gcc-3.x warning cleanups in mtd_debug.c
* getopt'ified fcp.c, fixes a bug with "fcp -h"

Test(basic):
* Image generated using mkfs.jffs2 on x86-linux is written to NOR flash 
  and mounted/accessed okay on ppc_4xx-ppcboot&linux.
* eraseall -j /dev/mtd2 && mount: fs space readily available.

Question:
Has anyone of you ported mkfs.jffs2 to Solaris?


Thanks for the excellent work.

Cheers,
Stephane







--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mtd-20030325.patch"

diff -Nru mtd-20030325/fs/jffs2/compr_rtime.c mtd-20030325-th/fs/jffs2/compr_rtime.c
--- mtd-20030325/fs/jffs2/compr_rtime.c	Tue May 21 00:00:06 2002
+++ mtd-20030325-th/fs/jffs2/compr_rtime.c	Wed Mar 26 15:05:51 2003
@@ -25,6 +25,9 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <linux/string.h> 
+#ifndef __KERNEL__
+#include <string.h> 
+#endif
 
 /* _compress returns the compressed size, -1 if bigger */
 int jffs2_rtime_compress(unsigned char *data_in, unsigned char *cpage_out, 
diff -Nru mtd-20030325/util/eraseall.c mtd-20030325-th/util/eraseall.c
--- mtd-20030325/util/eraseall.c	Wed Feb 19 00:00:10 2003
+++ mtd-20030325-th/util/eraseall.c	Wed Mar 26 18:57:32 2003
@@ -45,7 +45,7 @@
 #include "linux/jffs2.h"
 
 #define PROGRAM "eraseall"
-#define VERSION "0.1.1"
+#define VERSION "0.1.2"
 
 static const char *exe_name;
 static const char *mtd_device;
@@ -119,18 +119,20 @@
 				continue;
 			}
 		} else {
-			if (lseek (fd, erase.start, SEEK_SET) != 0) {
+			if (lseek (fd, erase.start, SEEK_SET) < 0) {
 				fprintf(stderr, "\n%s: %s: MTD lseek failure: %s\n", exe_name, mtd_device, strerror(errno));
 				continue;
 			}	
-			if (write (fd , &cleanmarker, sizeof (cleanmarker)) != 0) {
+			if (write (fd , &cleanmarker, sizeof (cleanmarker)) != sizeof (cleanmarker)) {
 				fprintf(stderr, "\n%s: %s: MTD write failure: %s\n", exe_name, mtd_device, strerror(errno));
 				continue;
 			}
 		}
 		if (!quiet)
-			printf ("\rCleanmarker written at %x\n", erase.start);
+			printf (" Cleanmarker written at %x.", erase.start);
 	}
+	if (!quiet)
+		printf("\n");
 
 	return 0;
 }
@@ -144,7 +146,7 @@
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "q";
+		static const char *short_options = "jq";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -202,7 +204,7 @@
 	printf("Usage: %s [OPTION] MTD_DEVICE\n"
 	       "Erases all of the specified MTD device.\n"
 	       "\n"
-	       "  -j, --jffs2    format the device for jffs2"
+	       "  -j, --jffs2    format the device for jffs2\n"
 	       "  -q, --quiet    don't display progress messages\n"
 	       "      --silent   same as --quiet\n"
 	       "      --help     display this help and exit\n"
diff -Nru mtd-20030325/util/fcp.c mtd-20030325-th/util/fcp.c
--- mtd-20030325/util/fcp.c	Mon Jun 18 12:47:25 2001
+++ mtd-20030325-th/util/fcp.c	Wed Mar 26 18:38:22 2003
@@ -40,6 +40,7 @@
 #include <fcntl.h>
 #include <unistd.h>
 #include <linux/mtd/mtd.h>
+#include <getopt.h>
 
 typedef int bool;
 #define true 1
@@ -175,40 +176,49 @@
 
    (progname = strrchr (argv[0],'/')) ? progname++ : (progname = argv[0]);
 
-   /*************************************
-	* parse cmd-line args back to front *
-	*************************************/
+   /*********************
+	* parse cmd-line 
+	*****************/
+
+   for (;;) {
+   	int option_index = 0;
+   	static const char *short_options = "hv";
+   	static const struct option long_options[] = {
+   		{"help", no_argument, 0, 'h'},
+   		{"verbose", no_argument, 0, 'v'},
+   		{0, 0, 0, 0},
+   	};
+
+   	int c = getopt_long(argc, argv, short_options,
+   			    long_options, &option_index);
+   	if (c == EOF) {
+   		break;
+   	}
+
+   	switch (c) {
+   	case 'h':
+		flags |= FLAG_HELP;
+		DEBUG("Got FLAG_HELP\n");
+   		break;
+   	case 'v':
+		flags |= FLAG_VERBOSE;
+		DEBUG("Got FLAG_VERBOSE\n");
+		break;
+	default:
+		DEBUG("Unknown parameter: %s\n",argv[option_index]);
+		showusage (progname,true);
+   	}
+   }
+   if (optind+2 == argc) {
+	flags |= FLAG_FILENAME;
+   	filename = argv[optind];
+	DEBUG("Got filename: %s\n",filename);
+
+	flags |= FLAG_DEVICE;
+   	device = argv[optind+1];
+	DEBUG("Got device: %s\n",device);
+   }
 
-   while (--argc)
-	 {
-		if (device == NULL)
-		  {
-			 flags |= FLAG_DEVICE;
-			 device = argv[argc];
-			 DEBUG("Got device: %s\n",device);
-		  }
-		else if (filename == NULL)
-		  {
-			 flags |= FLAG_FILENAME;
-			 filename = argv[argc];
-			 DEBUG("Got filename: %s\n",filename);
-		  }
-		else if (!strcmp (argv[argc],"-v") || !strcmp (argv[argc],"--verbose"))
-		  {
-			 flags |= FLAG_VERBOSE;
-			 DEBUG("Got FLAG_VERBOSE\n");
-		  }
-		else if (!strcmp (argv[argc],"-h") || !strcmp (argv[argc],"--help"))
-		  {
-			 flags |= FLAG_HELP;
-			 DEBUG("Got FLAG_HELP\n");
-		  }
-		else
-		  {
-			 DEBUG("Unknown parameter: %s\n",argv[argc]);
-			 showusage (progname,true);
-		  }
-	 }
    if (flags & FLAG_HELP || progname == NULL || device == NULL)
 	 showusage (progname,flags != FLAG_HELP);
 
diff -Nru mtd-20030325/util/mkfs.jffs2.c mtd-20030325-th/util/mkfs.jffs2.c
--- mtd-20030325/util/mkfs.jffs2.c	Sun Feb 16 00:00:09 2003
+++ mtd-20030325-th/util/mkfs.jffs2.c	Wed Mar 26 15:10:38 2003
@@ -785,7 +785,8 @@
 	rd.hdr_crc = cpu_to_je32(crc32(0, &rd, 
 				sizeof(struct jffs2_unknown_node) - 4));
 	rd.pino = cpu_to_je32((e->parent) ? e->parent->sb.st_ino : 1);
-	rd.version = cpu_to_je32(version++);
+	rd.version = cpu_to_je32(version);
+	version++;
 	rd.ino = cpu_to_je32(statbuf->st_ino);
 	rd.mctime = cpu_to_je32(statbuf->st_mtime);
 	rd.nsize = strlen(name);
@@ -877,7 +878,8 @@
 			ri.hdr_crc = cpu_to_je32(crc32(0, 
 						&ri, sizeof(struct jffs2_unknown_node) - 4));
 
-			ri.version = cpu_to_je32(++ver);
+			++ver;
+			ri.version = cpu_to_je32(ver);
 			ri.offset = cpu_to_je32(offset);
 			ri.csize = cpu_to_je32(space);
 			ri.dsize = cpu_to_je32(dsize);
@@ -895,7 +897,8 @@
 	}
 	if (!je32_to_cpu(ri.version)) {
 		/* Was empty file */
-		ri.version = cpu_to_je32(++ver);
+		++ver;
+		ri.version = cpu_to_je32(ver);
 		ri.totlen = cpu_to_je32(sizeof(ri));
 		ri.hdr_crc = cpu_to_je32(crc32(0, 
 					&ri, sizeof(struct jffs2_unknown_node) - 4));
diff -Nru mtd-20030325/util/mtd_debug.c mtd-20030325-th/util/mtd_debug.c
--- mtd-20030325/util/mtd_debug.c	Fri Jan 11 00:00:06 2002
+++ mtd-20030325-th/util/mtd_debug.c	Wed Mar 26 15:23:39 2003
@@ -124,10 +124,10 @@
    if ((buf = (u_int8_t *) malloc (size)) == NULL)
 	 {
 #define BUF_SIZE	(64 * 1024 * sizeof (u_int8_t))
-		fprintf (stderr, __FUNCTION__ ": malloc(%#x)\n", size);
+		fprintf (stderr, "%s: malloc(%#x)\n", __FUNCTION__, size);
 		if (size != BUF_SIZE) {
 			size = BUF_SIZE;
-			fprintf (stderr, __FUNCTION__ ": trying buffer size %#x\n", size);
+			fprintf (stderr, "%s: trying buffer size %#x\n", __FUNCTION__, size);
 			goto retry;
 		}
 		perror ("malloc()");
@@ -139,14 +139,14 @@
    err = read (fd,buf,size);
    if (err < 0)
 	 {
-		fprintf (stderr, __FUNCTION__ ": read, size %#x, n %#x\n", size, n);
+		fprintf (stderr, "%s: read, size %#x, n %#x\n", __FUNCTION__, size, n);
 		perror ("read()");
 		goto err2;
 	 }
    err = write (outfd,buf,size);
    if (err < 0)
 	 {
-		fprintf (stderr, __FUNCTION__ ": write, size %#x, n %#x\n", size, n);
+		fprintf (stderr, "%s: write, size %#x, n %#x\n", __FUNCTION__, size, n);
 		perror ("write()");
 		goto err2;
 	 }
@@ -194,10 +194,10 @@
 retry:
    if ((buf = (u_int8_t *) malloc (size)) == NULL)
 	 {
-		fprintf (stderr, __FUNCTION__ ": malloc(%#x) failed\n", size);
+		fprintf (stderr, "%s: malloc(%#x) failed\n", __FUNCTION__, size);
 		if (size != BUF_SIZE) {
 			size = BUF_SIZE;
-			fprintf (stderr, __FUNCTION__ ": trying buffer size %#x\n", size);
+			fprintf (stderr, "%s: trying buffer size %#x\n", __FUNCTION__, size);
 			goto retry;
 		}
 		perror ("malloc()");
@@ -209,7 +209,7 @@
 	   size = n;
    if (fread (buf,size,1,fp) != 1 || ferror (fp))
 	 {
-		fprintf (stderr, __FUNCTION__ ": fread, size %#x, n %#x\n", size, n);
+		fprintf (stderr, "%s: fread, size %#x, n %#x\n", __FUNCTION__, size, n);
 		perror ("fread()");
 		free (buf);
 		fclose (fp);
@@ -218,7 +218,7 @@
    err = write (fd,buf,size);
    if (err < 0)
 	 {
-		fprintf (stderr, __FUNCTION__ ": write, size %#x, n %#x\n", size, n);
+		fprintf (stderr, "%s: write, size %#x, n %#x\n", __FUNCTION__, size, n);
 		perror ("write()");
 		free (buf);
 		fclose (fp);
@@ -298,7 +298,7 @@
 	 printf ("MTD_WRITEABLE");
    else
 	 {
-		int i,first = 1;
+		int first = 1;
 		static struct
 		  {
 			 const char *name;

--SLDf9lqlvOQaIe6s--
