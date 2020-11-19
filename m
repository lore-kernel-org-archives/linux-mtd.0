Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F382EC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 13:06:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A902076B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 13:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wB2sb4nk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rx+UHcNN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A902076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a5NizeE6/Kx+EVvsZyBMj7ZGcDAnyQN3ppjjW4E64Ko=; b=wB2sb4nkj3RH8Bl2BIYS8Ycul
	l0fnrlMlNIT0DANhwf+Eilj1iuvUAPJuH3E4cVDwJZnhAOV5wdEppJtdN45zYql1i6Ej4C8KYSi3f
	WwA4TDTrd+QhfDLJSGHgYth7NbZLxEj3zw3oI69TCkpjiNT1DIPg1XKOdnMxS6MiKaAlYsBFA3Ccb
	c22Na/l5qc1flU904rHiJPb12mBYz1MePk+1K2LSCMrNrH+xkI3x11iN3wvTcszI0QcWy61NUdR0h
	7ZYnviEFGyqmCw27OqQQ/9TqtzVnfqD2Y+IOzrrlHkHDjBrAWhcwQvFlLTiu9J79ZuZAK+DssJcB0
	sZCbzoi+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfjdd-0003Tc-Az; Thu, 19 Nov 2020 13:06:13 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfjdZ-0003T8-Dp
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 13:06:10 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJD64U9029545;
 Thu, 19 Nov 2020 07:06:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605791164;
 bh=K3hAeClCAz3KvgK7nzwBNZovMmLm/80uSNMpThLhLs8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=rx+UHcNNzp+1ZEgUgLnojxcVdsV9g4gBridDFgvNOt9hHAHL18gCMRRdCz6PkH60j
 OG7wyO3K+n5+T046jd48ww0uj3OId1c9A8KR109Oogr46Ts7/4O5xfQfGpL3FueVQn
 /nvrD65zxzavh1Za70uhvpXNLFjsoM/bgV3KWY1U=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJD64qk105099
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 07:06:04 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 07:06:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 07:06:03 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJD60gb051726;
 Thu, 19 Nov 2020 07:06:01 -0600
Subject: Re: [PATCH v8 0/6] spi: cadence-quadspi: Add QSPI controller support
 for Intel LGM SoC
To: "Ramuthevar,Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>,
 <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
References: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <3f9abc46-b874-465e-152f-f6c0065e5613@ti.com>
Date: Thu, 19 Nov 2020 18:36:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_080609_599220_D4313558 
X-CRM114-Status: GOOD (  24.10  )
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
Cc: cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
 linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/19/20 11:25 AM, Ramuthevar,Vadivel MuruganX wrote:
> Add QSPI controller support for Intel LGM SoC.
> 
> Note from Vignesh(mtd subsystem maintainer):
> This series is a subset of "[PATCH v12 0/4] spi: cadence-quadspi: Add
> support for the Cadence QSPI controller" by Ramuthevar,Vadivel MuruganX
> <vadivel.muruganx.ramuthevar@linux.intel.com> that intended to move
> cadence-quadspi driver to spi-mem framework
> 
> Those patches were trying to accomplish too many things in a single set
> of patches and need to split into smaller patches. This is reduced
> version of above series.
> 
> Changes that are intended to make migration easy are split into separate
> patches. Patches 1 to 3 drop features that cannot be supported under
> spi-mem at the moment (backward compatibility is maintained).
> Patch 4-5 are trivial cleanups. Patch 6 does the actual conversion to
> spi-mem and patch 7 moves the driver to drivers/spi folder.
> 

This text no longer makes sense anymore with few patches dropped and
others reordered

> I have tested both INDAC mode (used by non TI platforms like Altera
> SoCFPGA) and DAC mode (used by TI platforms) on TI EVMs.
> 
> Patches to move move bindings over to
> "Documentation/devicetree/bindings/spi/" directory and also conversion
> of bindig doc to YAML will be posted separately.  Support for Intel
> platform would follow that.
> 
> Reference:
>         https://lkml.org/lkml/2020/6/1/50
> 
> ---
> v8:
>   - As Mark suggested to add the dt-bindings documentation patches
>     end of the series , so dropped.  


> 
> Ramuthevar Vadivel Murugan (6):
>   spi: cadence-quadspi: Add QSPI support for Intel LGM SoC
>   spi: cadence-quadspi: Disable the DAC for Intel LGM SoC
>   spi: cadence-quadspi: Add multi-chipselect support for Intel LGM SoC
>   spi: Move cadence-quadspi.txt to Documentation/devicetree/bindings/spi
>   dt-bindings: spi: Convert cadence-quadspi.txt to cadence-quadspi.yaml
>   dt-bindings: spi: Add compatible for Intel LGM SoC
> 

This is quite confusing... Summary/diffstat still shows patches 4 to 6
and so does the patch numbering in $subject while changelog says
otherwise and I received only 3 patches in my Inbox?


>  .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 ----------
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 148 +++++++++++++++++++++
>  drivers/spi/Kconfig                                |   2 +-
>  drivers/spi/spi-cadence-quadspi.c                  |  33 ++++-
>  4 files changed, 178 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> 

So does the diffstat...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
