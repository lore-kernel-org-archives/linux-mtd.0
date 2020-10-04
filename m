Return-Path: <SRS0=8K5C=DL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB1BC4363C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 21:36:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0360D206DD
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 21:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTqqd4i1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0360D206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zeZPBkJ+s4wj3sagix5dyHCT1KVbnxdeByaMdGwSCEQ=; b=rTqqd4i1fUcHSktKc1yXNzUPa
	Ek3Zz7VsvsciFoy8RUcmDQl9sfynHVF+8sXdJ0BxaSeQ2yaBxAx7AcRBueflRBaNcy4dNNv6QDv37
	goAMvrSgjhE+eosXAE6k9c+nimVMbdxdymfHLOWGwST8vSSO4hvrgFb/BnSfu6v+PzvreKyLHaQU4
	l/Y8kpJmxoLzFIw/J73Kp8o0vObVq7dq9mSkvGS+4/eOXubL2tcukGkyRlBrOJ9I30ERNZsGSC1hI
	xy37hzuOCNCl9jKCQq6AQA05Za2d2fm4S+nwWqJeQKCpQjkUCDo0Z+1CnsqfJEDKW0Dc5GBYHnWyd
	DytAtJxwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPBgE-0002NF-GX; Sun, 04 Oct 2020 21:36:30 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPBgA-0002Lw-TB
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 21:36:27 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-22-miBv3_8TPze0sLNho43zTg-1; Sun, 04 Oct 2020 22:36:21 +0100
X-MC-Unique: miBv3_8TPze0sLNho43zTg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sun, 4 Oct 2020 22:36:20 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Sun, 4 Oct 2020 22:36:20 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bert Vermeulen' <bert@biot.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: RE: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
Thread-Topic: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
Thread-Index: AQHWmEFme608aECbAkSNwPF3PIHq6KmD73IwgAP1ZgCAABS1AA==
Date: Sun, 4 Oct 2020 21:36:20 +0000
Message-ID: <e41bb2d9ad144736b858b186acf2a47b@AcuMS.aculab.com>
References: <20200930235611.6355-1-bert@biot.com>
 <20201001063421.qcjdikj2tje3jn6k@ti.com>
 <801445c9-4f59-5300-3a03-b48a3d631efe@biot.com>
 <1c4ee46115854ce28b17935504f2fc78@AcuMS.aculab.com>
 <2c7b03eb-58fa-73af-93d7-669bad2e57ef@biot.com>
In-Reply-To: <2c7b03eb-58fa-73af-93d7-669bad2e57ef@biot.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_173627_116110_BC7E6D40 
X-CRM114-Status: GOOD (  18.44  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bert Vermeulen
> Sent: 04 October 2020 22:12
> 
> On 10/2/20 9:50 AM, David Laight wrote:
> > From: Bert Vermeulen
> >> The SoCs I'm dealing with have an SPI_ADDR_SEL pin, indicating whether it
> >> should be in 3 or 4-byte mode. The vendor's hacked-up U-Boot sets the mode
> >> accordingly, as does their BSP. It seems to me like a misfeature, and I want
> >> to just ignore it and do reasonable JEDEC things, but I have the problem
> >> that the flash chip can be in 4-byte mode by the time it gets to my spi-nor
> >> driver.
> >
> > If these are the devices I think they are, can't you read the
> > non-volatile config word (bit 0) to find out whether the device
> > expects a 3 or 4 byte address and how many 'idle' clocks there
> > are before the read data?
> 
> I'm working with Realtek RTL838x/RTL839x SoCs. Reading it out is a
> pretty convoluted procedure involving different I/O registers depending
> on the SoC model.

How do they manage to let you do read/write without 'read control'.
Actually I can imagine...

The problem we had was getting the IO pins to link up to user
logic on an Altera Cyclone-V fpga.
Then it was just a 'SMOP' to get reads and write converted to
nibble 'bit-bang' with the chipselect and output enable (IIRC)
controlled by the register address.
I doubt any 'standard' interface is as efficient.

I think I found a hardware bug in the chips we are using.
There seemed to be a timing window in which the 'read status'
command (after a write/erase) was completely ignored by
the device.
Everything looked write on a scope - but the data line
wasn't driven.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
