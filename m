Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyr1A-0006kC-Qj
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:04:14 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 07/10] mtdutils: move OOB auto-layout into libmtd's mtd_write
Date: Wed, 31 Aug 2011 13:00:36 -0700
Message-ID: <1314820839-7107-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the addition of the the new ioctl(MEMWRITE), we can use the
kernel's internal OOB autoplacement option. It's a cleaner interface and
avoids too much duplication of coding effort.

This patch moves any legacy code (using MEMGETOOBSEL) into a legacy
function in libmtd.c. It's not exactly a "pre-2.6.30" feature, so I'm not
moving it to libmtd_legacy.c.

Now, autoplacement features are only activated if we call mtd_write with
mode == MTD_OPS_AUTO_OOB. This should fix some discrepancies for
nandwrite, where we weren't handling OOB consistently (i.e., we had
different functionality when the kernel did/didn't support MEMWRITE).
But that also means that we now default to using MTD_OPS_PLACE_OOB
instead of AUTO layout. To re-enable autoplacement, we can re-implement
the `--autoplace' option that had previously rotted.

This patch also cleans up a need for an extra OOB buffer in nandwrite.

This has been tested a little in nandsim as well as on SLC NAND flash.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd.c |   39 +++++++++++++++++++++++++++++++++++++++
 nandwrite.c  |   53 ++++-------------------------------------------------
 2 files changed, 43 insertions(+), 49 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index d47b307..1b16de5 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1071,6 +1071,42 @@ int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 	return 0;
 }
 
+static int legacy_auto_oob_layout(const struct mtd_dev_info *mtd, int fd,
+				  int ooblen, void *oob) {
+	struct nand_oobinfo old_oobinfo;
+	int start, len;
+	uint8_t *tmp_buf;
+
+	/* Read the current oob info */
+	if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo))
+		return sys_errmsg("MEMGETOOBSEL failed");
+
+	tmp_buf = malloc(ooblen);
+	memcpy(tmp_buf, oob, ooblen);
+
+	/*
+	 * We use autoplacement and have the oobinfo with the autoplacement
+	 * information from the kernel available
+	 */
+	if (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+		int i, tags_pos = 0;
+		for (i = 0; old_oobinfo.oobfree[i][1]; i++) {
+			/* Set the reserved bytes to 0xff */
+			start = old_oobinfo.oobfree[i][0];
+			len = old_oobinfo.oobfree[i][1];
+			memcpy(oob + start, tmp_buf + tags_pos, len);
+			tags_pos += len;
+		}
+	} else {
+		/* Set at least the ecc byte positions to 0xff */
+		start = old_oobinfo.eccbytes;
+		len = mtd->oob_size - start;
+		memcpy(oob + start, tmp_buf + start, len);
+	}
+
+	return 0;
+}
+
 int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
 	      int offs, void *data, int len, void *oob, int ooblen,
 	      uint8_t mode)
@@ -1120,6 +1156,9 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
 
 	/* Fall back to old methods if necessary */
 	if (oob) {
+		if (mode == MTD_OPS_AUTO_OOB)
+			if (legacy_auto_oob_layout(mtd, fd, ooblen, oob))
+				return -1;
 		if (mtd_write_oob(desc, mtd, fd, seek, ooblen, oob) < 0)
 			return sys_errmsg("cannot write to OOB");
 	}
diff --git a/nandwrite.c b/nandwrite.c
index a78b0b6..920863f 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -233,7 +233,6 @@ int main(int argc, char * const argv[])
 	/* points to the current page inside filebuf */
 	unsigned char *writebuf = NULL;
 	/* points to the OOB for the current page in filebuf */
-	unsigned char *oobreadbuf = NULL;
 	unsigned char *oobbuf = NULL;
 	libmtd_t mtd_desc;
 	int ebsize_aligned;
@@ -345,9 +344,6 @@ int main(int argc, char * const argv[])
 	filebuf = xmalloc(filebuf_max);
 	erase_buffer(filebuf, filebuf_max);
 
-	oobbuf = xmalloc(mtd.oob_size);
-	erase_buffer(oobbuf, mtd.oob_size);
-
 	/*
 	 * Get data from input and write to the device while there is
 	 * still input to read and we are still within the device
@@ -460,16 +456,16 @@ int main(int argc, char * const argv[])
 		}
 
 		if (writeoob) {
-			oobreadbuf = writebuf + mtd.min_io_size;
+			oobbuf = writebuf + mtd.min_io_size;
 
 			/* Read more data for the OOB from the input if there isn't enough in the buffer */
-			if ((oobreadbuf + mtd.oob_size) > (filebuf + filebuf_len)) {
+			if ((oobbuf + mtd.oob_size) > (filebuf + filebuf_len)) {
 				int readlen = mtd.oob_size;
-				int alreadyread = (filebuf + filebuf_len) - oobreadbuf;
+				int alreadyread = (filebuf + filebuf_len) - oobbuf;
 				int tinycnt = alreadyread;
 
 				while (tinycnt < readlen) {
-					cnt = read(ifd, oobreadbuf + tinycnt, readlen - tinycnt);
+					cnt = read(ifd, oobbuf + tinycnt, readlen - tinycnt);
 					if (cnt == 0) { /* EOF */
 						break;
 					} else if (cnt < 0) {
@@ -494,46 +490,6 @@ int main(int argc, char * const argv[])
 					imglen = 0;
 				}
 			}
-
-			if (!noecc) {
-				int start, len;
-				struct nand_oobinfo old_oobinfo;
-
-				/* Read the current oob info */
-				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-					perror("MEMGETOOBSEL");
-					close(fd);
-					exit(EXIT_FAILURE);
-				}
-
-				/*
-				 * We use autoplacement and have the oobinfo with the autoplacement
-				 * information from the kernel available
-				 *
-				 * Modified to support out of order oobfree segments,
-				 * such as the layout used by diskonchip.c
-				 */
-				if (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-					int i, tags_pos = 0, tmp_ofs;
-					for (i = 0; old_oobinfo.oobfree[i][1]; i++) {
-						/* Set the reserved bytes to 0xff */
-						start = old_oobinfo.oobfree[i][0];
-						len = old_oobinfo.oobfree[i][1];
-						tmp_ofs = rawoob ? start : tags_pos;
-						memcpy(oobbuf + start, oobreadbuf + tmp_ofs, len);
-						tags_pos += len;
-					}
-				} else {
-					/* Set at least the ecc byte positions to 0xff */
-					start = old_oobinfo.eccbytes;
-					len = mtd.oob_size - start;
-					memcpy(oobbuf + start,
-							oobreadbuf + start,
-							len);
-				}
-			} else {
-				memcpy(oobbuf, oobreadbuf, mtd.oob_size);
-			}
 		}
 
 		/* Write out data */
@@ -588,7 +544,6 @@ closeall:
 	close(ifd);
 	libmtd_close(mtd_desc);
 	free(filebuf);
-	free(oobbuf);
 	close(fd);
 
 	if (failed
-- 
1.7.5.4
