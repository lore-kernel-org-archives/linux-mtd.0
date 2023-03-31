Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF19C76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9dxeY/thJRqdU6heilB2poc032svXBD6/x4gK7wrfAk=; b=qA5sNpWHeR9ONx
	fxwAsGq6Ts6XFa2xw62Z6XypOXiVZ3mNseJoHGOkWSDxucH9SfpP+fFArmSzq3ZgEhzo9jnqbp93/
	jn/m4fhP8OVx7wqHDpPeBZXayEV5WoTHb+LZKJNEvlGH5rjmx9KO/KxDqoJnhywZhmzFhCV67yM2n
	6txp3CBB03OPZCj5O3sSeop2ReZBJa1WTzmnjMYuUbwObhZnHJAzNIMXsJBh9RCJC8RTww2A3hf/D
	QLlt8wlnORQfgy5lAm/S6+jpl3be4mCZUTVkUTD1j8mnib0YRAN/AcB2tFnrZq7eCHyPZh5A7EEvM
	6X053d5A2rhvW0LHsvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBVM-006pNF-0t;
	Fri, 31 Mar 2023 09:57:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBUW-006oca-0o;
	Fri, 31 Mar 2023 09:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680256577; x=1711792577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wlywgRdYFCMfwefUgirPB5xmOD3K8zqnz1V+H3PCcUM=;
  b=C4ux2o7wcFpspf3HjsTKhKRDaO6g0cCmRMxyAps3ZuyyYV3j4s8iks9n
   fnd1gyJVna6BFK/4zL3KZH3697nDqmq4DcO5vUpCjPLhBOMnLdI8FtnQO
   qvBxo/Fw4uSnqG31HGdKdMpaqI6/bzB/UuIqsB/bmCblH2UN7XXyPg7mu
   dALwEbuANjKWD9vyR9kh+ZUUdQtdkutZd0bFTOFRhJGlbQbYzk8jFUkdj
   rNQ1UOYncsCyOehnqFn/qgA902SqplDrTNVnldmUsmU9Rj3il3+Z+sfFG
   PnWrlxzjB2mNr8XAN06J9U2HQrOTwYiMRTPUqOonf7/cIliMcNrY7QqUh
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="204368686"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 02:56:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 02:56:08 -0700
Received: from ROU-LT-M43238L.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 02:56:06 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: Varshini Rajendran <varshini.rajendran@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux-mtd@lists.infradead.org>, "Guillaume
 Socquet" <guillaume.socquet@microchip.com>
Subject: [PATCH] mtd: spi-nor: sst: Unlock addition for sst26vf016
Date: Fri, 31 Mar 2023 11:55:49 +0200
Message-ID: <20230331095549.16393-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025616_527447_1F3501E2 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Guillaume Socquet <guillaume.socquet@microchip.com>

Modify sst26vf016 flash_info struct so when such device is detected by
the driver it may be unlocked for write operation as sst26vf064.

Signed-off-by: Guillaume Socquet <guillaume.socquet@microchip.com>
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 drivers/mtd/spi-nor/sst.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 63bcc97bf978..99c8a19493f5 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -110,7 +110,9 @@ static const struct flash_info sst_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)
+		.fixups = &sst26vf_nor_fixups },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
