Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61FDC38A2D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZarOXVZ355HapJABDIPjvVoJAze6ETY4aXd0pTwUpM=; b=sUZLeaMKf0Hbl0
	FeK6e7wOVawQyGRmS7WmH02M5r2jjivJ8/+NgRxgAvF169sDTmBgbCyK3pdiB9W2MJszsF7y9d568
	aM9fxBvfHTCk3+U9RFf1/lpSqoJ4GvpbUw5na2ifwxKpg2fGBKLgZQu0d8vT8NJmNIhcovmcyCvRm
	dX6Pdgw3Xa9BhKK9hvgO05fo849tS84f1b/+3/WDnnCCBi5PH4RdoWgEB4M+gd7D/Si1gmSMh8ZpP
	eXC/wIMsAixQ7dt1YOxBHZwuRD6IFwTwuUCl4TyoTf20e7bhg3QsGG1V1pAMkgO5nt7JpoQIsHiqg
	hROXablqYalvC9gGyEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEfI-004EmJ-EZ; Tue, 25 Oct 2022 07:48:00 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEfE-004Ejy-8F
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 07:47:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5EF0EC0008;
	Tue, 25 Oct 2022 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666684072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzRPPOC0dgpsRT+KNgmTDR2mgXFxU07YYnSqsUCT1kg=;
	b=aOzwzcbMEIl5WPpnU47KzOVf51YQkKfHmSjYRCaFiuZKwrrD1ucjb8/Gn+8vp+ucmH5JeK
	5RNC3GVxEJLr0IiNtBvs7CaKEBQxZElV2FuUety3knYmSQfGFon9ve+3P1JuBCeTpmgKth
	S0uIHomTprmZUtQKtCyt6FM0Ctg9e6iNAtRpdQkP2xrWnhj02fLJqx6zMRPt1ASlTE9HNh
	kmNlgKIYhhd2RcJ/xJA93fKBFwqCrvrbd4Iu+hXopKGj8RuxC3pJ+utbWJF3A45Z9LuA5j
	yfcq7e1L19UBAIRpxWeqjaLBSjCMByzuWXcjo05LVdXpKH4qZmL0mdJ0A4lE6w==
Date: Tue, 25 Oct 2022 09:47:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vadym Kochan <vadym.kochan@plvision.eu>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Elad Nachman <enachman@marvell.com>, Chris
 Packham <chris.packham@alliedtelesis.co.nz>, Aviram Dali
 <aviramd@marvell.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: add missing layouts
Message-ID: <20221025094748.7dda3a57@xps-13>
In-Reply-To: <20221024215531.32033-1-vadym.kochan@plvision.eu>
References: <20221024215531.32033-1-vadym.kochan@plvision.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_004756_728835_F205535D 
X-CRM114-Status: GOOD (  17.36  )
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

SGkgVmFkeW0sCgp2YWR5bS5rb2NoYW5AcGx2aXNpb24uZXUgd3JvdGUgb24gVHVlLCAyNSBPY3Qg
MjAyMiAwMDo1NTozMSArMDMwMDoKCj4gRnJvbTogQXZpcmFtIERhbGkgPGF2aXJhbWRAbWFydmVs
bC5jb20+Cj4gCj4gQSBtaXNzaW5nIGxheW91dHMgd2VyZSBhZGRlZCB0byB0aGUgZHJpdmVyIHRv
IHN1cHBvcnQgTkFORCBmbGFzaGVzCj4gd2l0aCBFQ0MgbGF5b3V0cyBvZiAxMiBvciAxNiB3aXRo
IHBhZ2Ugc2l6ZWQgb2YgMjA0OCwgNDA5NiBvciA4MTkyLgo+IAo+IFVzdWFsbHkgdGhlc2VzIGFy
ZSByYXJlIGxheW91dHMsIGJ1dCBpbiBNYXJ2ZWxsIEFDNSBkcml2ZXIsIHRoZSBFQ0MKPiBsZXZl
bCBpcyBzZXQgYWNjb3JkaW5nIHRvIHRoZSBzcGFyZSBhcmVhLCBzbyB3ZSBtYXkgdXNlIHRoZXNl
IGxheW91dHMKPiBtb3JlIGZyZXF1ZW50bHkuCgpBZ2FpbiwgcGxlYXNlIGRvIG5vdCBjYXJyeSBj
b3NtZXRpYyBjaGFuZ2VzIGFuZCByZWFsIG5ldyBhZGRpdGlvbnMgaW4KdGhlIHNhbWUgcGF0Y2gu
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEF2aXJhbSBEYWxpIDxhdmlyYW1kQG1hcnZlbGwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFZhZHltIEtvY2hhbiA8dmFkeW0ua29jaGFuQHBsdmlzaW9uLmV1Pgo+
IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYyB8IDIzICsrKysrKysr
KysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxs
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gaW5kZXggYjlk
MWU5NmUzMzM0Li43OTQ0Nzg3ZjdiOWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWFydmVsbF9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25h
bmQuYwo+IEBAIC0yODMsMTQgKzI4MywyMSBAQCBzdHJ1Y3QgbWFydmVsbF9od19lY2NfbGF5b3V0
IHsKPiAgCj4gIC8qIExheW91dHMgZXhwbGFpbmVkIGluIEFOLTM3OV9NYXJ2ZWxsX1NvQ19ORkNf
RUNDICovCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWFydmVsbF9od19lY2NfbGF5b3V0IG1hcnZl
bGxfbmZjX2xheW91dHNbXSA9IHsKPiAtCU1BUlZFTExfTEFZT1VUKCAgNTEyLCAgIDUxMiwgIDEs
ICAxLCAgMSwgIDUxMiwgIDgsICA4LCAgMCwgIDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCAy
MDQ4LCAgIDUxMiwgIDEsICAxLCAgMSwgMjA0OCwgNDAsIDI0LCAgMCwgIDAsICAwKSwKPiAtCU1B
UlZFTExfTEFZT1VUKCAyMDQ4LCAgIDUxMiwgIDQsICAxLCAgMSwgMjA0OCwgMzIsIDMwLCAgMCwg
IDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCAyMDQ4LCAgIDUxMiwgIDgsICAyLCAgMSwgMTAy
NCwgIDAsIDMwLDEwMjQsMzIsIDMwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCA0MDk2LCAgIDUxMiwg
IDQsICAyLCAgMiwgMjA0OCwgMzIsIDMwLCAgMCwgIDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VU
KCA0MDk2LCAgIDUxMiwgIDgsICA1LCAgNCwgMTAyNCwgIDAsIDMwLCAgMCwgNjQsIDMwKSwKPiAt
CU1BUlZFTExfTEFZT1VUKCA4MTkyLCAgIDUxMiwgIDQsICA0LCAgNCwgMjA0OCwgIDAsIDMwLCAg
MCwgIDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCA4MTkyLCAgIDUxMiwgIDgsICA5LCAgOCwg
MTAyNCwgIDAsIDMwLCAgMCwgMTYwLCAzMCksCj4gKwlNQVJWRUxMX0xBWU9VVCg1MTIsICAgNTEy
LCAgMSwgIDEsICAxLCAgNTEyLCAgOCwgIDgsICAwLCAgIDAsICAwKSwKPiArCU1BUlZFTExfTEFZ
T1VUKDIwNDgsICAgNTEyLCAgMSwgIDEsICAxLCAyMDQ4LCA0MCwgMjQsICAwLCAgIDAsICAwKSwK
PiArCU1BUlZFTExfTEFZT1VUKDIwNDgsICAgNTEyLCAgNCwgIDEsICAxLCAyMDQ4LCAzMiwgMzAs
ICAwLCAgIDAsICAwKSwKPiArCU1BUlZFTExfTEFZT1VUKDIwNDgsICAgNTEyLCAgOCwgIDIsICAx
LCAxMDI0LCAgMCwgMzAsICAxMDI0LCAzMiwgMzApLAo+ICsJTUFSVkVMTF9MQVlPVVQoMjA0OCwg
ICA1MTIsICA4LCAgMiwgIDEsIDEwMjQsICAwLCAzMCwgIDEwMjQsIDY0LCAzMCksCj4gKwlNQVJW
RUxMX0xBWU9VVCgyMDQ4LCAgIDUxMiwgIDEyLCAzLCAgMiwgNzA0LCAgIDAsIDMwLCAgNjQwLCAw
LCAgMzApLAo+ICsJTUFSVkVMTF9MQVlPVVQoMjA0OCwgICA1MTIsICAxNiwgNSwgIDQsIDUxMiwg
ICAwLCAzMCwgIDAsICAgMzIsIDMwKSwKPiArCU1BUlZFTExfTEFZT1VUKDQwOTYsICAgNTEyLCAg
NCwgIDIsICAyLCAyMDQ4LCAzMiwgMzAsICAwLCAgIDAsICAwKSwKPiArCU1BUlZFTExfTEFZT1VU
KDQwOTYsICAgNTEyLCAgOCwgIDUsICA0LCAxMDI0LCAgMCwgMzAsICAwLCAgIDY0LCAzMCksCj4g
KwlNQVJWRUxMX0xBWU9VVCg0MDk2LCAgIDUxMiwgIDEyLCA2LCAgNSwgNzA0LCAgIDAsIDMwLCAg
NTc2LCAzMiwgMzApLAo+ICsJTUFSVkVMTF9MQVlPVVQoNDA5NiwgICA1MTIsICAxNiwgOSwgIDgs
IDUxMiwgICAwLCAzMCwgIDAsICAgMzIsIDMwKSwKPiArCU1BUlZFTExfTEFZT1VUKDgxOTIsICAg
NTEyLCAgNCwgIDQsICA0LCAyMDQ4LCAgMCwgMzAsICAwLCAgIDAsICAwKSwKPiArCU1BUlZFTExf
TEFZT1VUKDgxOTIsICAgNTEyLCAgOCwgIDksICA4LCAxMDI0LCAgMCwgMzAsICAwLCAgMTYwLCAz
MCksCj4gKwlNQVJWRUxMX0xBWU9VVCg4MTkyLCAgIDUxMiwgIDEyLCAxMiwgMTEsIDcwNCwgIDAs
IDMwLCAgNDQ4LCA2NCwgMzApLAo+ICsJTUFSVkVMTF9MQVlPVVQoODE5MiwgICA1MTIsICAxNiwg
MTcsIDE2LCA1MTIsICAwLCAzMCwgIDAsICAgMzIsIDMwKSwKPiAgfTsKPiAgCj4gIC8qKgoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
