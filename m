Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0903FC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B835260FF2
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B835260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpYIgeJhWMdGrEB5sam92ymBEm4Rh5cmUHv/T4tWVFs=; b=1lfd1UHwQU8LfZ
	X8FIErjozB2Jk1y22hVNRMRbYFqvBryqHHoaifDjKSsBigPHF93NSZ6n5jzsZ52GVQYpDRaYwpryK
	4TLlKLjZKL5546RYxJs3DxVW94Pppjd80LTJ6GTJmAq8Uk5rXTaSJ8pS9SLfIUGEzQ/AUZje4QmLL
	KWz1fn06FokrGvZXfyYHCCGAgZUt6/15+MCyDU+77l2hpAqbNTiF4NxSdKdiGSjW1FYoFkCAoM5aj
	/C3Sq6B0h3CbSxQd08yECzTgVAyZba8iakC4HWNvw2gGUKuP1MEU7vQCmuNuHQ0hNWbyLLRpMqeR7
	W+6w3nF4XBRAXGhtnTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GvC-00DgOC-Ao; Tue, 27 Jul 2021 06:50:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F7U-00DI3f-26; Tue, 27 Jul 2021 04:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361708; x=1658897708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rw9pd7hKHwkij51FXnWhKe3/qlJzsbPMaydEM1Cbtx8=;
 b=l0NboEwOJ3uGKWyZX8gawOvLvkgOTogKzxZM1ZJFCw6DEv4biCuFgqw0
 3oC8IpcmX+7eKD/7Cx/7UTAfCwDdzBSWTKnj22r2qQRtceMnuXhAqt5zq
 l0vD1fp4OV+UB2REYkLwDI12Zb5/qbrDsykDSmg29Fb4iD1XakoietmSl
 fKiHibG7nv1p9HMH4m5zCYIDrE2VHVv9awd7V6LUos5CUiDNUnnEQs8sd
 6bkjEz/zK0Teas2t4fFyTUsz3Nms+bwz/d679GeFhiM1QIKUaMQtTyQLB
 sPFnO1zyBYHB5fQT90lq1JT7yPYJCwy7NP1z9Lhol+3GHo9fyVRAMqP+9 Q==;
IronPort-SDR: F/80afb0lpIHx9NkkB7/G26fdSGJseecdeGY+1w9IQEWgCtl9NFKOrqcLLkNgRVMC1lJo40f3S
 a6q0Bws1xo0yGtuhBsy0nwr3oNOTNSOggLFNpl8GzQGXr2hVVHA0ifpOgHmXp8MLrU9yP/QYP8
 TETUy1jT8i8DDQAj3wHczdKJ42EKcP7kqsS7QAp226K4dCohPJ97HXF8eNdV8aAnW4kMqYC2pj
 71K0FMlkvV5k55uC//fxd+3qmAcWEvrQ/3eySRSymvuB87UOhto1e8ZUTY6j5SvMHg9EoVB2f2
 yd9Bm5RGZnVQgDHPK/3F9vz2
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137654067"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:55:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:55:06 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:55:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 31/35] mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
Date: Tue, 27 Jul 2021 07:52:18 +0300
Message-ID: <20210727045222.905056-32-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215508_173008_C2DCE45C 
X-CRM114-Status: GOOD (  10.77  )
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

s25fl256s0 does not define the SFDP tables nor implements the
RDSFDP 0x5a command. Skip the SFDP parsing in order to avoid
issuing an unsupported command to the flash.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index af10833f56d8..7fe4e31f8c3e 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -209,8 +209,8 @@ static const struct flash_info spansion_parts[] = {
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      USE_CLSR) },
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
+			      SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      USE_CLSR) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
