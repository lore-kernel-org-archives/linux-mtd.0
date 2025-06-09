Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBE0C5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGZUV/ScaNd5izZBPZ40qE9N3x0C0xYg/wDioi+Qy1s=; b=wnc0DiL+0MTGha
	ecYyXGi15LGg51i4drsBKSGupv1sK/CegtwLbZ8MuFTbXOb9+qcb79IRW+rTJziIVyLsmXty180uO
	2KNBxWcr33X/IH9nxR0W1bXLzpjV/uIIOYXzFRfmaL6+cSNmDzUAlSgrv6zD+YDNFx20Ejt79sezv
	T5cGQwatw0cpx+8zbBYRgNHfZo6DkVyGvx3IdTZWipglRjvYnDgWJKmmhlBLINzl9kWQUo3r69OUM
	UeYa44+lZxIaH8/7XAa5ZPXfcUVtBBRrSkUF+lg9QaFLiYoi0vlUHcAeW7iPb6YkiQGCqmPOx3qpK
	vNrmppD4kZt9tTMj675w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYgY-00000003kmN-029l;
	Mon, 09 Jun 2025 09:20:54 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYTb-00000003jSp-0DXE;
	Mon, 09 Jun 2025 09:07:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8E3B4326B;
	Mon,  9 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749460048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erCWTv1iBu+zhino5X8lqV0NnPCfncKslxTm/LttBO4=;
	b=mqb8fdfUAPmh1nGlznkXqcy65DTSqmBNVTK2jEWW+sZy/L4Mwn72e1BDiJ6cNad6U5dhco
	u2tGJQquy5bw3+kHVVdCbRKfHfSnzViq+cQDLYETVOvMuFONiHdKYsOexHM9Wtq5TlUA27
	Wq6EQAHizzOUgD/5vnR/JKaEAE9T6g0f+lVPjJLQmVUJ7c33S2FZ74WRNQJywTAYKrGQVk
	fSKxOTK0HsojuD7X2IAULVVy80JhHB4I6IhrxTD2EO/Jy5eiufVse+maoLpEn6h5EHezDB
	jnD8xN55kzjPhIwMon0UA42cRqfRK4brNShFTyzymTAVg6aNocx8YOUgeY/CTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Rob Herring <robh@kernel.org>,
  Mark Brown <broonie@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash
 controller
In-Reply-To: <CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
	(Alexey Charkov's message of "Fri, 6 Jun 2025 13:06:22 +0400")
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
	<20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com>
	<20250514204159.GA2988411-robh@kernel.org>
	<CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com>
	<2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org>
	<CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Jun 2025 11:07:27 +0200
Message-ID: <87y0u1z3jk.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeltdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegrlhgthhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_020731_385539_4B0D492F 
X-CRM114-Status: GOOD (  16.27  )
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

SGkgQWxleGV5LAoKPj4gPiBIYXBweSB0byByZWZlcmVuY2UgdGhlIHNwaS1jb250cm9sbGVyLnlh
bWwgYmluZGluZyBpZiBzby4KPj4KPj4gU1BJIE5PUiBmbGFzaGVzIGFyZSBzdGlsbCBjaGlsZCBk
ZXZpY2VzIG9mIGFuIFNQSSBjb250cm9sbGVyLiBZb3UgY2FuCj4+IGxvb2sgYXQgb3RoZXIgZXhh
bXBsZXMgLSBhcmVuJ3QgdGhleSBhbGwgdXNpbmcgc3BpLWNvbnRyb2xsZXI/IFdoeSB0aGlzCj4+
IHdvdWxkIGJlIGRpZmZlcmVudD8gVW5sZXNzIHlvdSBmb3VuZCBzb21lIGNhc2VzIHRoYXQgYXJl
IGRpZmZlcmVudCwgYnV0Cj4+IHRoZW4gd2hpY2ggb25lcz8KPgo+IE5vIHN0cm9uZyBvcGluaW9u
cyBoZXJlLCBhbmQgbm8gZXhwZWN0YXRpb24gb2YgYW55IHNwZWNpYWwgdHJlYXRtZW50Cj4gOikg
SnVzdCB3YW50ZWQgdG8gY29uc3VsdCBvbiB3aGF0J3MgbW9zdCBhcHByb3ByaWF0ZS4KPgo+IE15
IChzdWJqZWN0aXZlIGFuZCBwZXJoYXBzIHVuZm91bmRlZCkgZXhwZWN0YXRpb24gd2hlbiBzZWVp
bmcKPiBzb21ldGhpbmcgYWR2ZXJ0aXNlIGl0c2VsZiBhcyBhbiBTUEkgY29udHJvbGxlciB3YXMg
dGhhdCBpdCB3b3VsZCBiZSBhCj4gZ2VuZXJhbCBwdXJwb3NlIFNQSSBtYXN0ZXIsIHRvIHdoaWNo
IG9uZSBjYW4gZS5nLiBjb25uZWN0IGFuIFNQSQo+IGRyaXZlbiBMQ0Qgc2NyZWVuIGFuZCBnZXQg
aXQgdG8gd29yayB3aXRoIGdlbmVyaWMgTGludXggU1BJCj4gaW5mcmFzdHJ1Y3R1cmUgLSB3aGlj
aCB3b3VsZCBub3QgYmUgcG9zc2libGUgd2l0aCB0aGlzIHNpbmdsZS1wdXJwb3NlCj4gTk9SLW9u
bHkgZmxhc2ggY29udHJvbGxlci4gR2l2ZW4gdGhhdCBJIGRvbid0IGtub3cgaG93IGZsZXhpYmxl
IG9yCj4gcmVzdHJpY3RpdmUgb3RoZXIgZXhhbXBsZXMgYXJlIGluIHRlcm1zIG9mIGRyaXZpbmcg
YXJiaXRyYXJ5IFNQSQo+IGRldmljZXMsIEkgdGhvdWdodCBpdCdzIGJldHRlciB0byBqdXN0IGFz
ay4KPgo+IFdoYXQgSSdtIGdldHRpbmcgZnJvbSB0aGlzIGV4Y2hhbmdlIGhlcmUgaXMgdGhhdCBJ
J2QgYmV0dGVyIHVzZSB0aGUKPiBzcGktY29udHJvbGxlciBiaW5kaW5nIGFuZCByZXNwZWN0aXZl
IG5vZGUgbmFtZXMgcmVnYXJkbGVzcyBvZiB0aGUKPiBmYWN0IHRoYXQgdGhpcyBjb250cm9sbGVy
IGNhbm5vdCBkcml2ZSBhcmJpdHJhcnkgU1BJIGRldmljZXMgYmV5b25kCj4gTk9SIGZsYXNoICh3
aGljaCwgYXMgSSdtIGdldHRpbmcsIGlzIGlycmVsZXZhbnQgYWZ0ZXIgYWxsKS4KCkp1c3QgZm9y
IGluZm9ybWF0aW9uLCB0aGVyZSBhcmUgc2V2ZXJhbCBTUEkgY29udHJvbGxlcnMgd2hpY2ggYXJl
Cm9wdGltaXplZCBmb3IgZmxhc2ggaGFuZGxpbmcgKG5vdCBvbmx5IE5PUiwgdGhvdWdoKSBhbmQg
Zm9yIHRoYXQgd2UgaGF2ZQphIHNwaS1tZW0gbGF5ZXIgd2hpY2ggYWxsb3dzIHRvIHJlZmVyZW5j
ZSBhIHNldCBvZiBTUEkgbWVtb3J5ICJvbmx5IgpjYWxsYmFja3MuIE9uIHRoZSBkZXNjcmlwdGlv
biBzaWRlIHRob3VnaCwgdGhlc2UgY29udHJvbGxlcnMgYXJlIGxpa2UKYWxsIG90aGVyIFNQSSBj
b250cm9sbGVycywgc28gdGhlIHNhbWUgY29udHJvbGxlciBiaW5kaW5ncyBtYXkgYXBwbHkuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
