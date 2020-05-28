Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E6EC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 15:04:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99372075F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 15:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qc2bms4d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99372075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAUGuEW+J53jdIdm21eFdTBXK2EEBY7rD0sr8KtNBGs=; b=qc2bms4dqqsrir
	4aiXuVhJfTHIrcARWPn/fs8ah8P1ybodncZtcmAnxV9bh0RlAC8qU6f1B2vhiVCg0oiL2CJMDgBXs
	wRb5pmKMZgq7biMOA57bTZZ4zwBnhCCUHbpyjzt0iDAS3ZanGXDBCfsKv9Jm6A9MyYtjhVphEmS7P
	27nJ9l93OwLbwEx+AE/l4mcE4zaAcuCFhIdVDpyNaCPohAI9jABUTWzZT7Hh7EOt8YuhDpI6HmEXP
	vwax6yCBr4LLnLGOTm15yPRwczphHn5VWc8cAkfOn/4TUDsSHY8lMzC3pg6XTFOZqGCbtL30BRbj/
	e8BLQMXuRpjMQWF+DIaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeK4u-0000hs-T2; Thu, 28 May 2020 15:04:16 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeK4W-0000P7-R9
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 15:03:54 +0000
IronPort-SDR: PB94M/oVG5UzEOYrR819fv3GYqEYWGYe7OT05ohPijG8fewv8+qGsrm8JVio+Cp83tLuKnBnn/
 r98Jt0YLTmiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 08:03:48 -0700
IronPort-SDR: VCP24WwpwTZQMISVT31BpFmDM2ZKPpBO2QU5tNkPxtdm/saoNw2Q2QS82qfDVk1hdz1UxhZQdu
 4XiBex7pwm4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="469143502"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 28 May 2020 08:03:47 -0700
Received: from [10.214.148.6] (vramuthx-mobl1.gar.corp.intel.com
 [10.214.148.6])
 by linux.intel.com (Postfix) with ESMTP id 8928D5803E3;
 Thu, 28 May 2020 08:03:41 -0700 (PDT)
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To: Rob Herring <robh@kernel.org>
References: <20200528051211.3063-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528051211.3063-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528140606.GA4173978@bogus>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <9ef6560e-9981-57a8-8d6d-88ba40b2be88@linux.intel.com>
Date: Thu, 28 May 2020 23:03:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528140606.GA4173978@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_080352_906056_5125B201 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com, masonccyang@mxic.com.tw,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 devicetree@vger.kernel.org, richard@nod.at, brendanhiggins@google.com,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, qi-ming.wu@intel.com,
 andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

On 28/5/2020 10:06 pm, Rob Herring wrote:
> On Thu, 28 May 2020 13:12:10 +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: '#address-cells', '#size-cells' do not match any of the regexes: '^nand@[a-f0-9]+$', 'pinctrl-[0-9]+'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> See https://patchwork.ozlabs.org/patch/1299399
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
Thank you!!!

Oh my bad, used old dtc compiler path and didn't see the error, will fix.

Regards
Vadivel

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
