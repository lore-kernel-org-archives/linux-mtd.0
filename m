Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4341AC4829E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=34mHnze3j3hFAgKs5zJbDDuGw/RNhNStO2+Fj2NLVXo=; b=bBrYZZSDWCC0OR
	IghBgBdgtSZopyp3SvY2b1ZWHd5o+xtw09Za3P4Z+ZeAPkhzZSKT0HZCr2oSlwhicesm95/Twn8IH
	NNN8ZiVfAMknnwBys3aSXMIsHdBH/+8Wc4p6g7mCEg6DIgZy8BCU+HfTHMBDIdyXdE08lRqp5j3Uv
	xiJHTgiko3Bs7hkKd3RTwwfMUBoZOwvkOBb/Rh5UoWB+Ld9VygNglCDJuNKtuWlA9361VwdUZOc0K
	1ZyFa1IBRA+qdyiwfYzkUvDlfXgGU21ZTOXqNtIAHVNjA9x/aZmWxlkEi0vB340sSMPh2Z7AKsRPx
	vavbbwYgILOnQpwt4pnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaR9-00000006Va7-1NF4;
	Mon, 12 Feb 2024 17:49:47 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaR5-00000006VYM-2rkZ
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 17:49:46 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CBflad027664;
	Mon, 12 Feb 2024 18:49:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=iG9lTCL
	5x6tc33cbUiqDXTjCZznE1C2VEmTB9j9Cvs0=; b=QEG6TZ6HWjBuHT1COxwVc/y
	B2AAMbrvZNHVl3zs8mqxcOSbPuydF4pEuJQoT2OwoDOp6QFtn7pmPugAjPyW8uBv
	L3t5N/5BKibv6CLVWPqjAdhpuCDn3YQ1KpBNLlmPx3B1K8nNNtOxDP+N7crSg2DI
	e+iKUvoZs3nZzv60K8TcyKH0eeXSkJ9WzXh1JOJbz1bzCmLlu/bDfFp9eW1/Uc8f
	8Rk9B/ptw1ZH6Rv73vHCQKhX8WbujlQpgxjcsTCIvtxYR8Ir4smWxSUWnJaH3I30
	r9PfTuiV4eAZi8ZmI/KmTqmR5uEX/qwKDrO5Qqzli6+cft7oaXs4x6Fi2gBDpIQ=
	=
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6mynd420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:49:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CAA840045;
	Mon, 12 Feb 2024 18:49:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AABF427B40C;
	Mon, 12 Feb 2024 18:48:39 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:48:39 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH 00/12] Add MP25 FMC2 support
Date: Mon, 12 Feb 2024 18:48:10 +0100
Message-ID: <20240212174822.77734-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_094944_285146_C1DD19BD 
X-CRM114-Status: UNSURE (   7.07  )
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

Add MP25 SOC support in stm32_fmc2 drivers:
 - Update stm32-fmc2-ebi driver to support FMC2 revision 2 and MP25 SOC.
 - Update stm32_fmc2_nand driver to support FMC2 revision 2 and MP25 SOC.

Christophe Kerello (11):
  dt-bindings: memory-controller: st,stm32: add MP25 support
  memory: stm32-fmc2-ebi: add a platform data structure
  memory: stm32-fmc2-ebi: add MP25 support
  memory: stm32-fmc2-ebi: update the driver to support revision 2
  memory: stm32-fmc2-ebi: add RIF support
  memory: stm32-fmc2-ebi: add runtime PM support
  dt-bindings: mtd: st,stm32: add MP25 support
  mtd: rawnand: stm32_fmc2: use dma_get_slave_caps to get DMA max burst
  mtd: rawnand: stm32_fmc2: add a platform data structure
  mtd: rawnand: stm32_fmc2: add MP25 support
  mtd: rawnand: stm32_fmc2: update the driver to support revision 2

Patrick Delaunay (1):
  dt-bindings: memory-controller: st,stm32: add 'power-domains' property

 .../memory-controllers/st,stm32-fmc2-ebi.yaml |   7 +-
 .../bindings/mtd/st,stm32-fmc2-nand.yaml      |  58 ++-
 drivers/memory/stm32-fmc2-ebi.c               | 445 ++++++++++++++++--
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 108 ++++-
 4 files changed, 547 insertions(+), 71 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
