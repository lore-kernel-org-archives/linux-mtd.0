Received: from mail1.bemta8.messagelabs.com ([216.82.243.204])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNxTp-0007Mp-7R
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 09:33:26 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH v8 1/5] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Date: Wed, 30 May 2018 18:32:26 +0900
Message-Id: <20180530093230.3240-2-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
References: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For the word write it is checked if the chip has the correct value.
But it is not checked for the write buffer as only checked if ready.
To make sure for the write buffer change to check the value.

It is enough as this patch is only checking the last written word.
Since it is described by data sheets to check the operation status.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
Changes since v7:
- None.

Changes since v6:
- Change Cc: Joakim Tjernlund tag as Reviewed-by: tag.
- Add Cc: stable tag.

Changes since v5:
- None since the v4 change is just combined as same series by v6.

Changes since v3:
- Removed to check if chip ready.

Changes since v2:
- Just updated the patch to add v3 version into subject and desribe a changelog.

Changes since v1:
- Just changed to add Brian as Cc and the patch is sent to Boris-san as To

Changes since v0:
- Changed Split the part to change write buffer from the v1 patch

 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index e397b80e40cc..1d6be8c63d39 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1879,7 +1879,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
 
-		if (chip_ready(map, adr)) {
+		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
-- 
2.16.1
