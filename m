Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8023C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTxPZAPHyWEJVEyyggVvm7JySNKcgObhCvbUphCy5N8=; b=zeEtxW0Dh1+4uh
	q77bhIrg9k0PS3O3bPS4PY4/pDSYHEdADjAQEfn/t8Wg8hRBDabbyfiCwLQAPMBjeHx/qNCqKDCnJ
	i0lM0rThPla0f4nY86rJTRgKAvdSPQ2ucnhbgdkBXGO6YpEB1iHbmGyegxDWd/Z/01OWrLoReLbTw
	yHw/vTfHeBE3aJt8wv95YiT8ttPI38JpNUO/UPZwCRuJiD6KNs7Hngb8ufy1NFBBHHhGLXUij/Qv2
	tqjSGxts+sXztWa5NpwaKUlmf7gv9ME1C94stD9DgWIULtvnIveiYyG2DYC5Bf0a991DX7MOyoKQB
	7t+q24SgL4bLgDjr/hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkLo2-00A7Kg-BL; Fri, 29 Apr 2022 08:16:50 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkLny-00A7GF-Dx
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 08:16:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C3545200003;
 Fri, 29 Apr 2022 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651220200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcuqZnYHQxKLgoxggRWjAXqr7/fqSK47D92u/FiDLDg=;
 b=g+AcK2B7JRyT4bac/ldD8VgleEEN/BYQIdNdAilo+nIaIXIigb3ZmX3wru4D0e17Mt6UCW
 +dLVh9MjrRaYYszZzYaZiWs6F46AzGJnNvWjyglnJ8l7Z5LhwhgLiWFe32I+Xg1x/MZbcD
 4KFcv1PHiGJceFgFtUHdE1IC+3ZpiLgOHwSA+deFyxYQBNEtzJ/JWiibij+KK0GSi4jmGw
 Hk6we4H/dswxY2lqVJ7FeocacC2+PjK5BsRGG7T9rpa9EpOkbwJsSdvnjyvRBLqY9HtgXy
 +z/XmCjSeo81RFx26fwH6tYzx17URFAyLeaH3W/5NJ3fhyfLKZCOnLLb6ieGVQ==
Date: Fri, 29 Apr 2022 10:16:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard Andersson <rickaran@axis.com>
Cc: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <rickard314.andersson@gmail.com>
Subject: Re: [PATCH] MTD: NAND: Select timings for Kioxia TH58NVG3S0HBAI4
Message-ID: <20220429101638.14719910@xps13>
In-Reply-To: <20220429080549.29236-1-rickaran@axis.com>
References: <20220429080549.29236-1-rickaran@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_011646_841737_327E42FC 
X-CRM114-Status: GOOD (  16.18  )
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

SGkgUmlja2FyZCwKCnJpY2thcmFuQGF4aXMuY29tIHdyb3RlIG9uIEZyaSwgMjkgQXByIDIwMjIg
MTA6MDU6NDkgKzAyMDA6Cgo+IEZyb206IFJpY2thcmQgeCBBbmRlcnNzb24gPHJpY2thcmFuQGF4
aXMuY29tPgo+IAo+IEFkZCB0aW1pbmdzIGZvciBLaW94aWEvVG9zaGliYSBUSDU4TlZHM1MwSEJB
STQuIFRpbWluZ3MKPiBmb3IgdGhpcyBtZW1vcnkgbWF0Y2hlcyB0aGUgdGltaW5ncyBzZWxlY3Rl
ZCBmb3IKPiBUSDU4TlZHMlMzSEJBSTQuCj4gCj4gVGhpcyBwYXRjaCBpbmNyZWFzZXMgZXJhc2Vi
bG9jayB3cml0ZSBzcGVlZCBmcm9tIDUyNDggS2lCL3MKPiB0byA2ODY0IEtpQi9zIGFuZCBlcmFz
ZSBibG9jayByZWFkIHNwZWVkIGZyb20gODU0MiBLaUIvcwo+IHRvIDE4MzYwIEtpQi9zCj4gCj4g
VGVzdGVkIG9uIGkuTVg2U1guCgpQbGVhc2UgY2hhbmdlIHRoZSB0aXRsZSB0byBzb21ldGhpbmcg
bGlrZToKIm10ZDogcmF3bmFuZDoga2lveGlhOiBBZGQgc3VwcG9ydCBmb3IgVEg1OE5WRzNTMEhC
QUk0IgoKQW5kIHdlJ2xsIGJlIGdvb2QuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2thcmQgeCBB
bmRlcnNzb24gPHJpY2thcmFuQGF4aXMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2lkcy5jICAgICB8IDMgKysrCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfdG9z
aGliYS5jIHwgNiArKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
aWRzLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jCj4gaW5kZXggZDY0YWRiZDFj
ZTZiLi44OGMyNDQwYjQ3ZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9pZHMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKPiBAQCAtNjEs
NiArNjEsOSBAQCBzdHJ1Y3QgbmFuZF9mbGFzaF9kZXYgbmFuZF9mbGFzaF9pZHNbXSA9IHsKPiAg
CXsiVEg1OE5WRzJTM0hCQUk0IDRHIDMuM1YgOC1iaXQiLAo+ICAJCXsgLmlkID0gezB4OTgsIDB4
ZGMsIDB4OTEsIDB4MTUsIDB4NzZ9IH0sCj4gIAkJICBTWl8ySywgU1pfNTEyLCBTWl8xMjhLLCAw
LCA1LCAxMjgsIE5BTkRfRUNDX0lORk8oOCwgU1pfNTEyKSB9LAo+ICsJeyJUSDU4TlZHM1MwSEJB
STQgOEcgMy4zViA4LWJpdCIsCj4gKwkJeyAuaWQgPSB7MHg5OCwgMHhkMywgMHg5MSwgMHgyNiwg
MHg3Nn0gfSwKPiArCQkgIFNaXzRLLCBTWl8xSywgU1pfMjU2SywgMCwgNSwgMjU2LCBOQU5EX0VD
Q19JTkZPKDgsIFNaXzUxMil9LAo+ICAKPiAgCUxFR0FDWV9JRF9OQU5EKCJOQU5EIDRNaUIgNVYg
OC1iaXQiLCAgIDB4NkIsIDQsIFNaXzhLLCBTUF9PUFRJT05TKSwKPiAgCUxFR0FDWV9JRF9OQU5E
KCJOQU5EIDRNaUIgMywzViA4LWJpdCIsIDB4RTMsIDQsIFNaXzhLLCBTUF9PUFRJT05TKSwKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF90b3NoaWJhLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX3Rvc2hpYmEuYwo+IGluZGV4IGNmNGYzNzk1OTQyMS4uZDNkMzRk
NzE5MjFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfdG9zaGliYS5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF90b3NoaWJhLmMKPiBAQCAtMjg3LDgg
KzI4NywxMCBAQCBzdGF0aWMgaW50IHRvc2hpYmFfbmFuZF9pbml0KHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXApCj4gIAlpZiAoIXN0cm5jbXAoIlRDNThOVkcwUzNFIiwgY2hpcC0+cGFyYW1ldGVycy5t
b2RlbCwKPiAgCQkgICAgIHNpemVvZigiVEM1OE5WRzBTM0UiKSAtIDEpKQo+ICAJCXRjNThudmcw
czNlX2luaXQoY2hpcCk7Cj4gLQlpZiAoIXN0cm5jbXAoIlRINThOVkcyUzNIQkFJNCIsIGNoaXAt
PnBhcmFtZXRlcnMubW9kZWwsCj4gLQkJICAgICBzaXplb2YoIlRINThOVkcyUzNIQkFJNCIpIC0g
MSkpCj4gKwlpZiAoKCFzdHJuY21wKCJUSDU4TlZHMlMzSEJBSTQiLCBjaGlwLT5wYXJhbWV0ZXJz
Lm1vZGVsLAo+ICsJCSAgICAgc2l6ZW9mKCJUSDU4TlZHMlMzSEJBSTQiKSAtIDEpKSB8fAo+ICsJ
ICAgICghc3RybmNtcCgiVEg1OE5WRzNTMEhCQUk0IiwgY2hpcC0+cGFyYW1ldGVycy5tb2RlbCwK
PiArCQkgICAgIHNpemVvZigiVEg1OE5WRzNTMEhCQUk0IikgLSAxKSkpCj4gIAkJdGg1OG52ZzJz
M2hiYWk0X2luaXQoY2hpcCk7Cj4gIAo+ICAJcmV0dXJuIDA7CgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
