Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3A2ECAAD5
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Sep 2022 02:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlWHVWobV6JaJIZRSVc58Gs4xm3LQKawUyZM+HWQB48=; b=i4HjpZB9uCBZX5
	VzTCSxjsf21TGfuga/yLwrsLdl9pNajR2inQOowqRpS3LG6EmsVJNAnAdYc3X2HdRl1KRLVLzWZP4
	veZcewcvkh+7Ka56kOw3Sm8MupRdcR+H/0k5Z5sSxPP9ymFbXvUgXVMpEC0ddYDfCr2xwH29XBjpd
	yMpiGsEdWYx8eR89aglhZn9ZiUMb/Ka7zJ2mHDM7nhUShXoMokV9O0Lv8HmJvRQq7ZG9ex1zKBTZ7
	SZmbbNWrmxypOksS5vuEggXPGOyjixM02kNZhfb9h9mHnENAaNwCB8QsmQvXOMxDSgiLpy+EnQOdS
	GrYjEV7i35WcDK20QkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVkte-001eaw-J1; Wed, 07 Sep 2022 02:34:34 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVktb-001eYA-IR
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2022 02:34:33 +0000
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id BBI00145;
        Wed, 07 Sep 2022 10:27:45 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201619.home.langchao.com (10.100.2.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 10:27:45 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Deming
 Wang <wangdeming@inspur.com>
Subject: [PATCH] mtd: Fix spelling typo in comment
Date: Tue, 6 Sep 2022 09:42:04 -0400
Message-ID: <20220906134204.4119-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.200.104.82]
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201619.home.langchao.com (10.100.2.19)
tUid: 2022907102745388c78758f33297a769aa21231d1a209
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_193431_946379_F7050488 
X-CRM114-Status: UNSURE (   9.01  )
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

Modify the maxiumum to maximum

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 8bb17c5a66c3..276c529014d5 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -14,7 +14,8 @@
 #include <linux/bcma/bcma.h>
 
 /* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
- * shown ~1000 retries as maxiumum. */
+ * shown ~1000 retries as maximum.
+ */
 #define NFLASH_READY_RETRIES		10000
 
 #define NFLASH_SECTOR_SIZE		512

base-commit: 840126e36e8ff272cb63158646433fa1324533d9
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
