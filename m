Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8F2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L78M0dYesnkCaqso2433QkrCXkP0Wr4jdeu9vkcyjcM=; b=kUNxW8Ab9yug8O
	XS9luwupxv6XJW1mS0Mnsvl7ybf3y8O7hi15RdyWluTJAD+wxaR668krlvR+5jxoCY1vTH2Sbc8Fz
	5guEhhEUsfqZbv/bY/HTc08H66MK3px4JNp6fNEkzIfcUxRonpZ8fhpmd18iVRiClGj+mynbRgZcG
	gmeMhkOIVdfKYReJzG2KvQ7ShluelXSNs0/qATbo89NRsXioMNbQ/wMsJBbVBSKPIQ1F8LUf7tm28
	Q5xIW/pnEusGjKppCHNXe+bAFCjK1eyfWVTT7bIQ1J2FuBRsgG/81EnYJk3pubP1AUjhNenYeRnKx
	8+N63VRlsdBB9/eu/YJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubOv-008vCV-4j; Tue, 07 Dec 2021 14:25:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub4Y-008pFD-TR; Tue, 07 Dec 2021 14:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885838; x=1670421838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UdYsFkNfUHrVagNVmKqN6NosTnewSD+twW7PMmJOyos=;
 b=g70A5z/sTv5Fy2enseFdEkuWBPI+Dvd4nHrEuURMT71hZfGC5OJj6LAa
 YCFOuZ9kokdclz6Esb3aGmzyMURNx7ZxERXnAcZRT9wUD+8flIiiPbpOH
 cHjYJVbP8cTAlolD516Jycqm0J1cHAJMAN63XasyUceQT7rls9QoX+UXK
 uIwIgbGZDtsw6BeqHwMehsus8qVMQ2adjr0vZfkBxbXbuzP1wrC5vx6Jx
 4pztsjQGBWgA5r7ltTPibhMhS882YsYEmmp9JqWMwUiztLRuvS1tEyc8+
 KrRoXzuCu7xvozRzVMsfkkhi00t8Ze09TmLnvO3yR2RzlUMkPqRSe58M0 Q==;
IronPort-SDR: oqb69lx86yF0iW/j7Q9yaNkZduTCuwpGEGFBqgAmaxF3VLpmAFnMReuXzl0JxLj2pJfYxLTbP6
 1wWUP+INScCqVz41YG0NBLIc40vH9vu0HTxBxsy8+DWxDSBkYzENUBat37KjTGAb3rBlusA55t
 SkH7o0OxKLH189hy2lcHKRUdzuO0Gs14gjpgUK8KMEEEhVNl3TDgHM0qrafsbERrTdrgs7xkhZ
 BGtf3/2ygPi27w3lzgSzotso5xacjCXHiNj6isSvMd0oKWFvy0HPp/x6OaGPq6xib4imARBYkH
 62WL8BnhPeoTQ0rn4uFP56re
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="138953605"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:57 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:52 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 11/14] mtd: spi-nor: winbond: w25q256jvm: Init flash based
 on SFDP
Date: Tue, 7 Dec 2021 16:02:51 +0200
Message-ID: <20211207140254.87681-12-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060359_071623_C0814F0A 
X-CRM114-Status: GOOD (  10.04  )
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
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---

root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
ef7019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
winbond
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
w25q256jvm
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sfdp-w25q256jvm

xxd -p sfdp-w25q256jvm
53464450050100ff00050110800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff0f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14d3e96376337a757a75
f7a2d55c19f74dffe970f9a5

sha1sum sfdp-w25q256jvm
1d9f526670a97553a648567e051e8f7723f7a73a  sfdp-w25q256jvm
 drivers/mtd/spi-nor/winbond.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 421509406368..a7573df0a62d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -117,8 +117,7 @@ static const struct flash_info winbond_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &w25q256_fixups },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		PARSE_SFDP },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
