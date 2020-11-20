Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D68C388F9
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 00:08:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E683C2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 00:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yOC6ahZv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E683C2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PNewjXh/SSuw9QxDdlZy09/hHErro8pFBI60B98enI=; b=yOC6ahZvm14m3g
	GSTnRoM7dC6RPvi0W/+V2JKpFFx/oG58taQAJISISw/GAefpfyhlh7Y+lPkZijtKQzA+1l8cGIf/n
	/5/oK4spMjeRycewY5sKjRIhlq8fUzASkJFhS++buFT7ASNKpj2Es/ZRZx1QXaQ/CMXyzk9Mx+LZL
	dcVbOyWi/pHTv6T+evDlO4CSwON+DmnUN5l/rUZYtS8rTYhuPkdAzgof46OSuKXtfz570WXpq1Au3
	il0OXyE28/AKw2Cdn4V+gv2m377c/NpG9JkbfqfqGUxE5RLEcXKjFw7v0GjY+VXvJZVi7LfQAn7ig
	+2lJIeaUSFh7VkjSK8Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kftx5-0004HX-OW; Fri, 20 Nov 2020 00:06:59 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kftwx-0004Fp-7E
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 00:06:57 +0000
IronPort-SDR: IaJzoJflw+C/B85JPYT5tA6yJ47Fk3hsfV/DynLVdL6b7HhNs9rH9aQB1a86cmG/Qu2G4ScAlt
 LZDth14y0Jvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="168814804"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="168814804"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 16:06:44 -0800
IronPort-SDR: iz+IielfoYppbtbikNhl3Wz2qLKZa2w0KeA48U77kvg/3ENjHg7xD+kQMaK7TM4lLN8PWKg+s4
 hFNuXq6YmpQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="360222742"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 19 Nov 2020 16:06:43 -0800
Received: from [10.213.153.3] (vramuthx-MOBL1.gar.corp.intel.com
 [10.213.153.3])
 by linux.intel.com (Postfix) with ESMTP id A8265580806;
 Thu, 19 Nov 2020 16:06:40 -0800 (PST)
Subject: Re: [PATCH v8 0/6] spi: cadence-quadspi: Add QSPI controller support
 for Intel LGM SoC
To: Vignesh Raghavendra <vigneshr@ti.com>, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
References: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <98b7b367-0bf3-e745-1dd2-302f76bab0b7@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <b57321fc-f6ff-1a15-20fa-e776416544c9@linux.intel.com>
Date: Fri, 20 Nov 2020 08:06:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <98b7b367-0bf3-e745-1dd2-302f76bab0b7@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_190651_482601_F67D047E 
X-CRM114-Status: GOOD (  21.45  )
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
Cc: cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
 linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Vignesh,

Thank you very much for the review comments...

On 19/11/2020 8:36 pm, Vignesh Raghavendra wrote:
> 
> 
> On 11/19/20 11:25 AM, Ramuthevar,Vadivel MuruganX wrote:
>> Add QSPI controller support for Intel LGM SoC.
>>
>> Note from Vignesh(mtd subsystem maintainer):H
>> This series is a subset of "[PATCH v12 0/4] spi: cadence-quadspi: Add
>> support for the Cadence QSPI controller" by Ramuthevar,Vadivel MuruganX
>> <vadivel.muruganx.ramuthevar@linux.intel.com> that intended to move
>> cadence-quadspi driver to spi-mem framework
>>
>> Those patches were trying to accomplish too many things in a single set
>> of patches and need to split into smaller patches. This is reduced
>> version of above series.
>>
>> Changes that are intended to make migration easy are split into separate
>> patches. Patches 1 to 3 drop features that cannot be supported under
>> spi-mem at the moment (backward compatibility is maintained).
>> Patch 4-5 are trivial cleanups. Patch 6 does the actual conversion to
>> spi-mem and patch 7 moves the driver to drivers/spi folder.
>>
>> I have tested both INDAC mode (used by non TI platforms like Altera
>> SoCFPGA) and DAC mode (used by TI platforms) on TI EVMs.
>>
>> Patches to move move bindings over to
>> "Documentation/devicetree/bindings/spi/" directory and also conversion
>> of bindig doc to YAML will be posted separately.  Support for Intel
>> platform would follow that.
>>
>> Reference:
>>          https://lkml.org/lkml/2020/6/1/50
>>
>> ---
>> v8:
>>    - As Mark suggested to add the dt-bindings documentation patches
>>      end of the series , so dropped.
> 
> Suggestion was to drop patches converting legacy binding doc to YAML schema.
> You still need to include a patch documenting new compatible
> "intel,lgm-qspi" in the existing (legacy) binding doc.
Noted, will do that.

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
