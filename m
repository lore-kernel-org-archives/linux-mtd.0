Received: from m50-132.163.com ([123.125.50.132])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDctj-00068T-Re
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 19:56:35 +0000
From: Pan Bian <bianpan201604@163.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pan Bian <bianpan2016@163.com>
Subject: [PATCH 1/1] mtd: ubi: fix improper return value
Date: Sun,  4 Dec 2016 14:12:10 +0800
Message-Id: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Pan Bian <bianpan2016@163.com>

When __vmalloc() returns a NULL pointer, the region is not checked, and
we cannot make sure that only 0xFF bytes are present at offset. Thus,
returning 0 seems improper.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=189081

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/mtd/ubi/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b6fb8f9..b54fe05 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1413,7 +1413,7 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	buf = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubi_err(ubi, "cannot allocate memory to check for 0xFFs");
-		return 0;
+		return -ENOMEM;
 	}
 
 	err = mtd_read(ubi->mtd, addr, len, &read, buf);
-- 
1.9.1
