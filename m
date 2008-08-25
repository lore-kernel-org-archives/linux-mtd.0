Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXhRv-0002fQ-4n
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 19:09:59 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: fixed and enhanced '--flash-image' option
Date: Mon, 25 Aug 2008 21:09:50 +0200
Message-Id: <1219691391-15149-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The '--flash-image' option of 'ubiformat' requires an argument and
'.has_arg' must not be 0 hence.  The patch adds this option to the
commandline synopsis too.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ubi-utils/new-utils/src/ubiformat.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/new-utils/src/ubiformat.c b/ubi-utils/new-utils/src/ubiformat.c
index 1fa14b3..c2888e0 100644
--- a/ubi-utils/new-utils/src/ubiformat.c
+++ b/ubi-utils/new-utils/src/ubiformat.c
@@ -92,7 +92,8 @@ static const char *usage =
 "\t\t\t[-x <num>] [-E <value>] [-s <bytes>] [-O <offs>] [-n]\n"
 "\t\t\t[--help] [--version] [--yes] [--verbose] [--quiet]\n"
 "\t\t\t[--ec=<value>] [--vid-hdr-offset=<offs>]\n"
-"\t\t\t[--ubi-ver=<num>] [--no-volume-table]\n\n"
+"\t\t\t[--ubi-ver=<num>] [--no-volume-table]\n"
+"\t\t\t[--flash-image=<file>]\n\n"
 
 "Example 1: " PROGRAM_NAME " /dev/mtd0 -y - format MTD device number 0 and do\n"
 "           not ask questions.\n"
@@ -103,7 +104,7 @@ static const struct option long_options[] = {
 	{ .name = "sub-page-size",   .has_arg = 1, .flag = NULL, .val = 's' },
 	{ .name = "vid-hdr-offset",  .has_arg = 1, .flag = NULL, .val = 'O' },
 	{ .name = "no-volume-table", .has_arg = 0, .flag = NULL, .val = 'n' },
-	{ .name = "flash-image",     .has_arg = 0, .flag = NULL, .val = 'f' },
+	{ .name = "flash-image",     .has_arg = 1, .flag = NULL, .val = 'f' },
 	{ .name = "yes",             .has_arg = 0, .flag = NULL, .val = 'y' },
 	{ .name = "erase-counter",   .has_arg = 1, .flag = NULL, .val = 'e' },
 	{ .name = "quiet",           .has_arg = 0, .flag = NULL, .val = 'q' },
-- 
1.5.5.1
