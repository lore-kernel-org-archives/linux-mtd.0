Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IERlp-0004Br-B7
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 11:31:18 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l6RFUG6Q215542
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 15:30:16 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l6RFUGsD2756818
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 16:30:16 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l6RFU0k0003922
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 16:30:00 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/5] ubi-utils: migrate pddcustomize
Date: Fri, 27 Jul 2007 17:29:28 +0200
References: <200707271723.38987.alexs@linux.vnet.ibm.com>
In-Reply-To: <200707271723.38987.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707271729.28954.alexs@linux.vnet.ibm.com>
Cc: Frank Haverkamp <haver@linux.vnet.ibm.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
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
 ubi-utils/src/pddcustomize.c |   44 +++++++++++++++++++++++++------------------
 2 files changed, 27 insertions(+), 19 deletions(-)

--- mtd-utils.orig/ubi-utils/Makefile
+++ mtd-utils/ubi-utils/Makefile
@@ -49,7 +49,7 @@ ubirmvol: ubirmvol.o error.o libubi.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
 pddcustomize: pddcustomize.o error.o libubimirror.o bootenv.o hashmap.o \
-		libubiold.o libubiold_sysfs.o crc32.o
+		libubi.o libubi_common.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
 pfiflash: pfiflash.o libpfiflash.o list.o reader.o error.o libubimirror.o \
--- mtd-utils.orig/ubi-utils/src/pddcustomize.c
+++ mtd-utils/ubi-utils/src/pddcustomize.c
@@ -26,6 +26,7 @@
  *
  * 1.3 Removed argp because we want to use uClibc.
  * 1.4 Minor cleanups
+ * 1.5 Migrated to new libubi
  */
 
 #include <stdio.h>
@@ -35,16 +36,18 @@
 #include <getopt.h>
 #include <unistd.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <mtd/ubi-header.h>
 
 #include "config.h"
 #include "bootenv.h"
 #include "error.h"
 #include "example_ubi.h"
-#include "libubiold.h"
+#include "libubi.h"
+#include "libubi_common.h"
 #include "ubimirror.h"
 
-#define PROGRAM_VERSION "1.4"
+#define PROGRAM_VERSION "1.5"
 
 typedef enum action_t {
 	ACT_NORMAL   = 0,
@@ -301,17 +304,17 @@ err:
 static int
 ubi_read_bootenv(uint32_t devno, uint32_t id, bootenv_t env)
 {
-	ubi_lib_t ulib = NULL;
+	libubi_t ulib;
 	int rc = 0;
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
+	fp_in = ubi_vol_fopen_read(devno, id);
 	if (fp_in == NULL) {
 		err_msg("Cannot open volume:%d number:%d\n", devno, id);
 		goto err;
@@ -326,7 +329,7 @@ ubi_read_bootenv(uint32_t devno, uint32_
 err:
 	if( fp_in )
 		fclose(fp_in);
-	ubi_close(&ulib);
+	libubi_close(ulib);
 	return rc;
 }
 
@@ -359,27 +362,32 @@ err:
 static int
 ubi_write_bootenv(uint32_t devno, uint32_t id, bootenv_t env)
 {
-	ubi_lib_t ulib = NULL;
-	int rc = 0;
-	FILE* fp_out;
+	libubi_t ulib;
+	int fd_out, rc = 0;
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
-	if (fp_out == NULL) {
+
+	fd_out = ubi_vol_open(devno, id, O_RDWR);
+	if (fd_out < 0) {
 		err_msg("Cannot open volume:%d number:%d\n", devno, id);
 		goto err;
 	}
+	fp_out = fdopen(fd_out, "r+");
+	if (fp_out == NULL) {
+		err_msg("Cannot fdopen volume:%d number:%d\n", devno, id);
+		goto err;
+	}
 
 	rc = bootenv_write(fp_out, env);
 	if (rc != 0) {
@@ -391,7 +399,7 @@ ubi_write_bootenv(uint32_t devno, uint32
 err:
 	if( fp_out )
 		fclose(fp_out);
-	ubi_close(&ulib);
+	libubi_close(ulib);
 	return rc;
 }
 
