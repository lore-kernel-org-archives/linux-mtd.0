Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FEAC433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 02:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D84C20734
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 02:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUlf+gIB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D84C20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX/oBv72mDrXl6W+4XANLIM1nGG24QXeyGDlzkmVP+c=; b=WUlf+gIBo/DGjP
	pOMZFPaZwjQqstfnaKPSfq2Dpw9HHcUe0lD5M5E1jBQxjdC81wY1x6Bbe1uvf9Wd4oNckBC5wDwYM
	oq5Wabw8z5MN1mmnhH7G32dPykYJ/wWTn9ByheTHOlC+zk2r3j80Hvs37TD4Oht/Qsk9LbMHcGypK
	C/PDCuI2YMb+NKd4Zt6Nw1/dinOg+ozLkXg7wLoFwO2nHrwxSpKS4Mo9m5twCIevHqOlBbDfJIu14
	6tgzPT7X+j4pCTwARaQvT6wUJJKspkBdMzI0GGXSOjP1pf7Cue4GLoDuqHyNrRZGv/v2TSVTqvOfy
	als8zhSBYZerhyQXLikg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZPkK-0008Tt-IV; Fri, 15 May 2020 02:06:44 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZPkD-0008TK-OX
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 02:06:42 +0000
IronPort-SDR: XT2IjD7a2wN1wS0whRHU1NIJyS/sy//NwOvitPx0UK3Sxg7fmnIZHdbNSExnxl20mLv+yNvOqS
 fOsJqleJieBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 19:06:31 -0700
IronPort-SDR: Xe0oTyAejSCuxTExL/lzRxj20dECodjALgyh0jXW7dSuEqyHpUB+GTAMrHJSAJye9eDuDPHBd5
 udnnsrj93UPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,393,1583222400"; d="scan'208";a="251878183"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 14 May 2020 19:06:30 -0700
Received: from [10.213.147.163] (vramuthx-mobl1.gar.corp.intel.com
 [10.213.147.163])
 by linux.intel.com (Postfix) with ESMTP id 74F675804B6;
 Thu, 14 May 2020 19:06:24 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To: Rob Herring <robh@kernel.org>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200514130321.GB8436@bogus>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <3248d380-1d08-3088-8d18-0373a8a5aef9@linux.intel.com>
Date: Fri, 15 May 2020 10:06:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514130321.GB8436@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_190637_810568_10574E90 
X-CRM114-Status: GOOD (  18.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

    Thank you for the review comments...

On 14/5/2020 9:03 pm, Rob Herring wrote:
> On Wed, May 13, 2020 at 06:46:14PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 ++++++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..d9e0df8553fa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)
Noted.
> 
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel LGM SoC NAND Controller Device Tree Bindings
>> +
>> +allOf:
>> +  - $ref: "nand-controller.yaml"
>> +
>> +maintainers:
>> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,lgm-nand-controller
>> +
>> +  reg:
>> +    maxItems: 1
> 
> Looks like you have 4 or 6 entries, not 1. Need to define what each one
> is.
Sure, will define it.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    enum:
>> +      - rx
>> +      - tx
> 
> This defines a single entry. I believe you want:
> 
> items:
>    - const: tx
>    - const: rx
Yes, Thanks!

> 
>> +
>> +  pinctrl-names: true
> 
> No need for this. Tools add pinctrl properties.
will drop it.
> 
>> +
>> +patternProperties:
>> +  "^nand@[a-f0-9]+$":
>> +    type: object
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 7
>> +
>> +      nand-ecc-mode: true
>> +
>> +      nand-ecc-algo:
>> +        const: hw
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - dmas
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    nand-controller@e0f00000 {
>> +      compatible = "intel,nand-controller";
> 
> Doesn't match the schema.
Noted, will update the schema name.
> 
>> +      reg = <0xe0f00000 0x100>,
>> +            <0xe1000000 0x300>,
>> +            <0xe1400000 0x8000>,
>> +            <0xe1c00000 0x1000>;
> 
> Is it 4 or 6 entries?
yes, will update.
> 
>> +      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
>> +        "addr_sel0","addr_sel1";
> 
> Not documented.
Noted, will document it.
> 
>> +      clocks = <&cgu0 125>;
>> +      dma-names = "tx", "rx";
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      #clock-cells = <1>;
> 
> This is a clock provider too?
Yes, it is getting clock from CGU for nand-controller.

Regards
Vadivel
> 
>> +
>> +      nand@0 {
>> +        reg = <0>;
>> +        nand-on-flash-bbt;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +      };
>> +    };
>> +
>> +...
>> -- 
>> 2.11.0
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
