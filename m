Received: from mail.perches.com ([173.55.12.10])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQNRn-0004MK-Mx
	for linux-mtd@lists.infradead.org; Sat, 28 May 2011 17:37:12 +0000
From: Joe Perches <joe@perches.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Jiri Kosina <trivial@kernel.org>
Subject: [TRIVIAL PATCH next 09/15] mtd: Convert vmalloc/memset to vzalloc
Date: Sat, 28 May 2011 10:36:29 -0700
Message-Id: <adc50014679048de28c7d536f1686cd945fc40f6.1306603968.git.joe@perches.com>
In-Reply-To: <cover.1306603968.git.joe@perches.com>
References: <cover.1306603968.git.joe@perches.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/mtd/mtdswap.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index fd78853..5e5423b 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1374,11 +1374,10 @@ static int mtdswap_init(struct mtdswap_dev *d, unsigned int eblocks,
 		goto revmap_fail;
 
 	eblk_bytes = sizeof(struct swap_eb)*d->eblks;
-	d->eb_data = vmalloc(eblk_bytes);
+	d->eb_data = vzalloc(eblk_bytes);
 	if (!d->eb_data)
 		goto eb_data_fail;
 
-	memset(d->eb_data, 0, eblk_bytes);
 	for (i = 0; i < pages; i++)
 		d->page_data[i] = BLOCK_UNDEF;
 
-- 
1.7.5.rc3.dirty
