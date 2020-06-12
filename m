Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4394EC433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 15:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A17A20897
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 15:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rVHXOSPI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="V3oHbThV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A17A20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Mm9+vC4o13hNs5/c7o0yGfHbOj8r7I1IXSQSvc8RAQ=; b=rVHXOSPIC5YdnY
	GUylYzY3ezfuE5/nvGRLoDQsKkFYidg4ga181yh6dzdzBtORm/Ib3Xl82VMp9CoEN/Mx7SnlnFd2a
	3xYF+uxXpuG/VaT4yxjQ1gy0oteQrMpgyieCByb2yZKiBH+cXVT/uQT1dQVQV8oJvccTzQYU7kogS
	x827/IrrrmRLNRuq0SBCCk/tmqPpwqYyBdAGIpe+dSgvvD9T/t1GmOMDtAW/CteBpDSr/++bMODy0
	i4FOSb07C1Z1Y+R03IYFVCINrRqhBGRP6XzVLJ3CSBUjuft6EpoRQ1p/A2lAdygG7R7ojbIiM7nSA
	1oezxgVO9Xfg0ZUmtFtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjlWn-00023p-5X; Fri, 12 Jun 2020 15:23:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjlWh-00022s-Jl
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 15:23:29 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05CF1VeH016986; Fri, 12 Jun 2020 17:23:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ZNCgFY29ushPSChdQisNmd/nPHJRu5GNLEvEuVDL5BM=;
 b=V3oHbThVFkfRLV1aqUq4Dvf3ONhnmS7OuMBOhlANd777f+fD9tVVoIHaEwJ4vgFpvSZg
 ny2jfjYOv8WKIkMSjIjFTk1FrvIB5BnbeNpKH6maohfuQ408ijgATIlmvcpp/WGF8ken
 yhOmcT8+nBDSVFsBEFSOcrzGFWyKtA25YStyyT1nOgNdn/yyBXg0p/abfGQW5Mu3KYKX
 nh9D9z8m9I6iztupBtDMJEcYx/OnMXF3EgJXK8zxXq0gOzsqig1v2pffJtgeN0ILZPS+
 ieUcR3UoocZX38owaQxDBdc4zbuFRzQM5+meJgD+bGymcZCR8WxA2oGIDZ2Qx+LWV0Ay LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g097s1j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 17:23:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF14210002A;
 Fri, 12 Jun 2020 17:23:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 960112B9918;
 Fri, 12 Jun 2020 17:23:12 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 12 Jun 2020 17:23:11 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <arnd@linaro.org>,
 <alexandre.torgue@st.com>
Subject: [PATCH v5 0/6] add STM32 FMC2 EBI controller driver
Date: Fri, 12 Jun 2020 17:22:36 +0200
Message-ID: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_11:2020-06-12,
 2020-06-12 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_082327_995316_D3D76F8A 
X-CRM114-Status: GOOD (  14.93  )
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

Changes in v5:
 - NAND:
   - do not display errors if the driver is deferred.
   - look at the parent compatible string to match what we expect.
 - bindings:
   - add Rob reviewed-by tag on patch 3.
   - fix indent descriptions.
   - add new NFC compatible string to handle reg number of entries. 

Changes in v4:
 - bindings:
   - fix filename: st,stm32-fmc2-ebi.yaml

Changes in v3:
 - NAND:
   - rename labels used on errors
   - add in the commit log the reason to increase FMC2_TIMEOUT_MS (patch 3)
   - add Miquel reviewed-by tag (patches 2/4/5/9)
 - EBI:
   - move in memory folder
   - merge MFD and BUS drivers to avoid a MFD driver
 - bindings:
   - pattern name has been modified
   - vendor properties have been modified
     - s/_/-/
     - add unit suffix (-ns) on timing properties

Christophe Kerello (6):
  mtd: rawnand: stm32_fmc2: do not display errors if the driver is
    deferred
  dt-bindings: mtd: update STM32 FMC2 NAND controller documentation
  dt-bindings: memory-controller: add STM32 FMC2 EBI controller
    documentation
  memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
  mtd: rawnand: stm32_fmc2: use regmap APIs
  mtd: rawnand: stm32_fmc2: get resources from parent node

 .../memory-controllers/st,stm32-fmc2-ebi.yaml      |  252 ++++
 .../bindings/mtd/st,stm32-fmc2-nand.yaml           |   83 +-
 drivers/memory/Kconfig                             |   10 +
 drivers/memory/Makefile                            |    1 +
 drivers/memory/stm32-fmc2-ebi.c                    | 1206 ++++++++++++++++++++
 drivers/mtd/nand/raw/Kconfig                       |    1 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  311 ++---
 7 files changed, 1688 insertions(+), 176 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
 create mode 100644 drivers/memory/stm32-fmc2-ebi.c

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
