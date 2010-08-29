Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OpgmS-0005AB-PF
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 12:14:37 +0000
Received: by ywi4 with SMTP id 4so1909499ywi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 05:14:36 -0700 (PDT)
Subject: [PATCH 2/2] UBI: fix forward compatibility
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <1283083932.2131.36.camel@brekeke>
References: <1283083932.2131.36.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 15:14:32 +0300
Message-ID: <1283084072.2131.38.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Commit 0798cea8c2e1afee59686c51d27d0e96b05e42d1 "UBI: improve corrupted flash handling"
broke delet-compatible volumes handling - it introduced a limit of 8 eraseblocks which
may be corrupted. And delete-compatible eraseblocks are added to the "corrupted" list,
so if we'd have a large delete-compatible volume, UBI would refuse it.

The fix is to add delete-compatible volumes to the erase list instead. Indeed, they are
corrupted, we just have to erase them.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 372a15a..69b52e9 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -843,7 +843,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		case UBI_COMPAT_DELETE:
 			ubi_msg("\"delete\" compatible internal volume %d:%d"
 				" found, will remove it", vol_id, lnum);
-			err = add_to_list(si, pnum, ec, &si->corr);
+			err = add_to_list(si, pnum, ec, &si->erase);
 			if (err)
 				return err;
 			return 0;
-- 
1.7.2.2
