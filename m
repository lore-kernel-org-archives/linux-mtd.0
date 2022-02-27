Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB38C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Feb 2022 21:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ovp9B/Jb3n8aIa1BoCZ48LtyB5LYSlSHROJ1zTpCIc=; b=vbHnBQQgh2LljZ
	u8N/fZ9l1gUh41qypgOJ7sbJxfLKe8alZoRS5CpABn1cfWw1EsRRmSC6LW3Y8PIpv8Wkpo53DQvvW
	uqVfwbkvOV+D0/m+OAVPT9pTWj0+b8ddgbHT10NfRHChpsYRwqNuy7wjoi8Lwq0hADCme+zu9r7tp
	1q3ScY4YwnJot20M5Y6a2KHuc3REq8u273IJK43ruHb7tGOnC0wHrr7Rfa7Am56spLXRBoAP1Sf98
	C9VYrf3wmDH4C/TiWVXNJtQp681bDDyZ8tVUEzZYEkPsSsO17mV5MxJDXNAYioWWcqpcwOfEQbKhp
	Cxua840WrBjGg0ePawpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOR5E-00AEdk-3r; Sun, 27 Feb 2022 21:28:00 +0000
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOR5A-00AEd7-Vy
 for linux-mtd@lists.infradead.org; Sun, 27 Feb 2022 21:27:59 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E30F222C9F;
 Sun, 27 Feb 2022 21:27:53 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 27 Feb
 2022 22:27:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005bd4da659-6e74-42ae-98f4-7b2406606e6c,
 949565DF20DEE76D4A77FF7731A75FE8B07B1F6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <890fce14-8001-74c9-21a9-0de117e743ef@kaod.org>
Date: Sun, 27 Feb 2022 22:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/10] spi: aspeed: Calibrate read timings
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
 <20220214094231.3753686-9-clg@kaod.org>
 <20220225091809.gvup3mcst45szi6x@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220225091809.gvup3mcst45szi6x@ti.com>
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a51f072-26f3-48de-b05f-06cdd16eb070
X-Ovh-Tracer-Id: 17066672266216704900
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrleekgddugeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudetudefueeffedvjeeiieffleegtefgledthfelueevieetgeekuedvffdtteehnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_132757_384168_4A23557B 
X-CRM114-Status: GOOD (  16.82  )
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

T24gMi8yNS8yMiAxMDoxOCwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gT24gMTQvMDIvMjIgMTA6
NDJBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRvIGFjY29tbW9kYXRlIHRoZSBkaWZm
ZXJlbnQgcmVzcG9uc2UgdGltZSBvZiBTUEkgdHJhbnNmZXJzIG9uIGRpZmZlcmVudAo+PiBib2Fy
ZHMgYW5kIGRpZmZlcmVudCBTUEkgTk9SIGRldmljZXMsIHRoZSBBc3BlZWQgY29udHJvbGxlcnMg
cHJvdmlkZSBhCj4+IHNldCBvZiBSZWFkIFRpbWluZyBDb21wZW5zYXRpb24gcmVnaXN0ZXJzIHRv
IHR1bmUgdGhlIHRpbWluZyBkZWxheXMKPj4gZGVwZW5kaW5nIG9uIHRoZSBmcmVxdWVuY3kgYmVp
bmcgdXNlZC4gVGhlIEFTVDI2MDAgU29DIGhhcyBvbmUgb2YKPj4gdGhlc2UgcmVnaXN0ZXJzIHBl
ciBkZXZpY2UuIE9uIHRoZSBBU1QyNTAwIGFuZCBBU1QyNDAwIFNvQ3MsIHRoZQo+PiB0aW1pbmcg
cmVnaXN0ZXIgaXMgc2hhcmVkIGJ5IGFsbCBkZXZpY2VzIHdoaWNoIGlzIGEgYml0IHByb2JsZW1h
dGljIHRvCj4+IGdldCBnb29kIHJlc3VsdHMgb3RoZXIgdGhhbiBmb3Igb25lIGRldmljZS4KPj4K
Pj4gVGhlIGFsZ29yaXRobSBmaXJzdCByZWFkcyBhIGdvbGRlbiBidWZmZXIgYXQgbG93IHNwZWVk
IGFuZCB0aGVuIHBlcmZvcm1zCj4+IHJlYWRzIHdpdGggZGlmZmVyZW50IGNsb2NrcyBhbmQgZGVs
YXkgY3ljbGUgc2V0dGluZ3MgdG8gZmluZCBhIGJyZWFraW5nCj4+IHBvaW50LiBUaGlzIHNlbGVj
dHMgYSBkZWZhdWx0IGdvb2QgZnJlcXVlbmN5IGZvciB0aGUgQ0V4IGNvbnRyb2wgcmVnaXN0ZXIu
Cj4+IFRoZSBjdXJyZW50IHNldHRpbmdzIGFyZSBiaXQgb3B0aW1pc3RpYyBhcyB3ZSBwaWNrIHRo
ZSBmaXJzdCBkZWxheSBnaXZpbmcKPj4gZ29vZCByZXN1bHRzLiBBIHNhZmVyIGFwcHJvYWNoIHdv
dWxkIGJlIHRvIGRldGVybWluZSBhbiBpbnRlcnZhbCBhbmQKPj4gY2hvb3NlIHRoZSBtaWRkbGUg
dmFsdWUuCj4+Cj4+IER1ZSB0byB0aGUgbGFjayBvZiBBUEksIGNhbGlicmF0aW9uIGlzIHBlcmZv
cm1lZCB3aGVuIHRoZSBkaXJlY3QgbWFwcGluZwo+PiBmb3IgcmVhZHMgaXMgY3JlYXRlZC4KPiAK
PiBUaGUgZGlybWFwX2NyZWF0ZSBtYXBwaW5nIHNheXMgbm90aGluZyBhYm91dCBfd2hlbl8gaXQg
c2hvdWxkIGJlIGNhbGxlZC4KPiBTbyB0aGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCBpdCB3aWxs
IG9ubHkgYmUgY2FsbGVkIGFmdGVyIHRoZSBmbGFzaCBpcwo+IGZ1bGx5IGluaXRpYWxpemVkLiAK
CnNwaV9ub3JfY3JlYXRlX3JlYWRfZGlybWFwKCkgaXMgY2FsbGVkIGFmdGVyIHNwaV9ub3Jfc2Nh
bigpIGluIHNwaV9ub3JfcHJvYmUoKS4KU2luY2UgYSBzcGlfbWVtX2Rpcm1hcF9pbmZvIGRlc2Ny
aXB0b3IgaXMgY3JlYXRlZCB1c2luZyB0aGUgbm9yIGZpZWxkcyA6CgoJc3RydWN0IHNwaV9tZW1f
ZGlybWFwX2luZm8gaW5mbyA9IHsKCQkub3BfdG1wbCA9IFNQSV9NRU1fT1AoU1BJX01FTV9PUF9D
TUQobm9yLT5yZWFkX29wY29kZSwgMCksCgkJCQkgICAgICBTUElfTUVNX09QX0FERFIobm9yLT5h
ZGRyX3dpZHRoLCAwLCAwKSwKCQkJCSAgICAgIFNQSV9NRU1fT1BfRFVNTVkobm9yLT5yZWFkX2R1
bW15LCAwKSwKCQkJCSAgICAgIFNQSV9NRU1fT1BfREFUQV9JTigwLCBOVUxMLCAwKSksCgkJLm9m
ZnNldCA9IDAsCgkJLmxlbmd0aCA9IG5vci0+cGFyYW1zLT5zaXplLAoJfTsKCXN0cnVjdCBzcGlf
bWVtX29wICpvcCA9ICZpbmZvLm9wX3RtcGw7Cgp0aGUgc3BpLW1lbSBmcmFtZXdvcmsgbWFrZXMg
dGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgbm9yIG9iamVjdCBpcyBpbml0aWFsaXplZC4KCj4gSSBz
dWdnZXN0IHlvdSBlaXRoZXIgbWFrZSB0aGlzIGEgcmVxdWlyZW1lbnQgb2YgdGhlIEFQSSwKCmhv
dyA/CgpUaGFua3MsCgpDLgoKCj4gb3IgY3JlYXRlIGEgbmV3IEFQSSB0aGF0IGd1YXJhbnRlZXMg
aXQgd2lsbCBvbmx5IGJlIGNhbGxlZCBhZnRlcgo+IHRoZSBmbGFzaCBpcyBpbml0aWFsaXplZCwg
bGlrZSBbMF0uCj4gCj4gWzBdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
aW51eC1tdGQvcGF0Y2gvMjAyMTAzMTExOTEyMTYuNzM2My0yLXAueWFkYXZAdGkuY29tLwo+IAo+
Pgo+PiBDYzogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+PiAtLS0KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
