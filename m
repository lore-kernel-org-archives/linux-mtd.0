Received: from mail1.bemta12.messagelabs.com ([216.82.251.9])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIdUW-0000eB-3Z
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 17:12:02 +0000
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01lp0143.outbound.protection.outlook.com [23.103.139.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id
 D8857294005
 for <linux-mtd@lists.infradead.org>; Wed, 16 May 2018 02:11:44 +0900 (JST)
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
Subject: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase functions
Date: Wed, 16 May 2018 02:11:15 +0900
Message-Id: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
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

The changes are to make sure to check the operation status.
Actually the flash write and erase error behavior is caused on our products.
The flash is Macronix flash device MX29GL512FHT2I-11G used by our products.
The patch series was separated for changes of flash write and erase.
Since those were not depended each other at the time.
But by additional changes the changes are related more as same way currently.
So combine patch series for the flash write and erase changes as v6.

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

Tokunori Ikegami (5):
  mtd: cfi_cmdset_0002: Change write buffer to check correct value
  mtd: cfi_cmdset_0002: Change definition naming to retry write
    operation
  mtd: cfi_cmdset_0002: Change erase functions to retry for error
  mtd: cfi_cmdset_0002: Change erase functions to check chip good only
  mtd: cfi_cmdset_0002: Change erase one block to enable XIP once

 drivers/mtd/chips/cfi_cmdset_0002.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

-- 
2.16.1
