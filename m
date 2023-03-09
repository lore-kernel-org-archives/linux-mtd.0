Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E30C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5aRp2tFZsObgucsevd4waVsrRrlq3a6Jm0ydM5XRGg=; b=yW27MWf8/zrcGlyouqHHeo9PXb
	b6l3JGxQWlP/iSDTZmTu+P2gdurTtBpvKMmRHLx6dQM92d/Q6QUYheAdiCNnuaEs/mWlYVBMnYMLf
	BP/VnviC4mqBQ0SvTvWqoeuJ68lwWi0cXiXXILGIDwv81poDJQ9Iv3WnyL3NV7C70oBIXrfGuFVsC
	vtAV2iapJmO+k0SPnkByeS+zQLgV0bs7+cyK5mymEczHrx73iGoOml/KszzPWBomi0wSCEGCXJ2/N
	JkUP8D3fvULCh109KKnfOWWlQGaUnXRbmfDxvFaWsVwFUWVYYzZIShPtuo3+nCJq1bJgY8zQbYb5n
	04i7L/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGsc-00AKfL-EX; Thu, 09 Mar 2023 14:04:27 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGqI-00AJMl-1f; Thu, 09 Mar 2023 14:02:03 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A8AA2D5A;
	Thu,  9 Mar 2023 15:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678370517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/l1Q+xJ4MDAQ221QCBefTlDZLE3+EBKQBBYXmE97Lw=;
	b=PdKbbRiUmTck4+p7CvvFaOVkS7y+8eMsok76ySxGXc5sWa21ukPCWDcO9j0/xSsaTpzWmI
	60KgS0y0CnXW175+8hDwXFo1M7LS9jpY1i0jnpt2XEU9sduHAFXQTgKQwAEavBC1AIxcna
	07tdIc6uP/NirknOwetL9uJ9/MsV7vOVGw84K1LszU/lzlcua8qyx8vSYlUUfd6UYCIBuM
	eZmvOWnB9g4Q/MmLm7TUxb7IZ0P/jSFVmz0ZN5Nhsl3CK73NHT998MgzZZx3XQgLbhzbt4
	sWRYKBl/tvYFszgqAtEqRKc0EhMvqvg6kRGfIY/u/41nLo+F/QBlDtCEymt1lQ==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 15:01:57 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com, Mark
 Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Claudiu.Beznea@microchip.com,
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, joel@jms.id.au, andrew@aj.id.au,
 kdasu.kdev@gmail.com, han.xu@nxp.com, john.garry@huawei.com,
 matthias.bgg@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, haibo.chen@nxp.com, yogeshgaur.83@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 michal.simek@xilinx.com, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_060202_306929_E52A4F5A 
X-CRM114-Status: GOOD (  16.91  )
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

Am 2023-03-09 14:54, schrieb Tudor Ambarus:
> On 09.03.2023 15:33, Michael Walle wrote:
>>>>> The controllers that can talk in dummy ncycles don't need the
>>>>> dummy.{buswidth, dtr} fields.
>>>>> 
>>>>> The controllers that can't talk in dummy cycles, but only on a 
>>>>> "byte"
>>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does not 
>>>>> have
>>>>> the buswidth and dtr info, it can't convert the dummy ncycles to 
>>>>> nbytes.
>>>>> If he knows only that buswidth is 8, it will convert ncycles to 4 
>>>>> bytes.
>>>>> If dtr is also specified it converts ncycles to 2 bytes.
>>>> 
>>>> No they don't need it. Lets take your semper flash and assume it 
>>>> needs
>>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of the 
>>>> mode
>>>> or dtr setting*. The controller then knows we need 12 clock cycles. 
>>>> It has
>>>> then to figure out how that can be achieved. E.g. if it can only do 
>>>> the
>>>> "old" byte programming and is in quad mode, good for it. It will 
>>>> send 6
>>>> dummy bytes, which will result in 12 dummy clock cycles, because 1 
>>>> byte
>>>> takes two clock cycles in quad SDR mode. If its in octal mode, send 
>>>> 12
>>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
>>>> single bit mode, because it cannot send 1.5 bytes..
>>>> 
>>> 
>>> You miss the fact that you can have 1-1-4. What buswidth do you use
>>> for dummy, the address buswidth or the data buswidth?
>> 
>> Doesn't matter, does it? The driver is free to chose, 1, 4, or 
>> anything
>> else. You don't sample any data during the dummy phase.
>> To answer your question: single for instruction, single for address,
>> whatever you choose for dummy as long as there are ncycles space 
>> between
>> address and data, and quad for data.
> 
> Huh? How does the controller chose, based on what?

Based on its own capabilities. It can choose either way. In the end
what matters is how many clock cycles there are between the address
and data phase. And you only need to convey that information to the
SPI controller - your new ncycles.

-michael

>> Depending on the capabilites of the hardware it will likely be 1 or 4.
>> 
>>> What happens if crazy protocols like 1S-1S-8D appear? What buswidth
>>> and transfer mode are you going to use for dummy?
>> 
>> Also doesn't matter. What matters is how many dummy clock cycles you
>> do. Again, they don't depent on the mode. You just have to count
>> the clock cycles between the address and the data phase (and that is
>> what your ncycle parameter will tell the controller).
>> 
>>> And please don't tell me that "we're going to assume that
>>> dummy.buswidth = address.buswidth because that's what we currently do
>>> in SPI NOR", because I'm not convinced that the assumption is 
>>> correct.
>> 
>> No, it doesn't matter :)
>> 
>> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
