Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRgt-0002eQ-2i
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:33:19 +0000
Received: by wwi18 with SMTP id 18so5012752wwi.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:33:17 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 6/6] mtd/denali: support for cmdline partitioning
Date: Fri,  3 Jun 2011 11:32:49 +0100
Message-Id: <1307097169-11744-7-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for command line partitioning.  This is favoured over
platform data based partitions.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e24e214..c48f5dd 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1419,6 +1419,9 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	unsigned long csr_len, mem_len;
 	struct denali_nand_info *denali;
 	struct denali_nand_pdata *pdata;
+	struct mtd_partition *partitions = NULL;
+	int nr_parts = 0;
+	const char *part_probes[] = { "cmdlinepart", NULL };
 
 	denali = kzalloc(sizeof(*denali), GFP_KERNEL);
 	if (!denali)
@@ -1644,7 +1647,11 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_req_irq;
 	}
 
-	if (pdata && pdata->parts)
+	nr_parts = parse_mtd_partitions(&denali->mtd, part_probes,
+					&partitions, 0);
+	if (partitions && nr_parts > 0)
+		ret = mtd_device_register(&denali->mtd, partitions, nr_parts);
+	else if (pdata && pdata->parts)
 		ret = mtd_device_register(&denali->mtd, pdata->parts,
 					 pdata->nr_parts);
 	else
-- 
1.7.4.1
