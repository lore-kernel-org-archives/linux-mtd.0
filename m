Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44DFC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Feb 2022 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+5asWHhy4so7fgMQ3EvKYx3ppsoFmr5ZlRvWAPi0BA=; b=005W7PMWZtYpeB
	GAzB2fyCWCcpmzTRI+pkXX0qMfSAh+qNPKlrgMKigDctimN44nEXtDI1xEbL3t3gpbd1Ts5BReMSU
	NuOF/tbbb0xz5KsR2j4Klr13qfdt0H1/q8M3YuSVEpojCvlyNvHqPPq79F5Q5lhCnTQ21ZP3KCqKx
	VxguuISFxjkkRBUPngtWRPG6eZmaWqXW5xw4/Jp8gk1hf0LxqI17iNDtXOyuG9+3zcgoWscio8TXB
	z5qPrMEaHtC1qwwGBiMyANi/BKOh9qw6HOPVTnn2qHZwKs7lDJ3bkARkaw8z5bN9mZb7l9EnJEcK9
	cPy2RlM81zkuwIJDPbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOOdJ-00A06F-I8; Sun, 27 Feb 2022 18:51:01 +0000
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOOd5-00A03k-KT
 for linux-mtd@lists.infradead.org; Sun, 27 Feb 2022 18:50:49 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.238])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 449B420F5D;
 Sun, 27 Feb 2022 18:50:42 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 27 Feb
 2022 19:50:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0019dbb524f-1c55-405d-97b9-25daac512930,
 949565DF20DEE76D4A77FF7731A75FE8B07B1F6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <688b7a65-d4b6-682b-494a-1d4178699dba@kaod.org>
Date: Sun, 27 Feb 2022 19:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
 <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-2-clg@kaod.org>
 <20220225073155.f2cxfhm7surf34d4@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220225073155.f2cxfhm7surf34d4@ti.com>
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bc842ac2-478e-418e-8a0a-cc8300debdda
X-Ovh-Tracer-Id: 14411800285764684676
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrleekgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_105047_845994_03DB1234 
X-CRM114-Status: GOOD (  14.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMi8yNS8yMiAwODozMSwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gT24gMTQvMDIvMjIgMTA6
NDJBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRvIHByZXBhcmUgdHJhbnNpdGlvbiB0
byB0aGUgbmV3IEFzcGVlZCBTTUMgU1BJIGNvbnRyb2xsZXIgZHJpdmVyIHVzaW5nCj4+IHRoZSBz
cGktbWVtIGludGVyZmFjZSwgY2hhbmdlIHRoZSBrZXJuZWwgQ09ORklHIG9wdGlvbiBvZiB0aGUg
Y3VycmVudAo+PiBkcml2ZXIgdG8gcmVmbGVjdCB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiB1c2Vz
IHRoZSBNVEQgU1BJLU5PUiBpbnRlcmZhY2UuCj4+IE9uY2UgdGhlIG5ldyBkcml2ZXIgaXMgc3Vm
ZmljaWVudGx5IGV4cG9zZWQsIHdlIHNob3VsZCByZW1vdmUgdGhlIG9sZCBvbmUuCj4gCj4gSSBk
b24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSByZWFzb25pbmcgYmVoaW5kIHRoaXMuIFdoeSBrZWVw
IHRoZSBvbGQKPiBkcml2ZXIgYXJvdW5kPyBXaHkgbm90IGRpcmVjdGx5IHJlcGxhY2UgaXQgd2l0
aCB0aGUgbmV3IG9uZT8gRG9lcyB0aGUKPiBuZXcgb25lIGhhdmUgYW55IGxpbWl0YXRpb25zIHRo
YXQgdGhpcyBvbmUgZG9lc24ndD8KCk5vLiBUaGUgb2xkIG9uZSBoYXMgbW9yZSBsaW1pdGF0aW9u
cyB0aGFuIHRoZSBuZXcgb25lLiBUaGUgb2xkIG9uZSBpbgptYWlubGluZSBpcyBoYWxmIGJha2Vk
IHNpbmNlIHdlIGNvdWxkIG5ldmVyIG1lcmdlIHRoZSBuZWNlc3NhcnkgYml0cwpmb3IgdHJhaW5p
bmcuIFdlIGhhdmUgYmVlbiBrZWVwaW5nIGEgZnVsbCB2ZXJzaW9uIG9uIHRoZSBPcGVuQk1DIHRy
ZWUuCgpKb2VsLCBjb3VsZCB3ZSBzaW1wbHkgZHJvcCB0aGUgb2xkIGRyaXZlciBpbiBtYWlubGlu
ZSBhbmQga2VlcCB0aGUgb2xkCm9uZSBpbiB0aGUgT3BlbkJNQyB0cmVlIHVudGlsIHdlIGZlZWwg
Y29tZm9ydGFibGUgPyBJIGd1ZXNzIHdlIG5lZWQKbW9yZSB0ZXN0aW5nLgoKVGhhbmtzLAoKQy4K
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
