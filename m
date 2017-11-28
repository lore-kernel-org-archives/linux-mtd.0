Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJl7D-0002ja-RA
 for linux-mtd@lists.infradead.org; Tue, 28 Nov 2017 19:00:21 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: mtdswap: make array 'name' static const,
 shrinks object size
Date: Tue, 28 Nov 2017 18:59:46 +0000
Message-Id: <20171128185946.25026-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only array 'name' on the stack but instead
make it static and constify it. Makes the object code smaller by 35
bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  26304	   4444	    352	  31100	   797c	drivers/mtd/mtdswap.o

After:
   text	   data	    bss	    dec	    hex	filename
  26205	   4508	    352	  31065	   7959	drivers/mtd/mtdswap.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/mtdswap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index f07492c6f4b2..7eb0e1f4f980 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1223,8 +1223,9 @@ static int mtdswap_show(struct seq_file *s, void *data)
 	unsigned int max[MTDSWAP_TREE_CNT];
 	unsigned int i, cw = 0, cwp = 0, cwecount = 0, bb_cnt, mapped, pages;
 	uint64_t use_size;
-	char *name[] = {"clean", "used", "low", "high", "dirty", "bitflip",
-			"failing"};
+	static const char * const name[] = {
+		"clean", "used", "low", "high", "dirty", "bitflip", "failing"
+	};
 
 	mutex_lock(&d->mbd_dev->lock);
 
-- 
2.14.1
