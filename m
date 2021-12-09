Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ACDC43217
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=51XFg/SIDHHAQ/Ael/NuALIC7MVLLi00KwLddBXjrEU=; b=bm+hnCrqeZMa/J
	QR+lnbpaBNTUe7QUPDE/IABp6Nj/3CReEdvm/nLtloWz95ENbTj3URA1MADiliIJtpqaHXKchX797
	rxca+H8s48bUKMXIUV57JaLHotPkxbGfgKx3QezPRqJhGDmnN9DjVFhlFrHbfG+dlKncezYxqlfVj
	KkdLRl7yU8SPOC+wOP0zb3Ooz7kQqcCTi9HWx1urNh1NUrKSQhufSjvkSbFDd4Y+2zOZVkXJWHPAG
	mXW7uiz0CQhvpAYpnSkprwpalRD2WqFszaftoLk+6Y8MK9gvwKmjXj9MbTcrO3WbOE0dDoksyvd9k
	q/KAWyrDAzKuUQXelFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvN6g-00GwGg-J9; Thu, 09 Dec 2021 17:21:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvN6b-00GwEw-8c
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 17:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639070477; x=1670606477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vxKWOQzwqDV/635r6yfLu/pg7KV7X8iCTbkJjrkvp8I=;
 b=oT/tFkbo1lEsCMKrZRNhNgy+AaGoSw7dxQbQ0Nx2Ba+aKOSgZsDsBVmk
 Um9Z/q4iERwSkyLXX7LhfiZN9ZVm5CzyujPH1sved5KZZN+oDCzIMOP+L
 bgD+2eiiLvYbcqZywHr2yhS18Z18XO3LCUtAIig4U5nWe+3LC24BxlQzR
 L3yMMjeT9xM2ZuKTIjDVWmiWNnMbYLhH4TKeFyWyqVs+eDcQ5MjhvyNv2
 a5aoiVUbiIwdByobbDe1BdDTA7LiGsLFAJAYnGBsqsARhOXwJvZrL1nux
 UjtYxHOFRkOumU2LVJUot4kM4C3f4KGg7JO1xdfw+pb/k12mmmgMbEZ+t A==;
IronPort-SDR: wM3TKeiOe4o3X1pUVKAfdHHkb7rloHvDKZb+Ep4ttfYLV1OGAzkgparxSWBr/saNUW/UrUia1M
 9hNNwAaeYOr3hAyOwNfuggBf1XtLQE1nI8ny/DmG+IaWPOl+lUI45wsP0sZ8uxnEVC5hMwyUky
 quzPJmOA3BtSSVQhoBaX/pk7+ndtGM3MAM6UHvrFEs35IC47wW78RobQT0TQ2uphYDjH3qhUYS
 glttgGuJwo58yDZGDU3nKodC1eKfD2dpX5gWfgfuydUt7IRobwIVtFyAYFvvwMS57nechXsU5w
 i5hMsj+c4ZEvuT2nWvCHU4Kt
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="154908042"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2021 10:21:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 9 Dec 2021 10:21:14 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 9 Dec 2021 10:21:11 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET
 flash_info fixup_flag
Date: Thu, 9 Dec 2021 19:21:07 +0200
Message-ID: <20211209172109.398258-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_092117_333272_D7AA6813 
X-CRM114-Status: GOOD (  11.58  )
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

The Soft Reset and Rescue Sequence Support is defined in BFPT_DWORD(16)
starting with JESD216A. The first version of SFDP, JESD216 (April 2011),
defines just the first 9 BFPT DWORDS, thus it does not contain information
about the Software Reset and Rescue Support. Since this support can not
be discovered by parsing the first SFDP version, introduce a flash_info
fixup_flag that will be used either by flashes that define
JESD216 (April 2011) or by flashes that do not define SFDP at all.
In case a flash defines BFPT_DWORD(16) but with wrong values, one should
instead use a post_bfpt() hook and set SNOR_F_SOFT_RESET.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 3 +++
 drivers/mtd/spi-nor/core.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2e21d5ac0e2d..32d80fdaa2a2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2699,6 +2699,9 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 
 	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
+	if (fixup_flags & SPI_NOR_SOFT_RESET)
+		nor->flags |= SNOR_F_SOFT_RESET;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2afb610853a9..70c6bb7f5f04 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -373,6 +373,8 @@ struct spi_nor_fixups {
  *                            memory size above 128Mib.
  *   SPI_NOR_IO_MODE_EN_VOLATILE: flash enables the best available I/O mode
  *                            via a volatile bit.
+ *   SPI_NOR_SOFT_RESET:      flash supports software reset enable, reset
+ *                            sequence.
  * @mfr_flags:      manufacturer private flags. Used in the manufacturer fixup
  *                  hooks to differentiate support between flashes of the same
  *                  manufacturer.
@@ -416,6 +418,7 @@ struct flash_info {
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
 #define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
+#define SPI_NOR_SOFT_RESET		BIT(2)
 
 	u8 mfr_flags;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
