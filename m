Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ADAC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1R9SZQPC/JKRJKCCCQcGd0RseQADs++oztVR75/40I=; b=hox9vAi1IfW6bA
	4vRoOpPZQnPbckiQLX098e7smcepaWj/v8KBfKpYQIt2s9rASvDpl+eMNivGBGovdCLMyUu/dqUgX
	1suJDIqz0g+nACXyMEkiHbUK1aDu65pJkZEDpualWGXQxNZN900TeDgGEDnkoxvE/ydB/AA/cQVE8
	au8FSN+Y20zuEKVTRxY6URcv5UrrT9mrLEg3nV3MB+eh7Y13QK1Fq2rpZwXfKDwi4cVMSEZdOR87V
	L8ZXi5lmiHHon/4bDwuah32h2K3UISTi6KTboV0JsZJg6wlVsNEVzujW/rrhbd1DP5Liz0m6kfD52
	iGGqQCGwhRq2syUQLcWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUn9A-00FfdH-Du; Thu, 17 Mar 2022 10:14:20 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUn95-00FfZT-JP
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 10:14:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-320-n3gtHFNZN_SPLC7LXsji0g-1; Thu, 17 Mar 2022 10:14:09 +0000
X-MC-Unique: n3gtHFNZN_SPLC7LXsji0g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Thu, 17 Mar 2022 10:14:08 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Thu, 17 Mar 2022 10:14:08 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Michael Walle' <michael@walle.cc>
CC: 'Vignesh Raghavendra' <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, "p.yadav@ti.com" <p.yadav@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>
Subject: RE: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Topic: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Index: AQHYOQSPIX1seC7nAUuKrYcK6uPoWazCAVMggAFSn4CAAATp8A==
Date: Thu, 17 Mar 2022 10:14:08 +0000
Message-ID: <8b765d24cb9a422bb383aad07251b65f@AcuMS.aculab.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
 <b60064231d33581c20279172cf8f765e@walle.cc>
 <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
 <9bc530d1fdaf4490a00fee150f963ac7@AcuMS.aculab.com>
 <bc2083a8903fdabc65083f7e5232ca2d@walle.cc>
In-Reply-To: <bc2083a8903fdabc65083f7e5232ca2d@walle.cc>
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
X-CRM114-CacheID: sfid-20220317_031415_966405_531BFEEB 
X-CRM114-Status: GOOD (  30.20  )
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

From: Michael Walle
> Sent: 17 March 2022 09:40
> 
> Am 2022-03-16 14:55, schrieb David Laight:
> > Thought...
> 
> Thank you for your proposal.
> 
> > Can you read the device in STR mode until you get a suitable
> > non-palindromic value, then read it in DTR mode and dynamically
> > determine the byte order?
> >
> > Clearly this won't work if the device is erased to all 0xff.
> > But a check could be done on/after the first write.
> >
> > I suspect write times are actually dominated by the time spent
> > waiting for the write to complete?
> > (Never mind the earlier block erase time.)
> > So always writing in STR mode probably makes little difference?
> > Writes really ought to be uncommon as well.
> >
> > Speeding up reads is a different matter - and probably useful.
> >
> > Of course, if you've got hardware reading the spi memory in DTR
> > mode for config data you might need to byteswap it (compared
> > to the STR writes) - but that is probably a 2nd order problem.
> >
> > I've got some bespoke logic on an PCIe fpga for accessing spi memory.
> > Uses address bits for the control signals and converts a 32bit
> > read/write into 8 nibble transfers to the chip.
> > (uses byte enables - don't an odd number of clocks.)
> > mmapp()ed to userspace for updating the 6MB fpga image.
> 
> Our problem is not how to detect that we have to swap it, but
> rather what we do when we have to do it.
> 
> If we have a controller which can swap the bytes for us on the
> fly, we are lucky and can enable swapping if we need it. We are
> also lucky when we don't have to swap the flash contents, obviously.
> 
> But what do we do when we need to swap it and the controller
> doesn't support it. We could do it in software which will slow
> things down. So depending on the use case this might or might not
> work. We can degrade it to a speed which doesn't have this issue;
> which might be 1-1-1 in the worst case. We could also do just
> nothing special; but this will lead to inconsistencies between
> reading in 1-1-1 and 8d-8d-8d.

I really doubt you'll notice the effects of a software byteswap
compared to the actual time taken to do an spi read.

What's the maximum clock rate for spi memory?
Something like 50MHz ?
If the spi controller isn't doing dma then the cpu pio reads
to get the data are very likely to be even slower than that.
(Especially if they are PCIe reads.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
