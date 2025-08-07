Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B1EC87FCA
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 21:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVajEgt2JEA/l9rHYHQdlVRw7hNQiX1Em39yN1Bc5gU=; b=xJSMZJz1D2wwzn
	e/elRCTSfn39/gSk08VwsWLV+otdojnDwXZxLxlWuzFDLVuoIn5rD92ndg/RDAydSOhAcCQLjwXim
	V51J7TyeRZCHrFqoJxQfbqU697Uxz/DiwppSlJ914iWqGo3XV46ibzW9Tu70QrfrNZ88Jl6AlJqtL
	OnoFeHWE1bBBqPieF6nCb6wq+Gt6h4vYXwnpTurtYobHhR/J73hQgvK5i48v7GHVNM79H9l7xsNc/
	d0HPPto/CqcNhMs6JN1zZe3a1wuLAPFfDvbZoME4E9OP7IXybXa8al2ixAwczoXb70jMY7YS7c+sq
	H2z2lghc0S/P2PPB/W+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8E8-00000001ZLw-2Nrt;
	Thu, 07 Aug 2025 21:32:44 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8E5-00000001ZLO-36wt
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 21:32:43 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 331F32C0243;
	Fri,  8 Aug 2025 09:32:38 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754602358;
	bh=oW5JWam2VA3juU/MwJT5lLasvSMqE8x6jxIBrPhy3FI=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=JO4/VYVTCIEAAC5ilg50/ySNmyLDxdULafZTkb41IRqR8+GR/HJ3SuC3LO7K09JmY
	 QnZ+XK+GpPPQMe72s7GgmH2iHzGGloNJ6z/gMvde8OOOdhEARtMsRqBkttJuy6EEHT
	 AezO1zEts6Rgd+cGfzAE/gx8bWgtOzMU/WjsoFdsg+6gyisleroTRhnX8Ij/9Bdzxz
	 4I9WVa40QHx3zv7k6IHQZ3WazmW7IgLsh2mgTPV/PEcGDCBm9O76MljmDzBFm/PJ4E
	 X4bHu4Ur9RPzsfQGatZaj8zknTu9WkJf7fKmWWcSiKRKZzLahe7sjU/IwX7mKZPAhm
	 5DzFvNj0skyBg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68951b760000>; Fri, 08 Aug 2025 09:32:38 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 8 Aug 2025 09:32:37 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Fri, 8 Aug 2025 09:32:37 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>,
	"tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: AW: NAND ECC errors
Thread-Topic: AW: NAND ECC errors
Thread-Index: AdwHqGyt2keeh0YRQwu69CO4vX1Wiv//nAQAgAAND4CAAAJ/gA==
Date: Thu, 7 Aug 2025 21:32:37 +0000
Message-ID: <a1794cf8-ed93-45db-8ac1-7e5d2ccd9fe9@alliedtelesis.co.nz>
References: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de>
 <2537e2a1-f958-4e9c-b346-b4fac2152a47@alliedtelesis.co.nz>
 <034f01dc07e1$8dd75dd0$a9861970$@gmx.de>
In-Reply-To: <034f01dc07e1$8dd75dd0$a9861970$@gmx.de>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <267979E25A9C3B4B8856C35938D14048@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=68951b76 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ofHXJze2uKyCCQXxoyUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_143242_262889_BD733254 
X-CRM114-Status: GOOD (  16.86  )
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


On 08/08/2025 09:23, markus.stockhausen@gmx.de wrote:
>> Anyone good ideas what to do first from here?
>>
>> Probably depends. Blanking the NAND chip and reformatting it will
>> resolve the errors from and upstream point of view. That's obviously not
>> really going to be something you want to do if you expect to swap back
>> and forth between the stock firmware and an upstream kernel.
>>
>> You'll probably want to convince the mtd code to allow the on-die ECC to
>> be disabled and find whatever software BCH settings are needed that work
>> with the stock firmware. Then we could maybe look at using the ECC
>> controller to accelerate that.
> Good direction. So assumption is:
> - vendor wrote BCH6 into OOB
> - This design is also active in his firmware (with Realtek ECC engine)
> - now we read data with upstream kernel and on-die ECC
> - Each read produces an on-die ECC error
> - As soon as we write new data on-die ECC will be created
>
> But where is the ECC knob in between spi-realtek-nand, mtd and ubi?
Yeah that's the part I don't know. I don't think there is an existing 
one for SPI-NAND (there is one for parallel NAND). I think it's a chip 
level thing so spi-realtek-nand will probably be ignorant of any such 
option (at least until the ECC controller comes into play). I also think 
ubi doesn't care who does the ECC as long as they tell them when there 
is an error.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
