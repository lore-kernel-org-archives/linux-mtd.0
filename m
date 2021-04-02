Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84462C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 08:21:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068F361105
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 08:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068F361105
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TJq7g8TPYj1t1V/551nmlQlVjSl1etVJ52MtVgHEo2w=; b=pyj8ZTF+gklejYuBu6genF6am
	38QBgmeDG7Cp/o/dLRL0KokZfDH3ijqR/iRVWp7g5HOtGRh0sSNjuI/ASODIO+8+PdhpBvLOpYWeI
	3wDZPw88TyfmL6BS4mLn6OK+kvpNI319GPOJysOMgq6Jdk7ASilqrGcFIsFqsQ6PZL8/IgZQJoXlb
	euWUPuc28VyzqOPxI7nLH0Us/HinpJedmxkOvyeZFckAU2pemQOdlqXgcfob+EDyIcmNpnPkK9x3V
	3A7xtL3DIhtIImo2pLZWj5K1rtCHwHUlwVC5OzZs5DchTIxpUvt5sESVKok+6wSb3c1DtjlT1grtg
	L6xAACiMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSF35-00CHEo-Af; Fri, 02 Apr 2021 08:20:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSF2o-00CHDA-9F
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 08:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617351642; x=1648887642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRulU25IEAwnweYpFPXTeAAZj5ejlP9sZftk3ipphww=;
 b=zQeAyNuwYkwwHugOjtZHJs0retqoWJgTBqDj14RgSLIx9Bkk+0c2pdSQ
 /YmLizoP/plKLvgtdKYxv/mRdSYvVBKJKxzc5nqq6RSFP6F+IIpP/CsCk
 R1hBjX42yulC9HUnoCv/iqOC7lBcdBkNQhZh33Xy6tKb+ZamJoA3ewaPh
 783J0Th530shU8sxFdm6T7fI/FwMM4ZPgxady3x43nJVSg9j1pbRQRdLM
 SUxzWmDx4WfPJTGB2W1dMsmOQtALYujU/9LdsHj9htXx8l5x88TMyfHvU
 tpUSk11+H8m91nUNe9z0H44KrawEjpa9xI47yz4pkg6Y6+wynmSePTKJ1 A==;
IronPort-SDR: Q64WanxaLYSwRju4Nu5qmC2uIW5OB7lVRYAwtpPi0djvMmyhnRUFwgvcNxMaPYUJCsSmZhrXr8
 0eucLYAekymiWkfd5MIbZ9gT7S5n8DUJnu9gSeBTPUCki9O1DEvETO/E6yH/M27zpO78QOGG37
 qI4rqkkyhLnkIEmGL7lFEYkngnBMvR9yPKGSNd6PPQ9+HV8s4Fj4mKX8O7CYMMjG9xjfJ1gXVk
 61pwtklk96FEoSmO8GcoUzheruQUHqAg8KoY73fg0sM/cpDaPYukpZyArwamyZaPPr/bzbWuNj
 fM0=
X-IronPort-AV: E=Sophos;i="5.81,299,1610434800"; d="scan'208";a="115094219"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Apr 2021 01:20:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Apr 2021 01:20:39 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Apr 2021 01:20:36 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <vigneshr@ti.com>,
 <masonccyang@mxic.com.tw>, <zhengxunli@mxic.com.tw>, <ycllin@mxic.com.tw>,
 <juliensu@mxic.com.tw>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>, <stable@vger.kernel.org>
Subject: [PATCH 1/2] Revert "mtd: spi-nor: macronix: Add support for
 mx25l51245g"
Date: Fri, 2 Apr 2021 11:20:30 +0300
Message-ID: <20210402082031.19055-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402082031.19055-1-tudor.ambarus@microchip.com>
References: <20210402082031.19055-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_092044_029345_51EBECCD 
X-CRM114-Status: GOOD (  11.60  )
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

This reverts commit 04b8edad262eec0d153005973dfbdd83423c0dcb.

mx25l51245g and mx66l51235l have the same flash ID. The flash
detection returns the first entry in the flash_info array that
matches the flash ID that was read, thus for the 0xc2201a ID,
mx25l51245g was always hit, introducing a regression for
mx66l51235l.

If one wants to differentiate the flash names, a better fix would be
to differentiate between the two at run-time, depending on SFDP,
and choose the correct name from a list of flash names, depending on
the SFDP differentiator.

Fixes: 04b8edad262e ("mtd: spi-nor: macronix: Add support for mx25l51245g")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 6c2680b4cdad..42c2cf31702e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -72,9 +72,6 @@ static const struct flash_info macronix_parts[] = {
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx25l51245g", INFO(0xc2201a, 0, 64 * 1024, 1024,
-			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      SPI_NOR_4B_OPCODES) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
