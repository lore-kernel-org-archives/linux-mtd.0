Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSZD-0003kH-CF
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:09:14 +0000
Received: by pzk4 with SMTP id 4so7209951pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:09:09 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 08/10] nandwrite: cleanup "oobinfochanged" leftovers
Date: Fri, 19 Aug 2011 10:07:54 -0700
Message-Id: <1313773676-12879-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't really use oobinfochanged anymore, since all the calls to the
MEMSETOOBSEL ioctls are gone. The remaining usage of it is superfluous
now, as the only case where it is changed is under the "noecc" condition
and the only case where it is tested is under the "!noecc" condition.

We also no longer need the "restoreoob" label and can instead simply
close everything done with the single remaining label, "closeall". Note
that `close(-1)' is legal, although useless.

Finally, we move `old_oobinfo' into the only block of code in which it's
used now.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index a0f2596..078e2ff 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -225,8 +225,6 @@ int main(int argc, char * const argv[])
 	struct mtd_dev_info mtd;
 	long long offs;
 	int ret;
-	int oobinfochanged = 0;
-	struct nand_oobinfo old_oobinfo;
 	bool failed = true;
 	/* contains all the data read from the file so far for the current eraseblock */
 	unsigned char *filebuf = NULL;
@@ -277,9 +275,7 @@ int main(int argc, char * const argv[])
 
 	if (noecc)  {
 		ret = ioctl(fd, MTDFILEMODE, MTD_MODE_RAW);
-		if (ret == 0) {
-			oobinfochanged = 2;
-		} else {
+		if (ret) {
 			switch (errno) {
 			case ENOTTY:
 				errmsg_die("ioctl MTDFILEMODE is missing");
@@ -300,7 +296,7 @@ int main(int argc, char * const argv[])
 
 	if (ifd == -1) {
 		perror(img);
-		goto restoreoob;
+		goto closeall;
 	}
 
 	pagelen = mtd.min_io_size + ((writeoob) ? mtd.oob_size : 0);
@@ -502,6 +498,7 @@ int main(int argc, char * const argv[])
 			if (!noecc) {
 				int i, start, len;
 				int tags_pos = 0;
+				struct nand_oobinfo old_oobinfo;
 
 				/* Read the current oob info */
 				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
@@ -517,7 +514,7 @@ int main(int argc, char * const argv[])
 				 * Modified to support out of order oobfree segments,
 				 * such as the layout used by diskonchip.c
 				 */
-				if (!oobinfochanged && (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE)) {
+				if (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
 					for (i = 0; old_oobinfo.oobfree[i][1]; i++) {
 						/* Set the reserved bytes to 0xff */
 						start = old_oobinfo.oobfree[i][0];
@@ -592,8 +589,6 @@ int main(int argc, char * const argv[])
 
 closeall:
 	close(ifd);
-
-restoreoob:
 	libmtd_close(mtd_desc);
 	free(filebuf);
 	free(oobbuf);
-- 
1.7.6
