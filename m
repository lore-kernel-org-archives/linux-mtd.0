Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZrs-0005I3-VH
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:01 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: check data CRC when in error state
Date: Tue, 30 Sep 2008 12:19:04 +0300
Message-Id: <1222766358-21886-9-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When UBIFS switches to R/O mode because of an error,
it is reasonable to enable data CRC checking.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 40e2790..0168271 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -62,6 +62,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
 {
 	if (!c->ro_media) {
 		c->ro_media = 1;
+		c->no_chk_data_crc = 0;
 		ubifs_warn("switched to read-only mode, error %d", err);
 		dbg_dump_stack();
 	}
-- 
1.5.4.1
