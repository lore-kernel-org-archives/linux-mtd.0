Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF45C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 21:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khjYbI8Mt+fEpQaiSYOAuS70t66I04f5z3JxoDQtXNk=; b=2ewWabfSGlCt1b
	CXPZ5m9ZBg1ElSxJJN2/vgu4ovQcR+AjW4sQPxtJbTKYkNC0R/lat03udbQhLmvB7WkU3ZCNLWdPX
	w+XmoUK5BIl2NiU5SYMOoBDWcpZrRSurvs8S2FIw942lyE//SS2sW1toC7vW1IGtisxROtUV7XgSK
	MuEHx3aFjQ/IS3GBY69zsc2lkQfA2Egub2OrJkIxANJ3Tnv30gZDbsTvf1+jkyFT4IA0NicXcWFv4
	XtLmb4OncCxteHDX5mV4rvAjMIP4UNEK/wwfJXxvPP8IV0SVPBWgTRsCmoWSvXIcBztq0G2KjEEnU
	+7AXuXD5zePOs5hxWqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q46RK-00F926-1v;
	Tue, 30 May 2023 20:59:34 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q46RF-00F90L-1m
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 20:59:31 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 075D92C0596;
	Wed, 31 May 2023 08:59:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685480360;
	bh=PBjB3x4Da7R7TpfstPuHs+sIxaQk8nENaOGkEpE5qtQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=pOzNHpaz1NG0hXZBt0V94hy2P9aj14wKaqHp509UwOd1nNBzemAHrK6pHcoWGh218
	 p+05TD5BLxtu3Z2/QVK7Uhv56ROPJ4yusOEUTKdDz/UCKGczdS1kEMs86ZA0Hu+FUN
	 wu/jujAmHbTvFn15P5Z7bymwu6n3ICf5ky3L+IWDllkqVjQaELhWt6uOSMjnZevWAg
	 CGn/k1fhhYqVx1PBKKP5d4gwK62nbyJoLfBm4sAsLTbRgsVb6ckp4HmBpibFK7PLqO
	 Mq3FZ9QhxiI9ZRLj19YYC7FWJgMyv1Gy4Dvt+3dn19AuJcyQQ24s5exW+LSSGA8WiS
	 gbxXT6EBSZfWw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B647663a70000>; Wed, 31 May 2023 08:59:19 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 May 2023 08:59:19 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Wed, 31 May 2023 08:59:19 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"vadym.kochan@plvision.eu" <vadym.kochan@plvision.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"enachman@marvell.com" <enachman@marvell.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Thread-Topic: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Thread-Index: AQHZkpEvY3k2XQch4kKrVAHkTx0+pa9x9ZmAgACPToA=
Date: Tue, 30 May 2023 20:59:19 +0000
Message-ID: <c030b2c5-2f44-72c7-f06f-9fa7b9247992@alliedtelesis.co.nz>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
 <20230530122625.7zu3ey5dnn6izeli@krzk-bin>
In-Reply-To: <20230530122625.7zu3ey5dnn6izeli@krzk-bin>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <5E9CA2666FDA994A94BC77746B7458E3@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=g8kJ_gb0AAAA:8 a=62ntRvTiAAAA:8 a=voM4FWlXAAAA:8 a=bzQKzZmY9NnqJuOzxnoA:9 a=QEXdDO2ut3YA:10 a=ecSNLfPMzbq-p5zXJZOg:22 a=pToNdpNmrtiFLRE6bQ9Z:22 a=IC2XNlieTeVoXbcui8wp:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_135929_758751_C3CAEB7A 
X-CRM114-Status: GOOD (  23.78  )
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


On 31/05/23 00:26, Krzysztof Kozlowski wrote:
> On Tue, 30 May 2023 12:53:36 +1200, Chris Packham wrote:
>> From: Vadym Kochan <vadym.kochan@plvision.eu>
>>
>> Switch the DT binding to a YAML schema to enable the DT validation.
>>
>> Dropped deprecated compatibles and properties described in txt file.
>>
>> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>
>> Notes:
>>      Changes in v6:
>>      - remove properties covered by nand-controller.yaml
>>      - add example using armada-8k compatible
>>
>>      earlier changes:
>>
>>      v5:
>>         1) Get back "label" and "partitions" properties but without
>>            ref to the "partition.yaml" which was wrongly used.
>>
>>         2) Add "additionalProperties: false" for nand@ because all possible
>>            properties are described.
>>
>>      v4:
>>         1) Remove "label" and "partitions" properties
>>
>>         2) Use 2 clocks for A7K/8K platform which is a requirement
>>
>>      v3:
>>        1) Remove txt version from the MAINTAINERS list
>>
>>        2) Use enum for some of compatible strings
>>
>>        3) Drop:
>>              #address-cells
>>              #size-cells:
>>
>>           as they are inherited from the nand-controller.yaml
>>
>>        4) Add restriction to use 2 clocks for A8K SoC
>>
>>        5) Dropped description for clock-names and extend it with
>>           minItems: 1
>>
>>        6) Drop description for "dmas"
>>
>>        7) Use "unevalautedProperties: false"
>>
>>        8) Drop quites from yaml refs.
>>
>>        9) Use 4-space indentation for the example section
>>
>>      v2:
>>        1) Fixed warning by yamllint with incorrect indentation for compatible list
>>
>>   .../bindings/mtd/marvell,nand-controller.yaml | 190 ++++++++++++++++++
>>   .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
>>   MAINTAINERS                                   |   1 -
>>   3 files changed, 190 insertions(+), 127 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://scanmail.trustwave.com/?c=20988&d=-uv15DQ4yN1qOuZLco1jWqY7o8cBk1EQuTpwPcj4lA&u=https%3a%2f%2fpatchwork%2eozlabs%2eorg%2fpatch%2f1787248
^^^ apologies for this, it's ironic that a security feature on our email 
gateway makes links look _more_ like malicious URLs.
> nand@720000: $nodename:0: 'nand@720000' does not match '^nand-controller(@.*)?'
> 	arch/arm64/boot/dts/marvell/armada-7040-db.dtb
> 	arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-db.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-db.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb
> 	arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb
> 	arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb
> 	arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9130-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9130-db.dtb
> 	arch/arm64/boot/dts/marvell/cn9131-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9131-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9131-db.dtb
> 	arch/arm64/boot/dts/marvell/cn9131-db.dtb
> 	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9132-db.dtb
> 	arch/arm64/boot/dts/marvell/cn9132-db.dtb
> 	arch/arm64/boot/dts/marvell/cn9132-db.dtb
This is resolved in patch 2/2. I can swap the order in the series if it 
helps.
> nand@720000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
> 	arch/arm64/boot/dts/marvell/cn9130-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9131-db-B.dtb
> 	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
I don't see these when I run dtbs_check
> nand-controller@43100000: clock-names: ['core'] is too short
> 	arch/arm/boot/dts/pxa300-raumfeld-connector.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dtb
>
> nand-controller@43100000: dma-names:0: 'rxtx' was expected
> 	arch/arm/boot/dts/pxa300-raumfeld-connector.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dtb
>
> nand-controller@43100000: Unevaluated properties are not allowed ('dma-names' was unexpected)
> 	arch/arm/boot/dts/pxa300-raumfeld-connector.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dtb
> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dtb

I've been running `make ARCH=arm64 dtbs_check 
DT_SCHEMA_FILES=marvell,nand-controller.yaml` (and similar for arm) but 
didn't see these am I doing something wrong or did I just fail to look 
properly.

> nand-controller@d0000: nand@0:partitions: Unevaluated properties are not allowed ('partition@errlog', 'partition@nand-bbt', 'partition@user' were unexpected)
> 	arch/arm/boot/dts/armada-385-atl-x530.dtb
>
> nand-controller@d0000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
> 	arch/arm/boot/dts/armada-385-atl-x530.dtb
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
