Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D81C6FD1C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUVKjIo2W9y6jwUmyykYMhWenrlm/T2nMR6e93Wh05E=; b=eihYhm46pJ5Siv
	8G6P9Jw4PrCahrGQ6CutmwKS6i3VsWyZwfNu5onhMhItBbxx/CCBPskXMQ6URvPt7VwSPMyMSEB5h
	zbJcIWALAJacMpe9mkOACJur3+7CJVx7i1uf3zOcLCchLKGq/3mqelDZ6gXFwGJpN8eYD/QE6hkgh
	DCf3sjCIhMw8TZw2fyUKY+SwHxWSBSaDjCrZHtUsEWmww0AoIlqMqyHiX+D9onwxx8lf/mmrf2HVV
	Gd3hvUwjt4/wjCJlGqsJzQSPvo5v6KVQQBekS6uybAnr/WooHNC2wlwwYWJyLSm1adaH5nnjtzZTm
	E4z/uLbKcZDlOm29a8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfez8-004CBY-1M;
	Fri, 24 Mar 2023 10:49:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfez3-004CA9-1g
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 10:49:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8155B60004;
	Fri, 24 Mar 2023 10:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679654956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOBPd3myOt8TTqgnfWSHRcc/PaMEX7WckFf+RBWxc+Y=;
	b=ZzRT68PSR4eqwmnXV99i0BbniiAAIef4MOEUfOCZWmzlpK/a1D2BJWbdvHacCk2dh7BU/f
	dC4f4/KN8wTaGIsT5Z3Tv6VBcGRe9mDaVHfifa87ERfYPGRUe5FeNqhKgdNQN25FF0M5b5
	utCcC/qwpyuB+zvI43VjHpTrn+Yp5Br7pRi/MkmK5oYYKoaODUvxSah+G3zWqxLKJNYPNw
	pl7ZaWSDwPvh/boWE0UGxE9FrTLPdcscQT8/R/qrcmLWkZBIhZGDDz6BsJDrpP22CoLFyW
	y5V6p5nJKHArkrEZHgvqqnrtNcoSYJ5mQGSvskjWSdr4jR3L1RMRW9qOKwD2eQ==
Date: Fri, 24 Mar 2023 11:49:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, masonccyang@mxic.com.tw,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nand: Macronix: document new
 binding
Message-ID: <20230324114911.19e00ae1@xps-13>
In-Reply-To: <CAKR-sGcbRRjqt3raXHcvfCfKFDfFWsuu+C7XW3qFckawMsqe4w@mail.gmail.com>
References: <20230323124510.2484808-1-noltari@gmail.com>
	<20230323124510.2484808-2-noltari@gmail.com>
	<20230324104020.54754079@xps-13>
	<CAKR-sGcbRRjqt3raXHcvfCfKFDfFWsuu+C7XW3qFckawMsqe4w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_034921_824119_03245C69 
X-CRM114-Status: GOOD (  31.06  )
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

SGkgw4FsdmFybywKCm5vbHRhcmlAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgMjQgTWFyIDIwMjMg
MTE6MzE6MTcgKzAxMDA6Cgo+IEhpIE1pcXXDqGwsCj4gCj4gRWwgdmllLCAyNCBtYXIgMjAyMyBh
IGxhcyAxMDo0MCwgTWlxdWVsIFJheW5hbAo+ICg8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4p
IGVzY3JpYmnDszoKPiA+Cj4gPiBIaSDDgWx2YXJvLAo+ID4KPiA+IG5vbHRhcmlAZ21haWwuY29t
IHdyb3RlIG9uIFRodSwgMjMgTWFyIDIwMjMgMTM6NDU6MDkgKzAxMDA6Cj4gPiAgCj4gPiA+IEFk
ZCBuZXcgIm14aWMsZGlzYWJsZS1ibG9jay1wcm90ZWN0aW9uIiBiaW5kaW5nIGRvY3VtZW50YXRp
b24uCj4gPiA+IFRoaXMgYmluZGluZyBhbGxvd3MgZGlzYWJsaW5nIGJsb2NrIHByb3RlY3Rpb24g
c3VwcG9ydCBmb3IgdGhvc2UgZGV2aWNlcyBub3QKPiA+ID4gc3VwcG9ydGluZyBpdC4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdt
YWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL25hbmQtbWFjcm9uaXgudHh0IHwgMyArKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtbWFjcm9uaXgudHh0Cj4gPiA+IGluZGV4IGZmYWIy
OGEyYzRkMS4uMDNmNjVjYTMyY2QzIDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtbWFjcm9uaXgudHh0Cj4gPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQKPiA+ID4g
QEAgLTE2LDYgKzE2LDkgQEAgaW4gY2hpbGRyZW4gbm9kZXMuCj4gPiA+ICBSZXF1aXJlZCBOQU5E
IGNoaXAgcHJvcGVydGllcyBpbiBjaGlsZHJlbiBtb2RlOgo+ID4gPiAgLSByYW5kb21pemVyIGVu
YWJsZTogc2hvdWxkIGJlICJteGljLGVuYWJsZS1yYW5kb21pemVyLW90cCIKPiA+ID4KPiA+ID4g
K09wdGlvbmFsIE5BTkQgY2hpcCBwcm9wZXJ0aWVzIGluIGNoaWxkcmVuIG1vZGU6Cj4gPiA+ICst
IGJsb2NrIHByb3RlY3Rpb24gZGlzYWJsZTogc2hvdWxkIGJlICJteGljLGRpc2FibGUtYmxvY2st
cHJvdGVjdGlvbiIKPiA+ID4gKyAgCj4gPgo+ID4gQmVzaWRlcyB0aGUgZmFjdCB0aGF0IG5vd2Fk
YXlzIHdlIHByZWZlciB0byBzZWUgYmluZGluZyBjb252ZXJzaW9ucyB0bwo+ID4geWFtbCBiZWZv
cmUgYWRkaW5nIGFueXRoaW5nLCBJIGRvbid0IHRoaW5rIHRoaXMgd2lsbCBmbHkuCj4gPgo+ID4g
SSdtIG5vdCBzdXJlIGV4YWN0bHkgd2hhdCAiZGlzYWJsZSBibG9jayBwcm90ZWN0aW9uIiBtZWFu
cywgd2UKPiA+IGFscmVhZHkgaGF2ZSBzaW1pbGFyIHByb3BlcnRpZXMgbGlrZSAibG9jayIgYW5k
ICJzZWN1cmUtcmVnaW9ucyIsIG5vdAo+ID4gc3VyZSB0aGV5IHdpbGwgZml0IGJ1dCBJIHRoaW5r
IGl0J3Mgd29ydGggY2hlY2tpbmcuICAKPiAKPiBBcyBleHBsYWluZWQgaW4gMi8yLCBjb21taXQg
MDNhNTM5YzdhMTE4IGludHJvZHVjZWQgYSByZWdyZXNzaW9uIG9uCj4gU2VyY29tbSBINTAwLXMg
KEJDTTYzMjY4KSBPcGVuV3J0IGRldmljZXMgd2l0aCBNYWNyb25peCBNWDMwTEYxRzE4QUMKPiB3
aGljaCBoYW5ncyB0aGUgZGV2aWNlLgo+IAo+IFRoaXMgaXMgdGhlIGxvZyB3aXRoIGJsb2NrIHBy
b3RlY3Rpb24gZGlzYWJsZWQ6Cj4gWyAgICAwLjQ5NTgzMV0gYmNtNjM2OF9uYW5kIDEwMDAwMjAw
Lm5hbmQ6IHRoZXJlIGlzIG5vdCB2YWxpZCBtYXBzIGZvcgo+IHN0YXRlIGRlZmF1bHQKPiBbICAg
IDAuNTA0OTk1XSBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHhjMiwgQ2hp
cCBJRDogMHhmMQo+IFsgICAgMC41MTE1MjZdIG5hbmQ6IE1hY3Jvbml4IE1YMzBMRjFHMThBQwo+
IFsgICAgMC41MTU1ODZdIG5hbmQ6IDEyOCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwg
cGFnZSBzaXplOgo+IDIwNDgsIE9PQiBzaXplOiA2NAo+IFsgICAgMC41MjM1MTZdIGJjbTYzNjhf
bmFuZCAxMDAwMDIwMC5uYW5kOiBkZXRlY3RlZCAxMjhNaUIgdG90YWwsCj4gMTI4S2lCIGJsb2Nr
cywgMktpQiBwYWdlcywgMTZCIE9PQiwgOC1iaXQsIEJDSC00Cj4gWyAgICAwLjUzNTkxMl0gQmFk
IGJsb2NrIHRhYmxlIGZvdW5kIGF0IHBhZ2UgNjU0NzIsIHZlcnNpb24gMHgwMQo+IFsgICAgMC41
NDQyNjhdIEJhZCBibG9jayB0YWJsZSBmb3VuZCBhdCBwYWdlIDY1NDA4LCB2ZXJzaW9uIDB4MDEK
PiBbICAgIDAuOTU0MzI5XSA5IGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBN
VEQgZGV2aWNlIGJyY21uYW5kLjAKPiAuLi4KPiAKPiBUaGlzIGlzIHRoZSBsb2cgd2l0aCBibG9j
ayBwcm90ZWN0aW9uIGVuYWJsZWQ6Cj4gWyAgICAwLjQ5NTA5NV0gYmNtNjM2OF9uYW5kIDEwMDAw
MjAwLm5hbmQ6IHRoZXJlIGlzIG5vdCB2YWxpZCBtYXBzIGZvcgo+IHN0YXRlIGRlZmF1bHQKPiBb
ICAgIDAuNTA0MjQ5XSBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHhjMiwg
Q2hpcCBJRDogMHhmMQo+IFsgICAgMC41MTA3NzJdIG5hbmQ6IE1hY3Jvbml4IE1YMzBMRjFHMThB
Qwo+IFsgICAgMC41MTQ4NzRdIG5hbmQ6IDEyOCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtp
QiwgcGFnZSBzaXplOgo+IDIwNDgsIE9PQiBzaXplOiA2NAo+IFsgICAgMC41MjI3ODBdIGJjbTYz
NjhfbmFuZCAxMDAwMDIwMC5uYW5kOiBkZXRlY3RlZCAxMjhNaUIgdG90YWwsCj4gMTI4S2lCIGJs
b2NrcywgMktpQiBwYWdlcywgMTZCIE9PQiwgOC1iaXQsIEJDSC00Cj4gWyAgICAwLjUzOTY4N10g
QmFkIGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4gWyAgICAwLjU1MDE1M10gQmFk
IGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4gWyAgICAwLjU1NTA2OV0gU2Nhbm5p
bmcgZGV2aWNlIGZvciBiYWQgYmxvY2tzCj4gWyAgICAwLjYwMTIxM10gQ1BVIDEgVW5hYmxlIHRv
IGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbAo+IGFkZHJlc3MgMTAyNzdm
MDAsIGVwYyA9PSA4MDM5Y2U3MCwgcmEgPT0gODAxNmFkNTAKPiAqKiogRGV2aWNlIGhhbmdzICoq
Kgo+IAo+IEVuYWJsaW5nIG1hY3Jvbml4X25hbmRfYmxvY2tfcHJvdGVjdGlvbl9zdXBwb3J0KCkg
bWFrZXMgdGhlIGRldmljZQo+IHVuYWJsZSB0byBkZXRlY3QgdGhlIGJhZCBibG9jayB0YWJsZSBh
bmQgaGFuZ3MgaXQgd2hlbiB0cnlpbmcgdG8gc2Nhbgo+IGZvciBiYWQgYmxvY2tzLgoKUGxlYXNl
IHRyYWNlIG5hbmRfbWFjcm9uaXguYyBhbmQgbG9vazoKLSBhcmUgdGhlIGdldF9mZWF0dXJlcyBh
bmQgc2V0X2ZlYXR1cmVzIHJlYWxseSBzdXBwb3J0ZWQgYnkgdGhlCiAgY29udHJvbGxlciBkcml2
ZXI/Ci0gd2hhdCBpcyB0aGUgc3RhdGUgb2YgdGhlIGxvY2tpbmcgY29uZmlndXJhdGlvbiBpbiB0
aGUgY2hpcCB3aGVuIHlvdQogIGJvb3Q/Ci0gaXMgdGhlcmUgYW55dGhpbmcgdGhhdCBsb2NrcyB0
aGUgZGV2aWNlIGJ5IGNhbGxpbmcgbXhpY19uYW5kX2xvY2soKSA/Ci0gZmluZGluZyBubyBiYnQg
aXMgb25lIHRoaW5nLCBoYW5naW5nIGlzIGFub3RoZXIsIHdoZXJlIGlzIGl0IGhhbmdpbmcKICBl
eGFjdGx5PyAob2Zmc2V0IGluIG5hbmQvIGFuZCBsaW5lIGluIHRoZSBjb2RlKQoKPiAKPiA+Cj4g
PiBPdGhlcndpc2UsIHdoeSB3b3VsZCB5b3UgZGlzYWJsZSB0aGUgYmxvY2sgcHJvdGVjdGlvbj8g
V2hhdCBkb2VzIGl0Cj4gPiBtZWFuIGV4YWN0bHk/IEknbSBub3QgaW4gZmF2b3Igb2YgYSBNYWNy
b25peC1zcGVjaWZpYyBwcm9wZXJ0eSBoZXJlLgo+ID4KPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwg
IAo+IAo+IC0tCj4gw4FsdmFybwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
