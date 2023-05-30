Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B15C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 23:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJvJ//YWjTOSyA5vX+3fbJjPuJN/OoPtDQspnDlqabs=; b=guU+QXUZSdslEj
	X89iSRcMz3c+RfY5RH+wy7M4HerbpyWJLc5m3jAYMjNDGdPliZyXXOKfa4z8HGEtcJWsCGnsOmnpC
	Ni3M6oneBQXhZ39CST1FMDKFoqePxisTUxB0ZaT3prmw9CbCeykd7DIGNQdHU19q9ukOzG5gh9wn+
	4JKksVGqOkvxhvHVjvTowjb5W5M6Cd+uU4+i/mA7Iv3Y+mwWAdtQMJ2mFyovpXI+cmSKO05oGJLut
	75SCnsDDHTFt++tf4NYjsBLWM++1ExM+bpd2qpLTli2GpP/gE0yA3xv3/F35as2m4fav/WMiYW6zn
	g2r8Sh9iNRtiG5KuDMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q48do-00FSf7-1K;
	Tue, 30 May 2023 23:20:36 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q48dl-00FSd9-2D
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 23:20:35 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7182C2C02A9;
	Wed, 31 May 2023 11:20:26 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685488826;
	bh=pBukmPQ3it++bc32Xj8MsVYzyzLTR0p/rymwPyFTAGs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BYjlzXQYNAH+TTZndsi3Omsk4q6jlYGG9kp5bOIZWJZES36RecojF+CndtM+n25gG
	 j0zqQw1itQ5Jo3/yk6rjWLj8uRu+Ul5wdCyXeBzIYHrg9NSntophgYpmJDIYJVBTd0
	 MQkPZze968IAHvgBfqNDoDzacGCWFCwiHAbpbx7wUua/QJphwQwkzcbKsthAFokBMR
	 +O9AJkLitZrU0btKCt+sHwSoiIJTKDqBSotwyqaXhpDeBzqR4IPRXjqh7JLQx595dY
	 rr/QVem53M8zH8X1FY/XkqNgOIK+ERtUisSpVUzvPCUfKT+FyIb79kq1+kthtvJjTt
	 R6D5vsK1bn3Og==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B647684ba0000>; Wed, 31 May 2023 11:20:26 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.26; Wed, 31 May 2023 11:20:26 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 31 May 2023 11:20:26 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Wed, 31 May 2023 11:20:25 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
	"vadym.kochan@plvision.eu" <vadym.kochan@plvision.eu>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "enachman@marvell.com"
	<enachman@marvell.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Thread-Topic: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Thread-Index: AQHZkpEvY3k2XQch4kKrVAHkTx0+pa9x9QcAgAC3TIA=
Date: Tue, 30 May 2023 23:20:25 +0000
Message-ID: <bc538264-20f5-03e1-a4a6-6f9f076f15eb@alliedtelesis.co.nz>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
 <a1b2caed-b314-59db-ee00-92fc983150f6@linaro.org>
In-Reply-To: <a1b2caed-b314-59db-ee00-92fc983150f6@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <11A8F379D8E7434AA6EEC968A66617F4@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=jWhIqavZLoxoapoUxmoA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_162034_208888_78122187 
X-CRM114-Status: UNSURE (   8.66  )
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

On 31/05/23 00:24, Krzysztof Kozlowski wrote:
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: marvell,armada-8k-nand-controller
>> +          - const: marvell,armada370-nand-controller
>> +      - enum:
>> +          - marvell,armada370-nand-controller
>> +          - marvell,pxa3xx-nand-controller
> You miss here deprecated compatibles, which are BTW still used. Don't
> drop properties and compatibles during conversion.
Is there any way to indicate that a compatible value is deprecated? I 
know how to mark a property as deprecated but how do I indicate this for 
specific compatible values?
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
