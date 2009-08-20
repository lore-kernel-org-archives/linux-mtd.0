Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Me7DV-0002rq-SC
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 12:58:10 +0000
Date: Thu, 20 Aug 2009 14:57:34 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Linux MTD list <linux-mtd@lists.infradead.org>
Subject: MXC nand controller performance
Message-ID: <20090820125734.GI23444@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>,
	Magnus Lilja <lilja.magnus@gmail.com>,
	Eric Benard <ebenard@eukrea.com>, Daniel Mack <daniel@caiaq.de>,
	Alberto Panizzo <maramaopercheseimorto@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Hi recently found out that on my i.MX27 board the mxc nand controller
performance nearly doubles when I disable interrupts. Can anybody
confirm this behaviour, possibly on other i.MXs?
I'm trying to figure out what to do. We could disable interrupts
completely in which case the driver would become simpler. Maybe using
polling mode has other impacts on other workloads, so maybe we want to
add a flag to platform_data instead of disabling interrupts completely.

You can use the following patch to disable interrupts. It is not meant
for inclusion in this form of course.

Sascha


>From ae3909b90667a13f7bbd6a042b6b65ea7c74ee48 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 20 Aug 2009 14:52:32 +0200
Subject: [PATCH] mxc_nand: disable interrupts

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 76beea4..bcc5929 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -175,6 +175,8 @@ static void wait_op_done(struct mxc_nand_host *host, int max_retries,
 {
 	uint32_t tmp;
 
+	useirq = 0;
+
 	if (useirq) {
 		if ((readw(host->regs + NFC_CONFIG2) & NFC_INT) == 0) {
 
-- 
1.6.3.3

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
