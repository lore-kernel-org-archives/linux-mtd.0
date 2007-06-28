Received: from mtagate5.uk.ibm.com ([195.212.29.138])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3xEI-0003CX-Fc
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 17:52:27 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l5SGnkVn508006
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2007 16:49:46 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l5SGnkY62920502
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2007 17:49:46 +0100
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l5SFmNs7000899
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2007 16:48:23 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: [PATCH] UBI-Utils: Cleanup of libubimirror
Date: Thu, 28 Jun 2007 18:49:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706281849.32594.alexs@linux.vnet.ibm.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

libubimirror has several odd intendations and spacing errors.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/src/libubimirror.c |   49 ++++++++++++++++++++-----------------------
 1 files changed, 23 insertions(+), 26 deletions(-)

--- mtd-utils.orig/ubi-utils/src/libubimirror.c
+++ mtd-utils/ubi-utils/src/libubimirror.c
@@ -54,10 +54,10 @@ static ssize_t fill_buffer(int fd, unsig
 
 	do {
 		got = read(fd, buf + have, len - have);
-		if( got == -1 && errno != EINTR )
+		if (got == -1 && errno != EINTR)
 			return -1;
 		have += got;
-	} while ( got > 0 && have < len);
+	} while (got > 0 && have < len);
 	return have;
 }
 
@@ -71,10 +71,10 @@ static ssize_t flush_buffer(int fd, unsi
 
 	do {
 		done = write(fd, buf + have, len - have);
-		if( done == -1 && errno != EINTR )
+		if (done == -1 && errno != EINTR)
 			return -1;
 		have += done;
-	} while ( done > 0 && have < len);
+	} while (done > 0 && have < len);
 	return have;
 }
 
@@ -88,8 +88,7 @@ static ssize_t flush_buffer(int fd, unsi
  *  fd_a is source
  *  fd_b is destination
  */
-static int
-compare_files(int fd_a, int fd_b)
+static int compare_files(int fd_a, int fd_b)
 {
 	unsigned char buf_a[COMPARE_BUF_SIZE], buf_b[COMPARE_BUF_SIZE];
 	ssize_t len_a, len_b;
@@ -97,61 +96,59 @@ compare_files(int fd_a, int fd_b)
 
 	for (;;) {
 		len_a = fill_buffer(fd_a, buf_a, sizeof(buf_a));
-		if (len_a == -1){
+		if (len_a == -1) {
 			rc = compare_error;
 			break;
 		}
 		len_b = fill_buffer(fd_b, buf_b, sizeof(buf_b));
-		if (len_b == -1){
+		if (len_b == -1) {
 			rc = compare_different;
 			break;
 		}
-		if( len_a != len_b ){
+		if (len_a != len_b) {
 			rc = compare_different;
 			break;
 		}
-		if( len_a == 0 ){	/* Size on both filies equal and EOF */
+		if (len_a == 0) {	/* Size on both files equal and EOF */
 			rc = compare_equal;
 			break;
 		}
-		if( memcmp(buf_a, buf_b, len_a) != 0 ){
+		if (memcmp(buf_a, buf_b, len_a) != 0 ) {
 			rc = compare_different;
 			break;
 		}
 	}
 	/* Position both files at the beginning */
-	if( lseek(fd_a, 0, SEEK_SET) == -1 ||
-	    lseek(fd_b, 0, SEEK_SET) == -1 )
+	if (lseek(fd_a, 0, SEEK_SET) == -1 ||
+	   lseek(fd_b, 0, SEEK_SET) == -1)
 		rc = seek_error;
 	return rc;
 }
 
-static int
-copy_files(int fd_in, int fd_out)
+static int copy_files(int fd_in, int fd_out)
 {
 	unsigned char buf_a[COMPARE_BUF_SIZE];
 	ssize_t len_a, len_b;
 	unsigned long long update_size, copied;
 
-	if( ubi_vol_get_used_bytes(fd_in, &update_size) == -1 ||
-	    ubi_vol_update(fd_out, update_size) == -1 )
+	if (ubi_vol_get_used_bytes(fd_in, &update_size) == -1 ||
+	    ubi_vol_update(fd_out, update_size) == -1)
 		return update_error;
-	for( copied = 0; copied < update_size; copied += len_b ){
+	for (copied = 0; copied < update_size; copied += len_b ) {
 		len_a = fill_buffer(fd_in, buf_a, sizeof(buf_a));
 		if (len_a == -1)
 			return read_error;
 		if (len_a == 0)		/* Reach EOF */
 			return 0;
 		len_b = flush_buffer(fd_out, buf_a, len_a);
-		if( len_b != len_a )
+		if (len_b != len_a)
 			return write_error;
 	}
 	return 0;
 }
 
-int
-ubimirror(uint32_t devno, int seqnum, uint32_t *ids, ssize_t ids_size,
-	  char *err_buf, size_t err_buf_size)
+int ubimirror(uint32_t devno, int seqnum, uint32_t *ids, ssize_t ids_size,
+		char *err_buf, size_t err_buf_size)
 {
 	int rc = 0;
 	uint32_t src_id;
@@ -173,7 +170,7 @@ ubimirror(uint32_t devno, int seqnum, ui
 		return ubi_error;
 
 	fd_in = ubi_vol_open(ulib, devno, src_id, O_RDONLY);
-	if (fd_in == -1){
+	if (fd_in == -1) {
 		EBUF("open error source volume %d", ids[i]);
 		rc = open_error;
 		goto err;
@@ -190,7 +187,7 @@ ubimirror(uint32_t devno, int seqnum, ui
 			goto err;
 		}
 		rc = compare_files(fd_in, fd_out);
-		if (rc < 0 ){
+		if (rc < 0) {
 			EBUF("compare error volume %d and %d", src_id, ids[i]);
 			goto err;
 		}
@@ -199,11 +196,11 @@ ubimirror(uint32_t devno, int seqnum, ui
 			EBUF("mirror error volume %d to %d", src_id, ids[i]);
 			goto err;
 		}
-		if( (rc = ubi_vol_close(fd_out)) == -1 ){
+		if ((rc = ubi_vol_close(fd_out)) == -1) {
 			EBUF("close error volume %d", ids[i]);
 			rc = close_error;
 			goto err;
-		}else
+		} else
 			fd_out = -1;
 	}
 err:
