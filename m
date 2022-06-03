Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FB8C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuMj3wC4Dh9FKjKDLy2CazV4bCM0KDXIx6tDAThCGPU=; b=uiEhyEr4ie6XzD
	ttyHoNZwXfMmbDoo4zc76CfP17+Kyro3BAS+K6ZW128EU5thsgG9/hQeaDjDOc5p/nHs7dgQtFWOf
	yl7huaMbFPNetcXXGxwuInzi1tLf1R+7fBk9epDuCIz1vXhzgFMhM5oOMKtR+5Bjc8DtVRaVTvxkX
	0Nbf8wMrX9368ZnehAIQBc/7qobuJ+kdSTJ21jBk+BOobXqQHIXCdzPtp0ffWk/6mmHm5JuNqXikq
	sJq85laFDDSeIR3hkV6cY/MqoVbBUEXoaytoeFC5MEOsnVZ3mQf0q6A1tLNEw9+R1zsuWSHZTZwm1
	+f/C8+SBh5ly5TtnqrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7Xb-007Ymt-Lf; Fri, 03 Jun 2022 13:40:39 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7XY-007Ym0-M4
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 13:40:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E7721BF207;
	Fri,  3 Jun 2022 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654263629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PDivizaxZ+AZVI8p6z9vlgef9z49p8d3VW+VGNrFXQ=;
	b=FyImQt/znIZ3l9LMdZ0YhyUCnm8jZNezAY+ZF2LrLu5+lFQyM6ady0UJG32AVkeNcXDR1b
	eQqgT8r55nCwyn+w87wZtn52dhsFvmEQmOrr98AaC2wCDFSb5yeHuJasulwXo1ubBOgB52
	2ZdD/b/c0tSyL6Xmesr/4co48HjYzx65CUOCkP7ByAC+iTcuV6FFG5+8VZ8ONelSLgc/MZ
	/nIPfrKqOkV/Um8Mzbk7mzYbqSYkEY7k0247463pkejI/L7GnCiSO5hbWJGGgrKdDW5mCp
	N+QKuEvj8NkAMLRjc09Leu0e4zzHtr/MUaNE8AptT3KletmN9jvAB2jQMtB4fA==
Date: Fri, 3 Jun 2022 15:40:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: mxc-nand: Drop undocumented
 properties from example
Message-ID: <20220603154024.27ae9ad5@xps-13>
In-Reply-To: <20220531150515.GB1742958-robh@kernel.org>
References: <20220525205947.2487165-1-robh@kernel.org>
	<20220527093839.3byc6r6ixuu5givt@pengutronix.de>
	<20220531150515.GB1742958-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_064036_892626_82BCC75C 
X-CRM114-Status: GOOD (  19.50  )
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

SGkgUm9iLCBNYXJjLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFR1ZSwgMzEgTWF5IDIwMjIg
MTA6MDU6MTUgLTA1MDA6Cgo+IE9uIEZyaSwgTWF5IDI3LCAyMDIyIGF0IDExOjM4OjM5QU0gKzAy
MDAsIE1hcmMgS2xlaW5lLUJ1ZGRlIHdyb3RlOgo+ID4gT24gMjUuMDUuMjAyMiAxNTo1OTo0Niwg
Um9iIEhlcnJpbmcgd3JvdGU6ICAKPiA+ID4gV2l0aCB1bmV2YWx1YXRlZFByb3BlcnRpZXMgaXNz
dWVzIGZpeGVkLCAnbmFuZC1idXMtd2lkdGgnIGFuZAo+ID4gPiAnbmFuZC1lY2MtbW9kZScgYXJl
IGZsYWdnZWQgYXMgdW5kb2N1bWVudGVkLiBSZW1vdmluZyB0aGVtIGZyb20gdGhlIGV4YW1wbGUK
PiA+ID4gaXMgdGhlIGVhc2llc3Qgc29sdXRpb24gdG8gc2lsZW5jZSB0aGUgd2FybmluZ3MuCj4g
PiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiAg
Cj4gPiAKPiA+IEF0IGxlYXN0IHRoZSAnbmFuZC1idXMtd2lkdGgnIHByb3BlcnR5IGlzIGRlc2Ny
aWJlZCBpbgo+ID4gIm5hbmQtY29udHJvbGxlci55YW1sIiBhbmQgdGhlICJteGMtbmFuZC55YW1s
IiByZWZlcnMgdG8gaXQuCj4gPiAKPiA+IHwgYWxsT2Y6Cj4gPiB8ICAgLSAkcmVmOiAibmFuZC1j
b250cm9sbGVyLnlhbWwiCj4gPiAKPiA+IElzIHRoaXMgcmVmIGJyb2tlbj8gIAo+IAo+IE5vcGUs
IHJlYWQgbXkgbm90ZSBiZWxvdy4gJ25hbmQtYnVzLXdpZHRoJyBpcyBkb2N1bWVudGVkIGFzIGEg
bmFuZCBjaGlwIAo+IChjaGlsZCBub2RlKSBwcm9wZXJ0eSwgbm90IGEgbmFuZCBjb250cm9sbGVy
IHByb3BlcnR5Lgo+IAo+IAo+ID4gcmVnYXJkcywKPiA+IE1hcmMKPiA+ICAgCj4gPiA+IC0tLQo+
ID4gPiBUaGVzZSBwcm9wZXJ0aWVzIG1heSBiZSBkZXByZWNhdGVkLCBidXQgdGhleSBhcmUgc3Rp
bGwgd2lkZWx5IHVzZWQgaW4KPiA+ID4gYmluZGluZ3MuIFRoZXkgZWl0aGVyIG5lZWQgdG8gYmUg
ZG9jdW1lbnRlZCAoYW5kIG1hcmtlZCBkZXByZWNhdGVkKSBvcgo+ID4gPiByZW1vdmVkIGZyb20g
Y3VycmVudCB1c2VycyAoaS5lLiBkdHMgZmlsZXMpLiAgCgpJIGRvbid0IG1pbmQga2VlcGluZyB0
aGVtIHVuZG9jdW1lbnRlZCB0byBlbmNvdXJhZ2UgcGVvcGxlIHRvIG1pZ3JhdGUKdG8gYSBiZXR0
ZXIgZGVzY3JpcHRpb24uIEZvciB0aGUgcmVjb3JkLCBpbiB0aGUgcGFzdCBjb250cm9sbGVycyBh
bmQKZGV2aWNlcyB3aGVyZSBub3Qgc2VwYXJhdGVkIGluIHRoZSBkZXNjcmlwdGlvbiwgaGVuY2Ug
d2UgaGFkIE5BTkQgY2hpcApzcGVjaWZpYyBwcm9wZXJ0aWVzIGxhbmRpbmcgaW4gdG8gdGhlIE5B
TkQgY29udHJvbGxlciBkZXNjcmlwdGlvbi4KClNvIEknbSBmaW5lIHdpdGggdGhlIGN1cnJlbnQg
YXBwcm9hY2guCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
