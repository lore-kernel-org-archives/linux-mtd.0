Received: from rs1.rw-gmbh.net ([213.239.201.58])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PYDuO-0007iZ-W2
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2010 08:30:53 +0000
Received: from pd951a5d2.dip0.t-ipconnect.de ([217.81.165.210]
	helo=[192.168.178.24])
	by rs1.rw-gmbh.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ralf.roesch@rw-gmbh.de>)
	id 1PYDuK-0000eW-Hx
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2010 09:30:48 +0100
Message-ID: <4D1C4338.2030003@rw-gmbh.de>
Date: Thu, 30 Dec 2010 09:30:48 +0100
From: =?UTF-8?B?UmFsZiBSw7ZzY2g=?= <ralf.roesch@rw-gmbh.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: fix for printing NAND model
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ralf Roesch <ralf.roesch@rw-gmbh.de>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1f75a1b..f29183a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3157,7 +3157,7 @@ ident_done:
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
 		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
 		nand_manuf_ids[maf_idx].name,
-	chip->onfi_version ? type->name : chip->onfi_params.model);
+	chip->onfi_version ? chip->onfi_params.model : type->name);
  	return type;
 }
-- 
1.7.2.3
