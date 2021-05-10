Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFCBC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 14:14:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6067660FF2
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 14:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6067660FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ILSTlMXSiXFpZyb1zZSN5vWoQaYPwj8mGN9v6pLRVPs=; b=TCCyFkPWD268oSPRgWWudHrzdm
	kek5B6rR/QpkvzyyzIJjZAiF5jRTAIKHRlDqvBvSek/FVX/NZgz/NP+kolXVh+7fFkT43VxqQqHvP
	7fTi5FQeRirAVM4Zuu+8OYBkCU+op/Xw6CtXlNPrvhx4MzqFXJwIe3iwT8p1PBdStkQwaH4YBb23J
	/3EQHMZmdiBAs7uRzHF1ct+cnswVn6lyaAAdpOJc5iwiYgJbSyJY+ZOmwr1zPogZ8acIXzrQt7Hrb
	JD7rU+i/KaHcIMLQ74JfSYZdqBCThsFZvAvlSZiabnr0eHm05cgRG20zXugMEovkv+zzYws/7JLye
	lh2nZGTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg6fS-00EaTl-2e; Mon, 10 May 2021 14:13:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6fF-00EaRv-MN; Mon, 10 May 2021 14:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zQTB3+bKckpKCMFqLzAkIZq7utL1kNvY+OYl+FsX0Cw=; b=CZDfhzDRiv4ByJn1b4Jx+S7bIQ
 I9bonXOJGf7ZY6+HDKPzOi6kRJEan2NT/x6DloFhUX9vxz9zabHHZW5VrfdNYC7cWNfDPZWrcv6zK
 7yScd1G3xWqBUrP6dmT58Zk+xFnjC9EdFFzyr+B0aoc0X/psOZHFtWwgEPZc/jEjIY3m2r5r3e3Nj
 2CObfKqF9aPu/E6iYcJHC6OHNQfA0AgNgVJADOJOdAN+iLopvb6vcrfO6ey1rXqcEtcxBnI2F61KE
 Mnnl/x8xliZYquAkQsDQeGMo+QN0t6ZVTWQoxY9drnwC9dIvLCiNZcA7QZjuv3ex1tR69faRUvtvB
 6mN78WtA==;
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6fD-008nP7-5f; Mon, 10 May 2021 14:13:40 +0000
IronPort-SDR: 7Z+AykxS8R57SBk7WA7GQzntZozqBEFd2Wz/2518DgHuZ67dTYk12px5eXJ8sGf5P2x4Yriu0F
 drt7VWTbcfkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196110243"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="196110243"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 07:13:35 -0700
IronPort-SDR: ltyKADyv74sqKrk8pGvheocmbjUB7aNZEfOIcMJovcY7sl2QrkPQT5cbebQDDxNRdIFUOA6ePH
 UDkpw80MBNEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="541231325"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 10 May 2021 07:13:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 628D0142; Mon, 10 May 2021 17:13:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mtd: spi-nor: Use SPI_MODE_X_MASK
Date: Mon, 10 May 2021 17:13:43 +0300
Message-Id: <20210510141343.56805-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_071339_242675_401C2EC8 
X-CRM114-Status: GOOD (  10.66  )
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

Use SPI_MODE_X_MASK instead of open coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 5703e8313980..2635c80231bb 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -326,7 +326,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 		ctrl |= SPIFI_CTRL_DUAL;
 	}
 
-	switch (mode & (SPI_CPHA | SPI_CPOL)) {
+	switch (mode & SPI_MODE_X_MASK) {
 	case SPI_MODE_0:
 		ctrl &= ~SPIFI_CTRL_MODE3;
 		break;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
