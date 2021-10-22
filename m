Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BD6C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFFDB61073
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFFDB61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB/60tgIrU9eFjEPnkV5NwL7Bpo+G+v1g+tavS7d1ro=; b=Z5/hqNTzGMH6HdQVYgICsk6/g0
	cgSs5cXGJtWLvylZQNZTcdpM91waNr5xTRqHVjlEdNGRr9ooBgNNNznWEM5VLu3H/qWYWZgHtGYDJ
	1KPKx6wZAj+nzuBvRGTqhGSUYb0F2MK/XKKSlsI8NeSPYEFB7KFT+8d+BoKC/MQJCzsuV1g70PJr9
	uyAzBgbVIRq6d2cLPRU7nOEasV2vWgfsTqWgPHOcUtDY//KHVRtFux5KipWuLBwBL0AS8+rZ7DCnG
	8+vvzmBgBVubqIOJfYmMxALm6dYChZZcHwrtRnYF8EBttCFTOryqyLIm5OZTF25h5XbevOjRra1lL
	x/F1w1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduEk-00B1Kq-4s; Fri, 22 Oct 2021 13:05:30 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdu8p-00Azqc-9d; Fri, 22 Oct 2021 12:59:24 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B1A7F221E1;
 Fri, 22 Oct 2021 14:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634907560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7i06/7crUUpElbUX/H8oxvuIyYHMsk0vTas7h4qU3w=;
 b=kiY/Lj+UlorFJ/Mn5Pl9XPhVwgA5wVCikc0U75HZKs43B0QsbOvznfHRCNdlGYkFbS3FmI
 /sDfCo9TCIZVHodNc8b69OG6LSUL8pqB6bWIMGvRIJv7xzeFWR87qusu0wkq8RFmA9zSmF
 G0h1B5BLCWnGvzs52PbW13u85O1zMT0=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 14:59:19 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
In-Reply-To: <eed6741d-cbb2-4f67-2780-6ba107eec0f8@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
 <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
 <20211022121010.mzul7qsxi6s4ru2w@ti.com>
 <eed6741d-cbb2-4f67-2780-6ba107eec0f8@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5a1497c9b2f07b2e6b91deb8ef17646f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_055923_551400_3829C3FF 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-22 14:42, schrieb Tudor.Ambarus@microchip.com:
> On 10/22/21 3:10 PM, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> On 22/10/21 01:21PM, Michael Walle wrote:
>>> Am 2021-08-17 12:24, schrieb Pratyush Yadav:
>>>> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>>>>> Used to initialize the NOR flags for settings that are not defined
>>>>> in the JESD216 SFDP standard, thus can not be retrieved when 
>>>>> parsing
>>>>> SFDP. No functional change.
>>>> 
>>>> I am worried if the order in which these flags are set can cause 
>>>> some
>>>> subtle bugs.
>>>> 
>>>> I can see one instance of it with SNOR_F_HAS_LOCK.
>>>> spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there 
>>>> are
>>>> no locking ops specified, it sets the default locking ops. This 
>>>> works
>>>> fine before this patch because the flag is set before the function 
>>>> is
>>>> called. But now, the flag will be set _after_ the function is 
>>>> called,
>>>> and so you will never be able to set the default flags.
>>> 
>>> Maybe we should just forbid to look at the SNOR_F_ flags in these
>>> functions. Instead the information could also be deduced by looking 
>>> at
>>> the SPI_NOR_ flags.
> 
> not true.

I guess you mean that some init flash init functions might set it, too.
Right? IMHO this goes into the spaghetti code direction again.
spi_nor_late_init_params() must not look at the SNOR_F_ flags. There
are too much inter-function dependencies and it is really hard to
follow the call chain.

The locking ops should also go into the (static) flash init which only
depends on the SPI_NOR_ flags. If SNOR_F_HAS_LOCK will be added at
in an init function, then this code should also take care of setting
the correct locking ops. Maybe both can be set together with a helper.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
