Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FEEC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 08:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9823A2146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 08:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yv/j7jo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9823A2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nB6tXO8wyemE9cDNmPPL10P3Rs9Db6NpJ2LFvSr9chg=; b=Yv/j7jo7DT0vd3
	ndoM2tkmbrS7jJuGFGootvfrf1jQc+PqRamSsjJl+U57wJ6yX8m9/RAmndPts0vSE3i+p5z2eb112
	AUukS8ehKm+4Jd7L93p4/a50maaCAj6nfHkUXF82QEAL4rzBQ8ljzukbSqwFLWBZ0qpalnJqgJDnL
	/kIDrwL/1y6A4GQl8enKT773JVGL96U0/bHGz8SKsDGW4JukeO2uz8kIFe4JE6I0Ce+DaA9/2jxCa
	JzhAuAHeCVsYbZAhXQuN+S3alGo/MJJ1gG+v7Yiw2rADYP2ZEdXgKYXq2a2PEvZYFAD7p6P0K1XBW
	boIqPkmV9gGOgHjR/M8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwMuq-0006SF-84; Wed, 20 Feb 2019 08:07:40 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwMum-0006Rh-O1
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 08:07:39 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 7EA016346F5;
 Wed, 20 Feb 2019 09:07:32 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 20 Feb
 2019 09:07:32 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 20 Feb 2019 09:07:32 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: mtd: mchp23k256: How to follow a more generic approach?
Thread-Topic: mtd: mchp23k256: How to follow a more generic approach?
Thread-Index: AQHUx4YW9WCII7mMYUC2iYT0KpFxjaXldHaAgAFCL4CAAG2EAIABHm+AgAAEP4A=
Date: Wed, 20 Feb 2019 08:07:31 +0000
Message-ID: <262c6ce2-2e21-a7c8-1ecb-fa30546efd71@kontron.de>
References: <21e1b97c-0f90-1cf9-cd93-e9785adb1856@wago.com>
 <caa1f926-e50d-a851-8412-6b20c10942ec@kontron.de>
 <782d297a-a030-08c9-702e-c1ba2b3e6626@wago.com>
 <d58a384a-7b43-931e-8ed9-0ad4cbf83628@kontron.de>
 <20190220085219.573b5051@collabora.com>
In-Reply-To: <20190220085219.573b5051@collabora.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.42]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <C1F99D28B4235149B988DA3E15792209@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 7EA016346F5.AB4DC
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: boris.brezillon@collabora.com, heinrich.toews@wago.com, 
 linux-mtd@lists.infradead.org, oleg.karfich@wago.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_000737_110168_5A95A1D3 
X-CRM114-Status: GOOD (  15.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "Heinrich.Toews@wago.com" <Heinrich.Toews@wago.com>,
 "Oleg.Karfich@wago.com" <Oleg.Karfich@wago.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 20.02.19 08:52, Boris Brezillon wrote:
> On Tue, 19 Feb 2019 14:47:08 +0000
> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> 
>>>    
>>>> The instructions seem to be very similar to EEPROM and SPI NOR devices.
>>>> So I'm curious about what others propose how to support these devices.
>>>
>>> I'm planning to write the driver for the ANV32AA1W during the next weeks
>>> and it would be really great to have some feedback on the approach here.
>>
>> Maybe you can create a new generic SPI RAM driver (I don't think
>> something like this exists yet), that can be used with things like SRAM,
>> nvSRAM, FRAM, etc.?
> 
> Creating a new framework makes sense if you have enough to share
> between all those drivers. I might be wrong (didn't look at the code)
> but I think SRAM devices are simple enough to not require a new
> mid-layer (especially if they use a different cmdset). What we could do
> though is group them in drivers/mtd/sram/.

It's just that it seems they are using a common basic command set (at 
least the ones that I have looked at) which seems to consist of READ 
(0x03), WRITE (0x02), READ_STATUS (0x05), WRITE_STATUS (0x01).
Some of them might provide additional commands for write protection or 
dual/quad access.
So I wouldn't consider it a "framework", but more a generic driver that 
supports this basic command set to connect to all of those chips.

> 
>>
>> At the time when a generic driver exists, we could use it to replace the
>> mchp23k256 driver.
>>
>> If you write a new driver or convert an existing one to support the
>> nvSRAM chips, please use the SPI MEM interface (drivers/spi/spi-mem.c).
>> This would enable us to share some code and connect those chips to all
>> kinds of controllers that support this interface (which are not only
>> generic SPI controllers, but also some QSPI controllers, that don't
>> support generic SPI transfers).
> 
> Yes, please use the spi-mem layer (note that I already started the
> conversion of at25 here [1]).
> 
> [1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1904223.html
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
