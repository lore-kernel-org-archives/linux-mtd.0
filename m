Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6ABE9A04B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8HOY+6xtqdh0DczFvyKZldqxPc9UUMS+4+X8cyFKxY=; b=m8rTiRuXQJW8SD
	Qaau01yB+W0wpDzuXRSyqo2jr5EhnMGolA3h/JUbgbbq9dxVNiOEEyewR9PfxdwF9RRYnonNmofiM
	DKUiPTe/Qgv8qbponWW5HQ0Y79m2mMrI19ktdHh1a+F1AXg30mprOTRt6b/2Vqxs+0Cn4hj/0PNfl
	HH9RQTvQY5p5Ilfi6oeJI6MsyZimGlmktg5m18k0/KsD5NXLIYyUn4lyktwh3X1g+TICd6BxiGnQK
	6v+QjypQZIRco3H6XjUG80STqomuN6+EjSXlqkxYgnRznfsQ5qmjvil2i/I9wsTPiyxQ2knO80PsH
	//ZZsQRRpPPlXUW1/SCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieT-00000009xSm-0hnq;
	Wed, 18 Feb 2026 14:35:41 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieP-00000009xRb-3VSe
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 14:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1771425337; x=1802961337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kt+JYlmLC8S632f23NjynpBZGNVCDSSCZjdmoEG0rs4=;
  b=Rs2973FCaxwVzn9+luVWKHAdVX5g3HxH0FtXlhPRXBmDzTkNCr1GUHST
   8LUM3chRqQkMAw5fmAmKsA24aiBPewZQwphQ842b3vDGv0fATuMLSZcn2
   T9LX1LI+iZnB2KBWA161P2V6DN4botL+U0vNwEGr9lTO7dz+JB9vHWx9K
   e6SyTuN6zvHUx/rl04FTgjUmcSxp4pBtaDWc3HXL0EpYnx0PxYNtYdii9
   CRo38pYR5dtnzyoHAn8t7N7980NeoLReHWdmHy3FNddV3NNnbP42iPQpm
   tdA8YOW3pH8Q7eneCxlZsxWXFWLqRDe27i+qm3AHLMPN35ziWx5YfErLA
   Q==;
X-CSE-ConnectionGUID: MNB7gRjmTY6/r5P8NjuqSw==
X-CSE-MsgGUID: P77f/YS+TVCaU2NxxIPwRw==
X-IronPort-AV: E=Sophos;i="6.21,298,1763424000"; 
   d="scan'208";a="13284428"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 14:35:33 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:3798]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.250:2525] with esmtp (Farcaster)
 id f5ccaf72-88de-47e8-967e-206a7fc27c21; Wed, 18 Feb 2026 14:35:32 +0000 (UTC)
X-Farcaster-Flow-ID: f5ccaf72-88de-47e8-967e-206a7fc27c21
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 18 Feb 2026 14:35:32 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 18 Feb 2026
 14:35:30 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH v2 2/3] mtd: spi-nor: winbond: Fix locking support for w25q256jw
Date: Wed, 18 Feb 2026 14:35:22 +0000
Message-ID: <20260218143523.17467-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218143523.17467-1-farbere@amazon.com>
References: <20260218143523.17467-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D042UWA002.ant.amazon.com (10.13.139.17) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_063537_923091_22F5BF04 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

The Winbond w25q256jw device:
 - Supports lock/unlock via SR.
 - Has Top/Bottom (TB) protect bit.
 - Uses Status Register bit 6 as the Top/Bottom (TB) protect bit.
 - Supports four Block Protect (BP) bits.

Update the flash parameters by enabling SPI_NOR_HAS_LOCK, SPI_NOR_HAS_TB,
SPI_NOR_TB_SR_BIT6 and SPI_NOR_4BIT_BP. Without these flags, the locking
configuration is incorrect.

Reference:
https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q256JW.1

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 55f1209936d5..6d325da121b4 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -274,6 +274,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x60, 0x20),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
