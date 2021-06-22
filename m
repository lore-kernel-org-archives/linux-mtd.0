Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFDAC48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 15:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D9D61370
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 15:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D9D61370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0L7mxka1s+xyAslv7YXttgxV9N3iJDAtOWi0Urtf/1A=; b=WrO6EgEvYa7DZw7JWOytzBX2sj
	LnMr083uXPd2PDeSfYHaHj6XqJ2Tht4X8gUSJvTTFH2/dvlDQnpiHIHpFfDqtzlvjNb3rhDxNIWSi
	oXb/u/Yy0vaBZI59c/bSvhoYv4nQ3O7WnqGxJGghHvFfrzelXa+mqfJGXYQWJGqaiesk2e9qwDKNY
	p7mEdfr9lDf11qkdeO7vOuw6x76LyXBiWpSJnT7rjf1AFbeBqvawi7WZEf2ebGpBMBAteGXaQI23i
	1CpCtgV+0xKS4GSx0ckXb0Sfq8NvvGvZLOodVCrcMxWLv0kT2AacKWhXsEbELPnvfFmEhy6M3H7UI
	v5MTVJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviUh-007lGp-UK; Tue, 22 Jun 2021 15:39:19 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviUe-007lFY-DL
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 15:39:17 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lviUa-00032Y-4w; Tue, 22 Jun 2021 15:39:12 +0000
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable
 warnings
To: Fabio Estevam <festevam@gmail.com>, Heiko Schocher <hs@denx.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, kernel-janitors@vger.kernel.org
References: <YMyir961W28TX5dT@mwanda>
 <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
 <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <aff4cbba-b8a4-445a-4290-7717355effc8@canonical.com>
Date: Tue, 22 Jun 2021 16:39:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_083916_502650_24A51A84 
X-CRM114-Status: GOOD (  14.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/06/2021 16:31, Fabio Estevam wrote:
> On Sat, Jun 19, 2021 at 3:23 AM Heiko Schocher <hs@denx.de> wrote:
>>
>> Hello Dan,
>>
>> On 18.06.21 15:42, Dan Carpenter wrote:
>>> Smatch complains that zero length read/writes will lead to an
>>> uninitalized return value.  I don't know if that's possible, but
>>> it's nicer to return a zero literal anyway so let's do that.
>>>
>>> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>> People, when we add a new driver can we make sure the first commit uses
>>> the new prefered subsystem prefix?  For example,
>>>
>>> "mtd: mchp48l640: add support for microchip 48l640 EERAM"
>>>       ^^^^^^^^^^
>>> Otherwise it's not clear to me what I should use as a patch prefix.
>>
>> Ok, sorry...
>>
>> Hmm... Colin already sent a fix for this, see:
>>
>> https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html
> 
> Yes, both patches work, but I think Dan's solution is a bit clearer, so:
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> Thanks
> 
Yep, I'm good with that.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
