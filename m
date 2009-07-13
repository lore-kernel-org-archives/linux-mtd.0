Received: from mail.de.keymile.com ([195.8.104.1])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQMoy-0002Wx-Dp
	for linux-mtd@lists.infradead.org; Mon, 13 Jul 2009 14:48:07 +0000
Received: from srvdehan1003.de.keymile.net (srvdehan1003.de.keymile.net
	[10.9.1.108]) by mailrelay.de.keymile.net (8.12.2/8.12.2)
	with ESMTP id n6DEihjp002145 for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jul 2009 16:44:43 +0200 (MEST)
Subject: [PATCH] UBI: fix bug in image sequence number handling
From: Holger Brunck <holger.brunck@keymile.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Jul 2009 16:47:57 +0200
Message-Id: <1247496477.3590.40.camel@pc005093.de.keymile.net>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all, 
I have seen a bug on the current 2.6.28 backport for UBI. But the same
bug seems to be present in the current ubi-2.6.git.

 
This patch fixes a bug in the image seq. number handling in the
scanning level. The assignment of the image_seq was incorrect.

Signed-off-by: Holger Brunck <holger.brunck@keymile.com>
---
 drivers/mtd/ubi/scan.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 065c4ba..e337b0b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -781,7 +781,7 @@ static int process_eb(struct ubi_device *ubi, struct
ubi_scan_info *si,
 			return -EINVAL;
 		}
 
-		image_seq = be32_to_cpu(ech->ec);
+		image_seq = be32_to_cpu(ech->image_seq);
 		if (!si->image_seq_set) {
 			ubi->image_seq = image_seq;
 			si->image_seq_set = 1;
-- 
1.6.0.1

Regards
Holger Brunck
