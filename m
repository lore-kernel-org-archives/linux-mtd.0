Return-Path: <SRS0=GPAM=77=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FD9C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 14:24:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBDD207E8
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 14:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwPFUDbL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBDD207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VC1BGMR5fnziKlLYEnETjc9ahNkdd87ixfzkVEcTiy8=; b=pwPFUDbLgVk2p+
	Uio2lh0aOAYKog71BLA9P2yCQFENJAjCSdeyI3j6Z57/2ULaUsctw7gLXxHsoef2H1G/ydjFeA7uw
	vQP2nO+i/DR9HSQGCJlljDPdF6VRD33fcTLNq/YOMUNd8oWPHhV4e0S3J6gYfy0I7n1DDS5LbHFS/
	CSii6y+4xFrf9pA5LujyOJFEZZsqUBh7e6AmrQl4tkoLoETR+5HU9dip+Hh7cuXzDAxNCBZHcFxuM
	STRnRyWgN9kTaYzlMmlbzakS8JBSA2NYJOpK7V3T8WThGKVSQTQRoM+2yYf/2dOxsoQ01t4qu0437
	xd5eGNXJiZVRV+iRHKEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlvSL-0006Cd-KK; Thu, 18 Jun 2020 14:23:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlvSI-0006BV-Bb
 for linux-mtd@lists.infradead.org; Thu, 18 Jun 2020 14:23:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 048132A4DC9
Subject: Re: next/master bisection: baseline.login on
 ox820-cloudengines-pogoplug-series-3
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
 <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
 <20200618152324.0b0007a9@xps13> <20200618160925.6f77b1d1@xps13>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
Date: Thu, 18 Jun 2020 15:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618160925.6f77b1d1@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_072350_529283_B5F56E7F 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, kernelci-results@groups.io,
 Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 linux-next@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Thomas Gleixner <tglx@linutronix.de>, Mason Yang <masonccyang@mxic.com.tw>,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 18/06/2020 15:09, Miquel Raynal wrote:
> Hi Guillaume,
> 
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 18 Jun 2020
> 15:23:24 +0200:
> 
>> Hi Guillaume,
>>
>> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
>> 2020 13:28:05 +0100:
>>
>>> Please see the bisection report below about a kernel panic.
>>>
>>> Reports aren't automatically sent to the public while we're
>>> trialing new bisection features on kernelci.org but this one
>>> looks valid.
>>>
>>> See the kernel Oops due to a NULL pointer followed by a panic:
>>>
>>>   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504
>>
>> Thanks for the report, I will not be able to manage it before Monday,
>> but I'll try to take care of it early next week.
> 
> Actually Boris saw the issue, I just updated nand/next, it should be
> part of tomorrow's linux-next. Could you please report if it fixes your
> boot?

Sure, will check tomorrow.  Thanks for the update.

We may also consider adding the nand/next branch to kernelci.org
and catch issues earlier.  We can discuss that separately.

Guillaume

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
