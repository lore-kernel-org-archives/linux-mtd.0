Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D24C54EE9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Sep 2022 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vhgsiz4C/mDX6sIl5i1VR9ZQoOlpFuoa/CwnMaOg5Fs=; b=JfLb8dfzRbcYuN
	1/tTwayRvY9RKsdESu8VGbALcm84w8kEI0MOIF6CI+/+VWZq/cDe10Az08EolOvK2VDt9UHG2l7x3
	EoySliM5UKTA755ZPInNixnxgVmokhdM6f01pyghVBl7Kj4wA1ljZBaYdqZIRFubEMQQCYDh3cKVM
	R2b8d/Jo5y+eGAC2O9i5ObqSG79qglkZ+Nr0DqqCP07sB2aBFCnOJt97fjK8ETklbnDecQkJDOWz8
	fqjAUCK+Xn6JlidvKhYX6QOBOiCeij5I36pn/go3hxQe9SabboEcbbgzBsG/egVaX/VdgjwZJfXtJ
	etafToTaZIN+zSGJ5P9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVop-005PYt-Pu; Sat, 17 Sep 2022 11:17:07 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVom-005PWx-IY
	for linux-mtd@lists.infradead.org; Sat, 17 Sep 2022 11:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663413424; x=1694949424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r5R83j4pOSZlr5q6a2Hps+vq4FBEXptw1GqH09jMVRM=;
  b=XbglassJqY3+XbawYVNXS/wEXorINuLU4qsI9sluuEByNO0hlxFe4Iyv
   xHjTfR9KnZR7omC0MesLgLuBIdaFsks7NzEtB4MdA16sTVgB/5uEEsMQh
   kNTgyyXXCUCdzqTUvT6mI5f1lf+uUiXE9Tox7calJ0TB0egT3pbdN7hmH
   bRGhoF5oN7ovWbsdB5EwJEsE1xQ4Pyzz6Kh9arqmYznTSEPEhUpM8i1oU
   Sd3bURW+tBrwbn99ZMSRFyNAq0+5At7ckYVJ1/AnRgx8jVCAPAbDHU0LU
   Arpo14gA3CxQIOpSuAS+z/S+dG86MsxIg1IzeaU7+D4JqWC9Kzu62QnqE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="286188077"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="286188077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 04:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="743609171"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.116])
  by orsmga004.jf.intel.com with ESMTP; 17 Sep 2022 04:16:59 -0700
From: niravkumar.l.rabara@intel.com
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: macronix: Add support for mx66u1g45g
Date: Sat, 17 Sep 2022 19:16:40 +0800
Message-Id: <20220917111640.977243-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916082215.883184-1-niravkumar.l.rabara@intel.com>
References: <20220916082215.883184-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_041704_760771_9194D1A7 
X-CRM114-Status: GOOD (  12.82  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

The MX66U1G45G is the smaller sibling (128MB) of the MX66U2G45G (256MB)
that is already supported.

Tested on Intel N5X socdk board,
- random data write, erase, read   - verified erase operations
- random data write, read and compare  - verified write/read operations

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
root@n5x:~# find / -iname spi-nor
/sys/kernel/debug/spi-nor
/sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor
/sys/bus/spi/drivers/spi-nor
root@n5x:~# ls -al /sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor/
drwxr-xr-x    2 root     root             0 Dec 16 17:26 .
drwxr-xr-x    6 root     root             0 Dec 16 17:25 ..
-r--r--r--    1 root     root          4096 Dec 16 17:26 jedec_id
-r--r--r--    1 root     root          4096 Dec 16 17:26 manufacturer
-r--r--r--    1 root     root          4096 Dec 16 17:26 partname
-r--r--r--    1 root     root             0 Dec 16 17:26 sfdp
root@n5x:~#  cat  /sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
c2253b
root@n5x:~# cat  /sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
macronix
root@n5x:~# cat  /sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor/partname
mx66u1g45g
root@n5x:~# cat  /sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp > mx66u1g45g-sfdp
root@n5x:~# hexdump mx66u1g45g-sfdp
0000000 4653 5044 0106 ff02 0600 1001 0030 ff00
0000010 00c2 0401 0110 ff00 0084 0201 00c0 ff00
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fffb ffff 3fff eb44 6b08 3b08 bb04
0000040 fffe ffff ffff ff00 ffff eb44 200c 520f
0000050 d810 ff00 4987 00b5 d282 e204 0344 3867
0000060 b030 b030 bdf7 5cd5 9e4a ff29 50f0 85f9
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
00000c0 8f7f ffff 5c21 ffdc ffff ffff ffff ffff
00000d0 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000110 2000 1600 f99d 64c0 cb85 ffff ffff ffff
0000120
---
 drivers/mtd/spi-nor/macronix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..07ace9da74b7 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -97,6 +97,10 @@ static const struct flash_info macronix_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
+		PARSE_SFDP
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
