Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F21C4332F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrO446Qyyk0LkcjCewIt+V5nyNEmSflpgTPf70KiKnA=; b=LTckmmSnyQPfxb
	WqZ78DXLiO5whemQElmY3CQsDZm5fjHO0V4bCfW6l4QSvWLU+Q7JsQW51fJPkBoa+BqC7NOlpagyt
	725kukZFx+BxEZHAqti71WUvcXYuyYSln4OJS/PeJMYWTOObpFoUDcaDyeIsM7v3WyjG8XGe4Vhr7
	7Hg6o2pgsB392aoyv2ee2QeBkWYJRlUVsmpVErvkun17A6xsRL317duLcF9X77yaXthBy1i8PwRHN
	/sVBGiB6Y1paMe/qpK/hinJkpvgGsGoZzkBkcW52AWGtxEdZZC6JgclCRxfzsvTdT0KyGTX3uu3kt
	olrn4K90DAm0F2It34FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubWY-008x2l-AQ; Tue, 07 Dec 2021 14:32:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub4e-008pIJ-98; Tue, 07 Dec 2021 14:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885844; x=1670421844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j1oUSi6jUH1ezDP02vz5Yr2eHAxVjrkiL9uEOegBljI=;
 b=vrpv6s2n5ncg5vdsm3oGGlFK2XRWzQYZ5nqahNoWf2ZMY/mNPy9uo436
 JkgVwV7k50bKNE41zPbAOHZK9EWl5E5a0JYhtFuIgxJc0j98kg8v0xBNt
 +fJ7e/ld5ahisZr3kPL3kBQKeOOKvejTyDEB2zQURkSnvcjXifi1puP+5
 n56g2DJ4HQR0somXy9EVi2Gx+35H7zbgfAuz3GFUIaF6m/9KIbA/pu0VY
 xxbpa3IgBNTEfFTZZYpBoIQW5PknfKJeGfjN7gpWi+lidA4OAP6h/tbV5
 vcIlNHiKma916CVApmoNxh2jcylfCXyUKy5sdpxGokE+oGy+l+c4zpyJ3 w==;
IronPort-SDR: xzVo7kKDQfXM4COzf7VRD7vwBKVfSFDgeSgNcNWW7SF9Zu47FYzyeneuI5n00eZbUS4AwZGaQW
 Sugm7azq1H631ybUtwFN9VPfjxPLj5c3akPT0nQECrE1euJQ3hfi0CjtOF29+7GwLtf5prmGXF
 pjZxopajsNaem6m3lE0RXXeUA6r40IQZPrwFE94XM/SnwUv9uTd1YNlytTFGq6WY1c3x+RJvOe
 Rd4ul9j5wxhdkwlevhIHNjGmH59EVyTsYPVUr+W97yObrW7Ivmf5aRbXkBpWxHMegsUCJ2ltQa
 SbsUms9WuCpVfI1h1oswXKnq
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="154563408"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:04:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:04:02 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:57 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 12/14] mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
Date: Tue, 7 Dec 2021 16:02:52 +0200
Message-ID: <20211207140254.87681-13-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060404_394535_CC0C6C28 
X-CRM114-Status: GOOD (  10.69  )
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

s25fl256s0 does not define the SFDP tables nor implements the
RDSFDP 0x5a command. Skip the SFDP parsing in order to avoid
issuing an unsupported command to the flash.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---

root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
0102194d0080
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
spansion
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
s25fl256s0
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
cat: '/sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp': No such file or directory

 drivers/mtd/spi-nor/spansion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f2a2995a7718..f44401287811 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -210,7 +210,8 @@ static const struct flash_info spansion_parts[] = {
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
 		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
 		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
