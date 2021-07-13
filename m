Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C613C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB06661073
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB06661073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEU8Fc4R3a9KiTth2z+vB9sB3oVQ5Wdk560hvln3eog=; b=PYvIiJtMzWn+j/
	aXShXbxO12to9Dq2c+35K6XWch2Nat3FkliRiBPjw91GadLBGxHbVloawsnGqgN2OvthWX6lMLLMy
	axrABhmqNymTVd3MLVCz0DAekvM0POCbPDyam+/X7w63ZXzYAWCpGUH4XCPdfdew3gInVlq6pYfRw
	OdNeB3mJS4CUSU2xFxXarhCDxx6HaWFUx3cg+Ce6XIhT3JdeRkPEU19vsy15W40zEvHuXIVLtfIux
	HKHq7LphQW28+ypUCkYQLQqpoaBVDstW+3lvJC/jqA52tbZVzQfhZOu29x/60I6xT3hzDPsJwUbGc
	Ydwyff/6uYrtaSCm/dgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3IAo-00ATR8-NF; Tue, 13 Jul 2021 13:10:06 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I7J-00ASMc-Ca
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:31 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD6NBW010788;
 Tue, 13 Jul 2021 08:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181583;
 bh=Z+dB4EvIxzpNpYXg02AgomR/hSRcWS9Lo0ZQW7fNDtc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Oo0S+EXbHEbn2R/Gnz7WiTH5wedw8ONfFwwU9qXVakYoSvaMbphvjBJXxL6kR6/I1
 QT1h1ANyBOncumQIn/knRs183Ir04iaoJoJh3yCyb1YIRyYbKAlw2nc2gvjOegZ8b4
 at82K3v8yAuLpQrqpgU1pl9DrNZmBi9Rwdw8/EDQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD6Nqe004963
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:06:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:06:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:06:23 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daI109825;
 Tue, 13 Jul 2021 08:06:19 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 08/13] mtd: spinand: Reject 8D-8D-8D op_templates if
 octal_dtr_enale() is missing in manufacturer_op
Date: Tue, 13 Jul 2021 13:05:33 +0000
Message-ID: <20210713130538.646-9-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060629_558161_470B7E9A 
X-CRM114-Status: GOOD (  12.31  )
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

The SPI NAND core doesn't know how to switch the flash to Octal DTR
mode (i.e. which operations to perform). If the manufacturer hasn't
implemented the octal_dtr_enable() manufacturer_op, the SPI NAND core
wouldn't be able to switch to 8D-8D-8D mode and will also not be able
to run in 1S-1S-1S mode due to already selected 8D-8D-8D read/write
cache op_templates.

So, avoid choosing a Octal DTR SPI op_template for read_cache,
write_cache and update_cache operations, if the manufacturer_op
octal_dtr_enable() is missing.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 19d8affac058..8711e887b795 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1028,6 +1028,8 @@ static int spinand_manufacturer_match(struct spinand_device *spinand,
 		if (id[0] != manufacturer->id)
 			continue;
 
+		spinand->manufacturer = manufacturer;
+
 		ret = spinand_match_and_init(spinand,
 					     manufacturer->chips,
 					     manufacturer->nchips,
@@ -1035,7 +1037,6 @@ static int spinand_manufacturer_match(struct spinand_device *spinand,
 		if (ret < 0)
 			continue;
 
-		spinand->manufacturer = manufacturer;
 		return 0;
 	}
 	return -ENOTSUPP;
@@ -1097,6 +1098,10 @@ spinand_select_op_variant(struct spinand_device *spinand,
 		unsigned int nbytes;
 		int ret;
 
+		if (spinand_op_is_octal_dtr(&op) &&
+		    !spinand->manufacturer->ops->octal_dtr_enable)
+			continue;
+
 		nbytes = nanddev_per_page_oobsize(nand) +
 			 nanddev_page_size(nand);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
