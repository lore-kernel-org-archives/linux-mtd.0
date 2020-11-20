Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83536C63777
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 00:35:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D073D22240
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 00:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RTGcsWDH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D073D22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4gUJIg+WnlMFzbydtwsMryURedurnfXr1eWFKrLsy4=; b=RTGcsWDHl8awaO
	s+VrN+4VQJNMLe0mfYZMa8FJiCvp/qB0L3/vV67rxAFeWUWTuo1DzSOtQFufkcpQlRlwt6+3c4UIn
	ERWfBfDnroBuKT3iakfIc+Ky6Sz600jjH+mYfl2j0qT8vA4QWljLA7TMEs9AqzIybNCRJ5r5NBbYl
	Uy5ttZZjAb1SS6KNhsYBuK8utS6wF2+ewAKi+Xm131a+TnxOQnSpREgH3YVkmNqOC1WqUhLqibb3N
	Tqqi4SH9V0fukMZYL7wHWVHm8EGml6MJEJhf4ibtIkTiDggXNhjQG5mL8vj4qSMtVGPL2dC0FrjRk
	4whMk2boniTyA/LZl9Tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfuNi-0006fX-6N; Fri, 20 Nov 2020 00:34:30 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfuNe-0006et-Lv
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 00:34:27 +0000
IronPort-SDR: nXK2CTtBDfTXhxh3SPCT6KHSzxqlAHrzslU3uppcIAH5NpHYGC/bektpsw2aBgQi109f3VBV8e
 V3/McisM557Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="170608965"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="170608965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 16:34:25 -0800
IronPort-SDR: eeeBn7+16YW+iSbQfMJEJ2UAcXVpvq/j7G9JdiIzK1GWAklsaRWMgOpNUpkMUE8KLNi1SIH5gq
 g25Uqvr95ujQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="534981484"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2020 16:34:24 -0800
Received: from [10.213.153.3] (vramuthx-MOBL1.gar.corp.intel.com
 [10.213.153.3])
 by linux.intel.com (Postfix) with ESMTP id A8653580409;
 Thu, 19 Nov 2020 16:34:22 -0800 (PST)
Subject: Re: [PATCH v8 0/6] spi: cadence-quadspi: Add QSPI controller support
 for Intel LGM SoC
To: Vignesh Raghavendra <vigneshr@ti.com>, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
References: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <3f9abc46-b874-465e-152f-f6c0065e5613@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <9d0ed730-59fc-b00e-5648-f1e5aeab0333@linux.intel.com>
Date: Fri, 20 Nov 2020 08:34:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <3f9abc46-b874-465e-152f-f6c0065e5613@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_193426_884574_A2B852D5 
X-CRM114-Status: GOOD (  24.96  )
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

Thank you for the review comments...

On 19/11/2020 9:06 pm, Vignesh Raghavendra wrote:
> 
> 
> On 11/19/20 11:25 AM, Ramuthevar,Vadivel MuruganX wrote:
>> Add QSPI controller support for Intel LGM SoC.
>>
>> Note from Vignesh(mtd subsystem maintainer):
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
> 
> This text no longer makes sense anymore with few patches dropped and
> others reordered
Just for reference added, will drop it.
> 
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
> 
>>
>> Ramuthevar Vadivel Murugan (6):
>>    spi: cadence-quadspi: Add QSPI support for Intel LGM SoC
>>    spi: cadence-quadspi: Disable the DAC for Intel LGM SoC
>>    spi: cadence-quadspi: Add multi-chipselect support for Intel LGM SoC
>>    spi: Move cadence-quadspi.txt to Documentation/devicetree/bindings/spi
>>    dt-bindings: spi: Convert cadence-quadspi.txt to cadence-quadspi.yaml
>>    dt-bindings: spi: Add compatible for Intel LGM SoC
>>
> 
> This is quite confusing... Summary/diffstat still shows patches 4 to 6
> and so does the patch numbering in $subject while changelog says
> otherwise and I received only 3 patches in my Inbox?
oh my bad, while patch creation wrongly added, will correct it, thanks!

Regards
Vadivel
> 
> 
>>   .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 ----------
>>   .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 148 +++++++++++++++++++++
>>   drivers/spi/Kconfig                                |   2 +-
>>   drivers/spi/spi-cadence-quadspi.c                  |  33 ++++-
>>   4 files changed, 178 insertions(+), 72 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>>   create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>>
> 
> So does the diffstat...
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
