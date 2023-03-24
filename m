Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B333C6FD1C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5jWcMVCrc+QkqdllWVZZKPSE0SxwVk2+ecwje3IGdI=; b=rP/eGuY61TxJb1
	Xxblfp9Xx/s+tzaMLq3+CbsCiP+wpLs6ZM0X0yU5Jlpu3yflwLLZs6EYJjZv2VSqmCNCr8atKTNjC
	+2TLUKZJNCjgNU4qRCvSOHG5hQqxe8qa0JsxlGdKzBsSwMOEDcq0WokWXnPhrDYrAUcAl+QI7+zh0
	LdrTO/8Ewv+hsYrv3W7cnEV9u1tANz+o5/kKwAxt5R66Cag10QJ5t2zGXncns6L18s4AVHFM6uYSZ
	59s6qLRQBIlx2LRlQcls/hqikBPGoLhexN8vyiM+a5BGJsb2y4OSuBW/1GK1dQiukzbrZDAadbJrW
	7a3smLSECf/RMsTnKazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjiZ-004uQk-2g;
	Fri, 24 Mar 2023 15:52:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjiV-004uOo-2a
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 15:52:37 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32ODHvwE010735;
	Fri, 24 Mar 2023 16:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JFtlxCELTTuNK4fwI5IIBKgcJAW7TQM275B47uT8+VM=;
 b=zk5tQtxIrDt3yVQLjCl9PmfjPjSXrkJFdvZxtEDYmLVsTX2OnHyg/jafqNHH5wNAbuKe
 +QjiOIP97uXKdcqCEzwSz59GgFgWRWg6qA+tASLygmgZ6PO0PKk9CtRKgweufXp42Rql
 869FyEtHCXUml+QxmyapVGsvudYdwbD+bKhDnL1QJs96j32o+yeO66tPv9bXE3Ctf4Mh
 9M11dKPwJ0sJr51lAbqKgYIARSESkHrtA1VFIgDGDJRQKuz92Ul4BxzKEpQ6mOOI5yfe
 +gXGA4ORG450d6zcZQgGW/6/cDMhRPL16QGJjqgU90Xp1mrjYkYuTAJWiU2BZTyAsHcq Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pgxjcduna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 16:52:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B4B8100039;
	Fri, 24 Mar 2023 16:52:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 024F6218632;
	Fri, 24 Mar 2023 16:51:52 +0100 (CET)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Mar
 2023 16:51:51 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH 2/2] mtd: rawnand: stm32_fmc2: depends on ARCH_STM32 instead of MACH_STM32MP157
Date: Fri, 24 Mar 2023 16:51:05 +0100
Message-ID: <20230324155105.826063-3-christophe.kerello@foss.st.com>
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
X-CRM114-CacheID: sfid-20230324_085236_148728_0BE50E7A 
X-CRM114-Status: GOOD (  15.21  )
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
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 170f1185ddc4..b523354dfb00 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -373,7 +373,7 @@ config MTD_NAND_TEGRA
 
 config MTD_NAND_STM32_FMC2
 	tristate "Support for NAND controller on STM32MP SoCs"
-	depends on MACH_STM32MP157 || COMPILE_TEST
+	depends on ARCH_STM32 || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Enables support for NAND Flash chips on SoCs containing the FMC2
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
