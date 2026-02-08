Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E90FEF06EA
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Feb 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8HOY+6xtqdh0DczFvyKZldqxPc9UUMS+4+X8cyFKxY=; b=ro721YYaX4VSvB
	C5xEMalLo3cHhY0sF/C/C5oJTkH1QSLOQ38iruE/s3CXOBks5NC/jrSVYVpECN+ijkueNCxqLv1Oy
	WlYTQ+kWkS/aZj0SttNAXBA/DSgzERms2v4iwWTfWKg9flWYOYs5sYohxKtCOrYNR6twc6TrwD4QD
	vCYFGvwexb72IpFZz2+BammOSF02W2rfl1tk3Z8DUnsdmSWU6OvPIeg7oMDGHgY0VaZsj2ql8IEMY
	Iu1xxvmkTBCXu5CWVh+bihkty58pysJYCNO+1Q/NEneMTee92Fjkbv6WapJcCFVBsd9p0wzAZmlRv
	vDMPh+bbn3WG18iUxoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8x-0000000D4Yj-2JpW;
	Sun, 08 Feb 2026 06:19:39 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8s-0000000D4X2-33Tj
	for linux-mtd@lists.infradead.org;
	Sun, 08 Feb 2026 06:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770531574; x=1802067574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kt+JYlmLC8S632f23NjynpBZGNVCDSSCZjdmoEG0rs4=;
  b=Itt/SDRYn5pUNDnCLVFxybz2JVsK1fFRHN2Iigholeo2FBceiVXhgEZ8
   ynHN0MRqHkLVOMU1N6ZlWEgDRKjxf2h3iBW7tITuRQ4r1P0rrBN0rGCHq
   k8cQYVICqpgqX7aSHwKeikc+5JUtIveFaaEGwIRmr8nwpdhPig2AcHqHX
   td/Jhfy3yqe/wnTkAhCjYEGBfgJ8tbrKfD3QpU6YtuS6AX2A1jtM6KxuI
   ppZ/LIryJ6nD1x4AxWFlJEinZGrgQuLCiKoUecmb9hoUZhtUcUW9ecx8H
   KmQ0W0bJEIelnuFM9bpDDYmb4nSlWI3stjYYJY/kTOjG60HpcxtZ9/dHT
   g==;
X-CSE-ConnectionGUID: 1IigKDfwSKax7H5DRDa94g==
X-CSE-MsgGUID: loBlZqD6T3qnE+WLyb+e+w==
X-IronPort-AV: E=Sophos;i="6.21,279,1763424000"; 
   d="scan'208";a="12622004"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 06:19:29 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:16392]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.153:2525] with esmtp (Farcaster)
 id 1b6970f0-5227-40dd-bb4b-b1af4b6f95a1; Sun, 8 Feb 2026 06:19:29 +0000 (UTC)
X-Farcaster-Flow-ID: 1b6970f0-5227-40dd-bb4b-b1af4b6f95a1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Sun, 8 Feb 2026 06:19:29 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Sun, 8 Feb 2026
 06:19:27 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH 2/4] mtd: spi-nor: winbond: Fix locking support for w25q256jw
Date: Sun, 8 Feb 2026 06:19:17 +0000
Message-ID: <20260208061919.30498-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260208061919.30498-1-farbere@amazon.com>
References: <20260208061919.30498-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_221934_825528_715D5C16 
X-CRM114-Status: UNSURE (   9.63  )
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
