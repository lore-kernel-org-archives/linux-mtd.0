Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBF4EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 04:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxx9gioCgPRz2rjJqrylYU2NJ9QVvB/YnTHnvA1e/js=; b=qWFMv+gqX7a4jA
	Wd8Qu+j5oCcWcPbNdzeuMHmMArKe2dkVPy5nwuSCbtSIMLPvai3bJXomT60I7H0bSub2efbMYT9XM
	hudlmlZSun/H1xDX2SbUCnHjM0iTkNheOYvTM6HkWMVBxCTh5z79nAFEuImdkpxT+eR36h9JI8QIk
	fzj0Zk1ICLmttyrzcqL6d/nyq7KSKmd8v49LIVBFnluiQUbBLvIlaVRHGFj+pgI3JBkIK/NZgj6KJ
	74it5uqE5W5gWZQiVTEhlqMEXychI9KxzvsTfq/jMevVfFSgQyHfc5S+Fj4P3aNOP/8Z7btagBouL
	nqeNaFnZEBwudbgBf8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF5Pm-002okQ-2W;
	Fri, 30 Jun 2023 04:07:22 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF5Pg-002oi3-2l
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 04:07:19 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 810B22C02A9;
	Fri, 30 Jun 2023 16:06:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1688098018;
	bh=jB27fmXkfzp7He06PxN/Gc4RfV1heM0YKMl2NWUGi/A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=d2zsqXm+xOY9ObtniFSp1XB3ylZj8/9z186Q/lBwA1e6yz1HFJsrvoRLNb5WSexuv
	 TnRn+Mij8sADWO6qEQL9wgM3S19CnRodag/v+l7eRsnqnsnzy9V4OSVjTFVYLgEUSs
	 2TnFTKM3MloDZFC9p1tmqAGzlovrnokHuGOId3JTeVpaBKPvFWb+nKabqC+o0jbR9Q
	 IDQr4BJoE+e9+L5vUegfdDnHVgqNvqWxVyJnJ7H4+6jlRocYoZBuMUB3ZtQtFq2GLe
	 zvorIGltlrlqg98TO1DokdACVnC2K/4V3tSl0HhAPbzvoqwUqAwb2U/MmraVcEQash
	 SDyuf+qlzFuvg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B649e54e20000>; Fri, 30 Jun 2023 16:06:58 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 30 Jun 2023 16:06:58 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.030; Fri, 30 Jun 2023 16:06:58 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "gregory.clement@bootlin.com"
	<gregory.clement@bootlin.com>, "pierre.gondois@arm.com"
	<pierre.gondois@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: marvell: Add NAND flash controller to
 AC5
Thread-Topic: [PATCH v2 2/3] arm64: dts: marvell: Add NAND flash controller to
 AC5
Thread-Index: AQHZp9wFzLABkbH5wEGgo5cmf3kQUa+h972A
Date: Fri, 30 Jun 2023 04:06:58 +0000
Message-ID: <aa45c265-5b90-b8a5-722e-4bcbc662660b@alliedtelesis.co.nz>
References: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
 <20230626031217.870938-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20230626031217.870938-3-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <0324BC037DBF9749B057D985433F6C8F@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=of4jigFt-DYA:10 a=w2twMtuE976TmCkByo0A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_210717_075425_F20DE6DC 
X-CRM114-Status: GOOD (  17.07  )
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


On 26/06/23 15:12, Chris Packham wrote:
> The AC5/AC5X SoC has a NAND flash controller (NFC). Add this to
> the base SoC dtsi file as a disabled node. The NFC integration
> on the AC5/AC5X only supports SDR timing modes up to 3 so requires a
> dedicated compatible property so this limitation can be enforced.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>      Changes in v2:
>      - New.
>
>   arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> index 8bce64069138..74d644e0c29e 100644
> --- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> @@ -296,6 +296,16 @@ spi1: spi@805a8000 {
>   			status = "disabled";
>   		};
>   
> +		nand: nand-controller@805b0000 {
> +			compatible = "marvell,ac5-nand-controller";
> +			reg =  <0x0 0x805b0000 0x0 0x00000054>;
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cnm_clock>;

Actually I think I've just noticed a problem with this. The NFC uses a 
different clock not the cnm one. It's not a gating clock like other SoCs 
and they're close enough frequency wise so it mostly works. I'll update 
this to add a dedicated nand-clock for v3.

> +			status = "disabled";
> +		};
> +
>   		gic: interrupt-controller@80600000 {
>   			compatible = "arm,gic-v3";
>   			#interrupt-cells = <3>;
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
