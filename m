Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JdU1x-00041Q-Hh
	for linux-mtd@lists.infradead.org; Sun, 23 Mar 2008 17:30:49 +0000
Date: Sun, 23 Mar 2008 18:30:18 +0100
From: Sebastian Siewior <bigeasy@tglx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND] [MTD] [NAND] add out label in rfc_from4
Message-ID: <20080323173018.GA24462@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Mundt <lethal@linux-sh.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This has been forgotten in commit f5bbdacc419 and nobody
compiled the driver.

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/rtc_from4.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index 9189ec8..0f6ac25 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -460,7 +460,7 @@ static int rtc_from4_errstat(struct mtd_info *mtd, struct nand_chip *this,
 			er_stat |= 1 << 1;
 		kfree(buf);
 	}
-
+out:
 	rtn = status;
 	if (er_stat == 0) {	/* if ECC is available   */
 		rtn = (status & ~NAND_STATUS_FAIL);	/*   clear the error bit */
-- 
1.5.4.3
