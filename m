Received: from mail.lysator.liu.se ([130.236.254.3])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M2WCe-0003hW-0A
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 19:57:58 +0000
From: Magnus Lilja <lilja.magnus@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MXC_NAND: Add correct dev_id parameter to free_irq() calls.
Date: Fri,  8 May 2009 21:57:47 +0200
Message-Id: <17fbadcd7f353348afa4c56f92e0423c5b9708df.1241812369.git.lilja.magnus@gmail.com>
Cc: s.hauer@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make sure to pass the same dev_id data to free_irq() that was
used when calling request_irq(), otherwise we get a warning about
freeing an already free IRQ.

Signed-off-by: Magnus Lilja <lilja.magnus@gmail.com>
---

For -rc perhaps?

Got the following warning prior to fixing this:
WARNING: at /opt/git/linux-2.6/kernel/irq/manage.c:736 __free_irq+0x88/
0x1ac()
Trying to free already-free IRQ 33
Modules linked in: mxc_nand(-)
[<c0025660>] (unwind_backtrace+0x0/0xd4) from [<c0036860>] (warn_slowpath+0x68/0
x8c)
[<c0036860>] (warn_slowpath+0x68/0x8c) from [<c0060324>] (__free_irq+0x88/0x1ac)
[<c0060324>] (__free_irq+0x88/0x1ac) from [<c0060454>] (free_irq+0xc/0x18)
[<c0060454>] (free_irq+0xc/0x18) from [<bf000c24>] (mxcnd_remove+0x30/0x48 [mxc_
nand])
unwind: Index not found bf000c24

 drivers/mtd/nand/mxc_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index f3548d0..8a93913 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -981,7 +981,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	return 0;
 
 escan:
-	free_irq(host->irq, NULL);
+	free_irq(host->irq, host);
 eirq:
 	iounmap(host->regs);
 eres:
@@ -1001,7 +1001,7 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	nand_release(&host->mtd);
-	free_irq(host->irq, NULL);
+	free_irq(host->irq, host);
 	iounmap(host->regs);
 	kfree(host);
 
-- 
1.5.6
