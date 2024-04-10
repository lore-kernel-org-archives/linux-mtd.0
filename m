Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552E9CD11C2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbIoXvJllPAZ3N8F3Wo9M+PQ8rUa+DP5vXH+CbjlDik=; b=4K1TFKRl6TR8dK
	G+FbZBFV4GG6SQgxeNIfKhxCZYVXSVZObzFs4fmLKmXL1qBVq81XQ/C1EzAVkTAE8yDEDdlaPsRgE
	zmP56Jjvx+lD6mC3MVcWdlyDTR76dlmZLTXwd3zgBPyMh0G/8iA3Cb9ZTAdv4g3OfHpcrlCl5Zut9
	MLJSKuAGhARXkB9jm+HNraPjJbO3PuM+OURct+KGSDo+OYcEslbmzh1LBgwt2YTinCy4W6aXNpB0p
	aNhBANLC18kXy9Gi56FhMOq8KrETfLCd8+J/WrIW3BDh3aHgNg/13tcAfXSFQ1EozFvnkaPX2Shco
	+YTnAcLccLEhII1jAu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZRW-00000007f8L-40FP;
	Wed, 10 Apr 2024 15:00:54 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZRQ-00000007f3v-3jwy;
	Wed, 10 Apr 2024 15:00:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F6841C0005;
	Wed, 10 Apr 2024 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712761244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzMYDMLGBpPQNMah2gckIeh3UT0WgV6HR8G+ppovp+Y=;
	b=d1DEagI4nb/ol0AaR0vfyiD500UagvM8aAw43x9dEhNl7sPQT3uoUpQgrcfWJl9sYEOjFs
	KfqwYvvH8RQ/BYupRm3yMeB8xxy6oYtewm5pEmdBjwClHnZOJUAY8xwLmHZcDkpRPM5806
	xSWAkfYYlhtIWeDgSqYZp1iGAEtxVgd3p5ayB55jQTChqmU08f1qJhrJ7Fsgc1YAokCcmn
	3edZuXvPg6HZNGNk/oXjDNbiNsmQxGQRLM+sBUIub2sCJmW77hqcsz0jylJuBSYwZyiJCO
	LkymfrG2MQ5I1FrT8yih+eDtbj1LDRoSl37311ZVUoa/AVRDk/bWRvdRn5Y99g==
Date: Wed, 10 Apr 2024 17:00:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240410170040.37a59ff6@xps-13>
In-Reply-To: <588551c9-3426-e623-e2aa-70b040c9324a@salutedevices.com>
References: <20240409181025.55504-1-avkrasnov@salutedevices.com>
	<20240409181025.55504-2-avkrasnov@salutedevices.com>
	<20240410122356.30852b3c@xps-13>
	<588551c9-3426-e623-e2aa-70b040c9324a@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_080049_489579_071B339F 
X-CRM114-Status: GOOD (  23.94  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBXZWQsIDEw
IEFwciAyMDI0IDE3OjQ4OjAyICswMzAwOgoKPiBIaSwKPiAKPiBPbiAxMC4wNC4yMDI0IDEzOjIz
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgQXJzZW5peSwKPiA+IAo+ID4gYXZrcmFzbm92
QHNhbHV0ZWRldmljZXMuY29tIHdyb3RlIG9uIFR1ZSwgOSBBcHIgMjAyNCAyMToxMDoyNCArMDMw
MDoKPiA+ICAgCj4gPj4gQm9vdCBST00gY29kZSBvbiBNZXNvbiByZXF1aXJlcyB0aGF0IHNvbWUg
cGFnZXMgb24gTkFORCBtdXN0IGJlIHdyaXR0ZW4KPiA+PiBpbiBzcGVjaWFsIG1vZGU6ICJzaG9y
dCIgRUNDIG1vZGUgd2hlcmUgZWFjaCBibG9jayBpcyAzODQgYnl0ZXMgYW5kCj4gPj4gc2NyYW1i
bGluZyBtb2RlIGlzIG9uLiBTdWNoIHBhZ2VzIGxvY2F0ZWQgd2l0aCB0aGUgc3BlY2lmaWVkIGlu
dGVydmFsCj4gPj4gd2l0aGluIHNwZWNpZmllZCBvZmZzZXQuIEJvdGggaW50ZXJ2YWwgYW5kIG9m
ZnNldCBhcmUgbG9jYXRlZCBpbiB0aGUKPiA+PiBkZXZpY2UgdHJlZSBhbmQgdXNlZCBieSBkcml2
ZXIgaWYgJ25hbmQtaXMtYm9vdC1tZWRpdW0nIGlzIHNldCBmb3IKPiA+PiBOQU5EIGNoaXAuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPGF2a3Jhc25vdkBzYWx1dGVk
ZXZpY2VzLmNvbT4KPiA+PiAtLS0KPiA+PiAgLi4uL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29u
LW5hbmQueWFtbCAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwo+ID4+ICAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1s
Cj4gPj4gaW5kZXggNTdiNjk1N2M4NDE1Li5iODZhMTk1MzA1NmIgMTAwNjQ0Cj4gPj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQu
eWFtbAo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1s
b2dpYyxtZXNvbi1uYW5kLnlhbWwKPiA+PiBAQCAtNjQsMTEgKzY0LDI1IEBAIHBhdHRlcm5Qcm9w
ZXJ0aWVzOgo+ID4+ICAgICAgICAgIGl0ZW1zOgo+ID4+ICAgICAgICAgICAgbWF4aW11bTogMAo+
ID4+ICAKPiA+PiArICAgICAgYW1sb2dpYyxib290LXBhZ2UtbGFzdDoKPiA+PiArICAgICAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+PiArICAgICAg
ICBkZXNjcmlwdGlvbjoKPiA+PiArICAgICAgICAgIFRoZSBORkMgZHJpdmVyIG5lZWRzIHRoaXMg
aW5mb3JtYXRpb24gdG8gc2VsZWN0IEVDQwo+ID4+ICsgICAgICAgICAgYWxnb3JpdGhtcyBzdXBw
b3J0ZWQgYnkgdGhlIGJvb3QgUk9NLiAgCj4gPiAKPiA+IFNoYWxsIHdlIGhhdmUgYSBsZW5ndGgg
cmF0aGVyIHRoYW4gdGhlIGxhc3QgcGFnZT8gIAo+IAo+IFlvdSBtZWFuIHJlbmFtZSBpdCB0byAi
YW1sb2dpYyxib290LXBhZ2VzLWxlbmd0aCIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdCA/IEJ1dCBJ
IHRoaW5rCj4gbGVuZ3RoIGluIGJ5dGVzIGlzIHVzZWxlc3MgaGVyZToKPiAxKSBib290IHJvbSBu
ZWVkcyB0aGF0IG9ubHkgc29tZSBzaW5nbGUgcGFnZXMgYXJlIHdyaXR0ZW4gaW4gc3BlY2lhbCBt
b2RlIChhbmQgYXMgSSBzZWUgaW4KPiAgICB2ZW5kb3IncyBkcml2ZXIgaXQgYWxzbyB3b3JrcyBp
biBwYWdlcykuCj4gMikgTkFORCBkcml2ZXIgb3BlcmF0ZXMgaW4gcGFnZXMgZHVyaW5nIHdyaXRl
L3JlYWQgc3VjaCBwYWdlcy4KPiAKPiBTbyBsZW5ndGggaW4gYnl0ZXMgd2lsbCBiZSBjb252ZXJ0
ZWQgdG8gcGFnZXMgYW55d2F5Lgo+IAo+IFdoYXQgZG8gWW91IHRoaW5rID8KCkkgZGlkbid0IHRh
bGsgYWJvdXQgdW5pdHMgOi0pCgpNYXliZTogYW1sb2dpYyxib290LXBhZ2VzIHdvdWxkIG1ha2Ug
c2Vuc2U/IEJ1dCBwb2ludGluZyBhdCB0aGUgbGFzdApwYWdlIHNlZW1zIHdlaXJkLgoKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
