Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E71C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 08:22:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D304164F92
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 08:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D304164F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sLWFaZjEssBvB98+L/A0czORRvOHjww0iG8CneYYz/k=; b=O9nSR8DKz1Al0xYLsgmHfo2Dz
	YVrXu4h+t8+ckpPR9oB5uvC8pBIzkfv5WnkwdPSA/Fcf/+IzZF3subGgsbjGsxCwNwmo2NukCP9t3
	17vqLW65cG57RjWypBPGN3daaHcQYCMZJFy7LB2SZS45LeOEH9wiHQ3PDFYYp72k11OQxSnVlYyLX
	8yM6E3WyUwd2kT/T47qQtIsZKvxj/nYZ1osvoBG37jOAWI2Cht3WwQEvDgax+Mj9rKNV4+2skuOTS
	AZi7h1Twpv4TD+j+qYyQIaF5mlFw+vQ7aDCqHucqxMlMES3tJx5k/d4n6BELRekngelW+r3E8G/xA
	JDBEHzZ4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMRR1-002jpG-KJ; Wed, 17 Mar 2021 08:21:43 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMRQv-002jo8-P1
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 08:21:41 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1AB3B22255;
 Wed, 17 Mar 2021 09:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615969294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyKNx2MYFWz0kJgEDgATo7j4IS8GZ7xQ4SVeMgtlp9g=;
 b=i/BRY4sfOhudWHjLImUF7RlfJgcXFgdevwEJqw90SPJdhdqlqhnKQg1TrWBCZQuvOuc/gp
 5wR3hmbQIksa6xPL6XCGfTqlBZJO50H6wZLHokpTR/lQzMUxhUTjwSVV7WFnwMcTxyh8df
 wxecIH4nU4JXztn8qPHrz9YQjUMlQkU=
MIME-Version: 1.0
Date: Wed, 17 Mar 2021 09:21:31 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: vigneshr@ti.com, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
In-Reply-To: <45d00a12-cb79-774e-f8e8-d65602629a90@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
 <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
 <6016b725-a779-1d2c-9884-099c58f53557@ti.com>
 <45d00a12-cb79-774e-f8e8-d65602629a90@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a9e1e18c034dfa185eeb5492acf2dff7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_082138_344722_566C4B76 
X-CRM114-Status: GOOD (  11.82  )
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

Am 2021-03-17 07:09, schrieb Tudor.Ambarus@microchip.com:
> On 3/15/21 8:23 AM, Vignesh Raghavendra wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> On 3/9/21 12:58 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 3/8/21 7:28 PM, Vignesh Raghavendra wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>>> know the content is safe
>>>> 
>>>> On 3/6/21 3:20 PM, Tudor Ambarus wrote:
>>>>> It makes the core file a bit smaller and provides better separation
>>>>> between the Software Write Protection features and the core logic.
>>>>> All the next generic software write protection features (e.g. 
>>>>> Individual
>>>>> Block Protection) will reside in swp.c.
>>>>> 
>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>>> ---
>>>>>  drivers/mtd/spi-nor/Makefile |   2 +-
>>>>>  drivers/mtd/spi-nor/core.c   | 407 
>>>>> +---------------------------------
>>>>>  drivers/mtd/spi-nor/core.h   |   4 +
>>>>>  drivers/mtd/spi-nor/swp.c    | 419 
>>>>> +++++++++++++++++++++++++++++++++++
>>>> 
>>>> Hmmm, name swp.c does not seem intuitive to me. How about expanding 
>>>> it a
>>>> bit:
>>>> 
>>>> soft-wr-protect.c or software-write-protect.c ?
> 
> Having in mind that we have the SWP configs, I think I prefer swp.c.
> But let's see what majority thinks, we'll do as majority prefers.
> Michael, Pratyush?

It's just an internal name, thus as long as it remotely makes sense,
I'm fine. It's just a matter of taste, isn't it?

But here's one technical reason that would bother me more: name
clashes between the core modules: core, sfdp, otp, swp and the
vendor names. It is very unlikely, but there is a non-zero chance ;)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
