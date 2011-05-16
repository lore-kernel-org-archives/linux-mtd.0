Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Z1-R0
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7dxUe010464
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/20] UBIFS: dump more in the lprops debugging check
Date: Mon, 16 May 2011 10:44:23 +0300
Message-Id: <1305531879-19311-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
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

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lprops.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 77c541b..667884f 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1108,6 +1108,10 @@ static int scan_check_cb(struct ubifs_info *c,
 	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
 		ret = PTR_ERR(sleb);
+		if (ret == -EUCLEAN) {
+			dbg_dump_lprops(c);
+			dbg_dump_budg(c, &c->bi);
+		}
 		goto out;
 	}
 
-- 
1.7.2.3
