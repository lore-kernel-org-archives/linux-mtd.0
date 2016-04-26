Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av0r1-0006ao-L5
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 11:08:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH] nanddump: Handle write errors
Date: Tue, 26 Apr 2016 13:08:02 +0200
Message-Id: <1461668882-7572-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we're unable to write to the output file, abort
and cleary message the user.
Otherwise broken/truncated dumps are created and
a lot of time will be wasted...

Not that I wasted some time with a truncated dump
because nandump did not handle -ENOSPC on the
customer's target... ;-)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 nand-utils/nanddump.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index 4ee7ed4..456ae37 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -309,6 +309,7 @@ int main(int argc, char * const argv[])
 	bool eccstats = false;
 	unsigned char *readbuf = NULL, *oobbuf = NULL;
 	libmtd_t mtd_desc;
+	ssize_t written;
 
 	process_options(argc, argv);
 
@@ -441,12 +442,25 @@ int main(int argc, char * const argv[])
 		/* Write out page data */
 		if (pretty_print) {
 			for (i = 0; i < bs; i += PRETTY_ROW_SIZE) {
+				size_t to_write;
+
 				pretty_dump_to_buffer(readbuf + i, PRETTY_ROW_SIZE,
 						pretty_buf, PRETTY_BUF_LEN, true, canonical, ofs + i);
-				write(ofd, pretty_buf, strlen(pretty_buf));
+
+				to_write = strlen(pretty_buf);
+				written = write(ofd, pretty_buf, to_write);
+				if (written != to_write) {
+					sys_errmsg("Unable to write to output");
+					goto closeall;
+				}
 			}
-		} else
-			write(ofd, readbuf, bs);
+		} else {
+			written = write(ofd, readbuf, bs);
+			if (written != bs) {
+				sys_errmsg("Unable to write to output");
+				goto closeall;
+			}
+		}
 
 		if (omitoob)
 			continue;
@@ -464,12 +478,25 @@ int main(int argc, char * const argv[])
 		/* Write out OOB data */
 		if (pretty_print) {
 			for (i = 0; i < mtd.oob_size; i += PRETTY_ROW_SIZE) {
+				size_t to_write;
+
 				pretty_dump_to_buffer(oobbuf + i, mtd.oob_size - i,
 						pretty_buf, PRETTY_BUF_LEN, false, canonical, 0);
-				write(ofd, pretty_buf, strlen(pretty_buf));
+
+				to_write = strlen(pretty_buf);
+				written = write(ofd, pretty_buf, to_write);
+				if (written != to_write) {
+					sys_errmsg("Unable to write to output");
+					goto closeall;
+				}
 			}
-		} else
-			write(ofd, oobbuf, mtd.oob_size);
+		} else {
+			written = write(ofd, oobbuf, mtd.oob_size);
+			if (written != mtd.oob_size) {
+				sys_errmsg("Unable to write to output");
+				goto closeall;
+			}
+		}
 	}
 
 	/* Close the output file and MTD device, free memory */
-- 
2.7.3
