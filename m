Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCADC4363A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 16:39:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9AE920790
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 16:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1xoD+3Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="l0b7x730"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9AE920790
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j0sFa4GUtSPv7zMlo3yhp/BVxXDrcAtgdjrH3bCXyF8=; b=Y1xoD+3QxlEiG3txf8giVQunpw
	Ogh4YAV4Nj9y4jPxQ4IArcfnYD3uxEmZGo0u5ee+9vHPR34mMx83XDgsGoXVweWvGqg61ybdcrOPV
	6LUMjgtzM2X+z68Vxe3DcmkEfk8QbBl8TLpdO1fG7HZpkyR/F7IuEL7yxsa+2warW07oXHK8zE3FF
	6ITWj94oj8N9HLbUMd4LNIBzVGD3LMut2n1QlS7H8rT5+vK5HSu+sUwbvxpaTqWjUD5wTPUD7c03m
	Od69SYCr2Fr7MHjbiKyXk54sD2+lzo7Lg4h0qeJLN0P/3um56vGRH2wXaElftQs1PTIWQvhnogLcp
	r2tENV1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYAwj-0007YA-Uj; Thu, 29 Oct 2020 16:38:41 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYAwh-0007X9-GW
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 16:38:41 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TGb2Kh031416; Thu, 29 Oct 2020 17:38:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=e0SSTSVY93gKKrdfyw2yURbWg7WpcuYct8NzXQrNQUE=;
 b=l0b7x730D0ZnX9RjlR/W0MDpvhh/BwJL40PH562kx2ZYV3t168kEuV0uMbhcKZYqZgSk
 5GCZgOqIfIFN5oWMiX1LCRtce+Ll/Xidn3c0ih3WoA018VA+7prmIPb9i9D2BcgUNibF
 e8g5faxpxlWgwcShYJXEp9z+pfh69woPf4ukWLNqH8rq40aZRTpMHkCrP09z8Ohl8kXx
 MES3pUEcfirU2j4i8AeGb1IqIBfKlkqkAQsC5JneejfyxR167x0VYwwvVIz+wZVbVdEp
 K32tEujJyJduHf/ouXHsL5+4biOiBr+qWEmLpPhfpjBKsq5/ic/+eIjlsPTpSNoixsMY 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccfftfxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 17:38:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3389100034;
 Thu, 29 Oct 2020 17:38:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB6F522EE8B;
 Thu, 29 Oct 2020 17:38:31 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct 2020 17:38:31
 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH] mtd: rawnand: stm32_fmc2: fix broken ECC
Date: Thu, 29 Oct 2020 17:38:12 +0100
Message-ID: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_10:2020-10-29,
 2020-10-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_123839_906078_62ED1460 
X-CRM114-Status: GOOD (  18.24  )
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
The default user configuration set in FMC2 driver is lost when
rawnand_dt_init function is called. To avoid to lose the default user
configuration, it is needed to move it in the new user_conf structure.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index b31a581..dc86ac9 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1846,6 +1846,7 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
+	struct nand_device *nanddev;
 	struct resource cres;
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
@@ -1952,10 +1953,11 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
 			 NAND_USES_DMA;
 
-	/* Default ECC settings */
+	/* Default ECC user settings */
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	chip->ecc.size = FMC2_ECC_STEP_SIZE;
-	chip->ecc.strength = FMC2_ECC_BCH8;
+	nanddev = mtd_to_nanddev(mtd);
+	nanddev->ecc.user_conf.step_size = FMC2_ECC_STEP_SIZE;
+	nanddev->ecc.user_conf.strength = FMC2_ECC_BCH8;
 
 	/* Scan to find existence of the device */
 	ret = nand_scan(chip, nand->ncs);
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
