Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4IHX-0007Al-Fc
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
Subject: [PATCH 3/3] mtd: remove unneeded initializer in
 mtd_ooblayout_count_bytes()
Date: Wed,  9 Nov 2016 11:08:10 +0900
Message-Id: <1478657290-9430-4-git-send-email-yamada.masahiro@socionext.com>
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

There is no need to initialize oobregion since it will be filled by
the iterator.

This function is called with mtd_ooblayout_free or mtd_ooblayout_ecc
for the iterator; both of them calls memset() to clear the oobregion.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index ca6a89a..ca661ce 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1354,7 +1354,7 @@ static int mtd_ooblayout_count_bytes(struct mtd_info *mtd,
 					    int section,
 					    struct mtd_oob_region *oobregion))
 {
-	struct mtd_oob_region oobregion = { };
+	struct mtd_oob_region oobregion;
 	int section = 0, ret, nbytes = 0;
 
 	while (1) {
-- 
1.9.1
