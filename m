Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27ECC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=At7LMEQ4mgdPA5N3qRR7Y9RdBFJc0BHi075PCG9MRNI=; b=ekYsFtAuygfI9a
	aEpVkjxk8+DoG0SbKUof8WY0rhP+5K/ZVfzulF5cBgPya4lDyd5XWNs4FRcu7zuxaB7yqMJixU0AE
	pi6HL0t4mpKsNuQwuFN+rGB/mWmN52ahxwJp8unu5De/ei9vLUbTx7CS4A3Owg9i6T5sa6ST8XSZJ
	cDxLBXKChyXPBruTVccbQKZhtCuKKXVSs27LD2JTMhKrI1p7j8M9Qu6FM1QtufTSVSSjQ4TpnzB6V
	gK/3y3lrf7jFNzkC0jdUCRHHt3p19QT/nFwUcL+R190PU1LRgRh5fSP7PHgPulAIv2b/JcCAdRRc4
	Z3n0zurUXnkLUvoV7PBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3ZHu-006lPF-Mu; Sat, 01 Jan 2022 07:58:51 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z43-006ilJ-Fy
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:44:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017iN9C066473;
 Sat, 1 Jan 2022 01:44:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641023064;
 bh=2W+ZEwsjEYSO5fmf1B2nM8J2QKPmJ+hSGNrBvEL/lZs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pHDWZqsdgMh1aZWIvPdQAuPltOPp39fsQDbc1PK2uiv7SkSQmBuQ51rW9GCQjqBIw
 pUNBWLJ/bbZp4Jw7XzWujWGN1pPNf0lJj9Evq0rsBWCOWFrPY6BbWRGdyOkc45tkIR
 micv12ireba371ZjduLttFZElAKjFaVk2nbwK9xI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017iNCr091059
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:44:23 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:44:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:44:23 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwk033162;
 Sat, 1 Jan 2022 01:44:18 -0600
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Daniel Palmer <daniel@0x0f.com>, Alexander
 Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v3 15/17] mtd: spianand: winbond: Add change_mode()
 manufacturer_ops
Date: Sat, 1 Jan 2022 13:12:48 +0530
Message-ID: <20220101074250.14443-16-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234431_669382_0A87D73B 
X-CRM114-Status: GOOD (  10.61  )
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

Add implementation of change_mode() for Winbond's manufacturer_ops,
that executes octal_dtr_enable() and octal_dtr_disable() according
to requested protocol.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/winbond.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index c7478faf6cee..d8eccb40c80f 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -242,8 +242,33 @@ static int winbond_spinand_octal_dtr_disable(struct spinand_device *spinand)
 	return 0;
 }
 
+static int winbond_change_spi_mode(struct spinand_device *spinand,
+				   const enum spinand_protocol protocol)
+{
+	if (spinand->protocol == protocol)
+		return 0;
+
+	switch (spinand->protocol) {
+	case SPINAND_1S_1S_1S:
+		if (protocol == SPINAND_8D_8D_8D)
+			return winbond_spinand_octal_dtr_enable(spinand);
+		break;
+
+	case SPINAND_8D_8D_8D:
+		if (protocol == SPINAND_1S_1S_1S)
+			return winbond_spinand_octal_dtr_disable(spinand);
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
 static const struct spinand_manufacturer_ops winbond_spinand_manuf_ops = {
 	.init = winbond_spinand_init,
+	.change_mode = winbond_change_spi_mode,
 };
 
 const struct spinand_manufacturer winbond_spinand_manufacturer = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
