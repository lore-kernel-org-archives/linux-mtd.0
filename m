Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqtzY-0001aa-3C
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 21:37:40 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 3/5] mtdinfo: restructure help message
Date: Tue, 9 Aug 2011 14:36:44 -0700
Message-ID: <1312925806-15929-4-git-send-email-computersforpeace@gmail.com>
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

We weren't very consistent in how we listed our options in the mtdinfo
help string (listing short options, long options, or both). Plus, not all
options are inter-operable, so we should distinguish this somewhat.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 0a20c76..cd55dce 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -64,8 +64,10 @@ static const char optionsstr[] =
 "-V, --version                   print program version";
 
 static const char usage[] =
-"Usage: " PROGRAM_NAME " <MTD device node file name> [-u] [-M] [-h] [-V] [--ubi-info] [--help]\n"
-"\t\t[--version]\n"
+"Usage: " PROGRAM_NAME " <MTD node file path> [--map | -M] [--ubi-info | -u]\n"
+"       " PROGRAM_NAME " --all [--ubi-info | -u]\n"
+"       " PROGRAM_NAME " [--help | --version]\n"
+"\n"
 "Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
 "Example 2: " PROGRAM_NAME " /dev/mtd0 - print information MTD device /dev/mtd0\n"
 "Example 3: " PROGRAM_NAME " /dev/mtd0 -u - print information MTD device /dev/mtd0\n"
-- 
1.7.0.4
