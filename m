Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA74C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6WWCY1aqFJbzo6SH3NW+ckKxentCOLPzPHrxuIWf1M=; b=Gb7KO0NVMSHE9I
	HKschMcplTCew4YR0UVRAZQvqxNlTEB3+hDtL4kRznWZrirfjrT/EOmYLoSN4ldxzd0tpotA5dnA6
	fxzHBuPNI/aeqUDXCWmm46Rkwf9g1FtobTJEF7wBmNC18aNHCurnkmCNzTCBaL55rnexaUzjZtCSi
	6ZGZuTI4Jt2so9z94qV+I3ZWEwfb0Nz2czty15Jc1xG7cFwRS+v5OadOLKcLJb3lfZtHeuQFWzmgV
	e3ZnF7Kzws9Tfj0MmS5o8LglSiLtwA/O+bCvu5Lj6RnpSqXgVosRKIC5ZL6Wbphgv6/Tz5QHMzupx
	cT0zHPLPnFBs8fx5EqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLka-002BNc-Vd; Wed, 02 Mar 2022 09:58:29 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLkL-002BHM-J8; Wed, 02 Mar 2022 09:58:15 +0000
Received: from [10.18.88.203] (10.18.88.203) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Wed, 2 Mar 2022
 17:58:07 +0800
Message-ID: <2d396290-2c7f-1c9e-2ba0-0a029e51fd45@amlogic.com>
Date: Wed, 2 Mar 2022 17:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Liang.Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH RESEND v2 2/2] dt-bindings: nand: meson: refine Amlogic
 NAND controller driver
To: Jerome Brunet <jbrunet@baylibre.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220217063346.21691-1-liang.yang@amlogic.com>
 <20220217063346.21691-3-liang.yang@amlogic.com>
 <1jv8wzw78r.fsf@starbuckisacylon.baylibre.com>
 <4741f36a-e17a-75c3-124f-447e4426c436@amlogic.com>
 <1jczj47ne5.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
In-Reply-To: <1jczj47ne5.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.88.203]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_015813_689146_61B9A6B5 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Jerome,

On 2022/3/2 16:42, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Wed 02 Mar 2022 at 13:19, Liang.Yang <liang.yang@amlogic.com> wrote:
> 
>> Hi Jerome,
>>
>> On 2022/2/28 19:36, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Thu 17 Feb 2022 at 14:33, Liang Yang <liang.yang@amlogic.com> wrote:
>>>
>>>> convert txt to yaml and refine the meson NFC clock document.
>>>>
>>>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
>>>> ---
>>>>    .../bindings/mtd/amlogic,meson-nand.txt       | 60 ----------------
>>>>    .../bindings/mtd/amlogic,meson-nand.yaml      | 70 +++++++++++++++++++
>>>>    2 files changed, 70 insertions(+), 60 deletions(-)
>>>>    delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>>>>    create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>>>> deleted file mode 100644
>>>> index 5794ab1147c1..000000000000
>>>> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>>>> +++ /dev/null
>>>> @@ -1,60 +0,0 @@
>>>> -Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
>>>> -
>>>> -This file documents the properties in addition to those available in
>>>> -the MTD NAND bindings.
>>>> -
>>>> -Required properties:
>>>> -- compatible : contains one of:
>>>> -  - "amlogic,meson-gxl-nfc"
>>>> -  - "amlogic,meson-axg-nfc"
>>>> -- clocks     :
>>>> -	A list of phandle + clock-specifier pairs for the clocks listed
>>>> -	in clock-names.
>>>> -
>>>> -- clock-names: Should contain the following:
>>>> -	"core" - NFC module gate clock
>>>> -	"device" - device clock from eMMC sub clock controller
>>>> -	"rx" - rx clock phase
>>>> -	"tx" - tx clock phase
>>>> -
>>>> -- amlogic,mmc-syscon	: Required for NAND clocks, it's shared with SD/eMMC
>>>> -				controller port C
>>>> -
>>>> -Optional children nodes:
>>>> -Children nodes represent the available nand chips.
>>>> -
>>>> -Other properties:
>>>> -see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
>>>> -
>>>> -Example demonstrate on AXG SoC:
>>>> -
>>>> -	sd_emmc_c_clkc: mmc@7000 {
>>>> -		compatible = "amlogic,meson-axg-mmc-clkc", "syscon";
>>>> -		reg = <0x0 0x7000 0x0 0x800>;
>>>> -	};
>>>> -
>>>> -	nand-controller@7800 {
>>>> -		compatible = "amlogic,meson-axg-nfc";
>>>> -		reg = <0x0 0x7800 0x0 0x100>;
>>>> -		#address-cells = <1>;
>>>> -		#size-cells = <0>;
>>>> -		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>>>> -
>>>> -		clocks = <&clkc CLKID_SD_EMMC_C>,
>>>> -			<&sd_emmc_c_clkc CLKID_MMC_DIV>,
>>>> -			<&sd_emmc_c_clkc CLKID_MMC_PHASE_RX>,
>>>> -			<&sd_emmc_c_clkc CLKID_MMC_PHASE_TX>;
>>>> -		clock-names = "core", "device", "rx", "tx";
>>>> -		amlogic,mmc-syscon = <&sd_emmc_c_clkc>;
>>>> -
>>>> -		pinctrl-names = "default";
>>>> -		pinctrl-0 = <&nand_pins>;
>>>> -
>>>> -		nand@0 {
>>>> -			reg = <0>;
>>>> -			#address-cells = <1>;
>>>> -			#size-cells = <1>;
>>>> -
>>>> -			nand-on-flash-bbt;
>>>> -		};
>>>> -	};
>>>> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>>>> new file mode 100644
>>>> index 000000000000..671f0a8fdc7c
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>>>> @@ -0,0 +1,70 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/amlogic,mmc-clkc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
>>>> +
>>>> +maintainers:
>>>> +  - liang.yang@amlogic.com
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - "amlogic,meson-gxl-nfc"
>>>> +      - "amlogic,meson-axg-nfc"
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 2
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: "core", "device"
>>>> +
>>>> +  "#clock-cells":
>>>> +    const: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - "#clock-cells"
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    nand-controller@7800 {
>>>> +	compatible = "amlogic,meson-axg-nfc";
>>>> +	reg = <0x0 0x7800 0x0 0x100>,
>>>> +	      <0x0 0x7000 0x0 0x1>;
>>> Please name the register ressources instead of relying on the order
>> ok
>>> Also, use the actual size of region, not the size you are using in the
>>> driver. AFAIK, the size of the 2nd region is not 0x1
>> yes, it should be 0x4 here, i will fix it.
>> we only need to use a 32bits SDEMMC_CLOCK register.
>> thanks.
> 
> No, it is not the point.
> What register you need in the driver is not relevant.
> What is relevant is the actual size of the memory region - so it not 0x1
> or 0x4 ... more likely 0x800 from what I see in the AXG dts.

ok, i will fix it. thanks.
> 
>>>
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +	interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>>>> +
>>>> +	clocks = <&clkc CLKID_SD_EMMC_C>,
>>>> +		<&clkc CLKID_FCLK_DIV2>;
>>>> +	clock-names = "core", "device";
>>>> +
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&nand_pins>;
>>>> +
>>>> +	nand@0 {
>>>> +		reg = <0>;
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <1>;
>>>> +
>>>> +		nand-on-flash-bbt;
>>>> +	};
>>>> +     };
>>>> +
>>>> +...
>>>> \ No newline at end of file
>>> .
> 
> .

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
