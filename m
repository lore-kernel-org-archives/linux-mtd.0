Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6f1i-0008VC-Fv
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 08:20:50 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p348Kh1c023896
	for <linux-mtd@lists.infradead.org>; Mon, 4 Apr 2011 11:20:43 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: linux-mtd@lists.infradead.org,
	"Bityutskiy Artem (Nokia-MS/Helsinki)" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] mkfs.ubifs: check output first
Date: Mon,  4 Apr 2011 11:21:15 +0300
Message-Id: <1301905275-2087-1-git-send-email-ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 mkfs.ubifs/mkfs.ubifs.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index bc0817f..9f3c5e0 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -675,8 +675,11 @@ static int get_options(int argc, char**argv)
 
 	if (optind != argc && !output)
 		output = strdup(argv[optind]);
-	if (output)
-		out_ubi = !open_ubi(output);
+
+	if (!output)
+		return err_msg("not output device or file specified");
+
+	out_ubi = !open_ubi(output);
 
 	if (out_ubi) {
 		c->min_io_size = c->di.min_io_size;
@@ -684,9 +687,6 @@ static int get_options(int argc, char**argv)
 		c->max_leb_cnt = c->vi.rsvd_lebs;
 	}
 
-	if (!output)
-		return err_msg("not output device or file specified");
-
 	if (c->min_io_size == -1)
 		return err_msg("min. I/O unit was not specified "
 			       "(use -h for help)");
-- 
1.6.3.3
