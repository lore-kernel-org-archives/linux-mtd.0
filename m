Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072B6C54EE9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Sep 2022 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rfJSrDU2aSVSNgAvPLEn8MJuZA4MJ2EgDOaaYdTGr94=; b=4LA53duM1OW2kr
	1EPEyHKhlCmarO7FU+iSY7aXq0qsPYRcb0N7WTIV2is1Hs9efTeBoeAMmtkBayLGvvxubZe2uNwOP
	IU5Zp7rhpWqnpn/V3lWpJrsDmKNK1K8Qxm32Pip/lYpDO/aO0HaMYISzQ454rCGOl7rpZUtXDo+OC
	3gxK4NYdjIMP0uqLlU28gfn/mUgVEXKsVpRzaVlOGBvBJaX3/Ec/5/+Ov5KK93WnRFfJ/d703jHWo
	g5Cf/bOpxzxMatqyYLq+1Vr9LLCknqGMB5aBZoziHEnxwTCg5OyRoFjOoDKF7J0z/Y+0VTA5iY1Y0
	vUW2OHbcYwiQqC1Jyeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6cZ-00AzX7-GK; Fri, 16 Sep 2022 08:22:47 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6cK-00AzNx-1I
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2022 08:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663316551; x=1694852551;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D/i/1Al2xe3YtNErK1BStvXExvCKvkVYhTtFeQyc+g8=;
  b=Zpz3W5+6M2HWqcrhNzRvTEoelMYCIxy5figl+6ixcVvzcoRAeGM0cNPG
   k/q206VLhI40JHePHKje8W3uNcd5sgzKyOQXz4i4tB4aYbpE1dLq1QwS3
   Qc7lIETkEIrbgo6WtPbNVIa9tVQFY6eU8BLMt/HqBY1xQXq/5asanrZAi
   N1+3IX5TC4+1bN1NBNN3HC4jMV+zuRdsxFXKKsAhP2Dn0PohmvzKBAOPl
   umfecGtWGR0qNHMAb8Kv74SuhZmsqcScyVdFslmmcRB3pqmIb0GFRRm5y
   EXhDRNdKSk1VHRUYUwjaKC1bDA/X6rs/x/uRDUUdFb3G0o1BjbX6ZaggW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="385233188"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="385233188"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 01:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="617592748"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.116])
  by orsmga002.jf.intel.com with ESMTP; 16 Sep 2022 01:22:26 -0700
From: niravkumar.l.rabara@intel.com
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	niravkumar.l.rabara@intel.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx66u1g45g
Date: Fri, 16 Sep 2022 16:22:15 +0800
Message-Id: <20220916082215.883184-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_012232_159473_1ED66EFE 
X-CRM114-Status: GOOD (  12.03  )
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
root@n5x:~# ls -al /sys/devices/platform/soc/
driver/                      ffd00200.watchdog/
driver_override              ffd10000.clock-controller/
f8011100.sdr/                ffd11000.rstmgr/
f87f8000.memory-controller/  ffd12000.sysmgr/
ff800000.ethernet/           ffda0000.dma-controller/
ff808000.mmc/                ffe00000.sram/
ff8d2000.spi/                modalias
ffb00000.usb/                of_node/
ffc02000.serial/             power/
ffc03000.timer0/             soc:base_fpga_region/
ffc03100.timer1/             soc:eccmgr/
ffd00000.timer2/             subsystem/
ffd00100.timer3/             uevent
root@n5x:~# ls -al /sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor/
drwxr-xr-x    2 root     root             0 Dec 16 17:27 .
drwxr-xr-x    6 root     root             0 Dec 16 17:25 ..
-r--r--r--    1 root     root          4096 Dec 16 17:27 jedec_id
-r--r--r--    1 root     root          4096 Dec 16 17:27 manufacturer
-r--r--r--    1 root     root          4096 Dec 16 17:27 partname
-r--r--r--    1 root     root             0 Dec 16 17:27 sfdp
root@n5x:~# cat  /sys/devices/platform/soc/ff8d2000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
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
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..723efe4ca57e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -97,6 +97,9 @@ static const struct flash_info macronix_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
