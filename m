Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4IHX-0007Ao-Ff
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 02:06:33 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/3] mtd: remove unneeded initializer in mtd_ooblayout_{get,
 set}_bytes()
Date: Wed,  9 Nov 2016 11:08:08 +0900
Message-Id: <1478657290-9430-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to initialize oobregion and section since they will
be filled by mtd_ooblayout_find_region().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/mtdcore.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d46e4ad..cf85f2b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1274,8 +1274,8 @@ static int mtd_ooblayout_get_bytes(struct mtd_info *mtd, u8 *buf,
 					    int section,
 					    struct mtd_oob_region *oobregion))
 {
-	struct mtd_oob_region oobregion = { };
-	int section = 0, ret;
+	struct mtd_oob_region oobregion;
+	int section, ret;
 
 	ret = mtd_ooblayout_find_region(mtd, start, &section,
 					&oobregion, iter);
@@ -1317,8 +1317,8 @@ static int mtd_ooblayout_set_bytes(struct mtd_info *mtd, const u8 *buf,
 					    int section,
 					    struct mtd_oob_region *oobregion))
 {
-	struct mtd_oob_region oobregion = { };
-	int section = 0, ret;
+	struct mtd_oob_region oobregion;
+	int section, ret;
 
 	ret = mtd_ooblayout_find_region(mtd, start, &section,
 					&oobregion, iter);
-- 
1.9.1
