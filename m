Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzngl-0006J0-Gx
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 09:06:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] ubinfo: document the new -N option
Date: Thu,  8 Apr 2010 12:04:09 +0300
Message-Id: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
Cc: Mika Westerberg <ext-mika.1.westerberg@nokia.com>,
	Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/ubinfo.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/src/ubinfo.c
index cd011c5..8f84382 100644
--- a/ubi-utils/src/ubinfo.c
+++ b/ubi-utils/src/ubinfo.c
@@ -56,6 +56,7 @@ static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
 static const char *optionsstr =
 "-d, --devn=<UBI device number>  UBI device number to get information about\n"
 "-n, --vol_id=<volume ID>        ID of UBI volume to print information about\n"
+"-N, --name=<volume name>        name of UBI volume to print information about\n"
 "-a, --all                       print information about all devices and volumes,\n"
 "                                or about all volumes if the UBI device was\n"
 "                                specified\n"
@@ -63,8 +64,8 @@ static const char *optionsstr =
 "-V, --version                   print program version";
 
 static const char *usage =
-"Usage 1: " PROGRAM_NAME " [-d <UBI device number>] [-n <volume ID>] [-a] [-h] [-V] [--vol_id=<volume ID>]\n"
-"\t\t[--devn <UBI device number>] [--all] [--help] [--version]\n"
+"Usage 1: " PROGRAM_NAME " [-d <UBI device number>] [-n <volume ID> | -N <volume name>] [-a] [-h] [-V]\n"
+"\t\t[--vol_id=<volume ID> | --name <volume name>] [--devn <UBI device number>] [--all] [--help] [--version]\n"
 "Usage 2: " PROGRAM_NAME " <UBI device node file name> [-a] [-h] [-V] [--all] [--help] [--version]\n"
 "Usage 3: " PROGRAM_NAME " <UBI volume node file name> [-h] [-V] [--help] [--version]\n\n"
 "Example 1: " PROGRAM_NAME " - (no arguments) print general UBI information\n"
@@ -77,6 +78,7 @@ static const char *usage =
 static const struct option long_options[] = {
 	{ .name = "devn",      .has_arg = 1, .flag = NULL, .val = 'd' },
 	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
 	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
 	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
-- 
1.6.6.1
