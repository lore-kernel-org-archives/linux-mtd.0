Received: from mail1.bemta12.messagelabs.com ([216.82.251.10])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBA0g-0003SS-9K
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 02:18:21 +0000
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01lp0147.outbound.protection.outlook.com [23.103.139.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id
 CB435294001
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2018 11:18:03 +0900 (JST)
 (envelope-from smtpuser@allied-telesis.co.jp)
From: smtpuser <smtpuser@allied-telesis.co.jp>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0002: Read data 3 times to check write
 operation status
Date: Wed, 25 Apr 2018 11:17:26 +0900
Message-Id: <20180425021726.18591-1-smtpuser@allied-telesis.co.jp>
In-Reply-To: <TY1PR01MB09540E30A53D361D54CEA16EDC880@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB09540E30A53D361D54CEA16EDC880@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

Cypress S29GLxxxP flash is needed to read data 3 times to check DQ6 toggles.
Actually the read data is sometimes changed by the 3rd reading.
Also this is caused on other flash device also.
The flash write failure is possible to be caused by the error.
To resolve the issue change the read number of times to 3 from 2.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
I have just updated the patch to add Signed-off-by and Cc lines.
This patch will be sent by git-send-email.
Also for our company mail system the sender mail address is needed to be set as smtpuser <smtpuser@allied-telesis.co.jp>.
But do not reply to the email address smtpuser <smtpuser@allied-telesis.co.jp>.
Please reply to my email address Tokunori Ikegami <ikegami@allied-telesis.co.jp> if any comemnt or problem.
Sorry for inconvinient about this.

 drivers/mtd/chips/cfi_cmdset_0002.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 56aa6b75213d..dc7667ff134a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -743,12 +743,13 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
  */
 static int __xipram chip_ready(struct map_info *map, unsigned long addr)
 {
-	map_word d, t;
+	map_word r1, r2, r3;
 
-	d = map_read(map, addr);
-	t = map_read(map, addr);
+	r1 = map_read(map, addr);
+	r2 = map_read(map, addr);
+	r3 = map_read(map, addr);
 
-	return map_word_equal(map, d, t);
+	return map_word_equal(map, r1, r2) && map_word_equal(map, r2, r3);
 }
 
 /*
-- 
2.16.1
