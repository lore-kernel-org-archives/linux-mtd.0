Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D12FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y13gPnW+pVST1cehXcOczQKpQiY6VJ79QaA/eKQk/lY=; b=aYXoCbPjZNq+ep
	5O4bxdLNhZn4iC8TDbMef8cXfWxeU4L1BMC1MszJzvxBKGJuNCxOmDJnMDOP4LSpYj0hGRdFf7K1Q
	QJSPmv6LEWdHK/KN59tiOV7k4Dn+s+FRSsWH49V2jYfWxgwZ3+TgZvKOmQcx1IIUrmbCHOlnEx+p+
	fgLzJT9e7sZ0qqpcqSIsRFhHxATSDwfqqOAWs7/JkSibiQpCtO4707uWQ9Xxihak4okcg43gUL/xg
	GGeWqQKF3l/WlMIYYdBG0Z+kvXLIwPwnd0BFd6AHsRr7ZQ3MjP7TrJIh9eMIrq5zhUhfAxrviioDK
	4B9oj6Z+7rbIggcoE3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlniJ-004ZM6-7B; Tue, 03 May 2022 08:16:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlniB-004ZGe-0r
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651565806; x=1683101806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BSgmH0Uww6kJ+xDqMISm2cy4x2eWbZdhTmpVeIXvfhU=;
 b=GY07jQqqPi9kawGNovSo51XwRKrFGlR3f5SdgUpNn5hxVzVb0X6npZZc
 82qOT3qq1J7iO5Ig+oCOJMQClM085RlV/3QcxBT79piBzfJ4ejz6CMld7
 TRvadnE/HvDS5eCjLhCAxDUH329stnJIxwbjQx6ZIT/iP48RYEmcp4pNy
 kGwvaABu7JD3JN9C07QqJw+GFG/wgfLOBX0aCQdEm12ITXw+avjP4ocY/
 UP0pjdP2O4XCvq5a4pOK/WgJ9dkR86Ys3ZykM2rvQUqVvKXZCJoaVv51r
 yD9hcsvVnMa+sINdfh99x/qG4AAUmKqIBRKHDibsJ+MRFmVacW3I3KuzW A==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="171740330"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:16:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:16:46 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:16:44 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v14 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
Date: Tue, 3 May 2022 11:16:25 +0300
Message-ID: <20220503081627.341870-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_011647_103795_788C1AF3 
X-CRM114-Status: GOOD (  11.50  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In 4BAIT parse, keep nor->params->addr_width because it may be used as
current address mode in SMPT parse later on.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 2 ++
 drivers/mtd/spi-nor/sfdp.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e7c7ab5a18da..f60240fdabd3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2673,6 +2673,8 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
 	if (nor->params->addr_nbytes) {
+		if (nor->flags & SNOR_F_HAS_4BAIT)
+			nor->params->addr_nbytes = 4;
 		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 90d7c25f7281..7240d9d74b8f 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1090,7 +1090,6 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	params->addr_nbytes = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
