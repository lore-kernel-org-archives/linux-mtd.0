Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2B8E7E635
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 13:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7iMm9JLGKQ47Z56pSXAYqp6vr7WlMOuOhgC72VZFCPQ=; b=NYzgihcA3nF6vt
	J4gPrcwY3G93KkMegkoyRC9yuma9TMIyC0MRqjUgp/msMnLfG8Z3+ukBPmtOMSYz66+PNV7NOXcIL
	VNZFOs4fGxY7o2YTmvDxgJnS1mW3rfsASjlMUHzFgTmORVRdIibua7GPxewjc9s3VB16ONlWA/5IC
	FTWygIqror2DHW9t+Gftpy8nuhoQHN1a8TVay8O/T9j3Lv69t+fdryvYXjZMJHfoDRkwS3ic6GPRo
	43gHw/0e6PCPl5IOAF7BVBhUvRRLIbS01QsXf07Wfi0x56WlqXkbQ18rOgLc3dAZN+06FvwaUAf/X
	g+W2En8XgxJsD+08OZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7wv-00GS9b-1I;
	Tue, 26 Sep 2023 13:18:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7ws-00GS8f-09;
	Tue, 26 Sep 2023 13:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695734277; x=1727270277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dlh3dXQftHY/1ZVP5UFfcPDTvFrZfh14Xuy9dWmFSS0=;
  b=B6HLK+5NT2UsI7Ppg2uluF2PicyawtIgx3b8C3UMiw5szai+0BaFwTPV
   AJLCzVCICxemswgjiqZAuYlLdxELITwlilupQnncWWyMCWZ9J6BXjRSPe
   Nk/PnzPt0DK/yGLJfhDLg/VcS1czjo2p7agurFqK+DEr7nrK43otuDw++
   bwL8h6ssxvt1ihm+JXV5/g/6ds5T3GuNhuVryXJG1h6BtMYiiGV/14knX
   9lzbWV2rbLDibB80sgp1SI9we6uFq4crykE5y12hddwMoecid+tY63AI+
   CPrg593JaXtfGHOuQxYDlz9IHiHL9U4DFM1rODj8yB6nEcskvo8o8JJtu
   A==;
X-CSE-ConnectionGUID: qv2bLBQUQDS1+ybmYDf9uQ==
X-CSE-MsgGUID: FZx5G028Q867FAN1S4AGaQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="6518420"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Sep 2023 06:17:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 26 Sep 2023 06:17:28 -0700
Received: from ROU-LT-M43238L.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 26 Sep 2023 06:17:27 -0700
From: <nicolas.ferre@microchip.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>,
	<linux-mtd@lists.infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v2] mtd: spi-nor: atmel: add at25ff321a entry
Date: Tue, 26 Sep 2023 15:16:55 +0200
Message-ID: <20230926131655.51224-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_061758_147546_3F3658C1 
X-CRM114-Status: GOOD (  15.64  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Add the at25ff321a 4MB SPI flash which is able to provide
SFDP informations.
Datasheet: https://www.renesas.com/us/en/document/dst/at25ff321a-datasheet

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
v1 -> v2: - adapt to new struct flash_info atmel_nor_parts init
	  - don't set the no_sfdp_flags property

Hi,

This flash is present on the MikoE flash 10 Click board and was tested on
sama7g5-ek at spi frequency of 80 MHz:

Here are the tests that I ran:
root@sama5d27-wlsom1-ek-sd:~# dd if=/dev/urandom of=./spi_test bs=1M count=3
3+0 records in
3+0 records out
3145728 bytes (3.1 MB, 3.0 MiB) copied, 0.285407 s, 11.0 MB/s
root@sama5d27-wlsom1-ek-sd:~# mtd_debug write /dev/mtd0 0 3145728 spi_test
Copied 3145728 bytes from spi_test to address 0x00000000 in flash
root@sama5d27-wlsom1-ek-sd:~# mtd_debug erase /dev/mtd0 0 3145728
Erased 3145728 bytes from address 0x00000000 in flash
root@sama5d27-wlsom1-ek-sd:~# mtd_debug read /dev/mtd0 0 3145728 spi_read
Copied 3145728 bytes from address 0x00000000 in flash to spi_read
root@sama5d27-wlsom1-ek-sd:~# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0300000
root@sama5d27-wlsom1-ek-sd:~# mtd_debug write /dev/mtd0 0 3145728 spi_test
Copied 3145728 bytes from spi_test to address 0x00000000 in flash
root@sama5d27-wlsom1-ek-sd:~# mtd_debug read /dev/mtd0 0 3145728 spi_read
Copied 3145728 bytes from address 0x00000000 in flash to spi_read
root@sama5d27-wlsom1-ek-sd:~# sha1sum spi_test spi_read
4de5dbe39ab24b169e9dad01a8cc12c4756270a2  spi_test
4de5dbe39ab24b169e9dad01a8cc12c4756270a2  spi_read

root@sama5d27-wlsom1-ek-sd:~# cat /sys/bus/spi/devices/spi0.1/spi-nor/partname
at25ff321a
root@sama5d27-wlsom1-ek-sd:~# cat /sys/bus/spi/devices/spi0.1/spi-nor/jedec_id
1f4708
root@sama5d27-wlsom1-ek-sd:~# cat /sys/bus/spi/devices/spi0.1/spi-nor/manufacturer
atmel
root@sama5d27-wlsom1-ek-sd:~# hexdump -C /sys/bus/spi/devices/spi0.1/spi-nor/sfdp
00000000  53 46 44 50 06 01 00 ff  00 06 01 10 10 00 00 ff  |SFDP............|
00000010  e5 20 e1 ff ff ff ff 01  40 eb 08 6b 08 3b 00 ff  |. ......@..k.;..|
00000020  ee ff ff ff ff ff 00 ff  ff ff 00 ff 0c 20 0f 52  |............. .R|
00000030  10 d8 00 ff 50 2a 2a 01  82 ff 9c d2 64 c1 08 46  |....P**.....d..F|
00000040  7a 75 7a 75 f7 c4 d5 5c  00 06 51 ff 88 30 00 00  |zuzu...\..Q..0..|
00000050
root@sama5d27-wlsom1-ek-sd:~# md5sum /sys/bus/spi/devices/spi0.1/spi-nor/sfdp
d540f07cbfb7c9c19654c453b561b311  /sys/bus/spi/devices/spi0.1/spi-nor/sfdp

# # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
root@sama5d27-wlsom1-ek-sd:~# mtdinfo /dev/mtd0
mtd0
Name:                           spi0.1
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          64 (4194304 bytes, 4.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true

Best regards,
  Nicolas

 drivers/mtd/spi-nor/atmel.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 95f0e139284e..e13b8d2dd50a 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -213,6 +213,11 @@ static const struct flash_info atmel_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x47, 0x08),
+		.name = "at25ff321a",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x48, 0x00),
 		.name = "at25df641",
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
