Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B78BC04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 03:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qd66QQBQJrK1uzzc4pit8WhR3d33YWYL0K48BNSgnjY=; b=tI51KomIvT2iCh
	c+qE6bmAQusbiZr/A9Dn0kWSLg0NcljdCQstFyj3CSGlUWSHPOll0dj69X30UTK9JjxYomznD8aBS
	lvXj98Gn902kQ94LYntH1gkE+g23cPtbTrXr6/U4hL73X9gk85dqrxw3RJWDG9j8SSutWuCGDGbdI
	Adl5rhG0KNhQeqZBRsRrHff7KfXDqQORaRFSrUj48YDrAprMhVpczzGhppE7SCLjlMR5/t0dLqBIK
	JiOlujgJg/8vdY7SO6iQ6Nl/PawCDkqgjMrnaFAXmWYHBn0I8mC2Dno5EUzXcHjyZlo9Ne4lQqbxc
	FC2ODwkNMH0ILCj8rvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtmu-003Hx1-2N; Thu, 28 Jul 2022 03:02:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtmo-003Hsg-DP
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 03:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658977326; x=1690513326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=my2dVllPbq4Dgzl/Gtr9GRUHAc9TOrgt08R1DPz0xRo=;
  b=rzxOsQCYjEJ3GdtMR63W/ruomocNwW2weOKIkWttMagtKhqN6/ochPPP
   KiP+1bFI9TN4PhkWbhqO8T1uZs2IKmew2MW/DIFp2J7HAcp8USVq4NASx
   U/ZJRA8OBlpzFRsstaO0cA/Z4Xxa9slIYv5zfiV4WsBhXVsGSoZXaCr63
   Vp6T9N/YCXNKtWj7bkdd4EluGIaJ73TFuBPnpnu8JeSajnw2cDTO5LPTW
   Rj3FmSN+uHwL7bYN1NRlqVTQkUWOaw5LJ19hx3HMk0vtUa3W6ml5ntbnW
   qKeHtjC98ggDau8ThpW1eeQs98KLeC4/FNEhezChar67EopmXNDgc7DpT
   g==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="174079398"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 20:02:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 20:02:04 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 27 Jul 2022 20:02:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <pratyush@kernel.org>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH] mtd: spi-nor: core: Add an error message when failing to exit the 4-byte address mode
Date: Thu, 28 Jul 2022 06:01:59 +0300
Message-ID: <20220728030159.68680-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_200206_813343_D310C86F 
X-CRM114-Status: UNSURE (   9.34  )
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

Add an error message when failing to exit the 4-byte address mode. Do not
stop the execution and go through the spi_nor_soft_reset() method if used,
in the hope that the flash will default to 3-byte address mode after the
reset.

Suggested-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..1cdbdad97136 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2841,7 +2841,8 @@ void spi_nor_restore(struct spi_nor *nor)
 	/* restore the addressing mode */
 	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET)
-		nor->params->set_4byte_addr_mode(nor, false);
+		if (nor->params->set_4byte_addr_mode(nor, false))
+			dev_err(nor->dev, "Failed to exit 4-byte address mode\n");
 
 	if (nor->flags & SNOR_F_SOFT_RESET)
 		spi_nor_soft_reset(nor);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
