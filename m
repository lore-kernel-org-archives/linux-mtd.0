Received: from mail1.bemta8.messagelabs.com ([216.82.243.206])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI9m9-0004rq-Um
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 09:28:22 +0000
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01lp0146.outbound.protection.outlook.com [23.103.139.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id
 2201129400A
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2018 18:27:59 +0900 (JST)
 (envelope-from smtpuser@allied-telesis.co.jp)
From: smtpuser <smtpuser@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 linux-mtd@lists.infradead.org
Subject: [PATCH RESEND v5 0/2] mtd: cfi_cmdset_0002: Changes to retry for
 flash erase
Date: Mon, 14 May 2018 18:27:25 +0900
Message-Id: <20180514092727.28924-1-smtpuser@allied-telesis.co.jp>
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

The flash erase error is caued on the Macronix flash device below.
  MX29GL512FHT2I-11G
Also it has been just confirmed to be able to reproduce.
And the retry function can resolved the flash erase error correctly.

The v5 patch series ware not sent by using git send-email.
Also the cover letter of previous resend patch series did not include the mailing list address.
So let me resend again the v5 patch series.

This patch has be sent by git-send-email.
But for our company mail system the sender mail address is needed to be set as smtpuser <smtpuser at allied-telesis.co.jp>.
So do not reply to the email address smtpuser <smtpuser at allied-telesis.co.jp>.
But please reply to my email address Tokunori Ikegami <ikegami at allied-telesis.co.jp> if any comment or problem.
Sorry for inconvenient about this.
I am asking to our IS department to resolve this issue.

Cc: linux-mtd@lists.infradead.org

Tokunori Ikegami (2):
  mtd: cfi_cmdset_0002: Change definition naming to retry write 
    operation
  mtd: cfi_cmdset_0002: Change erase functions to retry for error

 drivers/mtd/chips/cfi_cmdset_0002.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.16.1
