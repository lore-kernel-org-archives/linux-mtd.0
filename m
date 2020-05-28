Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41748C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 02:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FCEB20888
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 02:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1GfZrrg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FCEB20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rqC7o4bvWrQNEQG3o+DBcALn/v+MUmujmraYubmXvo=; b=f1GfZrrgrlu6um
	CufW+3b+cQHN5bwJvC6/g9dKey1aEeiixiGtakwIRjl5hLXa2+uHY+gHk2pB8MQAlXK6xLGVDLRYj
	/jYmlKLLGw6tdNUxiWUM/lmOnC90OxJ4pO+RqK7SDehClGyOJRrVymGbKDl9fLhWirJAEdCb//YJ5
	FK39r4SblJknLcILbf5VeZvV/6jKTyRRh0tfpCHKwXNqTi0GxqJxj6qPcelxdH5rK9YHG4cg8B5R0
	b+SO6awerNOGQxDsGL5sYhl2V4T8Z2YwfcOZW2WjEQLwkYNz/VcNAmw2riEVYARO4KP1P6dwApitb
	Z3+eHhzi2UMseQ1+FEBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je8kn-0006j1-FQ; Thu, 28 May 2020 02:58:45 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je8kj-0006iK-Vx
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 02:58:43 +0000
IronPort-SDR: 7TE+1E4nriy27K0vjQHXZpbIjXyL3W7D6Kkny0VrLCjS4FtnMwzXTvz8fL0yknGEp+u1SdC8pS
 KYltbs178Q1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 19:58:40 -0700
IronPort-SDR: NV1fIEi7SBqqpWFSyetil7BqpMQvRWv0Sli9g92468c8uiX8Se0i5A3wyNFWKSVJ9zyHmQnumZ
 zGuYmBc3PSyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; d="scan'208";a="468974457"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 27 May 2020 19:58:40 -0700
Received: from [10.214.164.131] (vramuthx-MOBL1.gar.corp.intel.com
 [10.214.164.131])
 by linux.intel.com (Postfix) with ESMTP id 9E6925803C1;
 Wed, 27 May 2020 19:58:35 -0700 (PDT)
Subject: Re: [RESENDPATCH v8 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To: Rob Herring <robh@kernel.org>
References: <20200520000621.49152-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200520000621.49152-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200526204306.GA224630@bogus>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <b04a6779-233d-ff7f-6eb6-b6393100189e@linux.intel.com>
Date: Thu, 28 May 2020 10:58:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526204306.GA224630@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_195842_070612_808DC0B9 
X-CRM114-Status: GOOD (  17.66  )
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

Thank you very much for the review comments...

On 27/5/2020 4:43 am, Rob Herring wrote:
> On Wed, May 20, 2020 at 08:06:20AM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 91 ++++++++++++++++++++++
>>   1 file changed, 91 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..cd4e983a449e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Still not dual licensed.
oh sorry, will update.
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
> 
> Still doesn't match the example. And the example will fail when it does.
Noted, will change it.
> 
>> +
>> +  reg:
>> +    items:
>> +       - description: ebunand registers
>> +       - description: hsnand registers
>> +       - description: nand_cs0 external flash access
>> +       - description: nand_cs1 external flash access
>> +       - description: addr_sel0 memory region enable and access
>> +       - description: addr_sel1 memory region enable and access
> 
> reg-names?
   should be -const: ebunand instead added description with register 
name , will keep "-const: ebunand ..etc"
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
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
> 
> Not documented or should be dropped.
Yes, will drop it.
> 
>> +  - dmas
>> +  - dma-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    nand-controller@e0f00000 {
>> +      compatible = "intel,lgm-nand";
>> +      reg = <0xe0f00000 0x100>,
>> +            <0xe1000000 0x300>,
>> +            <0xe1400000 0x8000>,
>> +            <0xe1c00000 0x1000>,
>> +            <0x17400000 0x4>,
>> +            <0x17c00000 0x4>;
>> +      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
>> +        "addr_sel0","addr_sel1";
> 
> Not documented. And needs a space after the ','.
Good catch, Thanks
> 
>> +      clocks = <&cgu0 125>;
>> +      dmas = <&dma0 8>, <&dma0 9>;
>> +      dma-names = "tx", "rx";
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      #clock-cells = <1>;
> 
> Should be removed?
sure, will remove it

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
