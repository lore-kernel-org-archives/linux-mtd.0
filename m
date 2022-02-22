Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C91C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBsyUfimKvvGa31WnVibzsiABTPK9qS6VId27UhB4SQ=; b=nNJJhn+8vxU2r5O35nUyd9UlXc
	LtUrKPMgOaKKerpxjOAA9mtwkYgDGyS4lPOFWiUJV2+33jeBqZEiMSrU2lfOaErBaWygc17H1VWWt
	JszrYZnCpMyMBjwfJ+GS4lAS1D7N0bulAiaODHZNFRX46ZhlTVmhbGs9C5tklbHG1UdveRv+0NrAm
	TIp8WxLaHFeHSHJ+LneU5XrTc0/s9eOwlkIN60fyzLxt3+Zyunv7g5aHC45PoAIWs0dSwsg9M5q5z
	H5bfcB1aWMrIAa1t+9arxX6IakUAZCAHd8GTYumGULx3SDWDd7fN6xpBqHR90JDvcQkqtx3cmrork
	lnj2+caQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMW8s-009tiW-VG; Tue, 22 Feb 2022 14:27:51 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMW8o-009tge-5E
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 14:27:48 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6FFDE22205;
 Tue, 22 Feb 2022 15:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645540064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8dj0piB+942CQbs7XIdKdDi92gQwu/L2SA425BJSZIw=;
 b=ktuPX8BKiZqDpYwucvTcKBislX13mpMQ+qRPl2YCsKBgJ7lC9fxFZtsETlzyl7sNWWtTkP
 VV37FTzWj3GngcMe/KCdXOSn5dkIo/qR5uJBlK81gMsRWZegjuwhPyEkdbCh5Zcjz/pPIM
 AG5HZLtdFM5XS5xImsEXMgP1b3pHdkQ=
MIME-Version: 1.0
Date: Tue, 22 Feb 2022 15:27:44 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, broonie@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Nicolas.Ferre@microchip.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
In-Reply-To: <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
 <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_062746_402260_85F007E1 
X-CRM114-Status: GOOD (  15.82  )
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

Am 2022-02-22 15:23, schrieb Tudor.Ambarus@microchip.com:
> On 2/22/22 16:13, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
>>> On 2/21/22 09:44, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>>> know
>>>> the content is safe
>>>> 
>>>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>>>> Fortunately there are controllers
>>>>> that can swap back the bytes at runtime, fixing the endiannesses.
>>>>> Provide
>>>>> a way for the upper layers to specify the byte order in DTR mode.
>>>> 
>>>> Are there any patches for the atmel-quadspi yet? What happens if
>>> 
>>> not public, but will publish them these days.
>>> 
>>>> the controller doesn't support it? Will there be a software 
>>>> fallback?
>>> 
>>> no need for a fallback, the controller can ignore 
>>> op->data.dtr_bswap16
>>> if
>>> it can't swap bytes.
>> 
>> I don't understand. If the controller doesn't swap the 16bit values,
>> you will read the wrong content, no?
>> 
> 
> In linux no, because macronix swaps bytes on a 2 byte boundary both on
> reads and on page program. The problem is when you mix 8D-8D-8D mode 
> and
> 1-1-1 mode along the boot stages. Let's assume you write all boot 
> binaries
> in 1-1-1 mode. When reaching u-boot if you enable 8D-8D-8D mode, when 
> u-boot
> will try to get the kernel it will fail, as the flash swaps the bytes 
> compared
> to what was written with 1-1-1 mode. You write D0 D1 D2 D3 in 1-1-1 
> mode and
> when reaching u-boot you will read D1 D0 D3 D2 and it will mess the
> kernel image.

But you have to consider also 3rd parties, like an external programmer 
or
another OS. So, there has to be *one correct* way of writing/reading 
these
bytes.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
