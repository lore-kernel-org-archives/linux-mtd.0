Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C92C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=du0cC9c2Qi0nDd/rvzUO/Fx2RMZSaVDxb2mDH9od09M=; b=oGpPSljub9zlNS
	+TNdr3nNwr/qq1cRXMeZLEicTmMZWZ0vrc9F53UJWgE8GTv0jcjBbJkIASg2Mk717eVH4WHrRYfXU
	PDzeTYii7sHcndz5L6B6Tr8pCYc7Cu7Gnmv0Ijfo8qhL9Ngc894kY2T0sJ+Gq4987Oxa5osiJYgdw
	gxed1SF7Yv0RDYi01xaY4X9YjjYPX+FQRo2M34UK9M7CWmtjcCwGrxgOQPfJRJMH4QjiCOFfkxQre
	4V5EBNUG83Ih2Hh7h6nMgscIbVL0pmPlNX1qhh/QBaT3vUbDrzzcVevvh+cJUXcjK/ftAhuxJwltl
	3wq+1Is+jsde7UWYdKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUU7d-00D6eC-Tz; Wed, 16 Mar 2022 13:55:29 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUU7Y-00D6bl-EF
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 13:55:26 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-10-OIxdLdHeP1as21Jigfr0hw-1; Wed, 16 Mar 2022 13:55:18 +0000
X-MC-Unique: OIxdLdHeP1as21Jigfr0hw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 16 Mar 2022 13:55:17 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 16 Mar 2022 13:55:17 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Vignesh Raghavendra' <vigneshr@ti.com>, Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, "p.yadav@ti.com"
 <p.yadav@ti.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>
Subject: RE: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Topic: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Index: AQHYOQSPIX1seC7nAUuKrYcK6uPoWazCAVMg
Date: Wed, 16 Mar 2022 13:55:17 +0000
Message-ID: <9bc530d1fdaf4490a00fee150f963ac7@AcuMS.aculab.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
 <b60064231d33581c20279172cf8f765e@walle.cc>
 <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
In-Reply-To: <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
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
X-CRM114-CacheID: sfid-20220316_065524_770950_7ACE901F 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Thought...

Can you read the device in STR mode until you get a suitable
non-palindromic value, then read it in DTR mode and dynamically
determine the byte order?

Clearly this won't work if the device is erased to all 0xff.
But a check could be done on/after the first write.

I suspect write times are actually dominated by the time spent
waiting for the write to complete?
(Never mind the earlier block erase time.)
So always writing in STR mode probably makes little difference?
Writes really ought to be uncommon as well.

Speeding up reads is a different matter - and probably useful.

Of course, if you've got hardware reading the spi memory in DTR
mode for config data you might need to byteswap it (compared
to the STR writes) - but that is probably a 2nd order problem.

I've got some bespoke logic on an PCIe fpga for accessing spi memory.
Uses address bits for the control signals and converts a 32bit
read/write into 8 nibble transfers to the chip.
(uses byte enables - don't an odd number of clocks.)
mmapp()ed to userspace for updating the 6MB fpga image.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
