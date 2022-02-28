Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E72EC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=scgy61ZoUcg7oaTp1Ht9Xe9qgdoizto2ZCmW+mbIMBM=; b=cTdFYCxxemwRnz
	HzdbUG4lbG53i5yKm+snaeTQIE1ooAcgL3g1Orh4RcQxRC28fFPdsEtR6zPYuPdZWTrtmX1uV4ZaV
	UzRA1nkabnXJOoeOXHtPiATQXYCh17ZUY2kTQ7OmgOveoQkFh8HxJURMy9JWdbWgE/3yhvFkDYKzo
	A6Xs6rVaUi8XWiAvzWF7JBSPP9VunabACPu4wNgZPwsTyIZ45WcG2JivZGMG+1OidWTWbqpSF8+AW
	NTR/6YFuCwQ2KAtAa4vrSkjZ92ezOfJXlDMbsqXBy/Y3ecn8hl2NB33W2KgL1h8jLl1LVeOO6Sllp
	h+7dp6zBlzQDXxJtdazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeHI-00BuE0-2u; Mon, 28 Feb 2022 11:33:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe1n-00Bmro-LN
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 11:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646047039; x=1677583039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t73JCsD7PZHwhkuYI4yML7PDv9mGaY4kWadlsL2q9n8=;
 b=U6Ye6OuLXPZbv8rpOxaMEo3FrX0jUvnBexC+9EB0+jiWWSiFBBk0TL9a
 vJwYMWhzmNfnOOKDQ1NIAA8W6DCxAjoSO+0cPC+FmsetwMBfUdi8bcQf0
 dVntzA9Pg3TlTmVx7yxPDegUMEWRQgExYsB9TIPJCsqFGF/dMhdeZ9jiZ
 yObagl7reF7Hy7f+JZhdaDI1zdZmb//aWwjXROtzKGhxBjSla6lTtaJw8
 XI8+Wn9+p0IbfzPwTQgOwhYjGeb85uHwbT69jGBV25wHHNB4x/PVgRLWH
 TShBszDA/SE6PuqVay/puFonSwlEeWLAhLh5XDofeYrwsq5fu9rjvWIDq g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155099335"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 04:17:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 04:17:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 04:17:14 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 0/8] mtd: spi-nor: Rework Octal DTR methods
Date: Mon, 28 Feb 2022 13:17:04 +0200
Message-ID: <20220228111712.111737-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_031719_778364_8679B0CF 
X-CRM114-Status: UNSURE (   5.06  )
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

This is a combination of:
https://lore.kernel.org/lkml/20220209133656.374903-1-tudor.ambarus@microchip.com/
https://lore.kernel.org/lkml/20220210023334.408926-1-tudor.ambarus@microchip.com/

Macronix patches will be handled in a further series.

v2:
- Fix bug on octal dtr disable, s/nor->reg_proto/SNOR_PROTO_1_1_1,
because after disable the nor->proto is not yet updated
- update function/macros names to comply with Michael's rename series.

Tudor Ambarus (8):
  mtd: spi-nor: Rename method, s/spi_nor_match_id/spi_nor_match_name
  mtd: spi-nor: Introduce spi_nor_match_id()
  mtd: spi-nor: core: Use auto-detection only once
  mtd: spi-nor: core: Introduce method for RDID op
  mtd: spi-nor: manufacturers: Use spi_nor_read_id() core method
  mtd: spi-nor: core: Add helpers to read/write any register
  mtd: spi-nor: micron-st: Rework spi_nor_micron_octal_dtr_enable()
  mtd: spi-nor: spansion: Rework spi_nor_cypress_octal_dtr_enable()

 drivers/mtd/spi-nor/core.c      | 153 ++++++++++++++++++++++----------
 drivers/mtd/spi-nor/core.h      |  13 +++
 drivers/mtd/spi-nor/micron-st.c | 112 ++++++++++++-----------
 drivers/mtd/spi-nor/spansion.c  | 131 ++++++++++++++-------------
 4 files changed, 241 insertions(+), 168 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
