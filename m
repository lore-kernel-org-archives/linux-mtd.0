Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAI0t-0002Iu-G0
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 08:34:57 +0000
Received: from eru.research.nokia.com ([172.21.23.107])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3E8YoLO027942
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2011 11:34:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: fix typo in a message
Date: Thu, 14 Apr 2011 11:38:23 +0300
Message-Id: <1302770303-3833-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When a PEB passes the torture test, UBI prints
"do not mark it a bad", but should print "do not mark it sa bad".
This patch corrects the typo.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index d58ceb1..8c1b1c7 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -465,7 +465,7 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 	}
 
 	err = patt_count;
-	ubi_msg("PEB %d passed torture test, do not mark it a bad", pnum);
+	ubi_msg("PEB %d passed torture test, do not mark it as bad", pnum);
 
 out:
 	mutex_unlock(&ubi->buf_mutex);
-- 
1.7.2.3
