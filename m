Received: from mtagate1.uk.ibm.com ([195.212.29.134])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IcgiA-00011V-T3
	for linux-mtd@lists.infradead.org; Tue, 02 Oct 2007 13:18:56 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate1.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l92CHopB130000
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 12:17:50 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.5) with
	ESMTP id l92CHoIE3047442
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 13:17:50 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l92CHkdR013561
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 13:17:46 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/4 try3] ubi-utils: migrate pddcustomize
Date: Tue, 2 Oct 2007 14:17:39 +0200
References: <200710021416.02621.alexs@linux.vnet.ibm.com>
In-Reply-To: <200710021416.02621.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710021417.40075.alexs@linux.vnet.ibm.com>
Cc: Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Migrate pddcustomize to the new libubi.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/Makefile           |    2 -
 ubi-utils/src/pddcustomize.c |   47 ++++++++++++++++++++++++++-----------------
 2 files changed, 30 insertions(+), 19 deletions(-)

Index: mtd-utils/ubi-utils/Makefile
===================================================================
--- mtd-utils.orig/ubi-utils/Makefile	2007-10-02 12:19:11.000000000 +0200
+++ mtd-utils/ubi-utils/Makefile	2007-10-02 13:49:01.000000000 +0200
@@ -43,7 +43,7 @@
 	$(CC) $(LDFLAGS) -o $@ $^
 
 pddcustomize: pddcustomize.o error.o libubimirror.o bootenv.o hashmap.o \
-		libubiold.o libubiold_sysfs.o crc32.o
+		libubi.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
 pfiflash: pfiflash.o libpfiflash.o list.o reader.o error.o libubimirror.o \
Index: mtd-utils/ubi-utils/src/pddcustomize.c
===================================================================
--- mtd-utils.orig/ubi-utils/src/pddcustomize.c	2007-10-02 12:19:11.000000000 +0200
+++ mtd-utils/ubi-utils/src/pddcustomize.c	2007-10-02 13:50:08.000000000 +0200
@@ -26,6 +26,7 @@
  *
  * 1.3 Removed argp because we want to use uClibc.
  * 1.4 Minor cleanups
+ * 1.5 Migrated to new libubi
  */
 
 #include <stdio.h>
@@ -34,6 +35,7 @@
 #include <string.h>
 #include <getopt.h>
 #include <unistd.h>
+#include <limits.h>
 #include <errno.h>
 #include <mtd/ubi-header.h>
 
@@ -41,10 +43,13 @@
 #include "bootenv.h"
 #include "error.h"
 #include "example_ubi.h"
-#include "libubiold.h"
+#include "libubi.h"
 #include "ubimirror.h"
 
-#define PROGRAM_VERSION "1.4"
+#define PROGRAM_VERSION "1.5"
+
+#define DEFAULT_DEV_PATTERN    "/dev/ubi%d"
+#define DEFAULT_VOL_PATTERN    "/dev/ubi%d_%d"
 
 typedef enum action_t {
 	ACT_NORMAL   = 0,
@@ -299,17 +304,20 @@
 static int
 ubi_read_bootenv(uint32_t devno, uint32_t id, bootenv_t env)
 {
-	ubi_lib_t ulib = NULL;
+	libubi_t ulib;
 	int rc = 0;
+	char path[PATH_MAX];
 	FILE* fp_in = NULL;
 
-	rc = ubi_open(&ulib);
-	if( rc ){
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		err_msg("Cannot allocate ubi structure\n");
-		return rc;
+		return -1;
 	}
 
-	fp_in = ubi_vol_fopen_read(ulib, devno, id);
+	snprintf(path, PATH_MAX, DEFAULT_VOL_PATTERN, devno, id);
+
+	fp_in = fopen(path, "r");
 	if (fp_in == NULL) {
 		err_msg("Cannot open volume:%d number:%d\n", devno, id);
 		goto err;
@@ -322,9 +330,9 @@
 	}
 
 err:
-	if( fp_in )
+	if (fp_in)
 		fclose(fp_in);
-	ubi_close(&ulib);
+	libubi_close(ulib);
 	return rc;
 }
 
@@ -357,25 +365,28 @@
 static int
 ubi_write_bootenv(uint32_t devno, uint32_t id, bootenv_t env)
 {
-	ubi_lib_t ulib = NULL;
+	libubi_t ulib;
 	int rc = 0;
-	FILE* fp_out;
+	char path[PATH_MAX];
+	FILE* fp_out = NULL;
 	size_t nbytes ;
 
 	rc = bootenv_size(env, &nbytes);
-	if( rc ){
+	if (rc) {
 		err_msg("Cannot determine size of bootenv structure\n");
 		return rc;
 	}
-	rc = ubi_open(&ulib);
-	if( rc ){
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		err_msg("Cannot allocate ubi structure\n");
 		return rc;
 	}
-	fp_out = ubi_vol_fopen_update(ulib, devno, id,
-			(unsigned long long)nbytes);
+
+	snprintf(path, PATH_MAX, DEFAULT_VOL_PATTERN, devno, id);
+
+	fp_out = fopen(path, "r+");
 	if (fp_out == NULL) {
-		err_msg("Cannot open volume:%d number:%d\n", devno, id);
+		err_msg("Cannot fopen volume:%d number:%d\n", devno, id);
 		goto err;
 	}
 
@@ -389,7 +400,7 @@
 err:
 	if( fp_out )
 		fclose(fp_out);
-	ubi_close(&ulib);
+	libubi_close(ulib);
 	return rc;
 }
 
