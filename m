Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A621EF06E8
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Feb 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELxdXBBbuhr1Pqq1Bl8HwmVzZiJCwIeACsO2b2MyLmE=; b=kXXQwEWmFZowlq
	COVGkb6M/PBz4risYr1HksIXSUEd1PmoE/nOdk5FsXSXmgft153r4AMjYhJ2R/SHf+AbGjIAYraaz
	3ojMpeDfvktTViR3X2Xeb8OruULEdgL16vnHWRuzWGxexkEEXIJ2mP98jL/Kd+RfQAZKy9NpMR076
	8KZiSb/AJIyAcndUln0X2XHCCTJ5c/tXvtvbt2UWXVEcrl7D6AGTvcPK+kk8SCaQkHttxnNJCPiCp
	gwufoLQ8QH3k5KgP4YiH8MrNCb6+twLOm/99D4M1/3jUjh9kWy3IiPGypsvlnd5XP+qWa4bqkermE
	ytNQHvd9MJG/xs0KOgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8y-0000000D4ZI-0U5d;
	Sun, 08 Feb 2026 06:19:40 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8t-0000000D4XR-3hC1
	for linux-mtd@lists.infradead.org;
	Sun, 08 Feb 2026 06:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770531575; x=1802067575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ltZuCxBdZ12qFQz0mmsudjFR/rgDd0q3Z1aKzrOqJs=;
  b=LOcn+TzTL8XQ7kmO3/2G7O8rP4XTxeMzgkdN4RH0UW+TGqR2iMTCdRhU
   24zinlwf/6q5Yn26+3GXrxiKZ/Ti+yaO5GcnwOrhOji9f8UakzIuiR53A
   ePi9YEpOl85+ZUiXj812wS7k1pUvVYQsGhKyg3heQqxTN3wkzG2lbBnxh
   kvLGzC0xuCUMnzk5qef/GhIO3XNAsOaZ5NpE3IJza3ivrIk6ZcPZGyvcU
   Oo0J0mTI4YHJBxztItWI7YCE/em0B2PB/wjvmTBtGaf33kt+uJcxeVHnp
   ryWgB3rVz8zvobEwib/t+SJARVjs5DLdaTXKE9EzFYjO3iJkL1FTI/Oq4
   Q==;
X-CSE-ConnectionGUID: nRhDc9OeQmaElTcUDn64JA==
X-CSE-MsgGUID: fri+sQXxSYygnKYFaIXl5A==
X-IronPort-AV: E=Sophos;i="6.21,279,1763424000"; 
   d="scan'208";a="12615211"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 06:19:31 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:8786]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.19.186:2525] with esmtp (Farcaster)
 id 26e52be1-f38c-4d5e-91f1-ddc4caa557d7; Sun, 8 Feb 2026 06:19:31 +0000 (UTC)
X-Farcaster-Flow-ID: 26e52be1-f38c-4d5e-91f1-ddc4caa557d7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Sun, 8 Feb 2026 06:19:30 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Sun, 8 Feb 2026
 06:19:29 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH 3/4] mtd: spi-nor: winbond: Fix locking support for w25q64jvm
Date: Sun, 8 Feb 2026 06:19:18 +0000
Message-ID: <20260208061919.30498-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260208061919.30498-1-farbere@amazon.com>
References: <20260208061919.30498-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_221936_021694_075104CC 
X-CRM114-Status: UNSURE (   9.31  )
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

The Winbond w25q64jvm supports block protection through the Status
Register (SR) and provides a Top/Bottom (TB) protection bit.

Enable SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB for this device to
properly describe its locking capabilities.

The device uses Status Register bit 5 as the TB bit and supports only
three Block Protect (BP) bits. Therefore, do not set SPI_NOR_TB_SR_BIT6
or SPI_NOR_4BIT_BP.

Reference:
https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q64JV.1

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6d325da121b4..eaa547d36aad 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -296,6 +296,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x17),
 		.name = "w25q64jvm",
 		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
