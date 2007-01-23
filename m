Received: from mtagate2.de.ibm.com ([195.212.29.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H9Q8V-0006E5-Q0
	for linux-mtd@lists.infradead.org; Tue, 23 Jan 2007 18:12:52 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id l0NI2t1m049824
	for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2007 18:02:55 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l0NI2tGF2936832
	for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2007 19:02:55 +0100
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l0NI2svC020647
	for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2007 19:02:54 +0100
From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
Subject: [PATCH] [MTD] UBI: fix argument order of dbg_err() call
To: MTD list <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
Date: Tue, 23 Jan 2007 19:00:13 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <200701231900.13218.lindhors@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[UBI DBG error] (pid:16998) vol_cdev_read: -74 bytes were read, but with error 2048

Signed-off-by: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/cdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 2bbcbba..6ec311a 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -371,7 +371,7 @@ static ssize_t vol_cdev_read(struct file
 			}
 
 			dbg_err("%d bytes were read, but with error %d",
-				 err, read);
+				read, err);
 			count -= read;
 			*offp += read;
 			break;
-- 
1.4.1
