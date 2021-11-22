Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A046FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrzsMtu7woDPZUQc85qSxB6YfXDuUWczbnbeFz8RW5c=; b=IN74Ig5AIPVdXP
	+KpCiL8uYu/94op8+yEvJGHcwAvQPn2TZ/VGK8+HU6Vj/6FmbFouxER8RIX2dAShUJt5+MloGXAtN
	3E86gybDvlj430Fn3B/wdoTXs7C3BTFKuaAKRkEP6PwxWHQ2slaOAgozQX/4iqpRTT1Dnc5ZMarTV
	TYyX5WA1OcWRKi0tIu77ltbxWHwTy3KmfN4nrsqGDCyu2t1Rwq0eeLqZ3axTK+oXYHY6PTYu4qgv4
	Dzy3dWZYujUqVuWHY5uaRX2qD3aQr7kmXajPQs150yxWq7nhoWY1tAF3Z9DVs6QpdTjGMuyekOYd3
	9jq48ciKIrg6fTRGtDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6mT-00FtZ1-RU; Mon, 22 Nov 2021 10:42:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yx-00Fh4V-H0; Mon, 22 Nov 2021 09:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574687; x=1669110687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZhUqxJkMxA0aR2GxiIzKwiXYKhD9V7OjEHL2JoCJe8=;
 b=EGanWogKu2Z45A8PPcvHejBJ6BxB1fxU37ynzAMNTSxSzooXEPBrWG6b
 H71vquklBYU8D1688aeWCw6ILTsIJWY1zwmcGZk3DdKVKf54IW445bvGj
 kiN9YR2iZt/xhRAqv7aZ0QofnUC7zPCKxcpJpJLo+65EByZeNzxFIpDwl
 bGqpXT6jm4k/kZuO/WLQhhi642jZG253Bft/dfAVZlH0uY+ApVaZbghFO
 ua3lDh6G03a5rxFYQTsHV6CHpXLrjzQjbDlvLbdkGZfeVq236GoKIBeZy
 lCfGnYpL3X8QU81mCotPaTj+C9MMVZBDclUCM/u2I2x4pWL/5x2rTXI4C A==;
IronPort-SDR: Y0StdOPgZnVwxpknrgepwSD4z4AwRrLwWuqSBeFnqcPb01625YMix6iWH0+VnvhTjy87UAmRPA
 tiPnh9S6aaLiRDNHiJ//mISw8kGaJBCq/YFYdI1e5qw3+IssDoFd6/zdMQFf5+aC8G9+u/be+r
 MiR+L5zEIHxepNGo8caTGhZBKzssPvG8W1DeXgQA8hn1NBSP/cnT3cSzx3rXOrLY5s7gy/13DQ
 VFPSVRdv98HuXxocFln/CtLVbtZCghVvLZs9IxYu+qDaH1ejfuuNwVQ/Ml/v+GEeXDoQN8wQXD
 rEVdLaUQWndQ6PfyI0TaohXx
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="144129581"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:51:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:51:24 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:51:19 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 11/13] mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
Date: Mon, 22 Nov 2021 11:50:18 +0200
Message-ID: <20211122095020.393346-12-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015127_675660_C12D0E76 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
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
v4: use new flag macros

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
index 1282a759cd75..92c2350e7ff3 100644
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
