Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29505C021A0
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2025 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByxlngkGq3Xb5xoHt/b2fJHadKdMkOBMaR5q+FyFzA0=; b=08Z9Q3h6b9QlWd
	iYnUImbd8Ywhrw4PIyu7h0k2mIkznk1jn3wBZSXFpUXBSZQylxVfxzoCQodHq+0/Jcr9hNXrg2NrS
	sWxtLS+Ne/uqytbDtWnKcqqI36bHZ1FGE7537c+p+J/waxgBn6xFUlybfkgobpYxjYjxvnIHAFneg
	VjhqqywFFQ0gjARpW/nKI3nKesjtode2qGCbJxvThl/sfk+UKF3phhPphP8ba3xx+22kqGOY4GRqf
	HuwmTdyilkNCJAwilQjcIGKSNbTfxaoz5BBu+oHW59sqixfEh37pgTqMMdtkBAwmsucRHA6wUByUF
	Tfs8ICdo4ASKumZBo4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxjh-00000003zYs-2h0F;
	Mon, 17 Feb 2025 09:48:21 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxTA-00000003w4Z-2oN3
	for linux-mtd@lists.infradead.org;
	Mon, 17 Feb 2025 09:31:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D2C04328A;
	Mon, 17 Feb 2025 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739784672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzSgtFsogf3LvL+ai4nE5Lt4B+3+Fu9VUwcYPOuEIZQ=;
	b=fK/H46QJFMLPMcRVkjjcBvXz3suQapWq9E5PCchE4muxik4Ug0FIztPKlE1SGb5DuDwz5a
	Uoo/64V/Eik/EAM40u63rxPdOzMTUc5FKFGxbkaMwRtBN5QXugz6xEKYFf59C2CPI3qGmh
	u2dWyZ6LCPd2sA0i6Nm2l6QZWCbNwHDiaPP9GOa9zcetatAYq2HNqRYOpUPYEdK/9SEZcv
	QBSU/EiTcIELPURB8EgJ9MV8wakky8b0GJorTq/QHU9O5rUi5u4wERdnNw3OTb4gL4kLQh
	1ripd4J1y7IWjqrj7Anhj4dIEqUdf7WF3Tl1AosWjOQZfn//HL8/QDLv01yDpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: J. =?utf-8?Q?Neusch=C3=A4fer?= via B4 Relay
 <devnull+j.ne.posteo.net@kernel.org>,
  devicetree@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,  Krzysztof
 Kozlowski <krzk@kernel.org>,  imx@lists.linux.dev,  Scott Wood
 <oss@buserror.net>,  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>,  Herbert Xu
 <herbert@gondor.apana.org.au>,  "David S. Miller" <davem@davemloft.net>,
  Lee Jones <lee@kernel.org>,  Vinod Koul <vkoul@kernel.org>,  Lorenzo
 Pieralisi <lpieralisi@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Bjorn Helgaas
 <bhelgaas@google.com>,  J. =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,  Wim Van
 Sebroeck <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-ide@vger.kernel.org,  linux-crypto@vger.kernel.org,
  dmaengine@vger.kernel.org,  linux-pci@vger.kernel.org,
  linux-watchdog@vger.kernel.org,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
In-Reply-To: <Z7Iqir-qaZDt6tsx@probook> ("J. =?utf-8?Q?Neusch=C3=A4fer=22'?=
 =?utf-8?Q?s?= message of "Sun, 16
	Feb 2025 18:12:26 +0000")
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
	<20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
	<87o6zaurv9.fsf@bootlin.com> <Z7Iqir-qaZDt6tsx@probook>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 17 Feb 2025 10:31:08 +0100
Message-ID: <87tt8svrxf.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdevhffgtdfhhefggeeftdeiffduiedtgffftddutdehteejhfevieelveegveetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehjrdhnvgesphhoshhtvghordhnvghtpdhrtghpthhtohepuggvvhhnuhhllhdojhdrnhgvrdhpohhsthgvohdrnhgvtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoi
 ihlrggsshdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehoshhssegsuhhsvghrrhhorhdrnhgvthdprhgtphhtthhopehmrgguugihsehlihhnuhigrdhisghmrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_013116_850792_89D8A733 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgo+PiA+IEluIHNvbWUgc2NlbmFyaW9zLCBzdWNoIGFzIHVuZGVyIHRoZSBGcmVlc2Nh
bGUgZUxCQyBidXMsIHRoZXJlIGFyZSByYXcKPj4gPiBOQU5EIGNoaXBzIHdpdGggYSB1bml0IGFk
ZHJlc3MgdGhhdCBoYXMgYSBjb21tYSBpbiBpdCAoY3Msb2Zmc2V0KS4KPj4gPiBSZWxheCB0aGUg
JG5vZGVuYW1lIHBhdHRlcm4gaW4gcmF3LW5hbmQtY2hpcC55YW1sIHRvIGFsbG93IHN1Y2ggdW5p
dAo+PiA+IGFkZHJlc3Nlcy4KPj4gCj4+IFRoaXMgaXMgc3VwZXIgc3BlY2lmaWMgdG8gdGhpcyBj
b250cm9sbGVyLCBJJ2QgcmF0aGVyIGF2b2lkIHRoYXQgaW4gdGhlCj4+IG1haW4gKHNoYXJlZCkg
ZmlsZXMuIEkgYmVsaWV2ZSB5b3UgY2FuIGZvcmNlIGFub3RoZXIgbm9kZSBuYW1lIGluIHRoZQo+
PiBjb250cm9sbGVyJ3MgYmluZGluZyBpbnN0ZWFkPwo+Cj4gSXQncyBhIGJpdCB0cmlja3kuIEFG
QUlDUywgd2hlbiBJIGRlY2xhcmUgYSBub2RlIG5hbWUgcGF0dGVybiBpbiBteQo+IHNwZWNpZmlj
IGJpbmRpbmcgaW4gYWRkaXRpb24gdG8gdGhlIGdlbmVyaWMgYmluZGluZywgdGhlIHJlc3VsdCBp
cyB0aGF0Cj4gYm90aCBvZiB0aGVtIGFwcGx5LCBzbyBJIGNhbid0IHJlbGF4IHN0cmljdGVyIHJl
cXVpcmVtZW50czoKPgo+ICMgcmF3LW5hbmQtY2hpcC55YW1sCj4gcHJvcGVydGllczoKPiAgICRu
b2RlbmFtZToKPiAgICAgcGF0dGVybjogIl5uYW5kQFthLWYwLTldJCIKPgo+ICMgZnNsLGVsYmMt
ZmNtLW5hbmQueWFtbAo+IHByb3BlcnRpZXM6Cj4gICAkbm9kZW5hbWU6Cj4gICAgIHBhdHRlcm46
ICJebmFuZEBbYS1mMC05XSgsWzAtOWEtZl0qKT8kIgoKV2VsbCwgSSBndWVzcyB0aGlzIGlzIGNy
ZWF0aW5nIGEgc2Vjb25kIHBvc3NpYmxlIG5vZGUgbmFtZS4KCj4gIyBkdGMKPiAvLi4uL2ZzbCxl
bGJjLWZjbS1uYW5kLmV4YW1wbGUuZHRiOgo+IG5hbmRAMSwwOiAkbm9kZW5hbWU6MDogJ25hbmRA
MSwwJyBkb2VzIG5vdCBtYXRjaCAnXm5hbmRAW2EtZjAtOV0kJwo+ICAgICAgICAgZnJvbSBzY2hl
bWEgJGlkOgo+IAlodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvZnNsLGVsYmMtZmNt
LW5hbmQueWFtbCMKCldoYXQgYWJvdXQgZml4aW5nIHRoZSBEVCBpbnN0ZWFkPwoKPiAoSSBjaGFu
Z2VkIHRoZSBzZWNvbmQgcGF0dGVybiB0byBuYW5kLWZhaWxALi4uIGFuZCBkdGMgd2FybmVkIGFi
b3V0IGl0Cj4gIG1pc21hdGNoaW5nIHRvby4pCj4KPiBQZXJoYXBzIEknbSBtaXNzaW5nIGEgRFQt
c2NoZW1hIHRyaWNrIHRvIG92ZXJyaWRlIGEgdmFsdWUvcGF0dGVybi4KPgo+IEFsdGVybmF0aXZl
bHkgKHBlbmRpbmcgZGlzY3Vzc2lvbiBvbiBwYXRjaCAxMS8xMiksIEkgbWlnaHQgZW5kIHVwIG5v
dAo+IHJlZmVyZW5jaW5nIHJhdy1uYW5kLWNoaXAueWFtbC4KCk9rLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
