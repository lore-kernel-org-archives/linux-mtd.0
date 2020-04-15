Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF8AC2BB55
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 15:58:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 274EC20857
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 15:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dja3E3Bo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Du3qQOqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 274EC20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uqw6vziJMhofi2/a99r1tm8k5Xb+co1CMbhccLeLIxE=; b=dja3E3BoA5pvLd
	zr0fe7xxp9pdukJQzceiRvtXSCBe5CNDwq7eJDCikmtzAARAfOkDEKI0PCcwXkOzfVC7IdDNDot5d
	EGZ2G/9thT4ayVyJzB1mKM7ob+AU5PA/WlqYOJNdxeQkwsmwnkh9iIFXHl2jU75qVP521ys6f57ss
	PuWqGiJMUhAiC3gvCCJhk0+kegkF8Qy1VTa5qW0LU2AoaTGn7lkpAGpbbNC57WgFpFrMRUMqw1w+L
	krr9xjNWouUwxJomTkjjh3jRZk6dss0Ubn5VN1JrEZ5KXz6epaHPNDlFD0A6yHu0EoLNFDwLPX3RV
	iEUcI2Z4PCqmk4O2mhHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOkQw-0002qx-F1; Wed, 15 Apr 2020 15:58:38 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOkQr-0002pJ-R8
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 15:58:36 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FFW5Hf032217; Wed, 15 Apr 2020 17:58:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=25grhCA0X75blAO5Q3+BsOtCodm4ez+TgXpHxUqmcPk=;
 b=Du3qQOqROvE191kXxbyLKK3rNuybC6dxETaPya+QqpmMu6r1eNoMUNktUHtPCj4kvv/K
 zdsUFo681t87gK1b+uuyI+3mvYSmMXJ/tyVN0obCbPwi37+TIekKPPv71JfapyPQDukD
 HKJPYsuyn640CFD2HdYgh0SNME/AiQVOYCMa78MdXGa4TdbXJCD86/pI3FEeo4JJVjAS
 eK4cibIgeZfgh4E5tB4IOCLC9MU6lC2EBVrSyPcPTzESRHgAdRx8xbHyR7H3QIM3AnC+
 YisKXfbiJhaGkMIhu0CzyOc1VTAUxcuTc5aDDQuIvXuvjyt6KUg3sJkwfFcWH71idRUF eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn94cxv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 17:58:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C56710003B;
 Wed, 15 Apr 2020 17:58:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34964212FAB;
 Wed, 15 Apr 2020 17:58:13 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 15 Apr 2020 17:58:12 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <tony@atomide.com>
Subject: [PATCH v2 00/12] add STM32 FMC2 controller drivers
Date: Wed, 15 Apr 2020 17:57:24 +0200
Message-ID: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_05:2020-04-14,
 2020-04-15 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_085834_319889_AF3F9280 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

Changes in v2:
 - use of regmap_bulk_write/regmap_bulk_read APIs
 - remove ops from stm32_fmc2 structure
 - add 2 APIs to manage FMC2 enable/disable
 - add 2 APIs to manage FMC2 NWAIT shared signal

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
 drivers/bus/stm32-fmc2-ebi.c                       | 1091 +++++++++++++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/stm32-fmc2.c                           |  136 +++
 drivers/mtd/nand/raw/Kconfig                       |    3 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             | 1277 +++++++++-----------
 include/linux/mfd/stm32-fmc2.h                     |  225 ++++
 10 files changed, 2413 insertions(+), 714 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
 create mode 100644 drivers/bus/stm32-fmc2-ebi.c
 create mode 100644 drivers/mfd/stm32-fmc2.c
 create mode 100644 include/linux/mfd/stm32-fmc2.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
