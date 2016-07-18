Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP4hP-0003tu-Bj
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 09:18:59 +0000
Received: by mail-lf0-x242.google.com with SMTP id l69so6409236lfg.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 02:18:30 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH mtd-utils] nanddump: check write function result for errors
Date: Mon, 18 Jul 2016 11:18:13 +0200
Message-Id: <1468833493-28311-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Errors may happen, it's e.g. easy on embedded devices to run out of space
when dumping big partitions. This patch adds a helper function for
writing. It deals with partial writes and just returns 0 on success or
error number.

The old code didn't check for errors at all which could result in
incomplete dumps without exiting with an error.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 nand-utils/nanddump.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index 4ee7ed4..0bbc97f 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -293,6 +293,25 @@ nil:
 	linebuf[lx++] = '\0';
 }
 
+/**
+ * ofd_write - writes whole buffer to the file associated with a descriptor
+ *
+ * On failure an error (negative number) is returned. Otherwise 0 is returned.
+ */
+static int ofd_write(int ofd, const unsigned char *buf, size_t nbyte)
+{
+	ssize_t bytes;
+
+	while (nbyte) {
+		bytes = write(ofd, buf, nbyte);
+		if (bytes < 0)
+			return -errno;
+		buf += bytes;
+		nbyte -= bytes;
+	}
+
+	return 0;
+}
 
 /*
  * Main program
@@ -309,6 +328,7 @@ int main(int argc, char * const argv[])
 	bool eccstats = false;
 	unsigned char *readbuf = NULL, *oobbuf = NULL;
 	libmtd_t mtd_desc;
+	int err;
 
 	process_options(argc, argv);
 
@@ -443,10 +463,19 @@ int main(int argc, char * const argv[])
 			for (i = 0; i < bs; i += PRETTY_ROW_SIZE) {
 				pretty_dump_to_buffer(readbuf + i, PRETTY_ROW_SIZE,
 						pretty_buf, PRETTY_BUF_LEN, true, canonical, ofs + i);
-				write(ofd, pretty_buf, strlen(pretty_buf));
+				err = write(ofd, pretty_buf, strlen(pretty_buf));
+				if (err) {
+					errmsg("ofd_write: %s\n", strerror(-err));
+					goto closeall;
+				}
 			}
-		} else
-			write(ofd, readbuf, bs);
+		} else {
+			err = ofd_write(ofd, readbuf, bs);
+			if (err) {
+				errmsg("ofd_write: %d %s\n", err, strerror(-err));
+				goto closeall;
+			}
+		}
 
 		if (omitoob)
 			continue;
@@ -466,10 +495,19 @@ int main(int argc, char * const argv[])
 			for (i = 0; i < mtd.oob_size; i += PRETTY_ROW_SIZE) {
 				pretty_dump_to_buffer(oobbuf + i, mtd.oob_size - i,
 						pretty_buf, PRETTY_BUF_LEN, false, canonical, 0);
-				write(ofd, pretty_buf, strlen(pretty_buf));
+				err = write(ofd, pretty_buf, strlen(pretty_buf));
+				if (err) {
+					errmsg("ofd_write: %s\n", strerror(-err));
+					goto closeall;
+				}
 			}
-		} else
-			write(ofd, oobbuf, mtd.oob_size);
+		} else {
+			err = ofd_write(ofd, oobbuf, mtd.oob_size);
+			if (err) {
+				errmsg("ofd_write: %d %s\n", err, strerror(-err));
+				goto closeall;
+			}
+		}
 	}
 
 	/* Close the output file and MTD device, free memory */
-- 
1.8.4.5
