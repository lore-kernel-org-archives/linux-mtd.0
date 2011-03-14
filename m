Received: from ebb05.tieto.com ([131.207.168.36])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PywnO-00050J-UC
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 01:42:07 +0000
Date: Mon, 14 Mar 2011 09:51:48 +0800
From: Yang Ruirui <ruirui.r.yang@tieto.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
	<Artem.Bityutskiy@nokia.com>, <ext-jani.1.nikula@nokia.com>,
	<ext-phil.2.carmody@nokia.com>, <ruirui.r.yang@tietoenator.com>
Subject: [PATCH 02/02] force module loaded with partitions set
Message-ID: <20110314015148.GA6827@darkstar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Yang Ruirui<ruirui.r.yang@tieto.com>

partitions can not be set after module loaded, the moduel param mode is 0444.

this patch force module loaded with param partitions set, if user does not
set partitions then give out a warning and return -EINVAL

Signed-off-by: Yang Ruirui<ruirui.r.yang@tieto.com>
Tested-by: Shao Yanqing<yanqing.shao@tieto.com>
Tested-by: Xiao Yang<yang.xiao@tieto.com>
---
 drivers/mtd/mtdswap.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- mtd-2.6-fc2ff59.orig/drivers/mtd/mtdswap.c	2011-03-14 09:36:09.283329099 +0800
+++ mtd-2.6-fc2ff59/drivers/mtd/mtdswap.c	2011-03-14 09:46:30.229993534 +0800
@@ -1569,6 +1569,12 @@ static struct mtd_blktrans_ops mtdswap_o
 
 static int __init mtdswap_modinit(void)
 {
+	if (!partitions[0]) {
+		printk(KERN_WARNING
+			"Please load mtdswap with correct partitions param\n");
+		return -EINVAL;
+	}
+
 	return register_mtd_blktrans(&mtdswap_ops);
 }
 
