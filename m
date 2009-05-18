Subject: [PATCH] mtd_dataflash: unbreak erase support
From: David Woodhouse <dwmw2@infradead.org>
To: torvalds@linux-foundation.org
Content-Type: text/plain
Date: Mon, 18 May 2009 11:13:54 +0100
Message-Id: <1242641634.30251.7.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"stable@kernel.org" <stable@kernel.org>, "Woodhouse,
	David" <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Peter Korsgaard <jacmet@sunsite.dk>

Commit 5b7f3a50 (fix dataflash 64-bit divisions) unfortunately
introduced a typo. Erase addr and len were swapped in the pageaddr
calculation, causing the wrong sectors to get erased.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
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

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
