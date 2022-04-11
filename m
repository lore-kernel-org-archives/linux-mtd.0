Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA6DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aNZDAMEmkNEP6tllLRSximMV9zJAiYK4p+75c5WqtWY=; b=cGKZfCRncMv3pi
	Up7TQANRqXAl1aRBWuEi6gFQi98azG/hfeYmwVf4SXoO1Ffk1hZAf3k2da8IFr4h225ncSRyDpJrc
	pPeWQyHdqr+gvrKgW6iaTt2V5qbfT79uubMk/xtdPcU7enTdEdo4cqUNdPVnU5ERRkymcmy74kdoY
	6heqncklBBuvFooyUT85IKKt1SbXDcmBkLd4YcSKVAWeAutret91AG+JUd5OKrZeUouAJeSIncSiU
	DWEaDoec9BnyiEAAg/WtgLDGOBUjcxqKJU9CF6v8bZMW2z/SwpRkSCwBwayC/9j9jx9Jd6HgMBemr
	EelXTKzDJCK/wjI81Emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtYO-0092ak-Mr; Mon, 11 Apr 2022 12:54:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtYI-0092Wq-9m
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 12:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649681634; x=1681217634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SiCUePDrJ89bzUhfoZ5GqmHxOEBBtleH5I9gXwug5RY=;
 b=NKyMJWf9QLYPGw+oSlhDSgKzv2WUlYLhElJPWzJyB3cFUommwz/kkvUy
 YvqyQy9nlLE1NBgaaomYuoRrlHproBRfbQGg0jlOrmSyowVQZQnp/xgTz
 DF/SeMraFaZl2HOtG9/0kfYpz+Fh4AkqWFskvkzCY3n1AeClmslwAOhKn
 xToZiqGlWeB4hV+qHTlKMJSjoIs8odRsYEFv1B4h/c5Xsq+VlLdYRP3w8
 pbNlRmg4bXdYKt1x0Cs/qHDeEFBYGnBy9bEWI1kZiMnd6F1Bi9B9AKJ14
 rLb+WoygPQkgvokk++kXC9vWNSYl/5Qv9BlwEZhDnc5tIp/MkBEb4lIvC w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="160069405"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 05:53:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 05:53:50 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 05:53:48 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v3 0/3] mtd: spi-nor: Parse BFPT to determine the 4-Byte
 Address Mode
Date: Mon, 11 Apr 2022 15:53:43 +0300
Message-ID: <20220411125346.118274-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_055354_435594_9F12D2FF 
X-CRM114-Status: UNSURE (   6.89  )
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

Depends on:
https://lore.kernel.org/lkml/20220411091033.98754-1-tudor.ambarus@microchip.com/

Get the 4-Byte Address mode method from BFPT and favor it in the detriment
of the "default" set_4byte_addr_mode method or the methods set by vendors.
This may introduce some regressions if flashes have wrong BFPT data. The
fix is to introduce post_bfpt() hooks and fix where needed. We should let
the core/sfdp do the params initialization, and do vendor specific updates
just where needed.

v3:
- Move the newly introduced BFPT definitions in sfdp.h, as they may be used by
manufacturer drivers to handle flash ID collisions.
- Drop "mtd: spi-nor: sfdp: Keep SFDP definitions private" patch for the same
reason as above
- Collect R-b tags

v2: Drop quad enable patch

Tudor Ambarus (3):
  mtd: spi-nor: Parse BFPT to determine the 4-Byte Address Mode methods
  mtd: spi-nor: Update name and description of the set_4byte_addr_mode
    BFPT methods
  mtd: spi-nor: Favor the BFPT-parsed set_4byte_addr_mode method

 drivers/mtd/spi-nor/core.c      |  70 ++------------------
 drivers/mtd/spi-nor/core.h      |   1 -
 drivers/mtd/spi-nor/macronix.c  |   9 ++-
 drivers/mtd/spi-nor/micron-st.c |  32 ++-------
 drivers/mtd/spi-nor/sfdp.c      | 113 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h      |  30 +++++++++
 drivers/mtd/spi-nor/winbond.c   |  18 +++--
 7 files changed, 174 insertions(+), 99 deletions(-)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
