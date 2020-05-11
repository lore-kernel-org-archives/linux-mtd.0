Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB07DC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D1C2075E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4Ohq0a8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6D1C2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Jf+LIqR6UPDlDoN3fVP3smX7Tsz74IywFqNYboC2Ik=; b=n4Ohq0a88XedJN
	Wbo7P7Pi0IuTE6e/POVlCfaDvkWBjfH6KvjHw/AIJvQM6zliNeh2m8+/XI+xKn1pnfN8ANbkH6OPD
	iEFUJ8Zm9wsZtVJmIX30hn2NROqSfCJjnAqhB9HoseGIfMv8v3jvf2ynGiQVTTwtZx9UPI5igvENI
	MZjAVpyoeThs6QvWlgXsL6geUHh53GdNdUvyknvu2bRdSFNjJk0pbOmOmL5dODgmzO4lSm7wM+glK
	KfVFuFLsQmC8Oy3DI4GAcyRMpj6seMYT+bA2ve9bjvZbsnCOc381Vs1myzSYl68HWsNYfJXsJItlU
	MuaN+or7nLNJGhhd4Ewg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY5Xo-0004Ca-Jd; Mon, 11 May 2020 10:20:20 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY5Xm-0004Bl-BU
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 10:20:19 +0000
IronPort-SDR: ABDbKSgsxsT7ZevbLIOSYyzwyr6McMI1T1fOr3FgF+pK3I7LDBbc9jGMMaLI8wY86NWP3Y/f89
 mwlYgcGjRlmg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 03:20:16 -0700
IronPort-SDR: GykbylfSzbmV/Ej+HXrmqwM/DP9kmXhFLxS8nBCs3aM1cZXR1XgO6RGiLYoXzJ+n6eh2RUiScd
 ecpFI6YZJogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; d="scan'208";a="340510307"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 11 May 2020 03:20:16 -0700
Received: from [10.255.160.142] (vramuthx-mobl1.gar.corp.intel.com
 [10.255.160.142])
 by linux.intel.com (Postfix) with ESMTP id 715E4580569;
 Mon, 11 May 2020 03:20:13 -0700 (PDT)
Subject: Re: [PATCH 0/6] mtd: spi-nor: Move cadence-qaudspi to spi-mem
 framework
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>
References: <20200508185411.487-1-vigneshr@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <22e0fc24-fa40-9fe9-8a1b-7b8e5c080020@linux.intel.com>
Date: Mon, 11 May 2020 18:20:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508185411.487-1-vigneshr@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_032018_407807_2772A41B 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: marex@denx.de, Boris Brezillon <bbrezillon@kernel.org>,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, dinguyen@kernel.org, linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

On 9/5/2020 2:54 am, Vignesh Raghavendra wrote:
> Vadivel,
> 
> I have maintained the additional changes needed on top of this series
> for Intel platform that were part of your v12 series here (needs cleanup):
> 
> https://github.com/r-vignesh/linux.git  branch: cqspi-mig
> 
> Please use above branch to test the same.

Thank you for the sending the patches on behalf of, will do the cleanup.
also I have already prepared YAML file , will send as separate patch.

Regards
Vadivel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
