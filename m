Received: from sand.ocn.ne.jp ([122.28.30.136] helo=smtp.sand.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqzqs-0006kK-GQ
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 02:48:35 +0000
From: Jon Povey <jon.povey@racelogic.co.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] ubi-utils: reformat help text to fit in 80 columns
Date: Thu,  2 Sep 2010 11:48:30 +0900
Message-Id: <1283395710-4755-1-git-send-email-jon.povey@racelogic.co.uk>
Cc: Jon Povey <jon.povey@racelogic.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reformat the help text of ubiattach and ubidetach to display nicely on
80 column terminals, also fix a couple of bits that did not make sense.

Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
---
 ubi-utils/src/ubiattach.c |   20 +++++++++-----------
 ubi-utils/src/ubidetach.c |    2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
index 4454c38..5a7d2cf 100644
--- a/ubi-utils/src/ubiattach.c
+++ b/ubi-utils/src/ubiattach.c
@@ -56,17 +56,15 @@ static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to attach MTD device to UBI.";
 
 static const char *optionsstr =
-"-d, --devn=<UBI device number>  the number to assign to the newly created UBI device\n"
-"                                (the number is assigned automatically if this is not\n"
-"                                specified\n"
-"-p, --dev-path=<path to device> path to MTD device node to attach\n"
-"-m, --mtdn=<MTD device number>  MTD device number to attach (alternative method, e.g\n"
-"                                if the character device node does not exist)\n"
-"-O, --vid-hdr-offset            VID header offset (do not specify this unless you\n"
-"                                really know what you do and the optimal defaults will\n"
-"                                be used)\n"
-"-h, --help                      print help message\n"
-"-V, --version                   print program version";
+"-d, --devn=<number>   the number to assign to the newly created UBI device\n"
+"                      (assigned automatically if this is not specified)\n"
+"-p, --dev-path=<path> path to MTD device node to attach\n"
+"-m, --mtdn=<number>   MTD device number to attach (alternative method, e.g\n"
+"                      if the character device node does not exist)\n"
+"-O, --vid-hdr-offset  VID header offset (do not specify this unless you really\n"
+"                      know what you are doing, the default should be optimal)\n"
+"-h, --help            print help message\n"
+"-V, --version         print program version";
 
 static const char *usage =
 "Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
index c4c05a5..e0bc050 100644
--- a/ubi-utils/src/ubidetach.c
+++ b/ubi-utils/src/ubidetach.c
@@ -50,7 +50,7 @@ static struct args args = {
 };
 
 static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
-" - a tool to remove UBI devices (detach MTD devices from UBI)";
+" - tool to remove UBI devices (detach MTD devices from UBI)";
 
 static const char *optionsstr =
 "-d, --devn=<UBI device number>  UBI device number to delete\n"
-- 
1.6.3.3
