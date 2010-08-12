Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjNUE-0000yR-8C
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 02:25:42 +0000
Date: Thu, 12 Aug 2010 10:23:14 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 2/5]nand/denali: change read_status function method
Message-ID: <20100812022314.GB25657@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


=46rom 8b09365e8e58ea0d18fe0ce03b20531c98d43a7a Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Wed, 11 Aug 2010 17:14:59 +0800
Subject: [PATCH 2/5] nand/denali: change read_status function method

In mtd->write, Denali controller will use MODE_11 mode to read
NAND flash status, then return back to MODE_1O mode to do page
write.
Here comes a bug for this kind of using, sometimes controller will
not write data to NAND and just return a good interrupt to tell
driver writing work is done. The data in this page is all 0xff and
this page can not be written again. The reason is unknow.

So read Denali controller register WRITE_PROTECT to get NAND status
instead.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3ba8952..975a893 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -169,13 +169,11 @@ static void read_status(struct denali_nand_info *dena=
li)
 	/* initialize the data buffer to store status */
 	reset_buf(denali);
=20
-	/* initiate a device status read */
-	cmd =3D MODE_11 | BANK(denali->flash_bank);
-	index_addr(denali, cmd | COMMAND_CYCLE, 0x70);
-	iowrite32(cmd | STATUS_CYCLE, denali->flash_mem);
-
-	/* update buffer with status value */
-	write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));
+	cmd =3D ioread32(denali->flash_reg + WRITE_PROTECT);
+	if (cmd)
+		write_byte_to_buf(denali, NAND_STATUS_WP);
+	else
+		write_byte_to_buf(denali, 0);
 }
=20
 /* resets a specific device connected to the core */
--=20
1.6.6.1
