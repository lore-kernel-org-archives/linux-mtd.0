Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A13CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1E2VZfIwq2fV3MUmRcvMAMXulCBXBjRcHvJrA5X8Zkw=; b=IeFD37M3HtTSqB
	QmuelAhJaYCpVuviFPa9ak7iNVDL5JSPuYEyog9iD+132ahpyV+jHjHa1pT/UxyqrxdkyycM6I1oU
	VIXof/MA0APX4RIRY2nphb1UpJ2/11QmIYI7BuZkDFubHoOnviKAdpIWir/WwNQm4QnizuB3JRwNJ
	QKt/P2ExIDP9dIzVDb8FBy1TafmejwM8guz7ko2UdnRiZJKQHjp21AuD3CYijXj1SSVhE0HaSTtz+
	WDbEI9FI4Rh0mM1/uiYythojlKQ45w4b9YiOmsZSrDl3rvodgznmzksEnNZufw1gZGq0Vqxlr+D4l
	6ILAkUw0t9u01/9oLYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLS-007X7s-9O; Mon, 25 Jul 2022 09:25:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLE-007Wr9-OO
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 09:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658741133; x=1690277133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fb6wA/lGlM5WQzPg01t3Za9EGBxyqz4rz/iDL/o8uJY=;
  b=rtiSqRp6icelnAucSo+Qhu20U5ogUYvcu0ArulSqZjvXPnUrOjKaNALq
   8l2XApEpZvJ932VVbf+1Jox/hEDOLg0l0va18CG2QkjlPEIqT1508FCF3
   9iW5zPkUGAJpnFyQmauX2b6nL53lqznyzf2/1XFS+YCe4laizjZNZsX4U
   zLJtaE0Of5G/RFaaWo/lAA4UvwcUOsrnqeSB9NZvLu5pKAlSninqf65HE
   zCPtqVIYTp0Bc8LBTIc4XFxyh6j2pNAdJeDYdQvmCRKOqehWVzN3/EITS
   74yEQLrgAPc2qrulyf8cNKSlctkmMJiPqb9m6NDLLjDJ+Nb+iTbObICRn
   A==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="173491258"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2022 02:25:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 02:25:31 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 02:25:29 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <tkuw584924@gmail.com>,
	<Takahiro.Kuwano@infineon.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v17 4/7] mtd: spi-nor: core: Return error code from set_4byte_addr_mode()
Date: Mon, 25 Jul 2022 12:25:02 +0300
Message-ID: <20220725092505.446315-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725092505.446315-1-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_022532_859190_37A83307 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The prams->set_4byte_addr_mode returns error code but is not handled
in spi_nor_init(). Handle the return code from set_4byte_addr_mode().

Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9f07f1036151..ec4c368b4ba6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2724,7 +2724,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		nor->params->set_4byte_addr_mode(nor, true);
+		return nor->params->set_4byte_addr_mode(nor, true);
 	}
 
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
