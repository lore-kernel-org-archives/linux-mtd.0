Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqtzd-0001aa-4N
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 21:37:45 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 4/5] mtdinfo: fixup "example usage" help section
Date: Tue, 9 Aug 2011 14:36:45 -0700
Message-ID: <1312925806-15929-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
References: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Line up columns better so that everything is more readable.

Remove "Example 1" since `mtdinfo' does not print information when not
given any arguments.

Remove "...UBI layout information" from description of Example 4, since
Example 4 (now 3) doesn't include the `-u' flag.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index cd55dce..1c3a46f 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -68,12 +68,10 @@ static const char usage[] =
 "       " PROGRAM_NAME " --all [--ubi-info | -u]\n"
 "       " PROGRAM_NAME " [--help | --version]\n"
 "\n"
-"Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
-"Example 2: " PROGRAM_NAME " /dev/mtd0 - print information MTD device /dev/mtd0\n"
-"Example 3: " PROGRAM_NAME " /dev/mtd0 -u - print information MTD device /dev/mtd0\n"
-"\t\t\t\tand include UBI layout information\n"
-"Example 4: " PROGRAM_NAME " -a - print information about all MTD devices\n"
-"\t\t\tand include UBI layout information\n";
+"Example 1: " PROGRAM_NAME " /dev/mtd0       print information MTD device /dev/mtd0\n"
+"Example 2: " PROGRAM_NAME " /dev/mtd0 -u    print information MTD device /dev/mtd0\n"
+"\t\t\t\t   and include UBI layout information\n"
+"Example 3: " PROGRAM_NAME " -a              print information about all MTD devices\n";
 
 static const struct option long_options[] = {
 	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
-- 
1.7.0.4
