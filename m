Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C0DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KAMP3zoDiBrynJFA9XOxzk0hQxCLrRSF1HSCwgrBzc=; b=u5TGyn8GsUw6eD
	YnGTJ+l0aynOYb3IfJ9ftYCIOkgewUzQsS9uoZ06PewB4Xwsn+NTSrAbL9dKJIJIqXJwM7fmpAFNW
	lzO+M6AfjTvLKa6oNqFtO++j2puuEaZel9v8RNJhPyY2N1IzWQTE7aXcsLLfFkUFbErCkqhUfkghw
	3kdTb4+srh9JOmFciDKaGE/sVBsxwCaSWgORGAR2XeViQ+r8FP3aPU3/V+ajBGGegv04PCB4w6ckX
	NXugyVLT0BlSB3vB/q3bjb6k/SFvaTWg9Wr2yn9D5b5ALsAwqpLq/8V6uZirJVZUqeTIkVcZ1ij8c
	+2QGt1ihXo1IvDwQ5DFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgMm-00CfFl-T5; Mon, 28 Feb 2022 13:47:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgL8-00Cec7-M7; Mon, 28 Feb 2022 13:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646055926; x=1677591926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O51lybEN0s6N++OrOWdENx455gBXcB/cLNp+s4cJKHQ=;
 b=nqQgwV3gEqiEMUA4JcxmZ7gFQs88aWtx1EdFsFwvrIHSgTM5bGGrFjw8
 KyPIdJ9xRqVnLmZ8RuVSBjGauknBBVWqY9KrA03jN7lC14NKStO5aRgA9
 ahr5SqGnsDENgESJ765WR+9gnDae/8DlFD8IwfvNXku/uqlHwHurXbn//
 mYI3t5frSBenwTOnXTk1arOiwcoveM6Lpw+rxSqyteSCzoDdOW+sHxQLO
 EmNi83fX4OQ/AZVG+ytx+XZhVAynt6B9Pqmb/5x91HFaLcSqf9YvoRmiv
 jGzCyr93oKMw5N2MqPV+BOkuoVny97f8lQjm2eUZ1IcbHFc4B0Qd9f9aQ A==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="163872939"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 06:45:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 06:45:25 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 06:45:21 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <esben@geanix.com>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>
CC: <vigneshr@ti.com>, <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Date: Mon, 28 Feb 2022 15:45:02 +0200
Message-ID: <20220228134505.203270-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228134505.203270-1-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054526_760796_1BE8B2E0 
X-CRM114-Status: GOOD (  12.07  )
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
index d81a4cb2812b..2754bbef3d2e 100644
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
@@ -44,7 +62,10 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		/* ID collision with mx25l3233f. */
+		PARSE_SFDP
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &mx25l3205d_fixups },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
