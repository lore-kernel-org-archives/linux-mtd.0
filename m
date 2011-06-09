Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6y-0002NW-F5
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:13 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEM028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:06 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 22/30] UBIFS: always print stacktrace when switching to R/O
	mode
Date: Thu,  9 Jun 2011 12:05:02 +0300
Message-Id: <1307610310-28691-23-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When switching to R/O mode due to an I/O error, always dump the stack, not only
when debugging is enabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 3be645e..48e1680 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -86,7 +86,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
 		c->no_chk_data_crc = 0;
 		c->vfs_sb->s_flags |= MS_RDONLY;
 		ubifs_warn("switched to read-only mode, error %d", err);
-		dbg_dump_stack();
+		dump_stack();
 	}
 }
 
-- 
1.7.2.3
