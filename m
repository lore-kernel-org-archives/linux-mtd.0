Received: from mail1.bemta12.messagelabs.com ([216.82.251.14])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFuW6-0005jR-KF
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 04:46:24 +0000
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01lp0143.outbound.protection.outlook.com [23.103.139.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id
 A4D62294001
 for <linux-mtd@lists.infradead.org>; Tue,  8 May 2018 13:46:06 +0900 (JST)
 (envelope-from smtpuser@allied-telesis.co.jp)
From: smtpuser <smtpuser@allied-telesis.co.jp>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0002: Change write buffer to check correct
 value
Date: Tue,  8 May 2018 13:45:34 +0900
Message-Id: <20180508044534.4226-1-smtpuser@allied-telesis.co.jp>
In-Reply-To: <20180508044142.4159-1-ikegami@allied-telesis.co.jp>
References: <20180508044142.4159-1-ikegami@allied-telesis.co.jp>
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

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 56aa6b75213d..5e9f2ca0a6c1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1879,7 +1879,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
 
-		if (chip_ready(map, adr)) {
+		if (chip_ready(map, adr) && chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
-- 
2.16.1
