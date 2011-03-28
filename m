Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46xD-00011h-Tw
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 07:33:36 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2S7XWKl001332
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 10:33:32 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] UBI: do not compare array with NULL
Date: Mon, 28 Mar 2011 10:36:09 +0300
Message-Id: <1301297771-14624-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Coverity spotted that UBI debugging code tries to compare
an array and NULL, which obviously makes little sense. Kill
this check.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/vmt.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index b79e0de..366eb70 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -790,11 +790,6 @@ static int paranoid_check_volume(struct ubi_device *ubi, int vol_id)
 		goto fail;
 	}
 
-	if (!vol->name) {
-		ubi_err("NULL volume name");
-		goto fail;
-	}
-
 	n = strnlen(vol->name, vol->name_len + 1);
 	if (n != vol->name_len) {
 		ubi_err("bad name_len %lld", n);
-- 
1.7.2.3
