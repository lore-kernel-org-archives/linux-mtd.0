Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMygw-0004lz-Eb
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:02:34 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/8] nanddump/nandwrite: use "simple_" str functions
Date: Mon, 29 Nov 2010 00:01:55 -0800
Message-ID: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Per Mike Frysinger's suggestion, we check for strtoll() and strtoull()
errors by using the "common.h" helper functions simple_strtoll() and
simple_strtoull().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c  |    4 ++--
 nandwrite.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index fe29596..bf95e81 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -136,7 +136,7 @@ static void process_options(int argc, char * const argv[])
 				omitbad = true;
 				break;
 			case 's':
-				start_addr = strtoull(optarg, NULL, 0);
+				start_addr = simple_strtoull(optarg, &error);
 				break;
 			case 'f':
 				if (!(dumpfile = strdup(optarg))) {
@@ -145,7 +145,7 @@ static void process_options(int argc, char * const argv[])
 				}
 				break;
 			case 'l':
-				length = strtoull(optarg, NULL, 0);
+				length = simple_strtoull(optarg, &error);
 				break;
 			case 'o':
 				omitoob = true;
diff --git a/nandwrite.c b/nandwrite.c
index bbe69b0..5373a89 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -201,7 +201,7 @@ static void process_options(int argc, char * const argv[])
 				writeoob = true;
 				break;
 			case 's':
-				mtdoffset = strtoll(optarg, NULL, 0);
+				mtdoffset = simple_strtoll(optarg, &error);
 				break;
 			case 'b':
 				blockalign = atoi(optarg);
-- 
1.7.0.4
