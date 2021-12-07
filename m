Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4466BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQaK8yOMO73M2hr5KhStY9LKtkd1rCPc1pDFiYzgU9Y=; b=xsbetCzWqi9z3D
	+xaDVkO8oRuA69TTw1uM9gnPM34xahy6bw3pwCaxnpccOiYtUlARgFmCJNrB1cFXv7OFHEvZ0P2Qi
	7GT8I0PseOPwCsBDWd4Kof1PKNRSLYBhFk5umFY9bO5xuhmAktkowQQ6FocgtJThsqo+pTp5MiL56
	xWoFmKe1TZcxtiiM6LSKrKKjP4IDhVz4FqhEIWhWjjU9NGWd5V3AlmFRI6KYsCjcb3cnaexN7WqVY
	Xvp6t+oBowexGoEkZC0l72VNA389Gkvsp3oXXs8Xnhh9SEGSQ1sd0ddLckHUOSdWSOaztLI5JgJ2L
	CkukVZwn3jPCzHM1OO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubgj-008zPJ-GS; Tue, 07 Dec 2021 14:43:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub4t-008pOv-Rj; Tue, 07 Dec 2021 14:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885859; x=1670421859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TSuyxCLlRv2UfyTIFzJk7vAO2ci0ZWPes/2YwpOBPqM=;
 b=fQJUUQRKAoc2/izDRnteZ2clHdYnf8HRWlIRlaeUsTX+hSVGmT0LJkiu
 pEd6+dD4tjSmxqPXRvSj/Rz9ikn6KbDEp9DP73wBAwCuKKq7b4pKhP3fz
 WAH1Gdy7qG6KxiADx++KlxP5oEzjP4voB7mi0QmzdiXleVDi5+OxLvEr5
 RoZ9PPuBfxFOS7f19qB6sQ1+/qFysqb09arDLQi8SNlMpMizRe8Alai1Q
 zwYomQDFoS38HZqoy+J5PQuGOXSASL76WEK/gCPeNxqrUNwf3F2t5A9vB
 dDvnIei9WNIWRhJgKZ/r1+0HGr0dHzN9wb3D3Zr+9fuOZ9iWv7sDuZaDL g==;
IronPort-SDR: nAHnF6L/Z+UqkYCiKESvszPTyYgD9p1CBwbIkEdR3XTymMorxV7l55UIt03eEuRyxrOCQWeGRm
 D1RbTYgbwEe5ACqHnX7C6FdCjniU4IyZfPQgPktsNq1aeGNkut5XGzWCjmI4cfIIUl8QuULNgd
 kXpU4x95A6MNKG8+oILM4u2dChUxmc2JnB1d4GDOm80nZJi5j3Me7WSC5Qk18U1gD7OP7nA6/2
 7NsCecWms6eH2trQ6/2ZehvJjkNtgLpHgkmwKNTxZwbxTVXjtp6JwptEx7XFj8SqB/cbc2ynVl
 PXi87qxZM5lAfaanyoEeXvii
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="141566333"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:04:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:04:12 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:04:07 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 14/14] mtd: spi-nor: issi: is25lp256: Init flash based on
 SFDP
Date: Tue, 7 Dec 2021 16:02:54 +0200
Message-ID: <20211207140254.87681-15-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060420_009878_A51C4A0E 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_4B 0x12.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
9d6019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
issi
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
is25lp256
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sfdp-is25lp256

xxd -p sfdp-is25lp256
53464450060101ff00060110300000ff9d05010380000002ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0f44eb086b
083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
11cecccd68467a757a75f7aed55c4a422cfff030f2a9ffffffffffffffff
ffffffffffffffff003600239ef9c0648fefffff

sha1sum sfdp-is25lp256
98d61eb4691e61521b84b83e1ddb8132cae2fea5  sfdp-is25lp256

 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 6707fcfda055..c4fff3c36356 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -46,7 +46,7 @@ static const struct flash_info issi_parts[] = {
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
