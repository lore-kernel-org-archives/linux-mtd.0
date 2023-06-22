Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D43CEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZYjIft2Vr4JQYzU46SL4PUyC/mcOd+5K3VfiHukTEc=; b=xVO7AffRmS7xQj
	chOtYQN9ejehEjqzdqowgE1w2N1/5SttcVIeuv2Ym5s8Wv4al9lkc5IwxSPLlQYl4+39+nv0ggClG
	4PhoNHd2ZEkSAkwLZT+FSOkY18A9DPeWrpVnUo7VB3mEjab7bNUc8rcC4+MMLgNwzziE0lZnKRbzZ
	lgRltKrke5J1T/RSNfByQaQS9ZuEPCVuRkOOWSdLqhNjynIJzJv25YgkRr+fbPT+8XX8N3cepKpWx
	UCipCzEl0hO28hqlr93MZplvJOmdGQtdWEqLACRdmFcsk9Q2cf5Ew6ufDeEcMnt7VfsJwP4MyH/I0
	FPo98upc9aN/JzC9K7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRSZ-001mXC-2p;
	Thu, 22 Jun 2023 21:03:19 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRRh-001liD-18
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:02:28 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687467741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj+dlKjeE1HfsgeOJRrfqs43BHfThE4k0H3BZX195EU=;
	b=ALMm54kKlsoAxrAjYQff4Ab0BklcIdnMkXohS2aMwFuaLrEquECzsa993/I4EUy/8ocnYB
	zKATuuxnBj3C2OPGBNY6FOQ63pcMExlyFZAN331Ydunqk7uVZjUE/3zU4Y2uIXhxy/kQOa
	pVVeh6WdREDFDDQINjteR9mhSnGTtsXU5EX8Q+bgr9Nv4xRGBXdgz86oIE5elztSZXx/cG
	szSuCGlUcDujIK/+zbWZb+ubZolgovu/nH4log6DDQfkVRgLvgAkMwwt3RwUdzUBBpfVvi
	wGj0IrEmwx/WVvdSmJG+aa9bj6oAg06h/lOHGLKQ9f4NogUQzfZmCisCYuqF7w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D388D20004;
	Thu, 22 Jun 2023 21:02:19 +0000 (UTC)
Date: Thu, 22 Jun 2023 23:02:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Rong <yangrong@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org (open list:MEMORY
 TECHNOLOGY DEVICES (MTD)), linux-kernel@vger.kernel.org (open list),
 opensource.kernel@vivo.com, luhongfei@vivo.com
Subject: Re: [PATCH] drivers: mtd: Fix potential memory leak in
 mtd_check_of_node
Message-ID: <20230622230217.793fe0c5@xps-13>
In-Reply-To: <20230621024517.1155-1-yangrong@vivo.com>
References: <20230621024517.1155-1-yangrong@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_140225_738781_C6DBD962 
X-CRM114-Status: GOOD (  18.15  )
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

SGVsbG8sCgp5YW5ncm9uZ0B2aXZvLmNvbSB3cm90ZSBvbiBXZWQsIDIxIEp1biAyMDIzIDEwOjQz
OjIyICswODAwOgoKPiBUaGUgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSBBUEkgaW50ZXJuYWxseSBp
bmNyZWFzZXMgdGhlIHJlZmVyZW5jZSBjb3VudAo+IGZvciBlYWNoIGNoaWxkIG5vZGUgdHJhdmVy
c2VkLiBJZiBhIGJyZWFrIHN0YXRlbWVudCBpcyBlbmNvdW50ZXJlZCBpbnNpZGUKPiB0aGUgbG9v
cCwgaXQgbGVhdmVzIG9uZSByZWZlcmVuY2UgdW5iYWxhbmNlZCBsZWFkaW5nIHRvIGEgbWVtb3J5
IGxlYWsuCj4gCj4gVGhlIGZ1bmN0aW9uIG10ZF9jaGVja19vZl9ub2RlIGluIGRyaXZlcnMvbXRk
L210ZGNvcmUuYyB1c2VzIHN1Y2ggYSBsb29wCj4gYW5kIGEgYnJlYWsgc3RhdGVtZW50IHdpdGhv
dXQgYSBjb3JyZXNwb25kaW5nIG9mX25vZGVfcHV0Lgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhl
IHBvdGVudGlhbCBtZW1vcnkgbGVhayBieSBhZGRpbmcgYSBjYWxsIHRvCj4gb2Zfbm9kZV9wdXQg
YmVmb3JlIHRoZSBicmVhayBzdGF0ZW1lbnQgaW5zaWRlIHRoZSBmb3JfZWFjaF9jaGlsZF9vZl9u
b2RlCj4gbG9vcCBpbiB0aGUgZnVuY3Rpb24gbXRkX2NoZWNrX29mX25vZGUuCgpJIHdhbnRlZCB0
byB0YWtlIHRoaXMgcGF0Y2ggYnV0IGl0IGZhaWxlZCB0byBhcHBseSBjbGVhbmx5LiBQbGVhc2Ug
bm93CndhaXQgZm9yIC1yYzEgYW5kIHNlbmQgYW4gdXBkYXRlZCB2Mi4KIAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFlhbmcgUm9uZyA8eWFuZ3JvbmdAdml2by5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L210ZGNvcmUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5j
Cj4gaW5kZXggZTAwYjEyYWE1ZWM5Li5iMDJjYjhiMWEzOGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTU5MSw2
ICs1OTEsNyBAQCBzdGF0aWMgdm9pZCBtdGRfY2hlY2tfb2Zfbm9kZShzdHJ1Y3QgbXRkX2luZm8g
Km10ZCkKPiAgICAgICAgICAgICAgICAgaWYgKHBsZW4gPT0gbXRkX25hbWVfbGVuICYmCj4gICAg
ICAgICAgICAgICAgICAgICAhc3RybmNtcChtdGQtPm5hbWUsIHBuYW1lICsgb2Zmc2V0LCBwbGVu
KSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIG10ZF9zZXRfb2Zfbm9kZShtdGQsIG10ZF9k
bik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQobXRkX2RuKTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
fQo+IC0tCj4gMi4zNS4zCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiDmnKzpgq7ku7blj4rlhbbpmYTku7blhoXlrrnlj6/og73lkKvmnInmnLrlr4blkowv5oiW6ZqQ
56eB5L+h5oGv77yM5LuF5L6b5oyH5a6a5Liq5Lq65oiW5py65p6E5L2/55So44CC6Iul5oKo6Z2e
5Y+R5Lu25Lq65oyH5a6a5pS25Lu25Lq65oiW5YW25Luj55CG5Lq677yM6K+35Yu/5L2/55So44CB
5Lyg5pKt44CB5aSN5Yi25oiW5a2Y5YKo5q2k6YKu5Lu25LmL5Lu75L2V5YaF5a655oiW5YW26ZmE
5Lu244CC5aaC5oKo6K+v5pS25pys6YKu5Lu277yM6K+35Y2z5Lul5Zue5aSN5oiW55S16K+d5pa5
5byP6YCa55+l5Y+R5Lu25Lq677yM5bm25bCG5Y6f5aeL6YKu5Lu244CB6ZmE5Lu25Y+K5YW25omA
5pyJ5aSN5pys5Yig6Zmk44CC6LCi6LCi44CCCj4gVGhlIGNvbnRlbnRzIG9mIHRoaXMgbWVzc2Fn
ZSBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBhbmQvb3IgcHJp
dmlsZWdlZCBpbmZvcm1hdGlvbiBhbmQgYXJlIGludGVuZGVkIGV4Y2x1c2l2ZWx5IGZvciB0aGUg
YWRkcmVzc2VlKHMpLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRo
aXMgbWVzc2FnZSBvciB0aGVpciBhZ2VudCwgcGxlYXNlIG5vdGUgdGhhdCBhbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCBjb3B5aW5nLCBvciBzdG9yYWdlIG9mIHRoaXMgbWVzc2FnZSBvciBpdHMgYXR0
YWNobWVudHMgaXMgbm90IGFsbG93ZWQuIElmIHlvdSByZWNlaXZlIHRoaXMgbWVzc2FnZSBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IHRoZSBtZXNzYWdlIG9yIHBo
b25lIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlLCBhbnkgYXR0YWNobWVudHMgYW5kIGFueSBjb3Bp
ZXMgaW1tZWRpYXRlbHkuCj4gVGhhbmsgeW91CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
