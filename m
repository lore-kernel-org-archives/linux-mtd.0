Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3502AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DHP4pKw/H07mJm9Rlg7zskwTQGFYSKJaS5puPCfANhg=; b=0FV6EuJE3fj/iD
	EK+cmlSMH3s9t4IDWr0MRxhPqC9nRl21x+JLU0S2sq5HOr+yXRUDnaQLrOs684MQbAZRZStzRxosl
	HL0Vs4qh8fFtktEWbodV+GZSbXzrpsxQo14thjp5y8/4PyDwttthwofcJhC4bJurz498IlH7quaFE
	UISduRZ3RpAtyYpemR6YenQOj4uOb/T22oQLaO8Gr6OdJxwoxCU5zsJohdbBt3UkQ7GADM+7e+2mn
	Y4WsjLBSUXL5iQJMj13raEIMkZC4cd2MOvz74kXmH/hMSq/NrugwEpzgeZVP3BGfeUnbpjbTrCB1L
	bA04bIihtONg56bhyEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myI6s-00BuBq-30; Fri, 17 Dec 2021 18:37:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myHcN-00BfAf-Nk
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 18:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639764367; x=1671300367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UMdgoyG6NtsYmCjMxOwTzNCHfy0C6UOW5FxVk8nPHkk=;
 b=lfM+j5xPzRiAuGJClqOBXZhlZW9Nb4NLsZ84JOj8hYfAbOIavmtL5OlX
 kV21lFv19WWkr49T0dJw4vKAOmZ0ELrB6PN+uxBwb4Hkhc4OGXMBDe6yJ
 ui6jmCLATaapsC+c0QNyMQ/qZi3/tKzsLeqEZAYqv2FIJAEkTNBME5+lL
 ayPkTXUjVufDdncwXA1fTVIngN1I2RjiY6AORvQNs30t9nlJCXA+JtGg0
 QE7S2lZ58tXrDrK3GfopM6GF8WH4UZTavUvJ5VRIhfkBnmdcvJQsBa7Ue
 GVxmPh1hlJMA6OBm09c3ZZ/nAkg6H2yhhE/gk47peotpxEdjW/WLd8732 Q==;
IronPort-SDR: vEVSpamFa48mxBBy23ve2sy1VHh9v2RHagkYWaUEthu5WqlmPqILbhhW8tF51FkmV6VTQ8djDt
 QHoHRsXP1HZBOKpylF5BinYxT3eFTD2+xQX72dtkMBGxZ0vsGCvRaGkplBbFPHGP+7uWT3QpKI
 NZY/FNPS3+24WTij1jnebCBnPKoy5JbYL6iKOnpsonji13aC3fJ800sSBHanUNjBKDK9ROWXNe
 s/GAMdmg0Y6CjDbN1A9f0Y0kSIhUdFgdVsQFGvXi5NOIhhrBfgMijXrWssJeUuI84MzC9pmBNh
 jQaOjmFNcCVRK8Ag/flvK0hH
X-IronPort-AV: E=Sophos;i="5.88,214,1635231600"; d="scan'208";a="142792749"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 11:06:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 11:06:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 11:06:03 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v5 1/2] mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET
 flash_info fixup_flag
Date: Fri, 17 Dec 2021 20:06:00 +0200
Message-ID: <20211217180601.585825-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_100607_946414_7FFBB8B2 
X-CRM114-Status: GOOD (  10.58  )
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
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v5: no changes
v4: no changes
v3: collect R-b
v2: no changes
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
