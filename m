Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73558EB64D7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Jun 2023 21:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRsXZOBhVIjhNAMkp81zT+iEeQzTfH9az9XRMy+IvUU=; b=ce25/SFYdYYH4s
	BM8bDE7aWQmvFpfdFaoUHd0kJx/XTtXZ9gWse7EvQHlKjJHiRxzFRO8BRURnOc5iN1zbX/GOXj9AH
	Iqwem3IUgEHt0UlaxpEA/DwrrU3L/T91JYs5VUWxQXR9aP0ceG1aoETksLFsY4zZ9/hT7Fa7z2ms7
	33v1rooCOoCftZtp4Y1hfu5UpDKJvLJwB26oK57zLv8YsvEMpAKJ7aN8VJJvq9hj0efWi+xvm5Oof
	FABQzRn+Ce7L09nvKi5wZOh1TTrtBr6qZUxnt3nhvTG9prqTHueWk1z+djbA2tbtzDgGA4YBUHAVA
	Py0E27cYBjR8eavbkKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAzhd-006iXm-0C;
	Sun, 18 Jun 2023 21:12:53 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAzhX-006iVs-0T
	for linux-mtd@lists.infradead.org;
	Sun, 18 Jun 2023 21:12:49 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2C6B72C0191;
	Mon, 19 Jun 2023 09:12:40 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1687122760;
	bh=n8GHzQbNON/Xjem4iPLcPT56xSQCP05AtkAX//cM2f4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hLOfbg3dnAiMkzPUA0tInJLoJgt/yEP53K+wUOFT4bHn+SDMi6eEB0dgo56EzEpX0
	 hSbSEeMlnGPUmscqEmpQfI9B0MIz25MKcn1QiQcm95jIBzcye/cfgzyftEsXL1ZOQD
	 ST1neWyxFBJgmUzUZjOf3h8sovf2ISJLWp3msIHddZVoneOyeo8gJGbIqQSJrvT3uX
	 29c252Lwn3gV2rX5JOe01djaj8HE3VPCxRgAwHwrmgPOmjYEDwj+qVUgCB+dw3m/4M
	 qZvLFtrhPRR497n2BJFo55gaDryzM+QdnMN78V3u59MTOC9xT6FVmjEP5P/QVtGXI2
	 zMwnWaM+YU9ig==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B648f73480000>; Mon, 19 Jun 2023 09:12:40 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.30; Mon, 19 Jun 2023 09:12:39 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Mon, 19 Jun 2023 09:12:39 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.030; Mon, 19 Jun 2023 09:12:39 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
	"vadym.kochan@plvision.eu" <vadym.kochan@plvision.eu>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "enachman@marvell.com"
	<enachman@marvell.com>
Subject: Re: [PATCH v6 0/2] dt-bindings: mtd: marvell-nand: Add YAML scheme
Thread-Topic: [PATCH v6 0/2] dt-bindings: mtd: marvell-nand: Add YAML scheme
Thread-Index: AQHZkpEvKI1tV7pyn0+RiOLc0KH0K6+MoboAgAADkQCAA7+hgA==
Date: Sun, 18 Jun 2023 21:12:39 +0000
Message-ID: <e79cb44c-a669-3726-ea71-1a4db88ebe7b@alliedtelesis.co.nz>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <87r0qbhbqt.fsf@BL-laptop> <87ilbnhb5j.fsf@BL-laptop>
In-Reply-To: <87ilbnhb5j.fsf@BL-laptop>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <6664D2983A17914E9F86CFFF8D694C22@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=of4jigFt-DYA:10 a=P-IC7800AAAA:8 a=62ntRvTiAAAA:8 a=ddKjx2dgZxSzjoJ6qqIA:9 a=QEXdDO2ut3YA:10 a=N53muDpBR4cA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=pToNdpNmrtiFLRE6bQ9Z:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_141247_664679_F2455140 
X-CRM114-Status: GOOD (  15.86  )
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


On 16/06/23 23:58, Gregory CLEMENT wrote:
> Gregory CLEMENT <gregory.clement@bootlin.com> writes:
>
>> Chris Packham <chris.packham@alliedtelesis.co.nz> writes:
>>
>>> Add YAML scheme for the Marvell's NAND controller
>>> to validate it's DT bindings. Old txt file is deleted,
>>> not included the compatibles and properties which were marked as
>>> deprecated.
>>>
>>> Also fix node name in cp11x DTSI acording to nand-controller.yaml
>>>
>>> I've picked up this series to hopefully get it over the line. I think I've
>>> addressed all the feedback from the last round of review.
>>>
>>> Vadym Kochan (2):
>>>    dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme
>>>    arm64: dts: marvell: cp11x: Fix nand_controller node name according to
>>>      YAML
>>
>> Both patch applied on mvebu/dt64
>>
>> However if the first patch should be merged through another tree, let me
>> know.
> Finally I removed these both patches, I missed the version 9!
>
> I applied the 2 patches for the dts files from v9.
>
> Thanks,
>
> Gregory
Thanks and sorry for the confusion. There's a v10 on the way but I can 
drop out the dts changes from that now.
>>
>>>   .../bindings/mtd/marvell,nand-controller.yaml | 190 ++++++++++++++++++
>>>   .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
>>>   MAINTAINERS                                   |   1 -
>>>   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   2 +-
>>>   4 files changed, 191 insertions(+), 128 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>>
>>> -- 
>>> 2.40.1
>>>
>> -- 
>> Gregory Clement, Bootlin
>> Embedded Linux and Kernel engineering
>> http://scanmail.trustwave.com/?c=20988&d=0c6M5H8PBagWXDuSKsjbXpd1zLX-HHHRk3xSZOdFDw&u=http%3a%2f%2fbootlin%2ecom
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
