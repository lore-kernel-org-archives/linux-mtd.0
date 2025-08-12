Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1252CA0EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IVUaIoDClcMm3g2SIhyG8w8oou5T8hbFeLNlo6twm+M=; b=MGT9Cr+ijN9k15
	F5gy1jRf8DmhXRhxiOnxEy3s/+/TXLGI/FbCht96hM/Qpnht9hwWbyCBAV188MTaDZ0r/Rl2tMwoT
	QStNRZSmIL4fOolRAVWFiKjTo0f3sRXk8RrCF8hhNpWf64tU381dqry0xL5ClBPmg2kCQ8t8RmBPl
	S4zQeNsWWAtN3+3KQGx5xqhDYqB7SOdWxtXN+fvT7Le4jZuiXyCJQBP8ztalXhSbyxiOCQLhFjzGf
	OFTxig43h5AL7Uit8TMg6RJPDsIRMpacFor35EVgopvQmj+az+04w9vmJso7C9lDKdvbUypn5Prs5
	GV6xtzQprAGJdPPGOs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljXI-0000000A85i-3Fa1;
	Tue, 12 Aug 2025 07:35:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljUU-0000000A7bX-2u8V;
	Tue, 12 Aug 2025 07:32:16 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C7IRVx020079;
	Tue, 12 Aug 2025 09:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=kKzblfJnewqfnHkkVYa4YD
	iRnQ2gHOTdHxuje0MFec4=; b=ZIPxJktFdjnmzaFfOUtkQ7bXbmPJI+TSc4mliP
	fb1SHOp4O/wHTp2l1szOCsiUlGlh0GDvjDxxoLXfCQU1o5U3BRKJRwlG6J0gA1hZ
	66iL25umfyUziZDgki2XAKb8uRymIolCbS8hqGD8a434ykGWOzMKwSEu4Q4BLo1e
	ExGk4veL7N1ziUqhIwse/NfA/o5JZF7v7adQrDVwUXJXcZqAEi1ScGcVhguRxMiT
	s8t9bI/7iqn/uRRizk9Ex5225v3rW1TKv1wl9/+78KJR09xJDnBbHtF2+JWH4/Qj
	ghP0Srs+8YYhviDuMSpZWTzF9P3CyLHmCAZUi64yQYb1K8Nw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48efw4q6pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:32:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5462240044;
	Tue, 12 Aug 2025 09:30:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E005D747A8E;
	Tue, 12 Aug 2025 09:30:13 +0200 (CEST)
Received: from localhost (10.48.87.65) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 09:30:13 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
Date: Tue, 12 Aug 2025 09:30:08 +0200
Subject: [PATCH] mtd: rawnand: stm32_fmc2: fix ECC overwrite
MIME-Version: 1.0
Message-ID: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAH/tmmgC/x2MQQ5AMBAAvyJ7tknb0KqviAO12AuylZKIv2scJ
 5mZByIJU4S2eEAoceR9y6DLAsI6bAshT5nBKFOrRmuc+UYKAfdEcgmfhN5bMzrnnass5O4QytL
 /7Pr3/QDFtYbCYwAAAA==
X-Change-ID: 20250811-fix-ecc-overwrite-9962b7797746
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Kerello <christophe.kerello@st.com>,
        Boris Brezillon
	<bbrezillon@kernel.org>
CC: <linux-mtd@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.65]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_003215_238399_4B858D94 
X-CRM114-Status: GOOD (  11.60  )
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

In case OOB write is requested during a data write, ECC is currently
lost. Avoid this issue by only writing in the free spare area.
This issue has been seen with a YAFFS2 file system.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: stable@vger.kernel.org
Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index a960403081f11091837b73b8610231fe421d0c05..f84f23392fa441327bec90ba12a2a57d825d9330 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -996,9 +996,21 @@ static int stm32_fmc2_nfc_seq_write(struct nand_chip *chip, const u8 *buf,
 
 	/* Write oob */
 	if (oob_required) {
-		ret = nand_change_write_column_op(chip, mtd->writesize,
-						  chip->oob_poi, mtd->oobsize,
-						  false);
+		unsigned int offset_in_page = mtd->writesize;
+		const void *buf = chip->oob_poi;
+		unsigned int len = mtd->oobsize;
+
+		if (!raw) {
+			struct mtd_oob_region oob_free;
+
+			mtd_ooblayout_free(mtd, 0, &oob_free);
+			offset_in_page += oob_free.offset;
+			buf += oob_free.offset;
+			len = oob_free.length;
+		}
+
+		ret = nand_change_write_column_op(chip, offset_in_page,
+						  buf, len, false);
 		if (ret)
 			return ret;
 	}

---
base-commit: fb2fae70e7e985c4acb1ad96110d8b98bb64a87c
change-id: 20250811-fix-ecc-overwrite-9962b7797746

Best regards,
-- 
Christophe Kerello <christophe.kerello@foss.st.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
