Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132EECC6B39
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 06:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:To:Subject:From:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBmaU8TdjlL+ks7CNOqKIF1OMo14btH3c3LDy2svI04=; b=IOynMct04rGuUg
	IFKJQVBzaINwE2yCm4ao8amgeoKoh4G7QJkCJfs4y/V9VONPQiWskMPyk6yadpvU4sfBJUuicoKIY
	sUinyQICtyxWLnXqYhHp4t3oyqYJPZQYVn4H/jEF5lhWDwXNPmKcsdfjcTSVf7/Ju8TgK1oyQRXk+
	xi0CCUZsD/kwp9Urua/nqnds2f85IemaUsC++MVg4tST0I65d5XTIcGX4P7dwudLqQ55ebogWfLgA
	Wt9HVOjL9mr5LvY3CTIEXOG+tnMQ5NOjli7IPOInAzxl7aKA8aWkKIF8mYIpxerKdQwWiGUPolbFp
	rk8AOSk/L5HosqvxwXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFAJ-0000000Gx6o-2Sa9;
	Thu, 15 Oct 2026 06:42:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFAF-0000000Gx6H-3KYK
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 06:42:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FDFF40931;
	Thu, 15 Oct 2026 06:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F091F000C6;
	Thu, 15 Oct 2026 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792046527;
	bh=NYEVBgKDeROqh63PQl2UHyalIjAhl2tEcV/5iKRL+7A=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=FAG7ZYXjxXbQgl9l5+4v+xY6PMTwRy98dWWJtwHo2iimcIyxeZtWutx/EwDpGrfAm
	 wy/Ra52Wl81q3Q2fb2/BgHKeMj4qtVClRruSiZxGRw+oM8CxBy4DO/qYy5gDMEjH0c
	 xNbAqM2h+uCGFc00o4Hu3cqjv6tcRausfY6vYNJ3tWKuI/0nW4mOWfo1Wd3acZKqCI
	 iFHZQucshVJQjCWfKUJHZRgxJWismTzkDxOuZPbBfoLsuRMCFRTK96Y5PjMtd40Lim
	 2tBWjbHglqSCmibsEeJQzlp8eRWHfbAr8ibcW0VXn2UpH0VQuSTicV4OVUhhWCIoun
	 +pKpw7mLSyjWQ==
Message-ID: <sashiko-outbox-172353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/8] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, aaro.koskinen@iki.fi, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
References: <cover.1790847519.git.manikandan.m@microchip.com>
 <89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
Date: Thu, 15 Oct 2026 06:42:05 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG52bWVtOiB1c2UtYWZ0
ZXItZnJlZSBvbiBsYXlvdXQgZHJpdmVyIG1vZHVsZSB1bmxvYWQKLS0KCmNvbW1pdCA0ZTdlODJl
ODRmMTljYTBjYzdmN2VhZTk0NzdjMTcxYjJiZGFiNjg1CkF1dGhvcjogTWFuaWthbmRhbiBNdXJh
bGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPgoKbnZtZW06IGxheW91dHM6IGFk
ZCBNaWNyb2NoaXAvU1NUIFNGRFAgRVVJIGxheW91dCBkcml2ZXIKClRoaXMgY29tbWl0IGFkZHMg
YW4gTlZNRU0gbGF5b3V0IHRoYXQgZXhwb3NlcyB0aGUgZmFjdG9yeS1wcm9ncmFtbWVkCkVVSS00
OCBpZGVudGlmaWVyIGZyb20gdGhlIE1pY3JvY2hpcC9TU1QgdmVuZG9yIFNGRFAgcGFyYW1ldGVy
IHRhYmxlCmFzIGEgIm1hYy1hZGRyZXNzIiBjZWxsLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
dm1lbS9sYXlvdXRzL3NzdDI2dmYtc2ZkcC1ldWkuYyBiL2RyaXZlcnMvbnZtZW0vbGF5b3V0cy9z
c3QyNnZmLXNmZHAtZXVpLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMDAuLjY0MTMxOGQ2ZjBhZjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9udm1l
bS9sYXlvdXRzL3NzdDI2dmYtc2ZkcC1ldWkuYwoKWyAuLi4gXQoKPiArCWluZm8ubmFtZSA9ICJt
YWMtYWRkcmVzcyI7Cj4gKwlpbmZvLm9mZnNldCA9IGJhc2UgKyBTRkRQX01DSFBfRVVJNDhfT0ZG
U0VUOwo+ICsJaW5mby5ieXRlcyA9IEVUSF9BTEVOOwo+ICsJaW5mby5ucCA9IG9mX2dldF9jaGls
ZF9ieV9uYW1lKGxheW91dF9ucCwgIm1hYy1hZGRyZXNzIik7Cj4gKwlpbmZvLnJlYWRfcG9zdF9w
cm9jZXNzID0gc2ZkcF9ldWlfcmVhZF9wb3N0X3Byb2Nlc3M7Cj4gKwo+ICsJcmV0ID0gbnZtZW1f
YWRkX29uZV9jZWxsKG52bWVtLCAmaW5mbyk7CgpbIC4uLiBdCgo+ICtzdGF0aWMgdm9pZCBzZmRw
X2V1aV9yZW1vdmUoc3RydWN0IG52bWVtX2xheW91dCAqbGF5b3V0KQo+ICt7Cj4gKwludm1lbV9s
YXlvdXRfdW5yZWdpc3RlcihsYXlvdXQpOwo+ICt9CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhp
cyBsZWF2ZSBhIGRhbmdsaW5nIHBvaW50ZXIgaWYgdGhlIGxheW91dCBtb2R1bGUgaXMgdW5sb2Fk
ZWQ/CgpJbiBzZmRwX2V1aV9hZGRfY2VsbHMoKSwgdGhlIGRyaXZlciByZWdpc3RlcnMgc2ZkcF9l
dWlfcmVhZF9wb3N0X3Byb2Nlc3MoKSBhcwphIGNhbGxiYWNrIHZpYSBudm1lbV9hZGRfb25lX2Nl
bGwoKS4gSG93ZXZlciwgdGhlIE5WTUVNIGNvcmUgdHJhY2tzIHRoZQpwcm92aWRlciBkZXZpY2Un
cyBtb2R1bGUsIG5vdCB0aGUgbGF5b3V0IGRyaXZlciBtb2R1bGUuIAoKRnVydGhlcm1vcmUsIG52
bWVtX2xheW91dF91bnJlZ2lzdGVyKCkgaXMgYW4gZW1wdHkgc3R1YiBpbiB0aGUgTlZNRU0gY29y
ZS4KQmVjYXVzZSB0aGUgY29yZSBBUEkgZG9lcyBub3QgcmVtb3ZlIHRoZSBjZWxscywgdGhlIGNl
bGwgcmVtYWlucyBpbiB0aGUKTlZNRU0gZGV2aWNlJ3MgY2VsbCBsaXN0IHdpdGggYSBkYW5nbGlu
ZyByZWFkX3Bvc3RfcHJvY2VzcyBmdW5jdGlvbiBwb2ludGVyLgoKSWYgdGhlIGxheW91dCBtb2R1
bGUgaXMgdW5sb2FkZWQgYW5kIHRoZSBjZWxsIGlzIHN1YnNlcXVlbnRseSByZWFkIChlLmcuLAp2
aWEgc3lzZnMpLCBjb3VsZCB0aGlzIGV4ZWN1dGUgdW5tYXBwZWQgbW9kdWxlIG1lbW9yeSBhbmQg
Y2F1c2UgYSB1c2UtYWZ0ZXItZnJlZT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc5MDg0NzUxOS5naXQubWFuaWthbmRhbi5t
QG1pY3JvY2hpcC5jb20/cGFydD01CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
