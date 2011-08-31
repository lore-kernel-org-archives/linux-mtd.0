Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyr07-0006ga-J6
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:03:08 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 06/10] nandwrite: merge `mtd_write_oob' and `mtd_write' calls
Date: Wed, 31 Aug 2011 13:00:35 -0700
Message-ID: <1314820839-7107-7-git-send-email-computersforpeace@gmail.com>
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

Now that `mtd_write' can write to both OOB and data regions, we need to
perform our `mtd_write' call only once.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 33a3b8f..a78b0b6 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -534,17 +534,17 @@ int main(int argc, char * const argv[])
 			} else {
 				memcpy(oobbuf, oobreadbuf, mtd.oob_size);
 			}
-			/* Write OOB data first, as ecc will be placed in there */
-			if (mtd_write_oob(mtd_desc, &mtd, fd, mtdoffset,
-						mtd.oob_size, oobbuf)) {
-				sys_errmsg("%s: MTD writeoob failure", mtd_device);
-				goto closeall;
-			}
 		}
 
-		/* Write out the Page data */
-		if (!onlyoob && mtd_write(mtd_desc, &mtd, fd, mtdoffset / mtd.eb_size, mtdoffset % mtd.eb_size,
-					writebuf, mtd.min_io_size, NULL, 0, 0)) {
+		/* Write out data */
+		ret = mtd_write(mtd_desc, &mtd, fd, mtdoffset / mtd.eb_size,
+				mtdoffset % mtd.eb_size,
+				onlyoob ? NULL : writebuf,
+				onlyoob ? 0 : mtd.min_io_size,
+				writeoob ? oobbuf : NULL,
+				writeoob ? mtd.oob_size : 0,
+				noecc ? MTD_OPS_RAW : MTD_OPS_PLACE_OOB);
+		if (ret) {
 			int i;
 			if (errno != EIO) {
 				sys_errmsg("%s: MTD write failure", mtd_device);
-- 
1.7.5.4
