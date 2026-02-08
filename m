Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F221EF06EB
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Feb 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuY1a5kr7yFk8rl1TDFVMNQzOVOoxMH8e303lYGeH4w=; b=iEIw+SUPSoCgvx
	RqLinUrDnTNeKp7wbUQdYojcAhpQWjO7YFSQCiVGN5lGGtE4/KpwgRtXG7qWX+MadJ5Vd3pBnuYDL
	zaSLez6SpUZJN3PYWG9Sq0UzyLoXgDrkdIYgWOdESCvB/JsXws1JibcGcJLs3SurVHKmJt1vKwyH+
	60C0bAhSEvl1T8YBttQEKNVpLum01cJIMDa0/McFXp6ZFLUCACAK8/UZHj5khyV5AUs9+b2G7R7qR
	oC7jipkW7NovHpeAz3pRdvlDa0vSaEKnlm78Y+p+xpMAc6niIF9XPpfeILJfHrjXU+gB38UfLkIwE
	Hw1pXaxWi83APbrJTUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8w-0000000D4YZ-2rTf;
	Sun, 08 Feb 2026 06:19:38 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8q-0000000D4WY-3nk7
	for linux-mtd@lists.infradead.org;
	Sun, 08 Feb 2026 06:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770531572; x=1802067572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IjrLJuqV+zku7oq1cTk6kfWf787uYZ5ciCmtra/6d8U=;
  b=XdWOQAb7X25Cxh4dWFSRNpIg+JXeg2BZJ5TlGLQTQMutSqKfBrSWEY3D
   6nW8KNsUA3PQ2FgAwZ9LpS+xbhyQLrgJt2AhvpzDKK5gjV7D7SIN8uKFW
   nAw2YftbqkpEe5PEdNwo5deZRtfifEWdnYHdMebfC12sNu1jhwYqw9fIw
   vvKEOIiuF8msjLMXqfngZo2uSFmpsJ7Sxqkn8rgOC1oIe6MwL7lavD2A6
   45n34lPIrJ/fs8WWYWhnDtWbko/Y9OXOFD5eMSth7mJxjxpP80Tv7E3DF
   A7YZD9S0u8Iuf9t4M28QERSukdRTDHaZcnury8EBwySx9nB/+CHmsm5lr
   w==;
X-CSE-ConnectionGUID: mpHZE5MEQZib1VT7OAEVhw==
X-CSE-MsgGUID: ilC1SuyESxm9fahTneCU9A==
X-IronPort-AV: E=Sophos;i="6.21,279,1763424000"; 
   d="scan'208";a="12424747"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 06:19:28 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21878]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.153:2525] with esmtp (Farcaster)
 id bc7b5c27-95df-41a4-9407-bbf7cb528505; Sun, 8 Feb 2026 06:19:27 +0000 (UTC)
X-Farcaster-Flow-ID: bc7b5c27-95df-41a4-9407-bbf7cb528505
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Sun, 8 Feb 2026 06:19:27 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Sun, 8 Feb 2026
 06:19:25 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH 1/4] mtd: spi-nor: winbond: Fix locking support for w25q256jwm
Date: Sun, 8 Feb 2026 06:19:16 +0000
Message-ID: <20260208061919.30498-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260208061919.30498-1-farbere@amazon.com>
References: <20260208061919.30498-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_221933_002658_B6E9023D 
X-CRM114-Status: GOOD (  11.63  )
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

The Winbond w25q256jwm device supports four Block Protect (BP) bits and
uses Status Register bit 6 as the Top/Bottom (TB) protect bit.

Update the flash parameters by enabling SPI_NOR_4BIT_BP and
SPI_NOR_TB_SR_BIT6. Without these flags, the locking configuration is
incorrect.

Reference:
https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q256JW.1

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fb855fe44733..55f1209936d5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -337,7 +337,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
