Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B954AC6FD20
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhhu4Rsyhvrd6Nl6KPeloHjTTGWVL2xJ6w4CaT5eYxo=; b=VsyMlSelI2gams
	9QwDGHOyJDwXF+Bvkr/Dlh69TeDvIYSej6yd9lZQb//mKFINSxrmv+ed2JNb+IWnutCtAPk3T4Z7X
	gIGLglpI9vB0FEw8OMhW1aFi24HALscCeK6fiCBvvIa9HDO4UyVursW9u/yK7XIiRz2325KSJrS96
	HfpsIHXQN0rxYoeczmdYaIiHbHKCcGU0Jg36v2/QGH9lYSt54cVDoWXgiGyBuMlb+nM5q7nyJO0hI
	P7ua9iWbm67P3uGsXygO+ILghjN/u2ASyY7K467RtH4mv2hpci8bXFqN0uPNch23Su0gtgwalcFJX
	m+Yu1875G7U7k6wO++5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjiZ-004uQd-0o;
	Fri, 24 Mar 2023 15:52:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjiV-004uOy-2L
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 15:52:37 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32OFkx41016287;
	Fri, 24 Mar 2023 16:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=lPzs3gk0GyXmQ2Aftj9Ob2Edm9JcZ5gvy9kTYjlmsyw=;
 b=vb3QJElMqA4/yraJ9RhyUE5Y7R/ndem/jA7ohUskL51s5NCgj7A9a+UHDRsXkOMd0WUk
 4tobmyuBWrA+5YBR1nmNp0EAPD6v9I4/3zmb0CjnEI4R5CAQUGOaN+TFQQn7m1O3wkMf
 nbdWUBo0kKQwTZ/lUllecWyBhEIBqtTLNsR5eVmRzGHh015hRWdIEFXJkULNlqRVQq9i
 0c3+eUlLwqqeaFD3Ek6LOE8esHzWeVvdVCTifQHp09dqC4+2HtI4iZ67QHV1kthnIJx8
 ClbqWMcVgBOAKFGc2m9AhymbAjDs7ZHDExJoYDjk4KplOH/jQ/TC89TssU0lyIXMgp+l qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pgxjedkxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 16:52:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 19D86100038;
	Fri, 24 Mar 2023 16:52:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACC11218627;
	Fri, 24 Mar 2023 16:51:42 +0100 (CET)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Mar
 2023 16:51:42 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH 1/2] memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of MACH_STM32MP157
Date: Fri, 24 Mar 2023 16:51:04 +0100
Message-ID: <20230324155105.826063-2-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324155105.826063-1-christophe.kerello@foss.st.com>
References: <20230324155105.826063-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_085236_129380_4A17A609 
X-CRM114-Status: GOOD (  14.70  )
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

To be able to compile the driver on all STM32MP SOCs, we move the
"depends on" on ARCH_STM32.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/memory/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index fac290e48e0b..91774e6ee624 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -228,7 +228,7 @@ config RENESAS_RPCIF
 
 config STM32_FMC2_EBI
 	tristate "Support for FMC2 External Bus Interface on STM32MP SoCs"
-	depends on MACH_STM32MP157 || COMPILE_TEST
+	depends on ARCH_STM32 || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Select this option to enable the STM32 FMC2 External Bus Interface
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
