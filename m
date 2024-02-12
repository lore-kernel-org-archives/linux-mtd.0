Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83515C4829E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 17:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f496TMSuKSLGhWZZm9wFCud1s9N1YBlFrTRn+o2rBuk=; b=eVLObT0/rvg45e
	ibT5dw1Kw/gASt9nm4NA2C5yAz2oAaMDMiisE9WLo5AMC81+F8510CtNo3J/ZNYbu2AaAW84Ok5ra
	YYsWfekgqQc3dgGdMk54Qz6F1nRiwm/b5QXPpxkdp5uA8pWt/alCSL907pQ7faYfqgnxAT4R/z/zZ
	yh9Lfw2qXcLujjvjMVeZ51JEHI6ZxXv1Yz31sOhNuihAoPOSeYkv7J9EpdEZqiYhVHO5AtfLRTK1H
	aZiPateCFpiXRi9LyexalaFjYhHdmZfXTZklAeFnFnrQPS768KphlUhvh1UguNk3IKeV2oAY15b6f
	W3vWRlX8kWwGHzP4Ep/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaRs-00000006Vo5-2QLi;
	Mon, 12 Feb 2024 17:50:32 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaRp-00000006Vld-3s9p
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 17:50:31 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CF4fx4002434;
	Mon, 12 Feb 2024 18:50:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=r6RWTYufSQBKqRLetLHxbThC+14OuOlj1dpd6iOn9yk=; b=se
	e1PXtWLwSNmdKoYwsM9aaKpfFhLFdGOS0HpawjkYUzXY7A5uokS//xgmvII+eV2W
	Gkb6Z8DF+jbwcdKHPJy9zd/ujQOZfIYUe1uYqtDonmjClHUnIu165wCB++LvBaz5
	XrKAEOeAUi0g+tvpJcc0hcyp1quuQa4/Xqw6muN6H1DTzxQAAP7sVtbn1TWQSmoI
	P1u7fZNcDh2WrUUEOngO54SCR+QRoiSxbWP3e/fHq8GYJ+NHA6/agaN3bbvKW3JK
	gw5OFyK3aRlWFueIBlRfVsU36kj5QOtWnJPPyAz5rXWVv3qV85gtvpcKwrU7sUNR
	D5EqyH+e0FfUm+ebuK0w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6kk4naxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:50:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C789E40044;
	Mon, 12 Feb 2024 18:50:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51D0B27F265;
	Mon, 12 Feb 2024 18:49:37 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:49:37 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH 04/12] memory: stm32-fmc2-ebi: add MP25 support
Date: Mon, 12 Feb 2024 18:48:14 +0100
Message-ID: <20240212174822.77734-5-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212174822.77734-1-christophe.kerello@foss.st.com>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_095030_317387_B56DA620 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

Add MP25 SOC support. RNB and NWAIT signals are differentiated.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/memory/stm32-fmc2-ebi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 5f82686689ee..d79dcb6c239a 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -1203,11 +1203,19 @@ static const struct stm32_fmc2_ebi_data stm32_fmc2_ebi_mp1_data = {
 	.rnb_for_nand = false,
 };
 
+static const struct stm32_fmc2_ebi_data stm32_fmc2_ebi_mp25_data = {
+	.rnb_for_nand = true,
+};
+
 static const struct of_device_id stm32_fmc2_ebi_match[] = {
 	{
 		.compatible = "st,stm32mp1-fmc2-ebi",
 		.data = &stm32_fmc2_ebi_mp1_data,
 	},
+	{
+		.compatible = "st,stm32mp25-fmc2-ebi",
+		.data = &stm32_fmc2_ebi_mp25_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, stm32_fmc2_ebi_match);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
