Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7kH6-0003Si-D3
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 15:08:38 +0000
Subject: [PATCH 1/3] mtdswap: Reduce function calls for sequence output in
 mtdswap_show()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <82e905b5-3958-be81-b0ee-d0a2805154df@users.sourceforge.net>
Message-ID: <a46e0d93-8708-2f1d-2e16-980216415681@users.sourceforge.net>
Date: Mon, 8 May 2017 17:08:04 +0200
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
Date: Mon, 8 May 2017 16:02:34 +0200

Two line breaks were put into a sequence by separate function calls.
Print the same data together with adjusted seq_printf() calls instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/mtdswap.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index f12879a3d4ff..0805f45c5139 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1283,19 +1283,14 @@ static int mtdswap_show(struct seq_file *s, void *data)
 			"erased %u times\n",
 			cwp, d->pages_per_eblk - cwp, cwecount);
 
-	seq_printf(s, "total erasures: %lu\n", sum);
-
-	seq_puts(s, "\n");
-
+	seq_printf(s, "total erasures: %lu\n\n", sum);
 	seq_printf(s, "mtdswap_readsect count: %llu\n", d->sect_read_count);
 	seq_printf(s, "mtdswap_writesect count: %llu\n", d->sect_write_count);
 	seq_printf(s, "mtdswap_discard count: %llu\n", d->discard_count);
 	seq_printf(s, "mtd read count: %llu\n", d->mtd_read_count);
 	seq_printf(s, "mtd write count: %llu\n", d->mtd_write_count);
 	seq_printf(s, "discarded pages count: %llu\n", d->discard_page_count);
-
-	seq_puts(s, "\n");
-	seq_printf(s, "total pages: %u\n", pages);
+	seq_printf(s, "\ntotal pages: %u\n", pages);
 	seq_printf(s, "pages mapped: %u\n", mapped);
 
 	return 0;
-- 
2.12.2
