Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FBDC4363D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 15:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F772074F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 15:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aBJ8wbKo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NAmLbfWo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F772074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v0Vm6wScrjVeS6SEmxYGMfgVIoZXk1tRauSDDJasC0s=; b=aBJ8wbKoJqtpGvygozAksafhf
	OPMT0OtWaUwDXHKLdWMSaealPHJ7EIWmmT8uDC6ltVRfGeHXzX4YNzKuerMOUc4lzJB7SWePYzm0K
	bzKsCGrtEbweobSFc06Nzgm82jrrnsdjHpYWN876MG1Qu9hp1TLagxqxB6u43+3WcmpUXUHhOUZaH
	T2eUsGYeoB3uuWLt4M3nmp3OWEVaOtxARjUQHjWb8wygBFfQvC54WWmV//KQQCCtMMuA4A5XWPheK
	Kd1EL4CFAondqhfXtJQ6T5CulSpyFi/dKMuoVLq27lBb6RMHYqtqpP8Muf1lx4okvC85OefiA7lou
	gHbHhQMLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSTi-0005OP-H2; Mon, 05 Oct 2020 15:32:42 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSTL-0005AC-RX
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 15:32:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095FWGQG088842;
 Mon, 5 Oct 2020 10:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601911936;
 bh=uZInZtZtJm4MRCGYsl8mXs5KzCzMAni/d5k6ekbUqYU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NAmLbfWowLw3K+74mQn0Sw7Kh/OXjSmkrjHmFALEPArSKf/crKE3Ea0IV7lThqiwK
 lPfW5rUEQM0gx5ODY83ySRnOaDXpmPoNGlVGDBsO3ZN1Rq5Ym9So6rZmdAAuPwbUZt
 FbkeVzVGv4cOjhqlliKvrHYWwTLpbl3vXyEOZB48=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095FWGBK010018
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Oct 2020 10:32:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 10:32:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 10:32:16 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095FVdlr052390;
 Mon, 5 Oct 2020 10:32:13 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v16 11/15] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Date: Mon, 5 Oct 2020 21:01:34 +0530
Message-ID: <20201005153138.6437-12-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005153138.6437-1-p.yadav@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_113220_001372_11BBD479 
X-CRM114-Status: GOOD (  14.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A Soft Reset sequence will return the flash to Power-on-Reset (POR)
state. It consists of two commands: Soft Reset Enable and Soft Reset.
Find out if the sequence is supported from BFPT DWORD 16.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h | 1 +
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 drivers/mtd/spi-nor/sfdp.h | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 105a4ddeb309..0a775a7b5606 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -27,6 +27,7 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_4BIT_BP      = BIT(12),
 	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
 	SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
+	SNOR_F_SOFT_RESET	= BIT(15),
 };
 
 struct spi_nor_read_command {
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3efcba5e629a..22cb519efe3f 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -608,6 +608,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 	}
 
+	/* Soft Reset support. */
+	if (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
+		nor->flags |= SNOR_F_SOFT_RESET;
+
 	/* Stop here if not JESD216 rev C or later. */
 	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 6d7243067252..89152ae1cf3e 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -90,6 +90,8 @@ struct sfdp_bfpt {
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
 
+#define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
+
 #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
 #define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
