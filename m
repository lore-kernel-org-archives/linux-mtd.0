Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TjBlY-0007Je-33
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2012 16:36:09 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiformat: clean up synopsis of command-line parameters
Date: Thu, 13 Dec 2012 17:35:58 +0100
Message-Id: <1355416558-21920-1-git-send-email-w.sang@pengutronix.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add -Q and --image-seq, remove double -v

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 ubi-utils/ubiformat.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 8f9bd3a..c49af29 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -102,10 +102,11 @@ static const char optionsstr[] =
 
 static const char usage[] =
 "Usage: " PROGRAM_NAME " <MTD device node file name> [-s <bytes>] [-O <offs>] [-n]\n"
-"\t\t\t[-f <file>] [-S <bytes>] [-e <value>] [-x <num>] [-y] [-q] [-v] [-h] [-v]\n"
+"\t\t\t[-Q <num>] [-f <file>] [-S <bytes>] [-e <value>] [-x <num>] [-y] [-q] [-v] [-h]\n"
 "\t\t\t[--sub-page-size=<bytes>] [--vid-hdr-offset=<offs>] [--no-volume-table]\n"
 "\t\t\t[--flash-image=<file>] [--image-size=<bytes>] [--erase-counter=<value>]\n"
-"\t\t\t[--ubi-ver=<num>] [--yes] [--quiet] [--verbose] [--help] [--version]\n\n"
+"\t\t\t[--image-seq=<num>] [--ubi-ver=<num>] [--yes] [--quiet] [--verbose]\n"
+"\t\t\t[--help] [--version]\n\n"
 "Example 1: " PROGRAM_NAME " /dev/mtd0 -y - format MTD device number 0 and do\n"
 "           not ask questions.\n"
 "Example 2: " PROGRAM_NAME " /dev/mtd0 -q -e 0 - format MTD device number 0,\n"
-- 
1.7.10.4
