Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE400C388F9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 02:17:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DDE2469C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 02:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bSzAMNyJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15DDE2469C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cLXivF4TMFXJc9OpKEEQruMqQ69qWThffMi4mEzgMA=; b=bSzAMNyJYyQYtT
	PKWaX0mbspQZD0yQQgzjyLV9fveKBxn0aPm5bjG7eewLpMaMEz6TkkH1X8KgSjtH/5C9yTid1PV+O
	a96EjHDr2u5GY4fZIKS87gnhsbnK1qudAZpuWjaoqdPSvDfv4NazNt5Ichs4Eu8l8kUSxZn3ywgk1
	Os3iCwa2OreLiBU4reiayPqqEfWI5SsYCA75UYwpidyWk90e2w3N/tgzaFgkdo9wfDlspL2KLAt0v
	tQzgYRvdPyAWAZjL1TORMIDeGJE/fIA2acl/0eXZewlBir3ygf50YSvbBBYy/D3Oe8fY9Rm20Sz33
	+yGSjWaq2o4/RD1ToUww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keqXi-0000zR-RW; Tue, 17 Nov 2020 02:16:26 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keqXg-0000z2-5J
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 02:16:25 +0000
IronPort-SDR: rs5fbOVpUUZN2NUjPf+h6iH8Od2HQAmspc9KHneZVPExX9YuMzgvZ9t0F4e/zsnLjuCyUOVauC
 Nd9RSXHZBiYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="188900335"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="188900335"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 18:16:19 -0800
IronPort-SDR: Di+NFc+q6jZhrHWVsvRMrloOEAgjXLd3pyvSbWk3pssZl2eMj0jBfZFWzP92vTT6Q8yv2mDgjo
 zrrdzn2/SLmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="367922696"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 16 Nov 2020 18:16:18 -0800
Received: from [10.213.151.175] (vramuthx-MOBL1.gar.corp.intel.com
 [10.213.151.175])
 by linux.intel.com (Postfix) with ESMTP id 1A900580428;
 Mon, 16 Nov 2020 18:16:15 -0800 (PST)
Subject: Re: [PATCH v7 5/6] dt-bindings: spi: Convert cadence-quadspi.txt to
 cadence-quadspi.yaml
To: Mark Brown <broonie@kernel.org>
References: <20201116031003.19062-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201116031003.19062-6-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201116190733.GF4739@sirena.org.uk>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <17f8b568-77f6-df85-252c-2edadd2a76e5@linux.intel.com>
Date: Tue, 17 Nov 2020 10:16:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201116190733.GF4739@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_211624_373059_0A6C26C0 
X-CRM114-Status: GOOD (  16.14  )
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
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, qi-ming.wu@intel.com, p.yadav@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mark,

On 17/11/2020 3:07 am, Mark Brown wrote:
> On Mon, Nov 16, 2020 at 11:10:02AM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Convert the cadence-quadspi.txt documentation to cadence-quadspi.yaml
>> remove the cadence-quadspi.txt from Documentation/devicetree/bindings/spi/
> 
> As previously and repeatedly requested please make any conversions to
> YAML the *final* thing in serieses so that issues with the conversion do
> not hold up other development.
Thank you for the suggestions...
I understood like order of series to be changed, that's the reason 
added-up YAML conversion patches at the end of series, sorry I will drop 
the patches of YAML conversion.

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
