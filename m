Return-Path: <SRS0=t0FF=7M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A71C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 30 May 2020 00:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD572075A
	for <linux-mtd@archiver.kernel.org>; Sat, 30 May 2020 00:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STaVQUTp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD572075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7C+L7UUHJoHL43ZBZMWpzlnkoAbPfRmqHJ62t5mJvf0=; b=STaVQUTpT1T1vo
	B5tsJ7jRbGa1MS5TrJ4s9I11DqT/t+/aY/Cw9W7VLFO0jjrp5Y5bqRmEubNRkoLsk8iKCno1nCy+M
	OkVTG68NX/6DA2tNZwmo5Ptzk/AYSaxkoKOGsjsn/maR50QZLnNTAg/hN/g9mmVUT/Yp46WCI0mEI
	d8p/9/JUS1UzNxFQD4JUNz8UWPwxtq58Fkqred2+pZbBfxbjKGADkaYtq1UCM0FO1Ygv5NwdtFtbH
	b4ItJp4cXWP6etA/0L4+MOOmEIe1piEBAyqBCVBFLSg6ZhiBPr2LUXs6IhT/t/y7UjeqpFXM2e2UB
	+5Jx78SVFQctKt3fo/Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jepCw-0001un-QG; Sat, 30 May 2020 00:18:38 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jepCt-0001tv-Fv
 for linux-mtd@lists.infradead.org; Sat, 30 May 2020 00:18:37 +0000
IronPort-SDR: Yq0qdqop7LB1b/4Y7Wu7zPKjQ+AvHWA/mSxGav5bWvCd+npcFNk+TJAXT7z8Eah597nvXM574h
 nbt+DoE0hhZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 17:18:31 -0700
IronPort-SDR: X06jFciNNis2gnsfgRCH16IqBHQKwsoDO/hW5okSNFgxMFtIMPQxjcwlNQODsfzxoeUUC+YicW
 LT9XQZXsmz4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,450,1583222400"; d="scan'208";a="311408533"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 29 May 2020 17:18:30 -0700
Received: from [10.213.39.142] (vramuthx-MOBL1.gar.corp.intel.com
 [10.213.39.142])
 by linux.intel.com (Postfix) with ESMTP id 2855F580100;
 Fri, 29 May 2020 17:18:25 -0700 (PDT)
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To: Rob Herring <robh@kernel.org>
References: <20200528153929.46859-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528153929.46859-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200529193130.GA2805164@bogus>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <a89a4a5e-5aff-61cc-0d3f-bd22dcc4786d@linux.intel.com>
Date: Sat, 30 May 2020 08:18:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529193130.GA2805164@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_171835_570636_95B29B3B 
X-CRM114-Status: GOOD (  14.86  )
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

On 30/5/2020 3:31 am, Rob Herring wrote:
> On Thu, May 28, 2020 at 11:39:28PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan<vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan<vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..afecc9920e04
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel LGM SoC NAND Controller Device Tree Bindings
>> +
>> +allOf:
>> +  - $ref: "nand-controller.yaml"
>> +
>> +maintainers:
>> +  - Ramuthevar Vadivel Murugan<vadivel.muruganx.ramuthevar@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,lgm-nand-controller
> Doesn't match the example.
Thank you for the review comments...

if we add the compatible = intel,lgm-nand-controller it throws an error 
like below..

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: 
nand-controller@e0f00000: '#address-cells', '#size-cells' do not match 
any of the regexes: '^nand@[a-f0-9]+$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: 
nand-controller@e0f00000: nand@0: '#address-cells', '#size-cells', 
'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'

referred from this file 
:Documentation/devicetree/bindings/mtd/nand-controller.yaml

fixed the compatible and example doesn't match issue.

Regards
Vadivel

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
