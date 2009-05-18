Received: from ey-out-1920.google.com ([74.125.78.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M5zlC-00014c-Go
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 10:08:13 +0000
Received: by ey-out-1920.google.com with SMTP id 13so726106eye.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 May 2009 03:07:52 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: David.Woodhouse@intel.com, Artem.Bityutskiy@nokia.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd_dataflash: unbreak erase support
Date: Mon, 18 May 2009 12:07:49 +0200
Message-Id: <1242641269-19113-1-git-send-email-jacmet@sunsite.dk>
Cc: stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 5b7f3a50 (fix dataflash 64-bit divisions) unfortunately
introduced a typo. Erase addr and len were swapped in the pageaddr
calculation, causing the wrong sectors to get erased.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Resend with Artem's acked-by
 David, clear regression from 2.6.28, please send to Linus for 2.6.30
 Please consider for 2.6.29-stable as well.

 drivers/mtd/devices/mtd_dataflash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 62dee54..43976aa 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -178,7 +178,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 		/* Calculate flash page address; use block erase (for speed) if
 		 * we're at a block boundary and need to erase the whole block.
 		 */
-		pageaddr = div_u64(instr->len, priv->page_size);
+		pageaddr = div_u64(instr->addr, priv->page_size);
 		do_block = (pageaddr & 0x7) == 0 && instr->len >= blocksize;
 		pageaddr = pageaddr << priv->page_offset;
 
-- 
1.6.2
