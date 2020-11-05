Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2221FC2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 03:12:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7821A20719
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 03:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nSyg6JXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7821A20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52c+V082gMwGJoPXtT+hjr/9/nqBJMUhu0Zu1TU351A=; b=nSyg6JXVI8OYqa
	ZXVj75qtTDQNG2ZvGgXivhQdHb058xRShapPYP6/JHw1AWySO7bU/29g9cLJDo867HtvWgTWxXlkk
	YqpKrYxMH4x6U7FMQ5PB5sSNU4BXf0y6lMIqVF2534msbkk850ZCBb4NWC4O6/Bj206tljnQ/rT38
	7AJF8g4i6ag1jLiXISZIDHfqprUiciV5V/ZTB1WdsWJZSCs/Qa0RFBJJeAiNbniF3ireXy12sKqay
	D1CUzXb3bhCG2imDjkK4/UKpgeg7tylpHscdk7C9ahoE6ta3VJiuAzw6bcAeIzNh6JZ0q3SI5DKFR
	nR4ftQ4FulLClEtfinyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaVfd-0000TP-9W; Thu, 05 Nov 2020 03:10:41 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaVfZ-0000Sx-FB
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 03:10:38 +0000
IronPort-SDR: GCndzZ1rqEtEVrivMREZYebKne/FvhtU0dLAg0Ez+gkyOH+HnaFXgoOf9zT/vQLRaqHzqtcHLw
 wbiVy76HB7HA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="165811864"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; d="scan'208";a="165811864"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 19:10:32 -0800
IronPort-SDR: PuvK8QPaHSE8f6b9etfQGhzDqsRW0Ahlj3lBVZPmEq5ms0IxAK0PUXeAHJbBtif2czvu1eHgOr
 LvMtHnR3aH9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; d="scan'208";a="325858998"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 04 Nov 2020 19:10:31 -0800
Received: from [10.226.38.24] (unknown [10.226.38.24])
 by linux.intel.com (Postfix) with ESMTP id A401558078C;
 Wed,  4 Nov 2020 19:10:28 -0800 (PST)
Subject: Re: [PATCH v16 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To: Rob Herring <robh@kernel.org>
References: <20201103075655.18699-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201103075655.18699-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201104185631.GA3946406@bogus>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <877b315f-c551-822d-71a8-84589b116c0f@linux.intel.com>
Date: Thu, 5 Nov 2020 11:10:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104185631.GA3946406@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_221037_681371_32BE5F47 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tudor.ambarus@microchip.com, richard@nod.at, simon.k.r.goldschmidt@gmail.com,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, qi-ming.wu@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

On 5/11/2020 2:56 am, Rob Herring wrote:
> On Tue, 03 Nov 2020 15:56:54 +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 99 ++++++++++++++++++++++
>>   1 file changed, 99 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml:24:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
> 
> dtschema/dtc warnings/errors:
> 
> 
> See https://patchwork.ozlabs.org/patch/1392698
> 
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
Thank you Rob, will install, check and update.

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
