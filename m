Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C42DC38145
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Sep 2022 07:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5V0NBCeZL3sl6c6xvSKNyq3m3HBU4jdrkw7Cky1qkQk=; b=JapAJ+qIxxT9A0
	miiFlfkbvp6Xih+eeqEH4Xjy9z2RBGvPwgu3MbvBulh9zDY1fORh5plXmBtAoOCcC+O+KzgqCzC0h
	hZxe0/2aALxAO4PiQHKzdNvfpp4UI/1ofBTzQixe42CIa4aOlj5S7hp4qmEZpcZT02s6Fnv9flcok
	vcO0yPsUH0Fx5fnCmJpZGyn1IPZ1E/OWMqRCAaWA0Nx1vXCs57/hnbWamXrwcW+CDvC7Fu5VPTZ0+
	3KO/HCJvzfgb/AOxpDQn1k+LbES91nWaCTvzHqs17toXfJp3y1SYikwrztrYUI4qxT92rwDT0Rqf8
	Z8437vQBvl/oBmL5kSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVplC-003qWt-Kg; Wed, 07 Sep 2022 07:46:10 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpky-003qO5-TY; Wed, 07 Sep 2022 07:45:59 +0000
Received: from [10.28.39.72] (10.28.39.72) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2507.6; Wed, 7 Sep 2022 15:45:51 +0800
Message-ID: <aa99e72c-41c8-02d5-c47b-05277b988eb0@amlogic.com>
Date: Wed, 7 Sep 2022 15:45:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v8 4/5] dt-bindings: nand: meson: convert txt to
 yaml
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>,
	<linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20220906060034.2528-1-liang.yang@amlogic.com>
 <20220906060034.2528-5-liang.yang@amlogic.com>
 <20220906143021.GA439874-robh@kernel.org>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220906143021.GA439874-robh@kernel.org>
X-Originating-IP: [10.28.39.72]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_004557_489254_3D03241E 
X-CRM114-Status: GOOD (  15.49  )
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

Hi Rob,

On 2022/9/6 22:30, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Sep 06, 2022 at 02:00:32PM +0800, Liang Yang wrote:
>> convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml
>>
>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
>> ---
>>   .../bindings/mtd/amlogic,meson-nand.txt       | 55 ------------
>>   .../bindings/mtd/amlogic,meson-nand.yaml      | 88 +++++++++++++++++++
>>   2 files changed, 88 insertions(+), 55 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>>   create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>> deleted file mode 100644
>> index 5d5cdfef417f..000000000000
>> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
>> -
>> -This file documents the properties in addition to those available in
>> -the MTD NAND bindings.
>> -
>> -Required properties:
>> -- compatible : contains one of:
>> -  - "amlogic,meson-gxl-nfc"
>> -  - "amlogic,meson-axg-nfc"
>> -
>> -- reg        : Offset and length of the register set
>> -
>> -- reg-names  : "nfc" is the register set for NFC controller and "emmc"
>> -		is the register set for MCI controller.
>> -
>> -- clocks     :
>> -	A list of phandle + clock-specifier pairs for the clocks listed
>> -	in clock-names.
>> -
>> -- clock-names: Should contain the following:
>> -	"core" - NFC module gate clock
>> -	"device" - parent clock for internal NFC
>> -
>> -Optional children nodes:
>> -Children nodes represent the available nand chips.
>> -
>> -Other properties:
>> -see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
>> -
>> -Example demonstrate on AXG SoC:
>> -
>> -	nand-controller@7800 {
>> -		compatible = "amlogic,meson-axg-nfc";
>> -		reg = <0x0 0x7800 0x0 0x100>,
>> -		      <0x0 0x7000 0x0 0x800>;
>> -		reg-names = "nfc", "emmc";
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>> -
>> -		clocks = <&clkc CLKID_SD_EMMC_C>,
>> -			 <&clkc CLKID_FCLK_DIV2>;
>> -		clock-names = "core", "device";
>> -
>> -		pinctrl-names = "default";
>> -		pinctrl-0 = <&nand_pins>;
>> -
>> -		nand@0 {
>> -			reg = <0>;
>> -			#address-cells = <1>;
>> -			#size-cells = <1>;
>> -
>> -			nand-on-flash-bbt;
>> -		};
>> -	};
>> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> new file mode 100644
>> index 000000000000..42634e9c0d3c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> @@ -0,0 +1,88 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/amlogic,meson-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
>> +
>> +allOf:
>> +  - $ref: "nand-controller.yaml"
> 
> Don't need quotes
I will fix it
> 
>> +
>> +maintainers:
>> +  - liang.yang@amlogic.com
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - "amlogic,meson-gxl-nfc"
>> +      - "amlogic,meson-axg-nfc"
> 
> Don't need quotes
i will fix it
> 
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: device
>> +
>> +patternProperties:
>> +  "^nand@[0-7]$":
>> +    type: object
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 1
>> +
>> +      nand-ecc-mode:
>> +        const: hw
>> +
>> +      nand-ecc-step-size:
>> +        const: 1024
>> +
>> +      nand-ecc-strength:
>> +        enum: [8, 16, 24, 30, 40, 50, 60]
>> +        description: |
>> +          The ECC configurations that can be supported are as follows.
>> +            meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
>> +            meson-axg-nfc 8
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/axg-clkc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    nand-controller@ffe07800 {
>> +      compatible = "amlogic,meson-axg-nfc";
>> +      reg = <0xffe07800 0x100>, <0xffe07000 0x800>;
>> +      reg-names = "nfc", "emmc";
>> +      interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>> +      clocks = <&clkc CLKID_SD_EMMC_C>,  <&clkc CLKID_FCLK_DIV2>;
>> +      clock-names = "core", "device";
>> +
>> +      pinctrl-0 = <&nand_pins>;
>> +      pinctrl-names = "default";
>> +
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      nand@0 {
>> +        reg = <0>;
>> +      };
>> +    };
>> +
>> +...
>> -- 
>> 2.34.1
>>
>>
> 
> .

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
