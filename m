Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25607C32771
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Sep 2022 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbTuzwl1vlYBn8ejhCdejuGDCrXhjouas6+FkIOEOPc=; b=sL6IX2x3dUA3ck
	3m+LA7E9KLQTRp55skKzF1oqvdnlxXtZR4S+fGuARGJRT0NhMyeBiR90VodXaRVGvoQyyuPDAPNit
	Wzq1cOxp5JFr1KV9Z1qWq9D87MO4m9aWWeIMOkbtApNRo2gqPmXiMgHNN5QwePXOw2nOdsivxthg5
	OjAI2fZQV0naDpsg2zUjCAqaVrwG/weljT5LEia5PTbw+IOiRB/9oUAntpxXHLVtVDJ3lMN8BoVi6
	mLnhSLoSb/OPv9y8fM9SFy27Eu96RKqAQVmj+6fi37DVyG4BWhfatrr4Tz7pFSMXmbjC0Dcfu9c5W
	LII5XLPQB6+K7r8Xt5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawVI-00AgSD-Eh; Wed, 21 Sep 2022 09:58:52 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawUr-00AgJ7-Bl; Wed, 21 Sep 2022 09:58:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 196031BF20E;
	Wed, 21 Sep 2022 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663754300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DyHD1cpJLUHFIMs13MWIgjp+SJUxrqpST3FASTVSKyg=;
	b=NKgx0wIhTPfQ5YxJxGGUmmnBRphvtN7QuHUpyH1cPD/8Ph1Qw3r+I4svJb9t8CV534EELl
	3usa6Vb6KvFX6P1OoFx2BdG2IAaLed+v0IfcpsWTPkMe7cv/Q0rxMM2e+4hlpJqjG5a9TU
	y78/qxC74wNo3nbRqLfZAQlIeBmdm2cJWDUpXvLtNUrA6tXLuehjmubX2k/RAT2Ne5bMMQ
	onN/8FdpyDJ+1pEbMwqwv4B2MROBUm9XOlYifOg5FbE3cn9A7THPNKeMZJ7+Lxd4bqLtEh
	wf1+htFsCdXcF/B3Zh3Zzpvv3TP+5o9JqBmNWYApH9rrSzR5qW3Ch4eBYxGn8g==
Date: Wed, 21 Sep 2022 11:58:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Robert Marko
 <robert.marko@sartura.hr>
Subject: Re: [PATCH v2 00/20] nvmem: core: introduce NVMEM layouts
Message-ID: <20220921115813.208ff789@xps-13>
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_025825_735396_C3708480 
X-CRM114-Status: GOOD (  31.78  )
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

SGkgTWljaGFlbCwgU3Jpbml2YXMsCgorIFRob21hcyBhbmQgUm9iZXJ0CgptaWNoYWVsQHdhbGxl
LmNjIHdyb3RlIG9uIEZyaSwgIDIgU2VwIDIwMjIgMDA6MTg6MzcgKzAyMDA6Cgo+IFRoaXMgaXMg
bm93IHRoZSB0aGlyZCBhdHRlbXB0IHRvIGZldGNoIHRoZSBNQUMgYWRkcmVzc2VzIGZyb20gdGhl
IFZQRAo+IGZvciB0aGUgS29udHJvbiBzbDI4IGJvYXJkcy4gUHJldmlvdXMgZGlzY3Vzc2lvbnMg
Y2FuIGJlIGZvdW5kIGhlcmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMTIy
ODE0MjU0OS4xMjc1NDEyLTEtbWljaGFlbEB3YWxsZS5jYy8KPiAKPiAKPiBOVk1FTSBjZWxscyBh
cmUgdHlwaWNhbGx5IGFkZGVkIGJ5IGJvYXJkIGNvZGUgb3IgYnkgdGhlIGRldmljZXRyZWUuIEJ1
dAo+IGFzIHRoZSBjZWxscyBnZXQgbW9yZSBjb21wbGV4LCB0aGVyZSBpcyAodmFsaWQpIHB1c2gg
YmFjayBmcm9tIHRoZQo+IGRldmljZXRyZWUgbWFpbnRhaW5lcnMgdG8gbm90IHB1dCB0aGF0IGhh
bmRsaW5nIGluIHRoZSBkZXZpY2V0cmVlLgo+IAo+IFRoZXJlZm9yZSwgaW50cm9kdWNlIE5WTUVN
IGxheW91dHMuIFRoZXkgb3BlcmF0ZSBvbiB0aGUgTlZNRU0gZGV2aWNlIGFuZAo+IGNhbiBhZGQg
Y2VsbHMgZHVyaW5nIHJ1bnRpbWUuIFRoYXQgd2F5IGl0IGlzIHBvc3NpYmxlIHRvIGFkZCBtb3Jl
IGNvbXBsZXgKPiBjZWxscyB0aGFuIGl0IGlzIHBvc3NpYmxlIHJpZ2h0IG5vdyB3aXRoIHRoZSBv
ZmZzZXQvbGVuZ3RoL2JpdHMKPiBkZXNjcmlwdGlvbiBpbiB0aGUgZGV2aWNlIHRyZWUuIEZvciBl
eGFtcGxlLCB5b3UgY2FuIGhhdmUgcG9zdCBwcm9jZXNzaW5nCj4gZm9yIGluZGl2aWR1YWwgY2Vs
bHMgKHRoaW5rIG9mIGVuZGlhbiBzd2FwcGluZywgb3IgZXRoZXJuZXQgb2Zmc2V0Cj4gaGFuZGxp
bmcpLgo+IAo+IFRoZSBpbXgtb2NvdHAgZHJpdmVyIGlzIHRoZSBvbmx5IHVzZXIgb2YgdGhlIGds
b2JhbCBwb3N0IHByb2Nlc3NpbmcgaG9vaywKPiBjb252ZXJ0IGl0IHRvIG52bWVtIGxheW91dHMg
YW5kIGRyb3AgdGhlIGdsb2JhbCBwb3N0IHBvY2Vzc2luZyBob29rLiBQbGVhc2UKPiBub3RlLCB0
aGF0IHRoaXMgY2hhbmdlIGlzIG9ubHkgY29tcGlsZS10aW1lIHRlc3RlZC4KClRoZXNlIGxheW91
dHMgYXJlIGFuIGV4Y2VsbGVudCBpZGVhLiBJIGFjdHVhbGx5IGhhdmUgYSBuZXcgdXNlIGNhc2Ug
Zm9yCnRoZW0uIEluIG1vZGVybiBFdGhlcm5ldCBzd2l0Y2hlcyB3aGljaCBmb2xsb3cgdGhlIE9O
SUUgc3RhbmRhcmQgWzFdCnRoZXJlIGlzIGFuIG52bWVtIGRldmljZSB3aGljaCBjb250YWlucyBh
IHN0YW5kYXJkaXplZAp0eXBlLWxlbmd0aC12YWx1ZSBhcnJheSB3aXRoIG1hbnkgaW5mb3JtYXRp
b24gYWJvdXQgbWFudWZhY3R1cmluZyBhbmQKbWFjIGFkZHJlc3Nlcy4gVGhlcmUgaXMgbm8gInN0
YXRpYyIgcGF0dGVybiB0aGVyZSBhbmQgYW55d2F5IHNvIG1hbnkKcG9zc2libGUgZW50cmllcyB0
aGF0IGl0IHdvdWxkIGJlIHZlcnkgdGVkaW91cyB0byBsaXN0IGFsbCBvZiB0aGVtIGluCnRoZSBi
aW5kaW5ncywgYXMgZWFjaCBtYW51ZmFjdHVyZXIgY2hvb3NlcyB3aGF0IGl0IHdhbnQgdG8gZXhw
b3J0IG9uCmVhY2ggb2YgaXRzIGRldmljZXMgKGFsdGhvdWdoIHJlYWRpbmcgdGhlIGRhdGEgc2Vx
dWVudGlhbGx5IGFuZApleHRyYWN0aW5nIHRoZSBjZWxscyBpcyByYXRoZXIgc3RyYWlnaHRmb3J3
YXJkKS4KCk1vcmVvdmVyLCB0aGUgc3BlY2lmaWNhdGlvbiBbMV0gZG9lcyBub3QgZGVmaW5lIGFu
eSBzdG9yYWdlIGRldmljZQp0eXBlLCBzbyBpdCBjYW4gYmUgZWcuIGFuIE1URCBkZXZpY2Ugb3Ig
YW4gRUVQUk9NLiBIYXZpbmcgYW4KbnZtZW0gZGV2aWNlIHByb3ZpZGVyIHNlcGFyYXRlZCBmcm9t
IHRoZSBudm1lbSBjZWxscyBwcm92aWRlciBtYWtlcwpjb21wbGV0ZSBzZW5zZSwgdGhlICJsYXlv
dXQiIGRyaXZlcnMgaWRlYSBwcm9wb3NlZCBieSBNaWNoYWVsIHNlZW0gdG8gYmUKYSBwZXJmZWN0
IGZpdC4KClNyaW5pdmFzLCBjYW4geW91IGdpdmUgdXMgYW4gdXBkYXRlIG9uIHdoYXQgeW91IHRo
aW5rIGFib3V0IHRoaXMKc2VyaWVzIChub3QgYSBjb21taXRtZW50LCBqdXN0IGhvdyB5b3UgZmVl
bCBpdCBvdmVyYWxsKT8KCk1pY2hhZWwsIGlzIHRoZXJlIGEgdjMgaW4gcHJlcGFyYXRpb24/IEkn
bGwgdHJ5IHRvIHdyaXRlIHNvbWV0aGluZyBvbgp0b3Agb2YgeW91ciB2MiBvdGhlcndpc2UuCgo+
IFlvdSBjYW4gYWxzbyBoYXZlIGNlbGxzIHdoaWNoIGhhdmUgbm8gc3RhdGljIG9mZnNldCwgbGlr
ZSB0aGUKPiBvbmVzIGluIGFuIHUtYm9vdCBlbnZpcm9ubWVudC4gVGhlIGxhc3QgcGF0Y2hlcyB3
aWxsIGNvbnZlcnQgdGhlIGN1cnJlbnQKPiB1LWJvb3QgZW52aXJvbm1lbnQgZHJpdmVyIHRvIGEg
TlZNRU0gbGF5b3V0IGFuZCBsaWZ0aW5nIHRoZSByZXN0cmljdGlvbgo+IHRoYXQgaXQgb25seSB3
b3JrcyB3aXRoIG10ZCBkZXZpY2VzLiBCdXQgYXMgaXQgd2lsbCBjaGFuZ2UgdGhlIHJlcXVpcmVk
Cj4gY29tcGF0aWJsZSBzdHJpbmdzLCBpdCBpcyBtYXJrZWQgYXMgUkZDIGZvciBub3cuIEl0IGFs
c28gbmVlZHMgdG8gaGF2ZQo+IGl0cyBkZXZpY2UgdHJlZSBzY2hlbWEgdXBkYXRlIHdoaWNoIGlz
IGxlZnQgb3V0IGhlcmUuIFRoZXNlIHR3byBwYXRjaGVzCj4gYXJlIG5vdCBleHBlY3RlZCB0byBi
ZSBhcHBsaWVkLCBidXQgcmF0aGVyIHRvIHNob3cgYW5vdGhlciBleGFtcGxlIG9mCj4gaG93IHRv
IHVzZSB0aGUgbGF5b3V0cy4KCkFjdHVhbGx5IEkgdGhpbmsgdGhlc2UgdHdvIG1hdGNoZXMgbWFr
ZSBjb21wbGV0ZSBzZW5zZSwgcmlnaHQgbm93IG9uZQpjYW4gb25seSB1c2UgdGhlIHUtYm9vdC1l
bnYgY2VsbHMgaWYgdGhlIGVudmlyb25tZW50IGlzIHN0b3JlZCBpbiBhbgptdGQgZGV2aWNlLCBv
ZiBjb3Vyc2UgdGhpcyBjb3ZlcnMgbWFueSBjYXNlcyBidXQgbm90IGFsbCBvZiB0aGVtIGFuZCBp
dAp3b3VsZCBiZSByZWFsbHkgbmljZSB0byBoYXZlIHRoaXMgZmlyc3QgbGF5b3V0IGV4YW1wbGUg
bWVyZ2VkLCBub3Qgb25seQpvbiB0aGUgbWFpbGluZyBsaXN0LgoKPiBGb3Igbm93LCB0aGUgbGF5
b3V0cyBhcmUgc2VsZWN0ZWQgYnkgYSBzcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZyBpbiBhCj4g
ZGV2aWNlIHRyZWUuIEUuZy4gdGhlIFZQRCBvbiB0aGUga29udHJvbiBzbDI4IGRvICh3aXRoaW4g
YSBTUEkgZmxhc2ggbm9kZSk6Cj4gICBjb21wYXRpYmxlID0gImtvbnRyb24sc2wyOC12cGQiLCAi
dXNlci1vdHAiOwo+IG9yIGlmIHlvdSdkIHVzZSB0aGUgdS1ib290IGVudmlyb25tZW50ICh3aXRo
aW4gYW4gTVREIHBhdGl0aW9uKToKPiAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiIsICJudm1l
bSI7Cj4gCj4gVGhlICJ1c2VyLW90cCIgKG9yICJudm1lbSIpIHdpbGwgbGVhZCB0byBhIE5WTUVN
IGRldmljZSwgdGhlCj4gImtvbnRyb24sc2wyOC12cGQiIChvciAidS1ib290LGVudiIpIHdpbGwg
dGhlbiBhcHBseSB0aGUgc3BlY2lmaWMgbGF5b3V0Cj4gb24gdG9wIG9mIHRoZSBOVk1FTSBkZXZp
Y2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
