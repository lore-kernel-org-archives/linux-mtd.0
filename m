Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7kIu-0004ti-Qt
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 15:10:30 +0000
Subject: [PATCH 3/3] mtdswap: Improve a size determination in
 mtdswap_erase_block()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <82e905b5-3958-be81-b0ee-d0a2805154df@users.sourceforge.net>
Message-ID: <0afe37eb-71fe-2a40-7ed5-24b910906671@users.sourceforge.net>
Date: Mon, 8 May 2017 17:10:03 +0200
MIME-Version: 1.0
In-Reply-To: <82e905b5-3958-be81-b0ee-d0a2805154df@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 16:51:30 +0200

Replace the specification of a data structure by a name for
a local variable as the parameter for the operator "sizeof" to make
the corresponding size determination a bit safer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/mtdswap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index f73fb0909b0c..c748515f8533 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -559,8 +559,7 @@ static int mtdswap_erase_block(struct mtdswap_dev *d, struct swap_eb *eb)
 
 retry:
 	init_waitqueue_head(&wq);
-	memset(&erase, 0, sizeof(struct erase_info));
-
+	memset(&erase, 0, sizeof(erase));
 	erase.mtd	= mtd;
 	erase.callback	= mtdswap_erase_callback;
 	erase.addr	= mtdswap_eb_offset(d, eb);
-- 
2.12.2
