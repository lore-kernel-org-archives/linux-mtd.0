Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58590C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:21:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A48460E78
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A48460E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKnQ7WR0wvHZmSYbdwPJqWztAWATMAt8DFG4Njahiu8=; b=3on+06Wr1LBsH6
	cTwkWJ1vvW+IgTbxrgSw7d52NgOJilYdLK7k6RCtuXYj57JzFH/S6sHxdjbHysNa/iUCE1Rn8/ezX
	qnJFHP2N7eBTDfeEgRtGEU+NA9tjxyZeb+PDcP0cqqJiQdWMSdNJAU24k6SLKPNXfk3qkmKRPXG9C
	TggsopSlr1a30H2C7bLeN1GQicqZ1o501CRt8Kzjv8arTdau7OHt7QzaKH7IRQvH3LmE6ROMpce9y
	whPLXzKTvSV6FoXvGZDw0VeZ78JXZo+k2AbCmzX7ghR8PusKxVnXjK0hL2DoN/1y2b4NDRbtt4Frf
	X5ge+IW01BQHCxEweNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPMt-00DHmY-9M; Sat, 06 Nov 2021 17:20:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjOqL-00D8Wm-2y; Sat, 06 Nov 2021 16:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636217221; x=1667753221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7WC/6AIf7kpjW4K6MtgfW1wAut2wuysvB6DA25RiLws=;
 b=IxEbxnBqImXGWTiBmq3ZU+xx5JyXRZVARhNuWNQlFQzjbzqvTZpmz7rT
 XTh+lpdooiq4ooABUfh7NqVGpzsPrYYmHtHlLaqBoFCrRWR6fIc5Ng0lo
 +nIQqUpdzjqNvYIi4sBiXyyB52YE1Ev8uakuHVvdsn8Da4EPwH5A9BL4/
 tHylQ/38M1v1+hsq9d24d1l8xmEa3yXebLBCR5a0GyBc3zZ6IQF/FrHQ2
 Z8MVXx/IgidapuIPNaRRJ5T8o/TgWRx1hf65QdLXON81XBGpVxulpSLvI
 NfNk6F9okcdZiCCA1ppDWdtZy8p3EAlRKbsLlEvl1TIQr43f3MmNDb2tl Q==;
IronPort-SDR: 8kXqtvcNsbV4cRSo8ylO8NYXeGLvkZ1SDsNobzkiJ2s0fvwbIYZ0hubdKNXMNrQuoI8R5fkCpa
 yijK6Zv7jMCzVmY2p+XsaG/XgDlMXqTIqUA7l24iYun5R9Ofct5cXTeuoOACnGXiq9GZ/YyOBW
 On8X+kD3pFEEAVurG+PI8sPxXWqfCiTOuhTTIT7OCfm0Z1XAn8db1hXejHnQz94tbdo5H29qEj
 9kgcK6Ru1Lyzj4+HgXspO6ijG5LEZOotSSq3IqMutMmEykz2hN7z9HWP4mDG/pSMzM7YswTTrd
 VTuWfgDmLoQuc/3gMRS+oHDb
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="150948757"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 04:37:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 04:37:13 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 04:37:08 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 2/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Date: Sat, 6 Nov 2021 13:36:53 +0200
Message-ID: <20211106113657.172690-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106113657.172690-1-tudor.ambarus@microchip.com>
References: <20211106113657.172690-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_094701_191420_FE324C31 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Macronix has a bad habbit of reusing flash IDs. While MX25L3233F supports
RDSFDP opcode, MX25L3205D does not support it and does not recommend
issuing opcodes that are not supported ("It is not recommended to adopt
any other code not in the command definition table, which will potentially
enter the hidden mode.").

We tested the RDSFDP on the MX25L3205D and the conclusion is that the
flash didn't reply anything. Given that it is unlikely that RDSFDP will
cause any problems for the old MX25L3205D, differentiate between the two
flashes by parsing SFDP.

Tested MX25L3233F. Generated a 256 Kbyte random data and did an erase,
write, read back and compare test. The flash uses for reads
SPINOR_OP_READ_1_4_4 0xeb, for erases SPINOR_OP_BE_4K 0x20, and for writes
SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
#  cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c22016
# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
macronix
# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
mx25l3233f
# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > mx25l3233f-sfdp


# xxd -p mx25l3233f-sfdp
53464450000101ff00000109300000ffc2000104600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0144eb086b
083b04bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
ffffffffffff003650269cf97764fecfffffffffffff

# sha1sum mx25l3233f-sfdp 
1b6e0f75b4a6d08d570082992455affa72b2dc81  mx25l3233f-sfdp

 drivers/mtd/spi-nor/macronix.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ffd702ec8f50..58b6cd9b194c 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,24 @@
 
 #include "core.h"
 
+static int mx25l3205d_post_bfpt_fixups(struct spi_nor *nor,
+				const struct sfdp_parameter_header *bfpt_header,
+				const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Macronix has a bad habit of reusing flash IDs: MX25L3233F collides
+	 * with MX25L3205D. MX25L3233F defines SFDP tables, while the older
+	 * variant does not.
+	 */
+	nor->name = "mx25l3233f";
+
+	return 0;
+}
+
+static const struct spi_nor_fixups mx25l3205d_fixups = {
+	.post_bfpt = mx25l3205d_post_bfpt_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -39,7 +57,10 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SPI_NOR_PARSE_SFDP |
+			      SECT_4K)
+		/* ID collision with mx25l3233f. */
+		.fixups = &mx25l3205d_fixups },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
