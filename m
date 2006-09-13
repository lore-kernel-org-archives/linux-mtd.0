Received: from roc.holo.8d.com ([64.254.227.115])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GNV1v-0001Pw-5X
	for linux-mtd@lists.infradead.org; Wed, 13 Sep 2006 14:43:55 +0100
Received: from trivia.8d.com ([209.47.172.20] helo=[192.168.142.55])
	by roc.holo.8d.com with esmtp (Exim 4.50) id 1GNUB2-0002pi-I0
	for linux-mtd@lists.infradead.org; Wed, 13 Sep 2006 08:49:20 -0400
Message-ID: <4507FE99.3030106@8d.com>
Date: Wed, 13 Sep 2006 08:50:33 -0400
From: Raphael Assenat <raph@8d.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] cmx270-nand: Make CMDLINE_PARTS usable
Content-Type: multipart/mixed; boundary="------------000803070809050403080607"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000803070809050403080607
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch gives a name to the cmx270 nand mtd, making it possible to use command line
partitioning.

eg:
mtdparts=cmx270-nand:32m(root),8m(data),-(spare)"

does not work without this patch. The default (one full device partition)
hardcoded in the driver is used.


Signed-off-by: Raphael Assenat <raph@8d.com>

--------------000803070809050403080607
Content-Type: text/plain;
 name="cmx270-nand-cmdlinepart.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cmx270-nand-cmdlinepart.diff"

This patch gives a name to the cmx270 nand mtd, making it possible to use command line
partitioning. 

eg:
mtdparts=cmx270-nand:32m(root),8m(data),-(spare)"

does not work without this patch. The default (one full device partition)
hardcoded in the driver is used.


Signed-off-by: Raphael Assenat <raph@8d.com>

--- linux-2.6.18-rc2-8d-unionfs/drivers/mtd/nand/cmx270-nand.c	2006-08-17 15:32:02.000000000 -0400
+++ linux-2.6.18-rc2-8d2/drivers/mtd/nand/cmx270-nand.c	2006-09-05 10:23:16.000000000 -0400
@@ -218,6 +218,7 @@
 		goto err2;
 	}
 
+	cmx270_nand_mtd->name = "cmx270-nand";
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	mtd_parts_nb = parse_mtd_partitions(cmx270_nand_mtd, part_probes,
 					    &mtd_parts, 0);

--------------000803070809050403080607--
