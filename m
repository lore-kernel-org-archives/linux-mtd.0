Received: from m12-17.163.com ([220.181.12.17])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDjpU-0008IB-Dj
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 03:20:37 +0000
From: Pan Bian <bianpan2016@163.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pan Bian <bianpan2016@163.com>
Subject: [PATCH 1/2 v2] mtd: ubi: fix improper return value
Date: Mon,  5 Dec 2016 11:19:18 +0800
Message-Id: <1480907958-19229-1-git-send-email-bianpan2016@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When __vmalloc() returns a NULL pointer, the region is not really
checked, and we cannot conclude that only 0xFF bytes are present at
offset. Thus, returing 0 seems improper. This patches fixes it, returns
"-ENOMEM" and removes the warning.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/mtd/ubi/io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b6fb8f9..00d7f44 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1411,10 +1411,8 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 		return 0;
 
 	buf = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
-	if (!buf) {
-		ubi_err(ubi, "cannot allocate memory to check for 0xFFs");
-		return 0;
-	}
+	if (!buf)
+		return -ENOMEM;
 
 	err = mtd_read(ubi->mtd, addr, len, &read, buf);
 	if (err && !mtd_is_bitflip(err)) {
-- 
1.9.1
