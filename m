Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C92C433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:03:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD6E64E98
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD6E64E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ec8n+96sA9Gg9D0SdUlG6GHdBX9xEjsYBGRl+GfTCDY=; b=b/y+YPYxKD6+aKUDTu32W6BmM
	YJ2C1ginM/vOTO6YlsQBE/3Dr7QhR8r1yiHIGV+3fVzYZbYS/oyhKPhikeJkpIRrgXOMpWLhROYNU
	aVOlEoDMehZ4fYX3M9Ncgyo329u8rqp4r1z6/XL5J17uvmKUn2Fzg8v9EmzuOH0B9FjmZRDvo5IVc
	7r769QgGNdpzHMtMayezabNxFDqv2XNRzkXQajoQyi9d/TA91+sUqxXrTd4NbfuoDEYEA37PstekX
	8LPA/A8CtLUfyZfFj1VnVwh0bjK1i4u13EqiSWA190PgOqMkQwBD6cOrzqpo4qkH0P3VPSfh56U3P
	y8LKXJZBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLk31-00FTMg-87; Mon, 15 Mar 2021 10:02:04 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLk2s-00FTLL-SE
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 10:01:56 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ADD4F2223A;
 Mon, 15 Mar 2021 11:01:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615802513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGPd+CT8s79hFeiEpM/nnYfFAxMfPqg60ZHDn0T03J4=;
 b=fGMoLNBJp8Pp/nYl6HtpNFLCX0GQXr4Ri1CbML5wUaQlTuTTaEvXwh23HCkE6qt8f6GC8k
 QkoWMKAdUOQ+JI3xVfpVc0iN7dkMZakL1h1JX3xbstUCopdIWzEisVxJRGP1gjXZ7VDNAp
 LMhpf0eyYmLuaQ6jNZnoJ8Y3kZF37Vc=
MIME-Version: 1.0
Date: Mon, 15 Mar 2021 11:01:53 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add OTP support
In-Reply-To: <f0ffd9b3-94d1-05ca-7e90-5014bf7a3db4@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-2-michael@walle.cc>
 <7dd4bfb0-bb38-20c8-68e1-ece836c847fa@microchip.com>
 <b83dbbcdee6bdeee0d494ba79fd792e4@walle.cc>
 <8b35d8f6-6ff8-9bf3-02bd-434cf46acccb@microchip.com>
 <f0ffd9b3-94d1-05ca-7e90-5014bf7a3db4@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <bbbc6230b7d60a2421520ce7d163be56@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_100155_140341_B2785990 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-03-15 10:44, schrieb Tudor.Ambarus@microchip.com:
> On 3/15/21 11:39 AM, Tudor Ambarus - M18064 wrote:
>> On 3/15/21 11:23 AM, Michael Walle wrote:
>> 
>> cut
>> 
>>>>> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
>>>>> new file mode 100644
>>>>> index 000000000000..4e301fd5156b
>>>>> --- /dev/null
>>>>> +++ b/drivers/mtd/spi-nor/otp.c
>>>>> @@ -0,0 +1,218 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * OTP support for SPI NOR flashes
>>>>> + *
>>>>> + * Copyright (C) 2021 Michael Walle <michael@walle.cc>> + */
>>>>> +
>>>>> +#include <linux/log2.h>
>>>>> +#include <linux/mtd/mtd.h>
>>>>> +#include <linux/mtd/spi-nor.h>
>>>>> +
>>>>> +#include "core.h"
>>>>> +
>>>>> +#define spi_nor_otp_ops(nor) ((nor)->params->otp.ops)
>>>>> +#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
>>>>> +#define spi_nor_otp_n_regions(nor)
>>>>> ((nor)->params->otp.org->n_regions)
>>>> 
>>>> I don't like these wrappers because they gratuiously hide what's 
>>>> really
>>>> there.
>>>> I find the code more easier to read without these wrappers, because 
>>>> I
>>>> don't
>>>> have to memorize what these wrappers are doing, and I better see how
>>>> the code
>>>> is organized.
>>> 
>>> TBH I find it easier on the eye and I've never seen so much 
>>> dereferences
>>> as in mtd/spi-nor.
> 
> the dereferences will still be there, but will be just hidden by these 
> wrappers,
> don't they? Why would one prefer the wrappers?

That's why I wrote "easier on the eye", yes that is subjective. But
there are also technical aspects, for example, the helpers all
operate on "struct nor*", so you don't have to use the
dereference chain or build up local variables. For example, see
spi_nor_otp_read_write(), it doesn't have to know
anything about the "struct spi_nor_otp_organization".

And of course you could change the actual implementation
without touching the code everywhere,.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
