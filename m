Received: from mail1.bemta8.messagelabs.com ([216.82.243.198])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIWUj-0007tU-5l
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 09:43:51 +0000
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01lp0178.outbound.protection.outlook.com [23.103.139.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id
 AE8FA294002
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2018 18:43:30 +0900 (JST)
 (envelope-from smtpuser@allied-telesis.co.jp)
From: smtpuser <smtpuser@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 0/1] mtd: cfi_cmdset_0002: Change write buffer to check
 chip good
Date: Tue, 15 May 2018 18:43:09 +0900
Message-Id: <20180515094310.14103-1-smtpuser@allied-telesis.co.jp>
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

Currently on our products the flash write error issue was caused.
This can be resolved to change the write buffer to check more.
So change the write buffer to check chip good.

Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org

Tokunori Ikegami (1):
  mtd: cfi_cmdset_0002: Change write buffer to check correct value

 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.16.1
