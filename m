Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121BDC4363A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 10:14:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79660221FF
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 10:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V1rZaGdF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79660221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haWgxQpuaAjWT1JQPma2pqtqA1gVE5341cm4ggn9FwU=; b=V1rZaGdFFdoGzE
	P/vv1q64ub2rLpGBHTGC0SCtJ8N6F9dj1C7/X+M7LxVktbg1Q7WcUDHGCJBCaZdU0gtjjWFoHxLe2
	sWqbaz8rSOUJ9DB5AJ6g1elKiE6wknrw/MkDcyHjniU7ivHgj59nGBBmjyiInoE1v08RA6xgaeh/S
	ZjePf1MJ0lLvd/rkIgiOodHEjEs8e9lWRayP7nyGXrJsfF3qCpiarnWU9/jOg5eMG8adc0aoZ3U/+
	6Wvz+PhEFJxibz0qA7uBTXhVXshNcBXGbMj5wGiemUIgX8Wk5Y71kG0Yq2oQSFl7MMB4bXB/svlSU
	DhlKV0TCbGPH4agDNIRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYROc-0000gD-2s; Fri, 30 Oct 2020 10:12:34 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYRLH-0007Zh-KS
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 10:09:24 +0000
IronPort-SDR: SImW+v6+yqo+/L7N4U0dlydIV6Ht6wx0YItMbzHDWo2o1kSADQyvM9fqkE0lJJrdy12nh1AZZN
 o1vV8/HzgjhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168716386"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="168716386"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 03:09:00 -0700
IronPort-SDR: mFvDCriwTsMm57moiZ5dHGjEUb97JPysXglsWYC7Z6KfmLA+w07/xGl9mpfV4Hf9+u/kqIdyHq
 WWzYj5zMardg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="356553438"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 30 Oct 2020 03:08:59 -0700
Received: from [10.255.142.248] (vramuthx-MOBL1.gar.corp.intel.com
 [10.255.142.248])
 by linux.intel.com (Postfix) with ESMTP id 86BAD5808A3;
 Fri, 30 Oct 2020 03:08:49 -0700 (PDT)
Subject: Re: [RESENDPATCH v15 2/2] mtd: rawnand: Add NAND controller support
 on Intel LGM SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20201026073021.33327-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201026073021.33327-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201028112037.326c06e2@xps13>
 <ab2b0b7a-93b6-51e4-ec08-7af4f4f38745@linux.intel.com>
 <20201030092329.280466d9@xps13>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <3ac47b27-5399-e0e7-43f3-d4394c26f800@linux.intel.com>
Date: Fri, 30 Oct 2020 18:08:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201030092329.280466d9@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_060907_937964_5C30E23E 
X-CRM114-Status: GOOD (  16.11  )
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
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 qi-ming.wu@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Thank you for the review comments...
On 30/10/2020 4:23 pm, Miquel Raynal wrote:
>>>> +
>>>> +static const struct of_device_id ebu_nand_match[] = {
>>>> +	{ .compatible = "intel,nand-controller", },
>>> No version or soc in the compatible? (not mandatory).
>> Yes, you're right, it should be "intel,lgm-ebunand", but this same driver supports 2 dfferent SOC's , that's the reason kept as generic
>> "intel,nand-controller"
> In this case I guess declaring two compatibles is the way to go.
Ok, Noted.

Best Regards
Vadivel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
