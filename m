Received: from mtagate5.uk.ibm.com ([195.212.29.138])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IERmx-0004D9-MA
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 11:34:12 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l6RFVCGG387078
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 15:31:12 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l6RFVCP92220158
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 16:31:12 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l6RFV1QX005242
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 16:31:02 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 3/5] ubi-utils: migrate ubimirror
Date: Fri, 27 Jul 2007 17:30:22 +0200
References: <200707271723.38987.alexs@linux.vnet.ibm.com>
In-Reply-To: <200707271723.38987.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707271730.22790.alexs@linux.vnet.ibm.com>
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

Migrate ubimirror to the new libubi.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/Makefile           |    2 +-
 ubi-utils/src/libubimirror.c |   21 +++++++++++----------
 ubi-utils/src/ubimirror.c    |    3 ++-
 3 files changed, 14 insertions(+), 12 deletions(-)

--- mtd-utils.orig/ubi-utils/Makefile
+++ mtd-utils/ubi-utils/Makefile
@@ -57,7 +57,7 @@ pfiflash: pfiflash.o libpfiflash.o list.
 	$(CC) $(LDFLAGS) -o $@ $^
 
 ubimirror: ubimirror.o error.o libubimirror.o bootenv.o hashmap.o \
-		libubiold.o libubiold_sysfs.o crc32.o
+		libubi.o libubi_common.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
 nand2bin: nand2bin.o nandecc.o nandcorr.o
--- mtd-utils.orig/ubi-utils/src/libubimirror.c
+++ mtd-utils/ubi-utils/src/libubimirror.c
@@ -22,7 +22,8 @@
 #include <memory.h>
 #include <fcntl.h>
 
-#include <libubiold.h>
+#include <libubi.h>
+#include <libubi_common.h>
 #include "ubimirror.h"
 
 #define COMPARE_BUF_SIZE    (128 * 1024)
@@ -125,14 +126,14 @@ static int compare_files(int fd_a, int f
 	return rc;
 }
 
-static int copy_files(int fd_in, int fd_out)
+static int copy_files(libubi_t ulib, int fd_in, int fd_out)
 {
 	unsigned char buf_a[COMPARE_BUF_SIZE];
 	ssize_t len_a, len_b;
 	unsigned long long update_size, copied;
 
 	if (ubi_vol_get_used_bytes(fd_in, &update_size) == -1 ||
-	    ubi_vol_update(fd_out, update_size) == -1)
+	    ubi_update_start(ulib, fd_out, update_size) == -1)
 		return update_error;
 	for (copied = 0; copied < update_size; copied += len_b ) {
 		len_a = fill_buffer(fd_in, buf_a, sizeof(buf_a));
@@ -152,7 +153,7 @@ int ubimirror(uint32_t devno, int seqnum
 {
 	int rc = 0;
 	uint32_t src_id;
-	ubi_lib_t ulib = NULL;
+	libubi_t ulib;
 	int fd_in = -1, i = 0, fd_out = -1;
 
 	if (ids_size == 0)
@@ -165,11 +166,11 @@ int ubimirror(uint32_t devno, int seqnum
 		src_id = ids[seqnum];
 	}
 
-	rc = ubi_open(&ulib);
-	if (rc != 0)
+	ulib = libubi_open();
+	if (ulib == NULL)
 		return ubi_error;
 
-	fd_in = ubi_vol_open(ulib, devno, src_id, O_RDONLY);
+	fd_in = ubi_vol_open(devno, src_id, O_RDONLY);
 	if (fd_in == -1) {
 		EBUF("open error source volume %d", ids[i]);
 		rc = open_error;
@@ -180,7 +181,7 @@ int ubimirror(uint32_t devno, int seqnum
 		if (ids[i] == src_id)		/* skip self-mirror */
 			continue;
 
-		fd_out = ubi_vol_open(ulib, devno, ids[i], O_RDWR);
+		fd_out = ubi_vol_open(devno, ids[i], O_RDWR);
 		if (fd_out == -1){
 			EBUF("open error destination volume %d", ids[i]);
 			rc = open_error;
@@ -191,7 +192,7 @@ int ubimirror(uint32_t devno, int seqnum
 			EBUF("compare error volume %d and %d", src_id, ids[i]);
 			goto err;
 		} else if (rc == compare_different) {
-			rc = copy_files(fd_in, fd_out);
+			rc = copy_files(ulib, fd_in, fd_out);
 			if (rc != 0) {
 				EBUF("mirror error volume %d to %d", src_id,
 						ids[i]);
@@ -211,6 +212,6 @@ err:
 	if (fd_in != -1)
 		ubi_vol_close(fd_in);
 	if (ulib != NULL)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 	return rc;
 }
--- mtd-utils.orig/ubi-utils/src/ubimirror.c
+++ mtd-utils/ubi-utils/src/ubimirror.c
@@ -19,6 +19,7 @@
  *
  * 1.2 Removed argp because we want to use uClibc.
  * 1.3 Minor cleanups
+ * 1.4 Migrated to new libubi
  */
 
 #include <stdio.h>
@@ -35,7 +36,7 @@
 #include "example_ubi.h"
 #include "ubimirror.h"
 
-#define PROGRAM_VERSION "1.3"
+#define PROGRAM_VERSION "1.4"
 
 typedef enum action_t {
 	ACT_NORMAL = 0,
