Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TPajr-00061W-9h
 for linux-mtd@lists.infradead.org; Sat, 20 Oct 2012 15:13:24 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiformat: really skip some messages when quiet
Date: Sat, 20 Oct 2012 17:12:56 +0200
Message-Id: <1350745976-1774-1-git-send-email-w.sang@pengutronix.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Both logic (only print when not quiet) and the indentation suggest that
the braces around the block have been forgotten.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 ubi-utils/ubiformat.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index a265a9a..8f9bd3a 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -875,11 +875,12 @@ int main(int argc, char * const argv[])
 		 * erase counters.
 		 */
 		if (percent < 50) {
-			if (!args.yes || !args.quiet)
+			if (!args.yes || !args.quiet) {
 				warnmsg("only %d of %d eraseblocks have valid erase counter",
 					si->ok_cnt, si->good_cnt);
 				normsg("erase counter 0 will be used for all eraseblocks");
 				normsg("note, arbitrary erase counter value may be specified using -e option");
+			}
 			if (!args.yes && want_exit()) {
 				if (args.yes && !args.quiet)
 					printf("yes\n");
@@ -888,11 +889,12 @@ int main(int argc, char * const argv[])
 			 args.ec = 0;
 			 args.override_ec = 1;
 		} else if (percent < 95) {
-			if (!args.yes || !args.quiet)
+			if (!args.yes || !args.quiet) {
 				warnmsg("only %d of %d eraseblocks have valid erase counter",
 					si->ok_cnt, si->good_cnt);
 				normsg("mean erase counter %lld will be used for the rest of eraseblock",
 				       si->mean_ec);
+			}
 			if (!args.yes && want_exit()) {
 				if (args.yes && !args.quiet)
 					printf("yes\n");
-- 
1.7.10.4
