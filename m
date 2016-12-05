Received: from m12-18.163.com ([220.181.12.18])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDjpU-0008Ht-QY
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 03:20:40 +0000
From: Pan Bian <bianpan2016@163.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pan Bian <bianpan2016@163.com>
Subject: [PATCH 2/2] mtd: ubi: fix improper return value
Date: Mon,  5 Dec 2016 11:19:29 +0800
Message-Id: <1480907969-19960-1-git-send-email-bianpan2016@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When __vmalloc() returns a NULL pointer, the data is not really tested,
and we cannot conclude that the data matches. Thus, returning 0 seems
improper. This patch fixes it, returns "-ENOMEM" and removes the
warning.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/mtd/ubi/io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 00d7f44..6707277 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1347,10 +1347,8 @@ static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 		return 0;
 
 	buf1 = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
-	if (!buf1) {
-		ubi_err(ubi, "cannot allocate memory to check writes");
-		return 0;
-	}
+	if (!buf1)
+		return -ENOMEM;
 
 	err = mtd_read(ubi->mtd, addr, len, &read, buf1);
 	if (err && !mtd_is_bitflip(err))
-- 
1.9.1
