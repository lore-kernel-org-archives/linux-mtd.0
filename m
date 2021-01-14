Return-Path: <SRS0=+zBv=GR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8FEC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 03:36:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BC823600
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 03:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BC823600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cl+RGmdYipKU+/uDjD6SiDgOYt3Pck+KXD4EQA5ZLqs=; b=mJe7dc0qsLJiIwvF4ddcQuPuD
	vAnyA3zt1SP69pvJ1Iast9iGW2y0Es5IvpwLCcxh7G6flWUKVlR9t/5ePj1xpOufbQ1wFI2MXUjRN
	p1TVawbgd+FKNhajzESXBhQpdK5naXWBchKucagQuvYrxFvf9stHX77mVKzdvMWt9I+w+ofNh7dcn
	RR8lswY043NojmWQ5e0O04vmY/dQDaxH+ybFFRTYxoCI86oH1Va2Y9RqQYXxUqPDEwqxbVDSvgbyk
	wrpus9mApaEuYEIwCRO65zuwWsvNqmWw+09WME8GLLX1ZcAUt9nakLbwi1JxIqbFWRg0pzuG3g3T+
	19fUy4bQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kztQC-0006Qj-6T; Thu, 14 Jan 2021 03:35:40 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kztQ9-0006Q5-Ez
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2021 03:35:38 +0000
IronPort-SDR: Sk0lDFLAmTakNxHZ3qoJ47kJr8EfYKdWhhOMskU/JFR+ydBdu/bvtMOm89E5LNfY7cHyDQPyxR
 JKZtorltOpBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="165976953"
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="165976953"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 19:35:35 -0800
IronPort-SDR: ygzTiOHXJJWannPZltaZAD28jha+8ihALXpvtTjpIPOTgv3dQCeRSxdqh0hOZHE3o5I725urN6
 D/Gk0dnee8QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="499471394"
Received: from imail001.iil.intel.com ([10.184.82.104])
 by orsmga004.jf.intel.com with ESMTP; 13 Jan 2021 19:35:32 -0800
Received: from [10.215.249.35] (cheolyon-MOBL.gar.corp.intel.com
 [10.215.249.35])
 by imail001.iil.intel.com with ESMTP id 10E3ZYsJ004016;
 Thu, 14 Jan 2021 05:35:35 +0200
From: "Kim, Cheol Yong" <cheol.yong.kim@linux.intel.com>
Subject: Re: [PATCH v9 0/5] spi: cadence-quadspi: Add QSPI controller support
 for Intel LGM SoC
To: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, rtanwar@maxlinear.com
References: <20201124041840.31066-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <161055171029.21847.3382759454400721764.b4-ty@kernel.org>
Message-ID: <6916fcc9-3132-2786-5c36-de3b64721694@linux.intel.com>
Date: Thu, 14 Jan 2021 11:35:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <161055171029.21847.3382759454400721764.b4-ty@kernel.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_223537_660761_ADA6B9FF 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: cheol.yong.kim@intel.com, vigneshr@ti.com, ckim@maxlinear.com,
 linux-mtd@lists.infradead.org, "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>,
 qi-ming.wu@intel.com, p.yadav@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 1/13/2021 11:28 PM, Mark Brown wrote:
> On Tue, 24 Nov 2020 12:18:35 +0800, Ramuthevar, Vadivel MuruganX wrote:
>> Add QSPI controller support for Intel LGM SoC.
>>
>> Patches to move move bindings over to
>> "Documentation/devicetree/bindings/spi/" directory and also added compatible
>> Support for Intel platform.
>>
>> dt-bindings: spi: cadence-qspi: Add support for Intel lgm-qspi
>> (earlier patch mail thread and Ack-by)
>> link: "https://lore.kernel.org/lkml/5d6d1b85.1c69fb81.96938.0315@mx.google.com/"
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
>
> Thanks!
>
> [1/5] spi: cadence-quadspi: Add QSPI support for Intel LGM SoC
>        commit: ab2d28750aacb773dc42d72fbad59146e8a6db5e
> [2/5] spi: cadence-quadspi: Disable the DAC for Intel LGM SoC
>        commit: ad2775dc3fc5d30dd51984ccbaa736cc7ea9caca
> [3/5] spi: cadence-quadspi: Add multi-chipselect support for Intel LGM SoC
>        commit: b436fb7d29bfa48ff5e00cbf413609c7a6d4d81e
> [4/5] spi: Move cadence-quadspi.txt to Documentation/devicetree/bindings/spi
>        commit: eb4aadc31ef4224b926d5165048cb297f4bda34f
> [5/5] dt-bindings: spi: cadence-qspi: Add support for Intel lgm-qspi
>        commit: fcebca39938fa9f6ed03f27fc75645ad7fd489e9
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

Thanks Mark!

Vadivel left company. Added Rahul <rtanwar@maxlinear.com> as a maintainer


>
> Thanks,
> Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
