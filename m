Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JPyd9-0005va-7k
	for linux-mtd@lists.infradead.org; Fri, 15 Feb 2008 11:21:29 +0000
Date: Fri, 15 Feb 2008 12:21:10 +0100
From: Sebastian Siewior <bigeasy@tglx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [NAND] add out label in rfc_from4
Message-ID: <20080215112110.GA32528@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: tglx@linutronix.de, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This has been probably forgotten in commit f5bbdacc419.

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
I hope that is the right fix.

 drivers/mtd/nand/rtc_from4.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index 47429b0..ace1915 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -461,6 +461,7 @@ static int rtc_from4_errstat(struct mtd_info *mtd, struct nand_chip *this,
 		kfree(buf);
 	}
 
+out:
 	rtn = status;
 	if (er_stat == 0) {	/* if ECC is available   */
 		rtn = (status & ~NAND_STATUS_FAIL);	/*   clear the error bit */
-- 
1.5.3.5
