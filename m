Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A24C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 12:44:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2433520721
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 12:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YG23R0J2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2433520721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/gf3/2dftN7nglUo+uPjjKAAmgElDGtY05VtqziTDc=; b=YG23R0J2Jrre7V
	nbYZ93SuSPRvXI2he/ZSliVfcjeKdWfA19/WWzU6uI7qBRKcV5n5LgYZkL8DEVEtHACyW3xqFgzx3
	bz+O76+RmF7zbd9QDd1J0NJRW9oA0YsR3hnsfjJfLVBRe8Np467FebPODfN+403e1p5OFy4rmTphh
	fqDTyQXseYaK1lyQsCrWkZqjRtjKlhhMtDdSIzC7ag1p6OhDvEvmHemOHoBqcG/4n06aafzBlgTu4
	HQ3ou+83pjQbv4En1H/o8uSGLjNmKPFGaXFoOpphQMmpgtOqb0/U9fSxs7u9xOxjzAzX6t+K5AMlK
	wfrL+f60rygcwQYTAY4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbkYO-0004Vn-Uo; Thu, 21 May 2020 12:44:04 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbkYL-0004Un-EM
 for linux-mtd@lists.infradead.org; Thu, 21 May 2020 12:44:03 +0000
IronPort-SDR: areje04OFwT8j9wGhMGyUFTPl6mglQLWBaYEPa2VXrbVgwI1Z4AgLr82pqBtyZy/6FwzLdhbvN
 +5BsjAsPqD8w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 05:44:00 -0700
IronPort-SDR: aHzqo4PXnOejTBUW6P+vTkEhj/SEhiL123RZpfLwQmtEa6X671yVZFbDI44O4F2YeKwIAyFhWt
 6SSKRUz/9s7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; d="scan'208";a="412380047"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 21 May 2020 05:44:00 -0700
Received: from [10.215.164.158] (vramuthx-mobl1.gar.corp.intel.com
 [10.215.164.158])
 by linux.intel.com (Postfix) with ESMTP id D70DA5804B4;
 Thu, 21 May 2020 05:43:52 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
To: Mark Brown <broonie@kernel.org>
References: <20200520123612.11797-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200520124329.GF4823@sirena.org.uk>
 <fd086da7-7e18-83bc-d423-56095b0cff96@linux.intel.com>
 <20200521105646.GA4770@sirena.org.uk>
 <24b0297c-5c33-f690-9514-68b76fc2c9ea@linux.intel.com>
 <20200521122035.GB4770@sirena.org.uk>
 <463b24a4-0a6a-9fcf-7eb9-8fde602c0c13@linux.intel.com>
 <20200521123735.GC4770@sirena.org.uk>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <f2f15cc2-e2e4-3379-f3b8-ca31a65ded54@linux.intel.com>
Date: Thu, 21 May 2020 20:43:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521123735.GC4770@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_054401_523215_85309ABA 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: cheol.yong.kim@intel.com, robh@kernel.org, vigneshr@ti.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, qi-ming.wu@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mark,

On 21/5/2020 8:37 pm, Mark Brown wrote:
> On Thu, May 21, 2020 at 08:34:43PM +0800, Ramuthevar, Vadivel MuruganX wrote:
>> On 21/5/2020 8:20 pm, Mark Brown wrote:
> 
>>> I mean that any changes to the bindings ought to be split out into
>>> separate patches, if there's multiple changes it may make sense for
>>> there to be multiple patches.
> 
>> Got it, we do not have multiple changes since it is new YAML file.
>> in case if we feel anything to be added , we add as separate patches.
> 
> If this is just a conversion to YAML then your changelog is wildly
> inaccurate and needs to be improved, your changelog says you are adding
> new things.
Yes , You are right, just conversion only, over that adding/modifying 
few of the properties like compatible and node name in  the example..etc
Sure I will make a multiple patches , Thanks!

Regards
Vadivel

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
