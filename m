Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710A6C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 11:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4Jf2dKo2VRuX/zTuqXQ9q7FIhevJsB6amkNI6uqWLk=; b=Z5ZnG4EjDeDLT7
	idL/3DmkjpTR0zxvdFhQ+et3K2x7b2UKDnqchReme+Q+fvR8Oy16b6Plud8rG395ATOeNLFx1Aohj
	fuy/c27WTxkWSRjAJU18EEdbbyXyiRO2GbjJ/wisB39uLMVVSpwLiPDSLUiWhE/y6NCr998+YfyTm
	xlKJqDW4ivN2ZYF7xqRHxO7UllFgnTr1eb7Xhs0izaC4X717nTxxMReaywx1rlGy7eOMUlBSQUkL1
	JjKtgiQENocIfhNFjHFEppO2QtxSwlUrWasp2Mgsnx4Jb6GIde1R0I6sQlLqB/TdAeUQgnzzrwtht
	QTv9tPtiyzz0rXbXAWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUo1V-00Fmn3-2e; Thu, 17 Mar 2022 11:10:29 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUo1S-00Fmlk-CU
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 11:10:28 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-255-MiCiRbVUN16QRgYdqh5Xig-1; Thu, 17 Mar 2022 11:10:22 +0000
X-MC-Unique: MiCiRbVUN16QRgYdqh5Xig-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Thu, 17 Mar 2022 11:10:21 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Thu, 17 Mar 2022 11:10:21 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Vignesh Raghavendra' <vigneshr@ti.com>, 'Michael Walle' <michael@walle.cc>
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
Thread-Index: AQHYOQSPIX1seC7nAUuKrYcK6uPoWazCAVMggAFSn4CAAATp8IAABzYAgAAFzgA=
Date: Thu, 17 Mar 2022 11:10:21 +0000
Message-ID: <fcae2d955b3f43af8d64f1aa50fbc685@AcuMS.aculab.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
 <b60064231d33581c20279172cf8f765e@walle.cc>
 <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
 <9bc530d1fdaf4490a00fee150f963ac7@AcuMS.aculab.com>
 <bc2083a8903fdabc65083f7e5232ca2d@walle.cc>
 <8b765d24cb9a422bb383aad07251b65f@AcuMS.aculab.com>
 <c17fe9c6-0757-dbb6-6efb-69d05d7ff589@ti.com>
In-Reply-To: <c17fe9c6-0757-dbb6-6efb-69d05d7ff589@ti.com>
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
X-CRM114-CacheID: sfid-20220317_041026_719788_B3D615E7 
X-CRM114-Status: GOOD (  10.25  )
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

From: Vignesh Raghavendra
> Sent: 17 March 2022 10:24
...
> Modern OSPI/QSPI flash controllers provide MMIO interface to read from
> flash where DMA can pull data as if though you are reading from On chip RAM

So the cpu does an MMIO read cycle to the controller which doesn't
complete until (for the nibble-mode spi device I have):
1) Chipselect is asserted.
2) The 8-bit command has been clocked out.
3) The 32bit address have been clocked out (8 clocks in nibbles).
4) A few (probably 4) extra delay clocks are added.
5) The data is read - 8 clocks for 32bits in nibble mode.
6) Chipselect is removed.

Now you can do long sequential reads without all the red tape.
But a random read in nibble mode is about 30 clocks.
16 bit mode saves 6 clocks for the data and maybe 6 for the address?

The controller could do 'clever stuff' for sequential reads.
At a cost of slowing down random reads.

So even at 400MHz it isn't that fast.

If the MMIO interface to the flash controller is PCIe you can
add in a load of extra latency for the cpu read itself.

While PCIe allows multiple read requests to be outstanding,
the Intel cpu I've looked at serialise the reads from each
cpu core (each cpu always uses the same TLP tag).

Now longer read TLP help a lot (IIRC max is 256 bytes).
But the x86 cpu will only generate read TLP for register reads.
You need to use AVX512 registers (or cache line fetches) to
get better throughput!

The alternative is getting the flash controller to issue
the read/write TLP for memory transfers.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
