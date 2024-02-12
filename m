Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0962DC48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYU1CwnUUkXPdhhaMWypXEiEN7iUQZZQzOkBi8YxSq0=; b=ZP2VxoiL60xAak
	b9Dx0FbZqRNTr5YialMs6ea4uKJ1c60vUGHiPI0wqU4wP7PAkcY6hrk6ajS7adwgM0s5B8E1cHKCq
	WnWJktcilbYN8pYLq+z5zSROCFg5D3+ZqRzm+pWR7u7PPZkcLB45XVmd6cciRPvDxvLRbsWQyrK1E
	0eqrsGw+sqXsrAyjZb2A5C+SNxvkZ8bcHnmuVIRkUQM7msRHaTHANF7TvJSgIAcRAab2+GZPkipdC
	zfNh2eZXGu1koqKLhIVXgc7u7GIh1b+SfA200z9QWyTGmHsFXUQiw+ZLQwBeOpz7GEpcDkKOUwOc7
	rzJ7BUil5wj+JOW/a4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaRl-00000006Vja-42wl;
	Mon, 12 Feb 2024 17:50:25 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaRi-00000006Vh8-0svs
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 17:50:24 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CEj6w1026608;
	Mon, 12 Feb 2024 18:50:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=3QGuapQ1pMl6+y67XtYFOHf0HELLIV7lP4kRD4q7dGc=; b=kv
	7eBtXBOnk2vof/1QkqQStAzmjfQk188Zth72pzIOVoXj7LJ5ZQXqArIBmr+op7V2
	I6M25m+XnjZgPdPUN1mE1TdVkPctX0kzzvAHtYFrvZWQ47+NEDRL7/Kf+tKaooM+
	NDIlQkFoPhFNhA/OboFiSt7by8+De/zBBQTXpI50+163O2mc89/eFwLkaT91uUxJ
	SjtfKX0XzZZb9ZChDIMFO0SU+EuNgw9Gt+zRpUjw5atePLUG0WS9IP0qcLYxMfoS
	GohF0d+haoWDiocH9B9FcNxskYtyzYBsQKDLAVosjFhbPrRw7RWMGyNbRCxqHGbZ
	cpExAoRDoVhsuwS1JiUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6kk4naxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:50:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E44A240049;
	Mon, 12 Feb 2024 18:50:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B54EE27CC12;
	Mon, 12 Feb 2024 18:48:52 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:48:52 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH 01/12] dt-bindings: memory-controller: st,stm32: add MP25 support
Date: Mon, 12 Feb 2024 18:48:11 +0100
Message-ID: <20240212174822.77734-2-christophe.kerello@foss.st.com>
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
X-CRM114-CacheID: sfid-20240212_095022_569070_FEF916D0 
X-CRM114-Status: UNSURE (   9.09  )
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

Add a new compatible string to support MP25 SOC.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index 14f1833d37c9..12e6afeceffd 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -23,7 +23,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32mp1-fmc2-ebi
+    enum:
+      - st,stm32mp1-fmc2-ebi
+      - st,stm32mp25-fmc2-ebi
 
   reg:
     maxItems: 1
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
