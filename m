Return-Path: <SRS0=paK1=PM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189B9C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Oct 2021 17:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1B060FE7
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Oct 2021 17:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF1B060FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXB/mLOo4q8amVUbQxpMruwxsQjoJklFABvI7FkxoE8=; b=iLn3nnJy9uk2hi+RpkoPGrHxUd
	k5lm2hcCAMxmREaV84XBRI9MRRYEo8Z0Dt2JdU8H2BiAwsBfu7oweKV8a4FaWRlRanMMa9q8PfO5W
	kcLeqLX1Yp33MYIU0HBleJzDcn+hviQirCTNXc+4L2KvI0uweYR6l34xh+1Iab01+VP79jHbZTQNo
	zFUSsFsu5xg6sUS41jQb/4G7QYDN3DP73cLlli5EmV6+EhMc4FiYr0D9gYors1rwo+NdGzcMumr3E
	Tz9I86N/tNkMm2YoicKZMv4fXDHeGH8ZBLURjI9gHb15dV9fdjmAPvzNI57iAPHq6mJ1fSr6WGotT
	v1iLLSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1megw7-00ENDy-Tt; Sun, 24 Oct 2021 17:05:31 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1megvs-00ENBQ-Et; Sun, 24 Oct 2021 17:05:19 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8562D22246;
 Sun, 24 Oct 2021 19:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1635095106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMsgAvJU2OAB241vv/84EM6plyk52Kzhi+0gOuUSunM=;
 b=cM12UzV83+uF6gFrZaauLwFba1f/BEpxhVFTeytZG99CkZY8TTqr/nKegT1g+/Tzk2WtnQ
 b+wxTcDQEUFaQrCYLhZZbcr/+Y0R/Xo/RZnPdNInuiI4vwFgX2/Wu/1JN/1og8qIlnr8q9
 oZGHB/YdQfo4GWHrHTnKjtYmwNWG3j8=
MIME-Version: 1.0
Date: Sun, 24 Oct 2021 19:05:01 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
In-Reply-To: <9bf93cbf-fc57-54ae-2439-45e4d75dc0b7@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
 <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
 <20211022121010.mzul7qsxi6s4ru2w@ti.com>
 <eed6741d-cbb2-4f67-2780-6ba107eec0f8@microchip.com>
 <5a1497c9b2f07b2e6b91deb8ef17646f@walle.cc>
 <9bf93cbf-fc57-54ae-2439-45e4d75dc0b7@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <b06ac5238d85f62ebe588f161e34cf59@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_100517_073931_78C165C9 
X-CRM114-Status: GOOD (  28.62  )
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

Am 2021-10-22 15:25, schrieb Tudor.Ambarus@microchip.com:
> On 10/22/21 3:59 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2021-10-22 14:42, schrieb Tudor.Ambarus@microchip.com:
>>> On 10/22/21 3:10 PM, Pratyush Yadav wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>>> know
>>>> the content is safe
>>>> 
>>>> On 22/10/21 01:21PM, Michael Walle wrote:
>>>>> Am 2021-08-17 12:24, schrieb Pratyush Yadav:
>>>>>> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>>>>>>> Used to initialize the NOR flags for settings that are not 
>>>>>>> defined
>>>>>>> in the JESD216 SFDP standard, thus can not be retrieved when
>>>>>>> parsing
>>>>>>> SFDP. No functional change.
>>>>>> 
>>>>>> I am worried if the order in which these flags are set can cause
>>>>>> some
>>>>>> subtle bugs.
>>>>>> 
>>>>>> I can see one instance of it with SNOR_F_HAS_LOCK.
>>>>>> spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there
>>>>>> are
>>>>>> no locking ops specified, it sets the default locking ops. This
>>>>>> works
>>>>>> fine before this patch because the flag is set before the function
>>>>>> is
>>>>>> called. But now, the flag will be set _after_ the function is
>>>>>> called,
>>>>>> and so you will never be able to set the default flags.
>>>>> 
>>>>> Maybe we should just forbid to look at the SNOR_F_ flags in these
>>>>> functions. Instead the information could also be deduced by looking
>>>>> at
>>>>> the SPI_NOR_ flags.
>>> 
>>> not true.
>> 
>> I guess you mean that some init flash init functions might set it, 
>> too.
>> Right? IMHO this goes into the spaghetti code direction again.
>> spi_nor_late_init_params() must not look at the SNOR_F_ flags. There
>> are too much inter-function dependencies and it is really hard to
>> follow the call chain.
> 
> I don't think I understand what you are referring to. The flash_info 
> flags
> are used just to set their SNOR_F correspondents. Take 
> SNOR_F_4B_OPCODES for
> example. A flash that can't discover 4b opcodes support when parsing 
> SFDP,
> will set the SPI_NOR_4B_OPCODES flash_info flag. Flashes that can 
> discover it,
> will ignore/not set the SPI_NOR_4B_OPCODES flag, and let the SFDP do 
> its thing:
> the SFDP code will set the SNOR_F_4B_OPCODES flag. The only flags that 
> are used
> across the SPI NOR core are the nor->flags (SNOR_F).

Sorry, I wasn't clear enough. I was talking about checking (already set) 
SNOR_F
flags in all these init functions ({flash,manufacturer)->post_sfdp(),
(flash,manufacturer)->late_init, ..). If we didn't allow this, then
we would avoid all these "subtle bugs" which happen because some of 
these
functions depend on another being called first. I.e. all the called
functions within spi_nor_init_params() may only add SNOR_F flags, but 
must
not actually use them. [I see that spi_nor_sfdp_init_params() will
remove SNOR_F_4B_OPCODES. Mhh.]

Btw. I wonder what is the difference between a member being in "struct 
spi_nor"
and being in "struct spi_nor_flash_parameter". Apparently, it should
contain the properties which can be set/changed in the fixups or by
parsing the SFPD. But then there are also the flags which are also
changed in the fixups.

Maybe we should pass the "struct nor" as const and a second parameter
"struct spi_nor_flash_parameter *params" which can be updated by the
called function. This way we can be sure the functions won't change
anything else. I don't suggest to do that right now, just to start
a discussion.

>> The locking ops should also go into the (static) flash init which only
>> depends on the SPI_NOR_ flags. If SNOR_F_HAS_LOCK will be added at
> 
> we don't have to specify the locking methods, we have generic ones. A 
> single
> flag is enough.

Hm, I'm not really sure we need that SNOR_F_HAS_LOCK flag at all.
"if (nor->params->locking_ops)" should be the same. At least the current 
code
which checks the info->flags for SPI_NOR_HAS_LOCK will set the default
locking ops instead of just setting the SNOR_F_HAS_LOCK.

>> in an init function, then this code should also take care of setting
> 
> what init function? We're just setting some flags.

all the functions called in spi_nor_init_params().

>> the correct locking ops. Maybe both can be set together with a helper.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
