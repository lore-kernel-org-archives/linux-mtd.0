Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9795FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 19:36:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6727420643
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 19:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0N3scQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6727420643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCnQSgdJSKuolxzgKb0dxcJGmH/2mvfGWq7zZPS90Sg=; b=k0N3scQn7vUP7g
	qgYDB6svJcBDd1Dv2HYuDG2Bao3BTXRVMdRDfg59C2wHvrljk4XcMqp3FQh5kiLFHsOwdoTB8uOm8
	C17BT4pOAY5Kl0jTQWcBKfrXSr+Ug7IsEt6PYOYS+apDBbFsGSp1RQqzqZx5BG4tOn+WnC4I+qT/t
	LmR6BMtRIAwGpo1g4eB0axgjR48dGvzzDSIqw+GNsVo701Zs5lOPHJaHdqTXZNVlu2+yx72aqNOGe
	fjalAsPJSK4cJ9G1/oUnLRe/xLGEOzerINpvK+0bVhwwcJVSFSwUJtdS5cJJvg2Cu0LSJp1CkCO5H
	Xvs1h7yv1atRuDC6HFFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jalYR-0004nb-77; Mon, 18 May 2020 19:36:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jalYO-0004lx-Lh
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 19:36:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 97A512A077B;
 Mon, 18 May 2020 20:35:58 +0100 (BST)
Date: Mon, 18 May 2020 21:35:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Convert the driver to exec_op()
Message-ID: <20200518213555.38e3a570@collabora.com>
In-Reply-To: <20200518212422.23316760@collabora.com>
References: <20200518165640.312220-1-boris.brezillon@collabora.com>
 <G7GJAQ.0VIFSQUDMC9H2@crapouillou.net>
 <20200518212422.23316760@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_123600_892596_A668AA3B 
X-CRM114-Status: GOOD (  21.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxOCBNYXkgMjAyMCAyMToyNDoyMiArMDIwMApCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gT24gTW9uLCAxOCBNYXkgMjAyMCAx
OTo1MDowNCArMDIwMAo+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90
ZToKPiAKPiA+IEhpIEJvcmlzLAo+ID4gCj4gPiBMZSBsdW4uIDE4IG1haSAyMDIwIMOgIDE4OjU2
LCBCb3JpcyBCcmV6aWxsb24gCj4gPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IGEg
w6ljcml0IDoKPiA+ID4gTGV0J3MgY29udmVydCB0aGUgZHJpdmVyIHRvIGV4ZWNfb3AoKSB0byBo
YXZlIG9uZSBsZXNzIGRyaXZlciByZWx5aW5nCj4gPiA+IG9uIHRoZSBsZWdhY3kgaW50ZXJmYWNl
LiAgCj4gPiAKPiA+IEdyZWF0IHdvcmssIHRoYW5rcyBmb3IgdGhhdC4KPiA+IAo+ID4gSG93ZXZl
ciBpdCBkb2VzIG5vdCB3b3JrIDooIG5hbmRfc2NhbigpIHJldHVybnMgZXJyb3IgLTE0NS4KPiAK
PiBMb29rcyBsaWtlIHRoZSBSL0Igc2lnbmFsIGlzIGludmVydGVkLiBDYW4geW91IHRyeSB3aXRo
IHRoZQo+IGZvbGxvd2luZyBkaWZmIGFwcGxpZWQ/CgpJIGNoZWNrZWQgdGhlIERULCBhbmQgdGhl
IEdQSU8gaXMgaW5kZWVkIGRlY2xhcmVkIEdQSU9fQUNUSVZFX0xPVywKd2hpY2ggZXhwbGFpbiB3
aHkgdGhlIHRlc3QgaXMgaW52ZXJ0ZWQuIEJlY2F1c2Ugb2YgRFQgQUJJIHN0YWJpbGl0eSBpdApt
aWdodCBub3QgYmUgYW4gb3B0aW9uIHRvIGNoYW5nZSB0aGF0LCBidXQgdGhlIHNpZ25hbCBzaG91
bGQgYWN0dWFsbHkgYmUKZGVjbGFyZWQgR1BJT19BQ1RJVkVfSElHSC4KCj4gCj4gLS0tPjgtLS0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRf
ZHJ2LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYwo+
IGluZGV4IGRjZWNkNTRhZjIwYi4uOTIwNjc5MjYyOWE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMKPiBAQCAtMjQ5LDYgKzI0OSwy
NiBAQCBzdGF0aWMgaW50IGluZ2VuaWNfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwKQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgaW5nZW5p
Y19uYW5kX2dwaW9fd2FpdHJkeShzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZCwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0aW1lb3V0X21zKQo+ICt7
Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogV2FpdCB1bnRpbCBSL0IgcGluIGluZGljYXRlcyBj
aGlwIGlzIHJlYWR5IG9yIHRpbWVvdXQgb2NjdXJzLgo+ICsgICAgICAgICogKzEgYmVsb3cgaXMg
bmVjZXNzYXJ5IGJlY2F1c2UgaWYgd2UgYXJlIG5vdyBpbiB0aGUgbGFzdCBmcmFjdGlvbgo+ICsg
ICAgICAgICogb2YgamlmZnkgYW5kIG1zZWNzX3RvX2ppZmZpZXMgaXMgMSB0aGVuIHdlIHdpbGwg
d2FpdCBvbmx5IHRoYXQKPiArICAgICAgICAqIHNtYWxsIGppZmZ5IGZyYWN0aW9uIC0gcG9zc2li
bHkgbGVhZGluZyB0byBmYWxzZSB0aW1lb3V0Lgo+ICsgICAgICAgKi8KPiArICAgICAgIHRpbWVv
dXRfbXMgPSBqaWZmaWVzICsgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKSArIDE7Cj4gKyAg
ICAgICBkbyB7Cj4gKyAgICAgICAgICAgICAgIGlmICghZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVw
KGdwaW9kKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAg
ICAgICAgICAgIGNvbmRfcmVzY2hlZCgpOwo+ICsgICAgICAgfSB3aGlsZSAodGltZV9iZWZvcmUo
amlmZmllcywgdGltZW91dF9tcykpOwo+ICsKPiArICAgICAgIHJldHVybiAhZ3Bpb2RfZ2V0X3Zh
bHVlX2NhbnNsZWVwKGdwaW9kKSA/IDAgOiAtRVRJTUVET1VUOwo+ICt9Owo+ICsKPiAgc3RhdGlj
IGludCBpbmdlbmljX25hbmRfZXhlY19pbnN0cihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGluZ2VuaWNfbmFuZF9jcyAq
Y3MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFu
ZF9vcF9pbnN0ciAqaW5zdHIpCj4gQEAgLTI5NCw4ICszMTQsOCBAQCBzdGF0aWMgaW50IGluZ2Vu
aWNfbmFuZF9leGVjX2luc3RyKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIG5hbmRfc29mdF93YWl0cmR5KGNoaXAsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc3RyLT5jdHgud2FpdHJkeS50
aW1lb3V0X21zKTsKPiAgCj4gLSAgICAgICAgICAgICAgIHJldHVybiBuYW5kX2dwaW9fd2FpdHJk
eShjaGlwLCBuYW5kLT5idXN5X2dwaW8sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnN0ci0+Y3R4LndhaXRyZHkudGltZW91dF9tcyk7Cj4gKyAgICAgICAgICAg
ICAgIHJldHVybiBpbmdlbmljX25hbmRfZ3Bpb193YWl0cmR5KG5hbmQtPmJ1c3lfZ3BpbywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zdHItPmN0
eC53YWl0cmR5LnRpbWVvdXRfbXMpOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICB9Cj4gQEAgLTMyMiw2ICszNDIsOSBAQCBzdGF0aWMgaW50IGlu
Z2VuaWNfbmFuZF9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gICAgICAgICAgICAg
ICAgIHJldCA9IGluZ2VuaWNfbmFuZF9leGVjX2luc3RyKGNoaXAsIGNzLCAmb3AtPmluc3Ryc1tp
XSk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAob3AtPmluc3Ryc1tpXS5kZWxheV9ucykK
PiArICAgICAgICAgICAgICAgICAgICAgICBuZGVsYXkob3AtPmluc3Ryc1tpXS5kZWxheV9ucyk7
Cj4gICAgICAgICB9Cj4gICAgICAgICBqejQ3ODBfbmVtY19hc3NlcnQobmZjLT5kZXYsIGNzLT5i
YW5rLCBmYWxzZSk7Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
