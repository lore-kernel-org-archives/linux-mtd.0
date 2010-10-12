Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=AM1EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5cMo-00034e-6T
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 10:45:59 +0000
Received: from mail14-am1 (localhost.localdomain [127.0.0.1])	by
	mail14-am1-R.bigfish.com (Postfix) with ESMTP id 8764D103029E	for
	<linux-mtd@lists.infradead.org>; Tue, 12 Oct 2010 10:45:55 +0000 (UTC)
Received: from am1ehsmhs008.bigfish.com (unknown [10.3.201.252])	by
	mail14-am1.bigfish.com (Postfix) with ESMTP id 5CC971858050	for
	<linux-mtd@lists.infradead.org>; Tue, 12 Oct 2010 10:45:55 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by de01egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o9CAjrbq003027	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 03:45:53 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o9CAjiG2025881	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 05:45:52 -0500 (CDT)
From: Mingkai Hu <Mingkai.hu@freescale.com>
To: <linuxppc-dev@ozlabs.org>, <spi-devel-general@lists.sourceforge.net>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v4 5/5] mtd: m25p80: add support to parse the partitions by OF
	node
Date: Tue, 12 Oct 2010 18:18:34 +0800
Message-ID: <1286878714-13090-6-git-send-email-Mingkai.hu@freescale.com>
In-Reply-To: <1286878714-13090-5-git-send-email-Mingkai.hu@freescale.com>
References: <1286878714-13090-1-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-2-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-3-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-4-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-5-git-send-email-Mingkai.hu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: grant.likely@secretlab.ca, david-b@pacbell.net, kumar.gala@freescale.com,
	tie-fei.zang@freescale.com, Mingkai Hu <Mingkai.hu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mingkai Hu <Mingkai.hu@freescale.com>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
v4:
 - Updated to latest kernel base(Linux 2.6.36-rc7).
 - Made changes according to Grant's comments.

 drivers/mtd/devices/m25p80.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6f512b5..9d20738 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -924,6 +924,11 @@ static int __devinit m25p_probe(struct spi_device *spi)
 			nr_parts = data->nr_parts;
 		}
 
+		if (nr_parts <= 0 && spi->dev.of_node) {
+			nr_parts = of_mtd_parse_partitions(&spi->dev,
+					spi->dev.of_node, &parts);
+		}
+
 		if (nr_parts > 0) {
 			for (i = 0; i < nr_parts; i++) {
 				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-- 
1.6.4
