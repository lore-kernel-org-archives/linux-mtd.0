Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0062BC48BC1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hovRY4YhhG4egUk9zCRO/uKJDUFQeRsqYD+DIqDe9Wg=; b=kX2LTmx2vWWA1Z
	4o1/4e4Rn84nj1gpb8YQvjM+Q9wAZpsioDxCu0dLSR1byk9J2nSys+WoDHKWJScXJuhr0rmSwqf13
	i6a0AKCRHSSmaqqIWLdzkBgVXL2FpjU1Jm3N/cuZd8TZVLV/lS6x5+4MicYQU7gqo05KVYv5zFy/I
	OYN0Dcav7ia/E1S2trR9sNFcGKZU9dugMBZMCzC3zmw+TV0uaSKFXvxXQQ54WsRGGMAvp5zRYKpem
	SxoPgdHf9XCB3c/9LIEgRAh2/WiJ7pcxBy8s5f9OKTQG7geGNsROyK3tNWjLwJDRX34+1jif18WXf
	m8zh+strF8tEvWOheGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaRn-00000006VkP-1ZCQ;
	Mon, 12 Feb 2024 17:50:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaRk-00000006ViD-17i8
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 17:50:25 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CEQj5x018688;
	Mon, 12 Feb 2024 18:50:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=X5FzM+bKH9CfiJVb/5vMppNol/5mtkgXoVYxjRsJvyc=; b=z2
	/7CTCJwgOTdOfiEWRG7uoiVStPGN4WnYG6/gHzmcZ/MkiK5Mu8+wP5bXfbU5kSbA
	H8MWbiDT9zY0G6HqbWDiaAEjkyRXi/PhQ1df4v/cZwmfgoTzyVEPJ/OkSGUQtwQM
	a46ZgVpMUFvNzGhSHutem3z03C7+yIWC1yOPRZl+u4hQTJmtZEQzuAkpBKjRL0RS
	Cn7VHuTV2g+JLlVMgwk9+hpVsOc9pkX4myqYdFofMSwRFJDn1NzQpuOB/NZQdNPA
	OBdoX5FmNYQaQ837RGpcPwBuUbffgrZdKeqRKIgmZ9SfSmby5i9qdTzJKX/zx0ea
	DKVsx1tbOWyrZy4diD/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6kk4naxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:50:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 073E44002D;
	Mon, 12 Feb 2024 18:50:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66E49275757;
	Mon, 12 Feb 2024 18:49:07 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:49:07 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH 02/12] dt-bindings: memory-controller: st,stm32: add 'power-domains' property
Date: Mon, 12 Feb 2024 18:48:12 +0100
Message-ID: <20240212174822.77734-3-christophe.kerello@foss.st.com>
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
X-CRM114-CacheID: sfid-20240212_095024_658129_D3FE6776 
X-CRM114-Status: UNSURE (   8.31  )
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
Allow a single 'power-domains' entry for STM32 FMC2.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index 12e6afeceffd..84ac6f50a6fc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -36,6 +36,9 @@ properties:
   resets:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   "#address-cells":
     const: 2
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
