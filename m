Received: from mail1.bemta8.messagelabs.com ([216.82.243.202])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIWUq-0007xJ-Kz
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 09:44:08 +0000
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01lp0175.outbound.protection.outlook.com [23.103.139.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id
 70795294001
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2018 18:43:39 +0900 (JST)
 (envelope-from smtpuser@allied-telesis.co.jp)
From: smtpuser <smtpuser@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH v4 1/1] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Date: Tue, 15 May 2018 18:43:10 +0900
Message-Id: <20180515094310.14103-2-smtpuser@allied-telesis.co.jp>
In-Reply-To: <20180515094310.14103-1-smtpuser@allied-telesis.co.jp>
References: <20180515094310.14103-1-smtpuser@allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

For the word write it is checked if the chip has the correct value.
But it is not checked for the write buffer as only checked if ready.
To make sure for the write buffer change to check the value.
Also the checking if ready is not necessary now so remove it.

It is enough as this patch is only checking the last written word.
Since it is described by data sheets to check the operation status.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
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
