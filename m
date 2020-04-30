Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADFDC83000
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 01:07:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2592082E
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 01:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YpRZkjb+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2592082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIC2N9RmFM7q/TMh7R29VMjW7dG5F77Otd8iww2Xnlo=; b=YpRZkjb+A0TNiZ
	lR/QDhrX01wjGRm3wU4ETgI1sjS5Jp4KG5jOHfGz+PxEKUncgovYVWVWT9VRiqaFyiYts415UeQK6
	au3y37zdXllJSR23f3GN4QOOlGVa9/+W+W3LH29kUjOYv6NRE8b+OpHYxE4IJNxbksQVrs7lRn/x0
	dFV2GvnW33oF41zWQT5QVXxNgxfuJBOl0bMy621GvbgTCKfsNNtyBsUex/5TW2Lzh13irqZB0zluG
	jBtwHbRSA4uoGIa9rcG7tsXGzGZkxoc64PArP/yDLODaeqASaz0ZNFHpr2ZuMNZ1wvFboYUh3OkXr
	PH1cOH+y0kVkR08az6Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTxg3-0001DC-0D; Thu, 30 Apr 2020 01:07:47 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTxfx-0001C0-TO
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 01:07:44 +0000
IronPort-SDR: FkKB9Q+hNMjDszAHs6uSLgm9FfZdBCjtoivkF2IRnzQLKGV1/GEKOEbEY+qfn4k3WzwkuT6thA
 ZfU5+VLDtyIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 18:07:38 -0700
IronPort-SDR: 8Q4gkOhp1ZUnE+RQpm1R4hBRrAC7b/3Ppd8uLI++yOdz/XX8f7mTAIc0o5U6zNpv7sk6HtOVAe
 6Lvw49YJsJkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; d="scan'208";a="432763015"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 29 Apr 2020 18:07:38 -0700
Received: from [10.215.170.136] (vramuthx-mobl1.gar.corp.intel.com
 [10.215.170.136])
 by linux.intel.com (Postfix) with ESMTP id E824D5805EB;
 Wed, 29 Apr 2020 18:07:33 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: Add YAML for Nand Flash
 Controller support
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429173446.6682dfb8@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <04423b9c-f70c-d461-05ac-9a4815af105c@linux.intel.com>
Date: Thu, 30 Apr 2020 09:07:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429173446.6682dfb8@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_180741_999271_F585E658 
X-CRM114-Status: GOOD (  16.02  )
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
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

  Thank you very much for the review comments and your time...

On 29/4/2020 11:34 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 18:42:04 +0800
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 61 ++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..6dd899d367b4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: GPL-2.0
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
>> +
>> +  pinctrl-names: true
>> +
>> +patternProperties:
>> +  "^pinctrl-[0-9]+$": true
>> +
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
>> +...
> 
> Can you provide an example? I'd like to make sure the binding looks
> good.

Noted, will update with example. Thanks!

Regards
Vadivel

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
