Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaOOB-0004HS-Sx
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 13:29:17 +0000
From: Enrico Jorns <ejo@pengutronix.de>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH] mtd-utils: ubinize: Always return error code (at least -1) in
 case of an error
Date: Fri, 11 Sep 2015 15:28:13 +0200
Message-Id: <1441978093-20917-1-git-send-email-ejo@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubinize should not fail silenty, this can be very annoying when using
it from other tools that rely on the exit code for determining the
success of their operation.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 ubi-utils/ubinize.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index 34f465a..60bbd9a 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -519,6 +519,7 @@ int main(int argc, char * const argv[])
 	 */
 	seek = ui.peb_size * 2;
 	if (lseek(args.out_fd, seek, SEEK_SET) != seek) {
+		err = -1;
 		sys_errmsg("cannot seek file \"%s\"", args.f_out);
 		goto out_free;
 	}
@@ -530,6 +531,7 @@ int main(int argc, char * const argv[])
 		int fd, j;
 
 		if (!sname) {
+			err = -1;
 			errmsg("ini-file parsing error (iniparser_getsecname)");
 			goto out_free;
 		}
@@ -550,6 +552,7 @@ int main(int argc, char * const argv[])
 		 */
 		for (j = 0; j < i; j++) {
 			if (vi[i].id == vi[j].id) {
+				err = -1;
 				errmsg("volume IDs must be unique, but ID %d "
 				       "in section \"%s\" is not",
 				       vi[i].id, sname);
@@ -557,6 +560,7 @@ int main(int argc, char * const argv[])
 			}
 
 			if (!strcmp(vi[i].name, vi[j].name)) {
+				err = -1;
 				errmsg("volume name must be unique, but name "
 				       "\"%s\" in section \"%s\" is not",
 				       vi[i].name, sname);
@@ -580,6 +584,7 @@ int main(int argc, char * const argv[])
 		if (img) {
 			fd = open(img, O_RDONLY);
 			if (fd == -1) {
+				err = fd;
 				sys_errmsg("cannot open \"%s\"", img);
 				goto out_free;
 			}
-- 
2.5.0
