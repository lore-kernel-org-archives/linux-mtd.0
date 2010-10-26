Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAZb9-0006lR-4X
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 02:49:16 +0000
Received: from mail72-am1 (localhost.localdomain [127.0.0.1])	by
	mail72-am1-R.bigfish.com (Postfix) with ESMTP id A477018601D4	for
	<linux-mtd@lists.infradead.org>; Tue, 26 Oct 2010 02:49:12 +0000 (UTC)
Received: from AM1EHSMHS001.bigfish.com (unknown [10.3.201.244])	by
	mail72-am1.bigfish.com (Postfix) with ESMTP id 10FA712A004C	for
	<linux-mtd@lists.infradead.org>; Tue, 26 Oct 2010 02:49:12 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by de01egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o9Q2n8Je023864	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 19:49:09 -0700 (MST)
Received: from shlinux1.ap.freescale.net (shlinux1.ap.freescale.net
	[10.192.225.216])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o9Q2n775014226	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 21:49:08 -0500 (CDT)
From: Frank Li <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] MTD: Fix MTD_MODE_RAW write fail
Date: Tue, 26 Oct 2010 10:54:20 +0800
Message-ID: <1288061660-23363-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Frank Li <Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdchar have not initilized all field of struct mtd_oob_ops
in mtd_write when mode is MTD_MODE_RAW.

function nand_do_write_ops
	if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
		return -EINVAL;

ooboffs is not initilized at mtd_write.
So random data cause nand_do_write_ops return fail.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/mtd/mtdchar.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index b7ed09c..58839fa 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -319,6 +319,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 		case MTD_MODE_RAW:
 		{
 			struct mtd_oob_ops ops;
+			memset(&ops, 0, sizeof(struct mtd_oob_ops));
 
 			ops.mode = MTD_OOB_RAW;
 			ops.datbuf = kbuf;
-- 
1.7.1
