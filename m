Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2zU-0003Zp-9c
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:48:37 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 5/6] UBI: Fastmap: Switch to ro mode if invalidate_fastmap()
 fails
Date: Sun, 30 Nov 2014 12:47:45 +0100
Message-Id: <1417348066-7043-6-git-send-email-richard@nod.at>
In-Reply-To: <1417348066-7043-1-git-send-email-richard@nod.at>
References: <1417348066-7043-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have to switch to ro mode to guarantee that upon next UBI attach
all data is consistent.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 8b95c48..3d913f5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1466,8 +1466,10 @@ err:
 	ret = 0;
 	if (old_fm) {
 		ret = invalidate_fastmap(ubi, old_fm);
-		if (ret < 0)
+		if (ret < 0) {
 			ubi_err(ubi, "Unable to invalidiate current fastmap!");
+			ubi_ro_mode(ubi);
+		}
 		else if (ret)
 			ret = 0;
 	}
-- 
1.8.4.5
