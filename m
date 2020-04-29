Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05607C83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 14:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8CC206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 14:26:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qxl4//g0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8CC206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6v+JI6VSaKiK3D+LB90maJlRTbiNga7vB1bw4O/lgc=; b=qxl4//g0Bd0GQn
	KzatKVoiR/G/DforkF5xgrNWn9z8VrWK37Nb7P9gncyvLdOwTxhAdWndEKL9S+McO5DvHN/HJkC7+
	laH51zKWhjY8Ptw83bauAXSnX+lxaU/EHnCcvV0cHOiNZGk+QPe3vg4L/JzW/qHV8ymBlG9x+dLgI
	bescLU8zSOhXaCpowbR3UhX5zrJiiaeNlfofcDgtQyrbD86WNVxjSUdZ8CGvinoEVdgVAzyWqEDjy
	9N1SVAObusSUVpLrCWp23eIieqhHHwewV6w9SO2oInNRBqfdhhUwwPyWnKjQ/2ZqVXcobZ/+NQDHy
	FHZh4Td8RuWThPxJUKaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTnfb-0001KI-5B; Wed, 29 Apr 2020 14:26:39 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTnfX-0001Ie-SA
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 14:26:37 +0000
IronPort-SDR: KNL+sb+HpGmUHzpqNUeOK5aTHIBWAuxdj2WfYc8w/5VCekOWS5bCmmcPEdkuKar42ACvPrfkj0
 KuLakJuYBHFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 07:26:32 -0700
IronPort-SDR: nHOb7/rn16dZLOGoxN/XQ9MazwIUxFRwGeiva5XLcWsEixjxco2xTE/14H6sL6yhYGSjRJXH0s
 ylx8I0GDw0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="248001618"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2020 07:26:31 -0700
Received: from [10.255.166.42] (vramuthx-mobl1.gar.corp.intel.com
 [10.255.166.42])
 by linux.intel.com (Postfix) with ESMTP id BD2D9580613;
 Wed, 29 Apr 2020 07:26:26 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429133308.4f91c35c@collabora.com>
 <4c946dbc-1518-0f0d-fac7-b2cfb4836440@linux.intel.com>
 <20200429153205.09c498cd@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <6b3ad9f3-2a3c-b44c-3c3f-24f2178dd3fa@linux.intel.com>
Date: Wed, 29 Apr 2020 22:26:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429153205.09c498cd@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_072635_924916_8B6C27A3 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

   Thank you very much for the review comments and your time...

On 29/4/2020 9:32 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 21:29:40 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>>      Thank you very much for the review comments and your time..
>>
>> On 29/4/2020 7:33 pm, Boris Brezillon wrote:
>>> On Wed, 29 Apr 2020 18:42:05 +0800
>>> "Ramuthevar,Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> +#define NAND_WRITE_CMD		(EBU_CON_CS_P_LOW | HSNAND_CLE_OFFS)
>>>> +#define NAND_WRITE_ADDR		(EBU_CON_CS_P_LOW | HSNAND_ALE_OFFS)
>>>> +
>>>
>>> I thought we agreed on dropping those definitions.
>>
>> Yes , we agreed upon it, due to assertion/de-assertion of CS kept it.
> 
> And I keep thinking we don't need that, just pass
> 'HSNAND_CLE_OFFS | HSNAND_CS_OFFS' directly.

Agreed!, will update in the next-patch version, Thanks!

Regards
Vadivel

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
