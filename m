Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9E4C531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMySisf6rrp6XOT0LzVkJ4OzRywd8Pnf0J1ZNI8pllk=; b=xGxekbE5cdUrnt
	yqetp+Biz7Cd0zBgPJCqGStwMxmf1VuDgRxHxCvh32pnZ0amKlH3uOythWQhb3ROPtNnP1rATK2VS
	/8QKd/dk0EpXjLTzmIxCeIdFUn/XZ5ARAtFgK8F3vYRR67ZSxCMgPvP4ljxm8hLv+uwEY6rvv9d8J
	wRtG30hr04K9l6A44GhovKBsUVy7CcCSRf4Ck/S0Bj5nEGJWthWwp+i1kVUs+EnXNitCvCcGlqiRs
	fyGRNn1wrBcgHtAH+vbl/34hcpRxXTrwkzX1jYRh2rQ0eeUCLJS7DiYL+4ipjQtwIs4z0dS+c3Ags
	wz1qT7GXUU/2MIKVjEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVe0-0000000HAw3-2g0A;
	Fri, 23 Aug 2024 14:52:04 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVdw-0000000HAtI-1ozI
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 14:52:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1D8DE0003;
	Fri, 23 Aug 2024 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724424717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ovXZSB8GFBqrpvMpMjyyHwkJf1v1SVV9Irls5YOZn48=;
	b=puPKFS5GOwqE8W2pluMt6LTzUyxjgS4SmQ5PkrBXGlQwsETTbBI2bAzMhh87LBh8eS8vG2
	Z8swvQt6+mv7je/XAIiiku1QOp025RQ7uDo6iEYCJ9gyYh3jIN8NgXK7oZqtNTXttnvJSp
	5lDAOq1jZ0/E6w1MPGBb9JSHN/o/7aQmpZTilJ57SZKW5J93+03foHNyoM5Imwwanj/eyw
	UxTO4vIdXUuoKGQATJ08hwxXdNu266QwrH8W23aS9TglEfDyJzECLEWBowPHMUVkS1HjTy
	QgejD5m/HPiIpSMLjvhkYN31CJCDR+iyrLvv18Fc0iYiSqG7hA7xf+mhaku/nw==
Date: Fri, 23 Aug 2024 16:51:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Julien Su
 <juliensu@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 4/9] mtd: spi-nand: Add continuous read support
Message-ID: <20240823165155.6c80e43c@xps-13>
In-Reply-To: <mafs04j7cznwh.fsf@kernel.org>
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
	<20240821162528.218292-5-miquel.raynal@bootlin.com>
	<mafs04j7cznwh.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_075201_326402_B5D781E8 
X-CRM114-Status: GOOD (  28.82  )
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

SGkgUHJhdHl1c2gsCgo+ID4gQEAgLTY4NCw3ICs4MzAsMTEgQEAgc3RhdGljIGludCBzcGluYW5k
X210ZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwKPiA+ICAKPiA+ICAJ
b2xkX3N0YXRzID0gbXRkLT5lY2Nfc3RhdHM7Cj4gPiAgCj4gPiAtCXJldCA9IHNwaW5hbmRfbXRk
X3JlZ3VsYXJfcGFnZV9yZWFkKG10ZCwgZnJvbSwgb3BzLCAmbWF4X2JpdGZsaXBzKTsKPiA+ICsJ
aWYgKHN0YXRpY19icmFuY2hfdW5saWtlbHkoJmNvbnRfcmVhZF9zdXBwb3J0ZWQpICYmCj4gPiAr
CSAgICBzcGluYW5kX3VzZV9jb250X3JlYWQobXRkLCBmcm9tLCBvcHMpKSAgCj4gCj4gVGhpcyBs
b29rcyBhIGJpdCBvZGQuIElmIHlvdXIgc3lzdGVtIGhhcyB0d28gTkFORCBkZXZpY2VzLCBvbmUg
d2l0aAo+IGNvbnRpbnVvdXMgcmVhZCBzdXBwb3J0IGFuZCBvbmUgd2l0aG91dCwgeW91IHdpbGwg
ZW5hYmxlIHRoaXMgc3RhdGljCj4gYnJhbmNoIGFuZCB0aGVuIGF0dGVtcHQgdG8gdXNlIGNvbnRp
bnVvdXMgcmVhZCBmb3IgYm90aCwgcmlnaHQ/IEkgdGhpbmsKPiBzcGluYW5kX3VzZV9jb250X3Jl
YWQoKSBzaG91bGQgaGF2ZSBhIGNoZWNrIGZvciBzcGluYW5kLT5zZXRfY29udF9yZWFkLAo+IG90
aGVyd2lzZSB5b3UgZW5kIHVwIGNhbGxpbmcgYSBOVUxMIGZ1bmN0aW9uIHBvaW50ZXIgZm9yIHRo
ZSBmbGFzaAo+IHdpdGhvdXQgY29udGludW91cyByZWFkLgoKTW1taCB0aGF0J3MgcmlnaHQsIEkg
d2FudGVkIGEgc2xpZ2h0bHkgbW9yZSBvcHRpbWFsIHBhdGggYnV0IHRoZSBzdGF0aWMKYnJhbmNo
IGRvZXNuJ3QgcGxheSB3ZWxsIGhlcmUgaWYgaXQncyBhIGdsb2JhbCBwYXJhbWV0ZXIuCgo+IFRo
aXMgd291bGQgcmVkdWNlIHRoZSBjb3N0IG9mIGNoZWNraW5nIHNldF9jb250X3JlYWQgaW4gdGhl
IGhvdCBwYXRoIGlmCj4gdGhlcmUgYXJlIG5vIGZsYXNoZXMgd2l0aCBjb250aW51b3VzIHJlYWQu
IFdoZW4geW91IGRvIGhhdmUgYXQgbGVhc3QKPiBvbmUsIHlvdSB3b3VsZCBoYXZlIHRvIHBheSBp
dCBldmVyeSB0aW1lLiBJIHN1cHBvc2UgeW91IGNhbiBkbyBzb21lIHNvcnQKPiBvZiBkb3VibGUg
YnJhbmNoIHdoZXJlIHlvdSB0YWtlIHRoZSByZXNwZWN0aXZlIHN0YXRpYyBicmFuY2ggaWYgX2Fs
bF8gb3IKPiBfbm9uZV8gb2YgdGhlIGZsYXNoZXMgaGF2ZSBjb250aW51b3VzIHJlYWQsIGFuZCB0
aGVuIHRoZSBoZXRlcm9nZW5lb3VzCj4gc2V0dXBzIGRvIHRoZSBjaGVjayBhdCBydW50aW1lLiBC
dXQgaXMgc3BpbmFuZF9tdGRfcmVhZCgpIGV2ZW4gaG90Cj4gZW5vdWdoIHRvIHdhcnJhbnQgc3Vj
aCBvcHRpbWl6YXRpb25zPwoKSSBiZWxpZXZlIHVzaW5nIHN0YXRpYyBicmFuY2hlcyBoZXJlIHdv
dWxkIGhhdmUgYmVlbiByZWxldmFudCB3aXRoIGEKc2luZ2xlIGNoaXAgdXNlLWNhc2UsIGJ1dCBJ
IGRvbid0IHRoaW5rIGl0IGlzIHdvcnRoIHVzaW5nIGlmIHdlIGhhdmUKbW9yZSB0aGFuIG9uZSBm
bGFzaC4gSXQgaXMgYW4gYWxtb3N0IHRlcGlkIHBhdGgsIGF0IG1vc3QsIHNvIEknbGwganVzdApj
aGVjayAtPnNldF9jb250X3JlYWQgcHJlc2VuY2UuCgo+ID4gKwkJcmV0ID0gc3BpbmFuZF9tdGRf
Y29udGludW91c19wYWdlX3JlYWQobXRkLCBmcm9tLCBvcHMsICZtYXhfYml0ZmxpcHMpOwo+ID4g
KwllbHNlCj4gPiArCQlyZXQgPSBzcGluYW5kX210ZF9yZWd1bGFyX3BhZ2VfcmVhZChtdGQsIGZy
b20sIG9wcywgJm1heF9iaXRmbGlwcyk7Cj4gPiAgCj4gPiAgCWlmIChvcHMtPnN0YXRzKSB7Cj4g
PiAgCQlvcHMtPnN0YXRzLT51bmNvcnJlY3RhYmxlX2Vycm9ycyArPQo+ID4gQEAgLTg3NCw2ICsx
MDI0LDkgQEAgc3RhdGljIGludCBzcGluYW5kX2NyZWF0ZV9kaXJtYXAoc3RydWN0IHNwaW5hbmRf
ZGV2aWNlICpzcGluYW5kLAo+ID4gIAl9Owo+ID4gIAlzdHJ1Y3Qgc3BpX21lbV9kaXJtYXBfZGVz
YyAqZGVzYzsKPiA+ICAKPiA+ICsJaWYgKHN0YXRpY19icmFuY2hfdW5saWtlbHkoJmNvbnRfcmVh
ZF9zdXBwb3J0ZWQpKQo+ID4gKwkJaW5mby5sZW5ndGggPSBuYW5kZGV2X2VyYXNlYmxvY2tfc2l6
ZShuYW5kKTsgIAo+IAo+IFNhbWUgaGVyZS4gV2l0aCBhIGhldGVyb2dlbmVvdXMgc2V0dXAsIHlv
dSB3aWxsIHNldCBsZW5ndGggdG8gZXJhc2VibG9jawo+IHNpemUgZXZlbiBmb3IgdGhlIG5vbi1j
b250aW51b3VzLXJlYWQgZmxhc2guIFRob3VnaCBmcm9tIGEgcXVpY2sgbG9vawo+IGluZm8ubGVu
Z3RoIGRvZXNuJ3Qgc2VlbSB0byBiZSB1c2VkIGFueXdoZXJlIG1lYW5pbmdmdWwuCgpJdCBpcyBh
IHBhcmFtZXRlciBmb3IgdGhlIHNwaSBjb250cm9sbGVyIGRyaXZlci4gSXQgbWF5IGxlYWQgdG8g
YW4KZXJyb3IgaWYgdGhlIHNpemUgaXMgdG9vIGJpZyBmb3Igd2hhdCB0aGUgY29udHJvbGxlciBp
cyBjYXBhYmxlIG9mLAp3aGljaCBpcyBub3QgdGhlIGNhc2UgZm9yIGFueSBvZiB0aGUgZXhpc3Rp
bmcgY29udHJvbGxlcnMgd2hpY2ggYXJlCmFsbCBjYXBhYmxlIG9mIG1hcHBpbmcgYSBibG9jayBh
dCBsZWFzdCAoc291cmNlOiBtZSByZWFkaW5nIHNwaSBjb2RlKS4KCnRoZSBpbmZvIHBhcmFtZXRl
ciBiZWluZyBwZXItbmFuZCBpdCdzIGZpbmUgdG8gdHVuZSBpdCBsaWtlIHRoYXQsIGJ1dCBJCmFn
cmVlIHRoZSBpZigpIGNvbmRpdGlvbmFsIGlzIGN1cnJlbnRseSB3cm9uZyBpbiB0aGUgY2FzZSBv
ZiBkdWFsCmRldmljZXMuCgo+IEluIGdlbmVyYWwsIGEgc3RhdGljIGJyYW5jaCBsb29rcyBtaXN1
c2VkIGhlcmUuIFRoaXMgaXNuJ3QgZXZlbiBhIGhvdAo+IHBhdGggd2hlcmUgeW91J2QgY2FyZSBh
Ym91dCBwZXJmb3JtYW5jZS4KClRCSCB0aGUgcmVhZCBwYXRoIG1pZ2h0IGJlIGNvbnNpZGVyZWQg
aG90LCBidXQgbm90IGhvdCBlbm91Z2ggdG8KanVzdGlmeSB0b28gY29tcGxleCBvcHRpbWl6YXRp
b25zIHNjaGVtZXMsIGRlZmluaXRlbHkuCgpUaGFua3MgYSBsb3QhCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
