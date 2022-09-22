Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD740C6FA91
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qsx3uE3QMHcGb32QmHl3eguvz1p493VplZvyYH/6okE=; b=n0oWUJEKXsp9QX
	IWIYlUYMsFZ/oM+WrqKyybrKzye0C/6h1cmpst3bizrZHqPkjrPNncYscU+kTDXUfkmhf/lHfSJbI
	kSqMv1p7o6bptpvrDHT46zi3646Y8KW2YczERX2prLOZFwy378jyO1X6n1suaeW/+HDZPTcFi8kin
	taCEubsN4WhK2RiUkaDKI9a1nTvuweG3vnd4lOm0NehUtXoix/BH6scqTGzFOmKfpY7lHTbWBJxZw
	hW+Zimj0vzEPKMPua8IYm3+u771MykrVvSldmQHCOA5jQC1YqrFFfzChVyLSlPx7ln8WJujYyTkS2
	9tVh1fZHulHE+1eHbd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMh4-00FpUE-6o; Thu, 22 Sep 2022 13:56:46 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMh1-00FpRc-EG
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 13:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663855003; x=1695391003;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uH6fLxepvYoxrV0OTOeCmCtbOLoVPZEQdEhJ2Ak8uvA=;
  b=iTWCJiFOT5NipUxa2/fTq3a2SvmyRcr5IUW6bLcIoy4zeFiKuNx5+FBP
   re/moeew1wfC191qjZcXeOdD0x2TklJNebmT+ko+rs0xI0pO0DmkaUMmR
   18UlZuLVtViL9E4HdLvg+BYWiGUXG2SAvLtnEwjUqT9jmWWxm+TyFW4U5
   6/Ha/lpyAXmgLNLJTIK/UO4gFM46a8Qbd+wgTk2siQEjgeRHCD0CVD535
   qYW3iAz8TiY6haH2NSsu+81Vinp+ib6OAu5bJkorPFG12nsVtTmOStN3P
   1Nasn/YjvEBe4+Sk/bGvIAGpO2603I6lHnve7V0XK2VRV8eMPyUfQCNbS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="297898438"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="297898438"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 06:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="795098210"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 06:56:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id AD61D238; Thu, 22 Sep 2022 16:56:46 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Date: Thu, 22 Sep 2022 16:56:46 +0300
Message-Id: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_065643_520017_15990A06 
X-CRM114-Status: GOOD (  12.05  )
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

Add support for this 32MB serial flash.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 119b38e6fc2a..7a7f5cb67a9e 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -57,6 +57,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
+	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
