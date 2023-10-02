Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC306E7849A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/e38lrPa0fPvx4ykPRq2JPW0fxwWTkNGgRke8bTDeSQ=; b=Ld8vtWwJnabV1X
	PEz7wtz2KKO60KybpnzYvk82BOjlXJP+5fMNXbwoXQNWb1+kSXIrpVFmAxO6t0K+nL9ULmt0VU+st
	QgHOfvKVbZ6ERnDSSixy7UQP2eTjvBKkt15QFB962nqjaOcdTCR/EJwIoBSHq4WzZRMO1GqGVURjN
	A69ScjvAGcbl0EGx4n/QsGSvkMk2iiCce2a9E1uHqOY9g3iKP9TqX42xbdgqz3lQ/B//FU/n7MCsk
	Mx72ponwBkQ2v6KY7K8n0U9iUNjowUZ95GVqDgDC/X+ey3SlUr6sBB1nj4tTTKrS/SRcIUFj+bwtc
	oYA841ywtvzAZCTyO0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFG2-00CEb6-36;
	Mon, 02 Oct 2023 09:30:30 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFFy-00CEa8-36
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 09:30:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A66AB1BF204;
	Mon,  2 Oct 2023 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696239021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1nvcBaLCmY8mO5vCFGklzXqpSCLTGt+OF1cfRa4tU1I=;
	b=Gcu7m0Pp90GHp77BmLulIh3lxJ0ZsmBaZP25G4W3qzZoxP5zDxpwxd9xrPi9jXYNVEHQHl
	gs5ksdF8QBLn0dDh7DneFcTXW7sWyJgEvjsDusTLTZLpdY2bIbfiJ/qCO69QGqCnPEnM1X
	5v4Zjj2T2t2a1urSFGseCBBWjFk/9JiBLRvr6FC8HksUeu2Fxuj7Xu9eGJD+KVSmqShlqx
	9mAy6i19fqNtvGZ/y9RLOKrO2s07JQtVmjQjfUM7c9cTLYzzrVj/wCMHeVcmoAfYh/VF2X
	O2NlsZbI442Ie1NYSl6+Cnptn2zDykeaCUokAp6Gmm1dSL8uIWXqTWtwZnMH1A==
Date: Mon, 2 Oct 2023 11:30:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Jean Delvare
 <jdelvare@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, Christophe
 Kerello <christophe.kerello@foss.st.com>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH] mtd: nand: add support for ts72xx
Message-ID: <20231002113017.481aae31@xps-13>
In-Reply-To: <8bbe66a23eb5c8a2404b72d754b1bcb6f4d23867.camel@maquefel.me>
References: <20230927141532.25525-1-nikita.shubin@maquefel.me>
	<20230927172947.33106fe2@xps-13>
	<8bbe66a23eb5c8a2404b72d754b1bcb6f4d23867.camel@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_023027_285475_DD48572C 
X-CRM114-Status: GOOD (  27.31  )
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

SGkgTmlraXRhLAoKPiBgYGAKPiAjIG1vZHByb2JlIHRlY2hub2xvZ2ljLW5hbmQtY29udHJvbGxl
cgo+IG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweGVjLCBDaGlwIElEOiAw
eGYxCj4gbmFuZDogU2Ftc3VuZyBOQU5EIDEyOE1pQiAzLDNWIDgtYml0Cj4gbmFuZDogMTI4IE1p
QiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXplOiA2
NAo+IFNjYW5uaW5nIGRldmljZSBmb3IgYmFkIGJsb2Nrcwo+IEJhZCBlcmFzZWJsb2NrIDEzNyBh
dCAweDAwMDAwMTEyMDAwMAo+IEJhZCBlcmFzZWJsb2NrIDMxMCBhdCAweDAwMDAwMjZjMDAwMAo+
IDMgZml4ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2UgNjAwMDAw
MDAubmFuZC0KPiBjb250cm9sbGVyCj4gQ3JlYXRpbmcgMyBNVEQgcGFydGl0aW9ucyBvbiAiNjAw
MDAwMDAubmFuZC1jb250cm9sbGVyIjoKPiAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDAyMDAwMCA6
ICJUUy1CT09UUk9NIgo+IDB4MDAwMDAwMDIwMDAwLTB4MDAwMDA3ZDIwMDAwIDogIkxpbnV4Igo+
IDB4MDAwMDA3ZDIwMDAwLTB4MDAwMDA4MDAwMDAwIDogIlJlZEJvb3QiCj4gYGBgCj4gCj4gVGhp
cyBsb29rcyBsaWtlIFNhbXN1bmcgSzlGMUcwOFUwRCBvciBLOUYxRzA4VTBCLgo+IAo+IEFuZCB0
aGUgcGF0Y2ggYWJvdmUgdG90YWxseSBzb2x2ZXMgbXkgaXNzdWVzIHdpdGggUkVBRENBQ0hFIC0g
dGhhbmsKPiB5b3UhCj4gCgpHcmVhdCEKCj4gPiBJZiB5b3UgYXJlIHVzaW5nIGEgTWljcm9uIGNo
aXAgdGhhdCBzcGVjaWZpZXMgbm90IHN1cHBvcnRpbmcgRUNDCj4gPiBjb3JyZWN0aW9uIHRvZ2V0
aGVyIHdpdGggc2VxdWVudGlhbCBjYWNoZSByZWFkcywgdGhlbiBpdCdzIGEgcHJvYmxlbQo+ID4g
dGhhdCB3ZSB3aWxsIHNvbHZlIHNvb24gKHlvdSBjYW4gaGFyZGNvZGUKPiA+IGNoaXAtPmNvbnRy
b2xsZXItPnN1cHBvcnRlZF9vcC5jb250X3JlYWQgdG8gMCk7Cj4gPiAKPiA+IE90aGVyd2lzZSB3
ZSBjYW4gZGlzY3VzcyBpdC4KPiA+ICAgCj4gPiA+IC0gbGVnYWN5IHdhaXQgaW1wbGVtZW50YXRp
b24gaGFkIG5vIGRlbGF5cyAtIG9ubHkgdGltZW91dCBhbmQgaWYgaQo+ID4gPiBzZXQgCj4gPiA+
IMKgIHJlYWRiX3BvbGxfdGltZW91dCgpIHRvIHNvbWV0aGluZyByZWFzb25hYmxlIGkgZXhwZXJp
ZW5jZSBzcGVlZAo+ID4gPiBkZWdyYWRhdGlvbiAKPiA+ID4gwqAgb24gbXRkX3NwZWVkdGVzdCwg
Y2FuIGl0IGJlIGxlZnQgYXMgMCA/ICAKPiA+IAo+ID4gTG9va3MgbGlrZSB0aGUgbGVnYWN5IGlt
cGxlbWVudGF0aW9uIHVzZWQgY29uZF9yZXNjaGVkKCkuIFRoZSBkZWxheQo+ID4gbmVlZHMgdG8g
YmUgb2JzZXJ2ZWQgYmVmb3JlIGZpcnN0IGNoZWNraW5nIGZvciB0aGUgc3RhdHVzLCBpdCdzIGEK
PiA+IGRlbGF5Cj4gPiB0aGF0IGlzIGRlc2NyaWJlZCBpbiB0aGUgc3BlYywgaWYgeW91IGdldCB0
aGUgc3RhdHVzIGJlZm9yZSB5b3UgbWlnaHQKPiA+IGp1c3Qgbm90IHNlZSBhIGNvbnNpc3RlbnQg
dmFsdWUuIEkgYmVsaWV2ZSB0aGF0IGlzIHdvcnRoIHRha2luZyBpbnRvCj4gPiBhY2NvdW50IGlu
IHlvdXIgaW1wbGVtZW50YXRpb24gYmVsb3cgKGRvbid0IHdhaXQgdGhlbiBkZWxheSwgaXQncwo+
ID4gbm90IHJlbGV2YW50KS4gQ2FuIHlvdSBzaGFyZSB0aGUgdmFsdWVzIHlvdSd2ZSB0cmllZCBh
bmQgdGhlCj4gPiBwZXJmb3JtYW5jZXMgeW91J3ZlIGdvdD8gIAo+IAo+IFRoZSBudW1iZXJzIGFy
ZSBwcmV0dHkgc3RhYmxlLCBzbyBpbmRlZWQgbGVnYWN5IGlzIGEgYml0IGZhc3RlciwKPiBmb2xs
b3dlZCB1cCBieSBuZXcgb25lIHdpdGggemVybyBpbnRlcnZhbC4KCi4uLgoKPiBMZWdhY3kgc3Bl
ZWR0ZXN0IChvbGQgdmVyc2lvbiBvZiBuYW5kIGNvbnRyb2xsZXIpOgoKPiBtdGRfc3BlZWR0ZXN0
OiBlcmFzZWJsb2NrIHdyaXRlIHNwZWVkIGlzIDM3OTMgS2lCL3MKPiBtdGRfc3BlZWR0ZXN0OiBl
cmFzZWJsb2NrIHJlYWQgc3BlZWQgaXMgMzU2NyBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IHBhZ2Ug
d3JpdGUgc3BlZWQgaXMgMzY4MiBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IHBhZ2UgcmVhZCBzcGVl
ZCBpcyAzNDg4IEtpQi9zCj4gbXRkX3NwZWVkdGVzdDogMiBwYWdlIHdyaXRlIHNwZWVkIGlzIDM3
MjQgS2lCL3MKPiBtdGRfc3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAzNTIxIEtpQi9z
Cj4gbXRkX3NwZWVkdGVzdDogZXJhc2Ugc3BlZWQgaXMgMTk4NzA5IEtpQi9zCgouLi4KIAo+IE5l
dyB2ZXJzaW9uIHdpdGggaW50ZXJ2YWwgemVybzoKCj4gbXRkX3NwZWVkdGVzdDogZXJhc2VibG9j
ayB3cml0ZSBzcGVlZCBpcyAzNjg1IEtpQi9zCj4gbXRkX3NwZWVkdGVzdDogZXJhc2VibG9jayBy
ZWFkIHNwZWVkIGlzIDM1MTcgS2lCL3MKPiBtdGRfc3BlZWR0ZXN0OiBwYWdlIHdyaXRlIHNwZWVk
IGlzIDM1OTIgS2lCL3MKPiBtdGRfc3BlZWR0ZXN0OiBwYWdlIHJlYWQgc3BlZWQgaXMgMzQ0NCBL
aUIvcwo+IG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSB3cml0ZSBzcGVlZCBpcyAzNjA4IEtpQi9zCj4g
bXRkX3NwZWVkdGVzdDogMiBwYWdlIHJlYWQgc3BlZWQgaXMgMzQ3NSBLaUIvcwo+IG10ZF9zcGVl
ZHRlc3Q6IGVyYXNlIHNwZWVkIGlzIDE5NDQ5OSBLaUIvcwoKTG9va3MgYWxtb3N0IHRoZSBzYW1l
IGFzIGFib3ZlLCBJIGJlbGlldmUgdGhlIGRpZmZlcmVuY2UgaXMganVzdCBub2lzZQpiZXR3ZWVu
IG1lYXN1cmVtZW50cy4KCi4uLgoKPiBOZXcgdmVyc2lvbiB3aXRoIGludGVydmFsIDEwMDoKCj4g
bXRkX3NwZWVkdGVzdDogZXJhc2VibG9jayB3cml0ZSBzcGVlZCBpcyAyNzIyIEtpQi9zCj4gbXRk
X3NwZWVkdGVzdDogZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDIxNzUgS2lCL3MKPiBtdGRfc3Bl
ZWR0ZXN0OiBwYWdlIHdyaXRlIHNwZWVkIGlzIDI1OTggS2lCL3MKPiBtdGRfc3BlZWR0ZXN0OiBw
YWdlIHJlYWQgc3BlZWQgaXMgMjA3MCBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSB3cml0
ZSBzcGVlZCBpcyAyNjI3IEtpQi9zCj4gbXRkX3NwZWVkdGVzdDogMiBwYWdlIHJlYWQgc3BlZWQg
aXMgMjEwNiBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IGVyYXNlIHNwZWVkIGlzIDE3NTg1MSBLaUIv
cwoKLi4uCgo+IEFsc28gcHJvdmlkaW5nIHZlcnNpb24gd2l0aCB6ZXJvIGludGVydmFsIGFuZCAi
aWYgKGluc3RyLT5kZWxheV9ucykiCj4gZHJvcHBlZCAtIGl0J3Mgb3B0aW9uYWwgYXMgZmFyIGkg
dW5kZXJzdG9vZDoKCkl0J3Mgbm90IG9wdGlvbmFsLCBzb3JyeSBmb3IgdGhlIHdyb25nIGNvbW1l
bnQsIHBsZWFzZSBrZWVwIGl0IGFzIGl0CmlzLCBrbm93aW5nIHRoYXQgaXQgd2lsbCBiZSBudWxs
IGFmdGVyIGEgd2FpdF9yZHkuCgo+IG10ZF9zcGVlZHRlc3Q6IGVyYXNlYmxvY2sgd3JpdGUgc3Bl
ZWQgaXMgMzY5NSBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IGVyYXNlYmxvY2sgcmVhZCBzcGVlZCBp
cyAzNTMyIEtpQi9zCj4gbXRkX3NwZWVkdGVzdDogcGFnZSB3cml0ZSBzcGVlZCBpcyAzNTkzIEtp
Qi9zCj4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFkIHNwZWVkIGlzIDM0NTcgS2lCL3MKPiBtdGRf
c3BlZWR0ZXN0OiAyIHBhZ2Ugd3JpdGUgc3BlZWQgaXMgMzY0MCBLaUIvcwo+IG10ZF9zcGVlZHRl
c3Q6IDIgcGFnZSByZWFkIHNwZWVkIGlzIDM0ODggS2lCL3MKPiBtdGRfc3BlZWR0ZXN0OiBlcmFz
ZSBzcGVlZCBpcyAxOTU0NTEgS2lCL3MKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
