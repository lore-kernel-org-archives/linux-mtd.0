Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnU-0004hL-0A
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:29 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFX1006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:26 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/11] fs-tests: integck: verify truncation only if -v option
	was given
Date: Tue, 17 May 2011 10:38:15 +0300
Message-Id: <1305617896-23711-11-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Currently we always verify holes when truncating, but we have -v switch for
this and should do this only if -v was given.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 84e3bef..2140a1b 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1082,7 +1082,8 @@ static void file_truncate_info(struct file_info *file, int fd,
 	w->random_seed = MAX_RANDOM_SEED + 1;
 	file->raw_writes = w;
 
-	if (new_length > file->length)
+	if (args.verify_ops && !args.power_cut_mode &&
+	    new_length > file->length)
 		file_check_hole(file, fd, file->length,
 				new_length - file->length);
 
-- 
1.7.2.3
