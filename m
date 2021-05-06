Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799A0C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:20:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2C0661107
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2C0661107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YIUPKqEKFljht6qk2InObXeRhAUxAKOcAYnpx+TK0YQ=; b=SZY+A/79ZWngQZQkDr5zi5470
	Be9qt7o/gINIqUZMU7FfsNuy4KCs+apK3JKTew2lSaIduTo+LKNpwPeWNq7ZKhnHaQYBuunoAdqRk
	i3uaMfC0Ct3o8x72V002wW+cxRbZClqF7Ai5Bz7I2LU/6pJs2ydNP2G4mLNthjQLmgPztcrVtir6c
	h7vYP8kFscyLmY8CV+HYAQbUeJ8MyteAKP0N8fClInHJtRVNOdVhQxoKdxnKLUTD56+jU6gv86od8
	ZxKmkzqqNR4Ip4hRpT80QqTDwAVSQALPKmzsGxePDwCBjF90A3sEJo4v0Wua6WI3lDrptsgsJNtFV
	JSC9XiAOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejWy-0057hN-AT; Thu, 06 May 2021 19:19:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWM-0057Zj-BW
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 19:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=YxdJ0KAQlULOSarEjigNBSaxhdxJcUTtoguFX6Vi1xY=; b=aJh5yhYdNFIX3erTS/OgXC+iEK
 iprGmZ+StMF/+aDo9T5C0ulLbH95JXxzD0cM+/p8FmdMMmxF63ahRXmgdWv8VnLdynYfHOVBn1LZK
 XIsNQv0PLeVr6D7/Zry6trfvMGISXz5cPybb1tY7UPx9LMUrDAwee4N5FxkoGuT2GGKox+0M7+Z6X
 A7wcNYCU8z6ust/OmE0CHJ3/EFoZUxlA6OyOZUfZSEQgUnE3n5A6sB8cDSHlM1KYyGr4rZpZ8eZ66
 mFTfcqEJrupFPF+LQkAMccqWgfbwN1x1N3ipgNmkMwsAjodZgfYG+L9Dl6FMiUPzAfpZvnfKEObfb
 qc7FAGgA==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWJ-006KiC-PO
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 19:18:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146JIin4080687;
 Thu, 6 May 2021 14:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620328724;
 bh=YxdJ0KAQlULOSarEjigNBSaxhdxJcUTtoguFX6Vi1xY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=c0F6JEgYXJkRjwu7ik8WAAmdjETo8cyZg6E2rPbXz4todjem5H3ZMkHJA2074o2hA
 Vg7ZT17zUeG7y2fIiIa0CmTakPwb2PV+pvned4HzXfiih4AMU80HWcYb8wkC3F0CNK
 DIKxLTcYj++aPsPN8Nz8468m/erZn/hFfMsePglk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146JIiDv097500
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 May 2021 14:18:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 14:18:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 14:18:43 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146JIUNF026052;
 Thu, 6 May 2021 14:18:41 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark
 Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 3/6] mtd: spi-nor: micron-st: write 2 bytes when disabling
 Octal DTR mode
Date: Fri, 7 May 2021 00:48:26 +0530
Message-ID: <20210506191829.8271-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210506191829.8271-1-p.yadav@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_121847_924547_B83F4E92 
X-CRM114-Status: GOOD (  18.17  )
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

The Octal DTR configuration is stored in the CFR0V register. This
register is 1 byte wide. But 1 byte long transactions are not allowed in
8D-8D-8D mode. The next byte address contains the CFR1V register, which
contains the number of dummy cycles. This is very fortunate since the
enable path changes the value of this register. Reset the value to its
default when disabling Octal DTR mode. This way, both changes to the
flash state made when enabling can be reverted in one single
transaction.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

 drivers/mtd/spi-nor/micron-st.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..e49bb2f142b3 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -13,6 +13,7 @@
 #define SPINOR_OP_MT_WR_ANY_REG	0x81	/* Write volatile register */
 #define SPINOR_REG_MT_CFR0V	0x00	/* For setting octal DTR mode */
 #define SPINOR_REG_MT_CFR1V	0x01	/* For setting dummy cycles */
+#define SPINOR_REG_MT_CFR1V_DEF	0x1f	/* Default dummy cycles */
 #define SPINOR_MT_OCT_DTR	0xe7	/* Enable Octal DTR. */
 #define SPINOR_MT_EXSPI		0xff	/* Enable Extended SPI (default) */
 
@@ -48,17 +49,28 @@ static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	if (ret)
 		return ret;
 
-	if (enable)
-		*buf = SPINOR_MT_OCT_DTR;
-	else
-		*buf = SPINOR_MT_EXSPI;
+	if (enable) {
+		buf[0] = SPINOR_MT_OCT_DTR;
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. The next register is the dummy
+		 * cycle configuration register. Since the transaction needs to
+		 * be at least 2 bytes wide, set the next register to its
+		 * default value. This also makes sense because the value was
+		 * changed when enabling 8D-8D-8D mode, it should be reset when
+		 * disabling.
+		 */
+		buf[0] = SPINOR_MT_EXSPI;
+		buf[1] = SPINOR_REG_MT_CFR1V_DEF;
+	}
 
 	op = (struct spi_mem_op)
 		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
 			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
 					   SPINOR_REG_MT_CFR0V, 1),
 			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
 
 	if (!enable)
 		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
