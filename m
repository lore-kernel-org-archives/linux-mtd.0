Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22251C3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 14:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3D3206BB
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 14:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hSFlZVRg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB3D3206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0vow7VdJSqD43AH7ApzLkjjwB83hwj8A1iWwMflehg=; b=hSFlZVRgOQf2tu
	KSSyC5zIJucR47aohY0+VniR+ld1e9I3WI5CdH3C1dxVy7cUzEC0Ergze0cHFBBItW4Ga86V0xweb
	meOGm2EDUzj+kQdlE3X01JJ8yGoaqfHhhhRoERYYcHKRQvl6Ae7GSKUsGgzHsrhRAoDTLSMqelTAR
	4jcKoYR0ftcGpTz/69ME/Q/yoR9MC7cUW61gab7jtKAeF6sR6wg32t1pDMcshHETbNXy5ovXNMo63
	bFQPP4OYX5OjIT7mKuWjg05IVoD5euYbVxyL5H5pZSVgia2ai9jw6WXpQUl0UTPxenPiTL9kQEukI
	edgPiCXGkAp+RW5V1iBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2G82-0001zE-KD; Mon, 26 Aug 2019 14:37:54 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2G7x-0001k4-WB
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 14:37:51 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id AE07867A6E4;
 Mon, 26 Aug 2019 16:37:46 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 26 Aug
 2019 16:37:46 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 26 Aug 2019 16:37:46 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RESEND PATCH v3 14/20] mtd: spi_nor: Add a ->setup() method
Thread-Topic: [RESEND PATCH v3 14/20] mtd: spi_nor: Add a ->setup() method
Thread-Index: AQHVXAeF9JHgldFrG0Cm/K0wg1GidacNPSwAgAAQawCAAAa/gIAACbmA
Date: Mon, 26 Aug 2019 14:37:46 +0000
Message-ID: <799c9166-428a-9c5b-67cd-c60d31170dc0@kontron.de>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-15-tudor.ambarus@microchip.com>
 <20190826144002.479494be@collabora.com>
 <d44218eb-458a-dd59-b79d-7803de2bdc09@kontron.de>
 <20190826160257.17b46962@collabora.com>
In-Reply-To: <20190826160257.17b46962@collabora.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <01ED29AFA9DA7449A68863D0DF4D86C9@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: AE07867A6E4.AE1FE
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: boris.brezillon@collabora.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 tudor.ambarus@microchip.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_073750_367432_169A686A 
X-CRM114-Status: GOOD (  10.50  )
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
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 26.08.19 16:02, Boris Brezillon wrote:
> On Mon, 26 Aug 2019 13:38:48 +0000
> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> 
>> On 26.08.19 14:40, Boris Brezillon wrote:
>>> On Mon, 26 Aug 2019 12:08:58 +0000
>>> <Tudor.Ambarus@microchip.com> wrote:
>>>    
>>>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>>
>>>> nor->params.setup() configures the SPI NOR memory. Useful for SPI NOR
>>>> flashes that have peculiarities to the SPI NOR standard, e.g.
>>>> different opcodes, specific address calculation, page size, etc.
>>>> Right now the only user will be the S3AN chips, but other
>>>> manufacturers can implement it if needed.
>>>>
>>>> Move spi_nor_setup() related code in order to avoid a forward
>>>> declaration to spi_nor_default_setup().
>>>>
>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>
>>> Nitpick: R-bs should normally be placed after your SoB.
>>
>> Just a question unrelated to the patch content:
>>
>> I learned to add R-b tags after my SoB when submitting MTD patches, but
>> recently I submitted a patch to the serial subsystem and was told to put
>> my SoB last. Is there an "official" rule for this? And if so where to
>> find it?
> 
> Should match the order of addition: if you picked an existing patch that
> had already received R-b/A-b tags and applied it to your tree you
> should add your SoB at the end. But if you are the author, your SoB
> should come first. At least that's the rule I follow :-).

Ok, thanks for clarifying. I was the author of said patch and was adding 
an R-b just like in this case here, so the people in the serial 
subsystem seem to apply different rules ;)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
