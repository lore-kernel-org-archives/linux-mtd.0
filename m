Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAD4C4363A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 13:35:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 494832076E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 13:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHMMs884";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="U08f8vbd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 494832076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OJ8kyV5qfUbB8XwS7FtMfc+vDNsxqiRVvDellJ6Ma8g=; b=IHMMs8844ixsiFinSKVtZU922t
	3Pum9KVI+xa0J+KpKPU9NT5H0wzVImX0tiA3kXkGS5OG2JA6OfD+CCNIFfRzlJRxdGJ2kS37LVmaW
	A1N/ZKcXmh624gAqqDV2wPVx+b5WgpPXhuuFtL4AS7AEKQcOSXgWYX3s9p8F4ENIyuccq71sHtnOs
	IteD+k4ipxEiO5OrGN8ye+H/bDHqsoMXINpWRKDHXd9JxDoYYNJ4RahcMhQIT9MNFJPe6rA21gPPv
	wU1/lODhYEDc+Sv4XGgV01LErVFp8b5uAA5Kgg1Go7Z9/vgyPD/tSdLCyNBbr7yoyknUi6bln5OH3
	IpEm82EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYUXl-0000TN-Q7; Fri, 30 Oct 2020 13:34:13 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYUXh-0000Sg-JK
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 13:34:11 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UDWJt9007267; Fri, 30 Oct 2020 14:34:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9xPycxgddNCQRIwCKrfgnU5GFmmuJ6NyQaq4vP1TrmY=;
 b=U08f8vbdA9Td2YH4t+3PGJY6Ey2UrD9yBjtsmGtZcwdLUW0858O+Q7WB2m3dpbxJrvH/
 5yFaXicbRaSsMOyODIJfiNPkLxF9p6ryTMZO2W/H9OnAZFnKot7Y+wnHf5rh3Z6ftT5M
 /vDOdHIz4fBpvj71bTtUiBDrQc1hHlgdapvyW8ZZq9HbVrWMFvDFu2QnZQW+wFUBBpwp
 XqtF0HCPE9Ds1gf8cygUJVZeBnV9bbJGbGiDrmARw/Vs1j+1Bo/RHfmM2cuCpYp5NG3R
 cVEJHw7fVgGPWEkLgyHioSlOc3Nj65uWS6RbVPdctXV9yE4DkMfUrDLZwG2n7JD+ma8e Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccmrgxsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 14:34:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E022100034;
 Fri, 30 Oct 2020 14:34:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 496FE20DDA6;
 Fri, 30 Oct 2020 14:34:03 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct 2020 14:34:02
 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH v2] mtd: rawnand: stm32_fmc2: fix broken ECC
Date: Fri, 30 Oct 2020 14:33:39 +0100
Message-ID: <1604064819-26861-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-30_04:2020-10-30,
 2020-10-30 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_093410_445966_BA1AB24A 
X-CRM114-Status: GOOD (  19.55  )
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
Cc: Christophe Kerello <christophe.kerello@st.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework user
input parsing bits"), ECC are broken in FMC2 driver in case of
nand-ecc-step-size and nand-ecc-strength are not set in the device tree.
To avoid this issue, the default settings are now set in
stm32_fmc2_nfc_attach_chip function.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
---
Changes in v2:
 - move default ECC settings in stm32_fmc2_nfc_attach_chip function.

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index b31a581..550bda4 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1708,6 +1708,13 @@ static int stm32_fmc2_nfc_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
+	/* Default ECC settings in case they are not set in the device tree */
+	if (!chip->ecc.size)
+		chip->ecc.size = FMC2_ECC_STEP_SIZE;
+
+	if (!chip->ecc.strength)
+		chip->ecc.strength = FMC2_ECC_BCH8;
+
 	ret = nand_ecc_choose_conf(chip, &stm32_fmc2_nfc_ecc_caps,
 				   mtd->oobsize - FMC2_BBM_LEN);
 	if (ret) {
@@ -1727,8 +1734,7 @@ static int stm32_fmc2_nfc_attach_chip(struct nand_chip *chip)
 
 	mtd_set_ooblayout(mtd, &stm32_fmc2_nfc_ooblayout_ops);
 
-	if (chip->options & NAND_BUSWIDTH_16)
-		stm32_fmc2_nfc_set_buswidth_16(nfc, true);
+	stm32_fmc2_nfc_setup(chip);
 
 	return 0;
 }
@@ -1952,11 +1958,6 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
 			 NAND_USES_DMA;
 
-	/* Default ECC settings */
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	chip->ecc.size = FMC2_ECC_STEP_SIZE;
-	chip->ecc.strength = FMC2_ECC_BCH8;
-
 	/* Scan to find existence of the device */
 	ret = nand_scan(chip, nand->ncs);
 	if (ret)
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
