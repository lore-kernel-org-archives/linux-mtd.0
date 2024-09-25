Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA4AC369D7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GUTpaawYJNU1r+ok8ApwgTB5u31eTf0cy7/AC019bPo=; b=KZhmPHaYd/cvLw
	xiLov2wt7pikUYvZsBQWkrzERXVKhfQpjNz3fnXhOf+eMmD8hH+n7wOlD+kin2Mr+7hisPwMt37A6
	6ZhEp7jbYUzNia16rjXvGpbXWSJKV5yWIf5Rwm8acZTeoq8Na3FxPjFzAu4i1EXGwM5iAkUkNz1Uj
	pmEBvwDx0/YVFX2rueW/u+hYB/vfcejikyvmp+i3JXrgrfz2U/RL2CKy12OsRt0z/bIyt/w5wc7SA
	cMehYnDBwlAtBaWnOjEAph30hn/hNa/wS+1pAiZmqcM9JX7vK0Rmedtt4NGpsVMfhgVV19g867+mK
	IQpEEoZDuJo4nYw85r6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stRCw-00000005AGu-2FEq;
	Wed, 25 Sep 2024 12:33:26 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stR5e-000000058EW-3ZUL
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 12:25:57 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240925122549140efc858252fe0341
        for <linux-mtd@lists.infradead.org>;
        Wed, 25 Sep 2024 14:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rWYWy9qsF1Mg10AlJ9IylqeS2/9mcuB8KaZ0fTLKsJ8=;
 b=jGnTe1BjDSTFy3vDOEPI7pDan1PCXqLd5JNVK5XVOheClu0S5XfMDwQUdC42LyTJ5X6X4t
 5c0nxnR7ed77ObgtdqCPOqHTwdcBaWNrhuP9MbnJCmLXUeuoAexMHo04a5BX/4yNdiY9mllb
 fhtOGaOS3i+wKkS5J/aP0RESjPbmHlJuFtqFc/86J0aD8oLc0Soe3NyugL8FHMQCaB+i7MSE
 JiobHtkK/WsKpO6jkQk1UIc2WU+HdReANqAwGEqNXhZl9zDH5d980nhSdzX4mOSko7L6OwAb
 4HgQhqspaNaXc7qOEnqkclxV+37qnzzLYpCmZoz63MJaHnhDtnGPMyvw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102Q F-RAM support
Date: Wed, 25 Sep 2024 14:25:45 +0200
Message-ID: <20240925122547.253790-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_052555_356894_9632A96E 
X-CRM114-Status: GOOD (  10.59  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

First chip that requires 9-byte Device ID, but at least in the proper
order.

Link: https://www.infineon.com/dgdl/Infineon-CY15B102Q_2-Mbit_(256_K_8)_Serial_(SPI)_Automotive_F-RAM-DataSheet-v07_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ecf5fe049d3
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changes in v2:
* set SPI_NOR_MAX_ID_LEN to 9

 drivers/mtd/spi-nor/core.h     | 2 +-
 drivers/mtd/spi-nor/spansion.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37a..fa6007ac36e14 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -9,7 +9,7 @@
 
 #include "sfdp.h"
 
-#define SPI_NOR_MAX_ID_LEN	6
+#define SPI_NOR_MAX_ID_LEN	9
 /*
  * 256 bytes is a sane default for most older flashes. Newer flashes will
  * have the page size defined within their SFDP tables.
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6356da2cb0be2..38b68a62b31d9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -987,6 +987,12 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hs02gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		.id = SNOR_ID(0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0xc2, 0x25, 0xc8),
+		.name = "cy15b102q",
+		.size = SZ_256K,
+		.sector_size = SZ_256K,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x13),
 		.name = "s25fl004k",
-- 
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
