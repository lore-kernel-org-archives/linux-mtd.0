Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561BDC3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 14:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25BD520735
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 14:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K3kg6fO+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Kw3F0Qfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25BD520735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ETtLPxMpNtlfLHcOpsTBleoKHDZouUXgXUH9bEVs2Y0=; b=K3kg6fO+p2Mknc
	OzqnAVv8uAIl+Z52Zz3ZzxqU0wC7fREg9SwD8U+wdMK9NOBg59klY506xRX17lrSabmLyczwdkomQ
	FSc5uKi/6lsnZ1t6zvFr8YghU9iulAwLyhmvdm7pUQptPfoT7eDSK81fnI0DM7J1vVE01hcM0RbBH
	gnSBRv9U4RuSbZ6GQ+MIvVtgpFouf74m+oUV1qUm4oGIUSUEqWKLJYJzhrDGfjNscrjbEiwYDYI4g
	tt2qRvvK1HYjP73gacVNY0Pitu/ypT9tL60UwcLtkLS2zkTAAsU2AwAbMO2LZuGw4EGvM3D6XTcXo
	VQcGDSIU/6WSrYZ5cQDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGOYK-0007Vd-Nz; Mon, 23 Mar 2020 14:59:44 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGOYG-0007V9-Ms
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 14:59:42 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02NEbU8j023776; Mon, 23 Mar 2020 15:59:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=yoIK90tuRPwC25Pp82+brJU/Ki+zCwsNgXSgRHpTEmE=;
 b=Kw3F0Qfj9wlZpMlmthXNy16b7cAByjyv0hCtOmt2Vsd0LTpUkldMQtGiZfNnLmwRd0/y
 NjI3EiWmbJ7L5Ou2DGpPjx22IWML4GfSKi4y8Z3eVvUXrd1APMe9MCib1Lh4RrGfZgHE
 b3v6mf1ImKY2r4hPPKcZ4tONCXTprb9rFKMpP1fQgfVBLwky0SiyMIlGjhysdw3jpBEL
 sfTpWzF9+gH+CrawxPi2FU3yHTv0Zl+f+G1bsuUwt/6l6+BeTIT1tdAj9kjYTSvpj2cp
 PBogZxVkcemvcm5Dxt+iiQ92/ynA/cZz5G00YFJ9OUaCd4d4UBvcSRv+XM3kW/1b3qdf ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995ajb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 15:59:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2E8910003A;
 Mon, 23 Mar 2020 15:59:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA321220F81;
 Mon, 23 Mar 2020 15:59:18 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 23 Mar 2020 15:59:18 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <tony@atomide.com>
Subject: [00/12] add STM32 FMC2 controller drivers
Date: Mon, 23 Mar 2020 15:58:40 +0100
Message-ID: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_05:2020-03-21,
 2020-03-23 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_075941_195439_D3011A8E 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: marex@denx.de, Christophe Kerello <christophe.kerello@st.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The FMC2 functional block makes the interface with: synchronous and
asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
peripherals) and NAND flash memories.
Its main purposes are:
  - to translate AXI transactions into the appropriate external device
    protocol
  - to meet the access time requirements of the external devices
All external devices share the addresses, data and control signals with the
controller. Each external device is accessed by means of a unique Chip
Select. The FMC2 performs only one access at a time to an external device.

Christophe Kerello (12):
  dt-bindings: mfd: stm32-fmc2: add STM32 FMC2 controller documentation
  mfd: stm32-fmc2: add STM32 FMC2 controller driver
  bus: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
  mtd: rawnand: stm32_fmc2: manage all errors cases at probe time
  mtd: rawnand: stm32_fmc2: remove useless inline comments
  mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS for timeouts
  mtd: rawnand: stm32_fmc2: cleanup
  mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros
  mtd: rawnand: stm32_fmc2: move all registers
  mtd: rawnand: stm32_fmc2: use regmap APIs
  mtd: rawnand: stm32_fmc2: use stm32_fmc2 structure in nfc controller
  mtd: rawnand: stm32_fmc2: add new MP1 compatible string

 .../devicetree/bindings/mfd/st,stm32-fmc2.yaml     |  370 ++++++
 drivers/bus/Kconfig                                |   11 +
 drivers/bus/Makefile                               |    1 +
 drivers/bus/stm32-fmc2-ebi.c                       | 1093 +++++++++++++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/stm32-fmc2.c                           |  120 ++
 drivers/mtd/nand/raw/Kconfig                       |    3 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             | 1273 +++++++++-----------
 include/linux/mfd/stm32-fmc2.h                     |  226 ++++
 10 files changed, 2407 insertions(+), 703 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
 create mode 100644 drivers/bus/stm32-fmc2-ebi.c
 create mode 100644 drivers/mfd/stm32-fmc2.c
 create mode 100644 include/linux/mfd/stm32-fmc2.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
