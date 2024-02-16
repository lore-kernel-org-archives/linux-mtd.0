Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3304BC48260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Feb 2024 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYLbxp3QBGdCoLPT+5PbwHOQVt/4pGdsQEf4a5YWFR0=; b=i92UXEDPc0XDjG
	g0TWjhukFQ75d789eht5EmrxQSDGVIL3K8z9DLU254evU/hCNaR9+1Ljy7mOl98n/G1HNlBUs0+52
	EpQ8auPJXDHo5ix+zJJ9+UFYlkbtlF51CAwnBfuEJCPnCYxsGP2C/FJ1zd1PHhbmJa5qAKQMLnXIF
	+wglaYC1i1AXP2nhbMCEGjDX7WVhAKbxzFDw1j2VwyCSLEVN0Q1gY+IifzlFuESB/xncR/nsx/rzW
	f43b5p766yNeM4LJjBzHh0VvtH8qbS/SmUg5cMfcCEYfy2LIr3UAlR7qRr5FmboRKVrLxawbkBqMd
	k5NCadNbN+YQkd265BNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb2Vv-00000003GbC-0tNc;
	Fri, 16 Feb 2024 18:00:43 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb2Vr-00000003GZv-1hUT
	for linux-mtd@lists.infradead.org;
	Fri, 16 Feb 2024 18:00:41 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GFVavx008758;
	Fri, 16 Feb 2024 19:00:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=jJ5ftO6qA0bAbkgyUfXtwPro3bnB89V6hMXoFA1fX/0=; b=Xz
	qy8X/YaHt/8k33pAAt7aZRhVsgVFL3Me4tcPqydMkRXJNewjP8V4MmwnP63N82Au
	jEZPPAyiTU0nbkgT9PBSMU+tHiHt879JqklHFkUSnV/2LSoTA1IRjmD49jbthIxQ
	HMMowLqc67S9ONoxnIqhqltbXdtZ5jl5g8NPD7PlZsO8h/2aS36JNvqRC79CI+fQ
	WtNuO6+MBb8Uby4QrRxGzK3YSXqa0dm3EQyovHV42YGiMMRNBb490h1KkBwVm2EJ
	xSGNSf3CCO2c0OXjc7s8DuInLSFy2xAQreAKn8ZGtlK1P5RoowG/n0mucZIWZWf/
	od4yDgDDQHFSe6PSvGEg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wa124k49t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 19:00:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D02CB40045;
	Fri, 16 Feb 2024 19:00:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 535432951A1;
	Fri, 16 Feb 2024 18:59:35 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 16 Feb
 2024 18:59:34 +0100
Message-ID: <90e6e7a2-97fd-41dc-bde9-43949168f9cd@foss.st.com>
Date: Fri, 16 Feb 2024 18:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Add MP25 FMC2 support
Content-Language: en-US
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240212174822.77734-1-christophe.kerello@foss.st.com>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_17,2024-02-16_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_100040_073605_26D0ED34 
X-CRM114-Status: UNSURE (   8.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2/12/24 18:48, Christophe Kerello wrote:
> Add MP25 SOC support in stm32_fmc2 drivers:
>   - Update stm32-fmc2-ebi driver to support FMC2 revision 2 and MP25 SOC.
>   - Update stm32_fmc2_nand driver to support FMC2 revision 2 and MP25 SOC.
> 

Hi Miquel,

Don't waste time reviewing this first patchset because I rewrote the 
NAND part.
Patch V2 will be sent next week.

Regards,
Christophe Kerello.


> Christophe Kerello (11):
>    dt-bindings: memory-controller: st,stm32: add MP25 support
>    memory: stm32-fmc2-ebi: add a platform data structure
>    memory: stm32-fmc2-ebi: add MP25 support
>    memory: stm32-fmc2-ebi: update the driver to support revision 2
>    memory: stm32-fmc2-ebi: add RIF support
>    memory: stm32-fmc2-ebi: add runtime PM support
>    dt-bindings: mtd: st,stm32: add MP25 support
>    mtd: rawnand: stm32_fmc2: use dma_get_slave_caps to get DMA max burst
>    mtd: rawnand: stm32_fmc2: add a platform data structure
>    mtd: rawnand: stm32_fmc2: add MP25 support
>    mtd: rawnand: stm32_fmc2: update the driver to support revision 2
> 
> Patrick Delaunay (1):
>    dt-bindings: memory-controller: st,stm32: add 'power-domains' property
> 
>   .../memory-controllers/st,stm32-fmc2-ebi.yaml |   7 +-
>   .../bindings/mtd/st,stm32-fmc2-nand.yaml      |  58 ++-
>   drivers/memory/stm32-fmc2-ebi.c               | 445 ++++++++++++++++--
>   drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 108 ++++-
>   4 files changed, 547 insertions(+), 71 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
