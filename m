Received: from mail.perches.com ([173.55.12.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHpOK-0007z5-Co
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2010 03:06:05 +0000
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>
Subject: [PATCH 37/44] fs/ubifs: Remove unnecessary semicolons
Date: Sun, 14 Nov 2010 19:04:56 -0800
Message-Id: <902d76520da2f65e5dc44339dccb07159947f23d.1289789605.git.joe@perches.com>
In-Reply-To: <cover.1289789604.git.joe@perches.com>
References: <cover.1289789604.git.joe@perches.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/ubifs/scan.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 3e1ee57..36216b4 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -328,7 +328,7 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 		if (!quiet)
 			ubifs_err("empty space starts at non-aligned offset %d",
 				  offs);
-		goto corrupted;;
+		goto corrupted;
 	}
 
 	ubifs_end_scan(c, sleb, lnum, offs);
-- 
1.7.3.1.g432b3.dirty
