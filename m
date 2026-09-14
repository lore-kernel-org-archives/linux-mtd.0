Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D8FC88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4mZ81jySyCVC5xnkqC9qaa0N4qT+Ckd1bAcXOBHjZU=; b=L6yjSjJXcYDXh/
	Tq0pT9haTR10b/h+NElUQ7JozDiBEspYkotSCd20t7Sma75CbedHoEqeQeI5apAbztqtQ6Hhu1FsC
	CGst5KQo3hFXgoJLxdrtQYw3MQ5JR8eOHfWKCX8ewj6iTk5l9e8gn0nbD4a8rFpX1WvCg2eyjTKUc
	6yiOa3E9gEiZ+4BCEMYzkZA9xss5DJsls0/h5l04Q15/YGPcter9EBSo8LvCxAJr71CpobCFTOdmu
	GAL355MD9aqUGZ88OKnTZH5lYBRsJ14CigO2M9/KP5mED+juU8RVjNPcXbBZcN20UFteiY3OoKTuZ
	WBk6Au+H177RMUS2Rq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60BG-00000002R6H-19dG;
	Mon, 14 Sep 2026 06:28:42 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60BD-00000002R4j-1GDq
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 06:28:40 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9B2FF19F;
	Mon, 14 Sep 2026 08:28:25 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 08:28:25 +0200
Message-Id: <DLETRRVRUWEP.1VU1EHARD3MSH@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com> <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
In-Reply-To: <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_232839_483237_3901CB6F 
X-CRM114-Status: GOOD (  22.14  )
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

SGksCgpPbiBGcmkgU2VwIDExLCAyMDI2IGF0IDU6MzYgUE0gQ0VTVCwgTnVubyBTw6Egd3JvdGU6
Cj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBJU1NJIElTMjVXWDAxRywgYSAxIEdiaXQgb2N0YWwgTk9S
IGZsYXNoLiBUaGUgcGFydAo+IGlzIGZ1bGx5IGRlc2NyaWJlZCBieSBTRkRQLCBzbyBvbmx5IHRo
ZSBmbGFzaCBJRCBhbmQgdHdvIEJGUFQgZml4dXBzIGFyZQo+IG5lZWRlZC4KCkFkZGluZyBhIG5l
dyBmbGFzaCBpbnZvbHZlcyBtaW5pbXVtIHRlc3RpbmcgYW5kIGFuIFNGRFAgZHVtcCwgc2VlClsx
XS4KCkFsc28gcGxlYXNlIGtlZXAgdGhlIGZvbGxvd2luZyBMaW5rOiB0YWcgaW4geW91ciBuZXh0
IHZlcnNpb246CgpMaW5rOiBodHRwczovL3d3dy5pc3NpLmNvbS9XVy9wZGYvMjVMWC1XWDAxR0Iu
cGRmCgo+IFRoZSBmbGFzaCBoYXMgbm8gU3RhdHVzIFJlZ2lzdGVyIDIgYW5kIGRvZXMgbm90IGlt
cGxlbWVudCB0aGUgMzVoIFJlYWQKPiBDb25maWd1cmF0aW9uIFJlZ2lzdGVyIGNvbW1hbmQsIHNv
IHRoZSBkZWZhdWx0IGFzc3VtcHRpb24gb2YgYSAxNi1iaXQKPiBXcml0ZSBTdGF0dXMgY29tbWFu
ZCBkb2VzIG5vdCBob2xkLiBBZGRpdGlvbmFsbHksIGl0cyBCRlBUIFF1YWQgRW5hYmxlCj4gUmVx
dWlyZW1lbnQgZmllbGQgY2FycmllcyBhIHJlc2VydmVkIHZhbHVlLCB3aGljaCBtYWtlcwo+IHNw
aV9ub3JfcGFyc2VfYmZwdCgpIGtlZXAgdGhlIG1hbnVmYWN0dXJlciBkZWZhdWx0IHF1YWQgZW5h
YmxlIG1ldGhvZDsKPiBjbGVhciBpdCwgc2luY2UgdGhpcyBpcyBhbiBvY3RhbC1vbmx5IHBhcnQg
d2l0aCBubyBxdWFkIG1vZGUgYXQgYWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51
bm8uc2FAYW5hbG9nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMgfCAy
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4gaW5kZXggMmYwNTdkNzMxZGYyLi5hYWM5ZDE5Yjkw
ZmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMKPiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+IEBAIC0yOSw2ICsyOSwyOSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHNwaV9ub3JfZml4dXBzIGlzMjVscDI1Nl9maXh1cHMgPSB7Cj4gIAkucG9zdF9iZnB0
ID0gaXMyNWxwMjU2X3Bvc3RfYmZwdF9maXh1cHMsCj4gIH07Cj4gIAo+ICtzdGF0aWMgaW50IGlz
MjV3eDAxZ19wb3N0X2JmcHRfZml4dXBzKHN0cnVjdCBzcGlfbm9yICpub3IsCj4gKwkJCQkgICAg
ICBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwKPiArCQkJ
CSAgICAgIGNvbnN0IHN0cnVjdCBzZmRwX2JmcHQgKmJmcHQpCj4gK3sKPiArCS8qCj4gKwkgKiBU
aGVyZSBpcyBubyBTdGF0dXMgUmVnaXN0ZXIgMiBhbmQgbm8gMzVoIGNvbW1hbmQuIEFuZCBXUklU
RSBTVEFUVVMKPiArCSAqIFJFR0lTVEVSIHRha2VzIGEgc2luZ2xlIGRhdGEgYnl0ZS4KPiArCSAq
Lwo+ICsJbm9yLT5mbGFncyAmPSB+U05PUl9GX0hBU18xNkJJVF9TUjsKPiArCj4gKwkvKgo+ICsJ
ICogVGhlIEJGUFQgUXVhZCBFbmFibGUgUmVxdWlyZW1lbnQgZmllbGQgaXMgc2V0IHRvIGEgcmVz
ZXJ2ZWQgdmFsdWUsIHNvCj4gKwkgKiBzcGlfbm9yX3BhcnNlX2JmcHQoKSBsZWF2ZXMgdGhlIHF1
YWQgZW5hYmxlIG1ldGhvZCBhdCBpdHMgZGVmYXVsdC4KPiArCSAqIE1ha2Ugc3VyZSB3ZSBkaXNh
YmxlIGl0IGFzIHRoZXJlIGlzIG5vIHF1YWQgbW9kZSBhbnl3YXkuCj4gKwkgKi8KPiArCW5vci0+
cGFyYW1zLT5xdWFkX2VuYWJsZSA9IE5VTEw7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBpczI1d3gwMWdfZml4dXBzID0gewo+ICsJ
LnBvc3RfYmZwdCA9IGlzMjV3eDAxZ19wb3N0X2JmcHRfZml4dXBzLAo+ICt9Owo+ICsKPiAgc3Rh
dGljIGludCBwbTI1bHZfbm9yX2xhdGVfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICB7Cj4g
IAlzdHJ1Y3Qgc3BpX25vcl9lcmFzZV9tYXAgKm1hcCA9ICZub3ItPnBhcmFtcy0+ZXJhc2VfbWFw
Owo+IEBAIC0xMjAsNiArMTQzLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBp
c3NpX25vcl9wYXJ0c1tdID0gewo+ICAJCS5pZCA9IFNOT1JfSUQoMHg5ZCwgMHg3MCwgMHgxOSks
Cj4gIAkJLm5hbWUgPSAiaXMyNXdwMjU2IiwKPiAgCQkuZmxhZ3MgPSBTUElfTk9SX1FVQURfUFAs
Cj4gKwl9LCB7Cj4gKwkJLmlkID0gU05PUl9JRCgweDlkLCAweDViLCAweDFiKSwKPiArCQkubmFt
ZSA9ICJpczI1d3gwMWciLApObyAubmFtZSBwbGVhc2UuCgotbWljaGFlbAoKWzFdIGh0dHBzOi8v
ZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IuaHRtbAoKPiArCQkuZml4dXBz
ID0gJmlzMjV3eDAxZ19maXh1cHMsCj4gIAl9Cj4gIH07Cj4gIAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
