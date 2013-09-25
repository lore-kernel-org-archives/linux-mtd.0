Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOvlF-0005nU-G6
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 20:32:38 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/2] UBI: Fix error path in scan_pool()
Date: Wed, 25 Sep 2013 22:32:04 +0200
Message-Id: <1380141125-11063-1-git-send-email-richard@nod.at>
Cc: richard.genoud@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have to set "ret", not "err" in case of an error.

Reported-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index f5aa4b0..9b42add 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -428,7 +428,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
 			ubi_err("bad image seq: 0x%x, expected: 0x%x",
 				be32_to_cpu(ech->image_seq), ubi->image_seq);
-			err = UBI_BAD_FASTMAP;
+			ret = UBI_BAD_FASTMAP;
 			goto out;
 		}
 
-- 
1.8.1.4
