Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F3EF06E9
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Feb 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63FeTEXM2TNdtsLT64e6fSx4x2VSnT+JDYcyraaNMaM=; b=QA6PtRFZAuK6d+
	eU+fYVnZDsz1qFu3MkoqeEmODEsBEqUXeDclKKs7frI3u/Ia2CLKYmUo97xNDwPds4Y/NiUQFfWyY
	gUjrPmrBI1SezC0SbzE44l7/iwBUmpN9/oemcZOWY0dN9egPDIygCWbnIJ9ABU0BjMcPAm9j+EVZg
	mb9ZwkGeyI+PnwuGby1wWXGVeHJAyYymnv5bqSSLxYqRI2htnmwyx4vS97xPpebmE41LhapcZNF2J
	PM4PqIlPOWIFKE0CMuqSyopooi8uLL5c7MhvQMFCJPGKH2pVqHHtx3lHnyZyQ2POVUpWriwLGSP1n
	x/0K56aKccJovkXKvPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy91-0000000D4a9-0tBu;
	Sun, 08 Feb 2026 06:19:43 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8v-0000000D4Xk-04FQ
	for linux-mtd@lists.infradead.org;
	Sun, 08 Feb 2026 06:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770531577; x=1802067577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TSB7ZMIEwHPA2BdOgtjeAr/yGJZm6ZKbT3wDxuL3iUQ=;
  b=cTQqFYOZqP3f0uxvEJBy+NESA0UNGpkgnpfIcRqBQYAsL84XOq1NGax0
   f2/Z1oSjFlVOBDbPXwiuFzJWMlak/UQ1JAllJ29WWXKfru2Vo8Fq545MX
   Ho05FFNmp45wS7z5P/d6tNhr43GArYxozg31cbKolGgG1BJvCSQuMTozJ
   GXVe55xZbBEZ1H+/PEf+ytZFuZH++4O6+iF2DTFDP58niihwKtES2NzTA
   J7gbc8s6MGPyeZ0N8FT4YN5C5MO8TsD2SCnB/iMg6lUVKk15Z0ee2pqnm
   jJAFSeuMkApIHo29PQG3+hMusYJD8sZg+yKi0VqrtUUQiuAx1YQNm7f2v
   g==;
X-CSE-ConnectionGUID: SuNz8UBaQIW+x28ZuqYelA==
X-CSE-MsgGUID: +JyEQ3D5S3StlgbjgneSWQ==
X-IronPort-AV: E=Sophos;i="6.21,279,1763424000"; 
   d="scan'208";a="12499393"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 06:19:33 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:30098]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.57.121:2525] with esmtp (Farcaster)
 id 8e83a719-64b5-446d-a4a9-304587f11833; Sun, 8 Feb 2026 06:19:32 +0000 (UTC)
X-Farcaster-Flow-ID: 8e83a719-64b5-446d-a4a9-304587f11833
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Sun, 8 Feb 2026 06:19:32 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Sun, 8 Feb 2026
 06:19:30 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH 4/4] mtd: spi-nor: winbond: Enable Dual and Quad support for w25q64jvm
Date: Sun, 8 Feb 2026 06:19:19 +0000
Message-ID: <20260208061919.30498-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260208061919.30498-1-farbere@amazon.com>
References: <20260208061919.30498-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_221937_180587_55EC7FBD 
X-CRM114-Status: GOOD (  11.10  )
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

The w25q64jvm supports Dual and Quad SPI operations.

Enable these capabilities by adding SPI_NOR_DUAL_READ and
SPI_NOR_QUAD_READ to no_sfdp_flags.

Reference:
https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q64JV.1

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index eaa547d36aad..cb35ec6f110e 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -297,7 +297,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q64jvm",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
