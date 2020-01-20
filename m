Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA64C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 10:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EEA12073D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 10:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fKLXfxYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EEA12073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZVO6x5FKV48vvqNkTY6w+3ckpZ4Qwe9ESuxjpiubaA=; b=fKLXfxYhmbiChp
	rJbAaoc4xn3XkjL010S22p0vqAiXGesSxSu0f2Dc9rdfNCc1JrwzUpNilWZJ4EJ5l5UNup+6YpT4l
	/dr1cl6eVH82ZSEO9GnNw5OwLzQ10BhhJK+0JuUiUUrJlyHPlSYgMGHh7FQjTUDYJW8BUoV5aXRF4
	m0rBnD9qPLAhODtdOEGOpLH09KEChYqzL28j1v9+XSJXMLz7KVd1vka/joDM+GSEm8tO+UWkmiU5c
	zbbq+qsATJMPI8dPiASHRS1GBhI+pKz7XTd++4aJXT9CCZRcl+AuY4VlEyLWIgZPb5gRIi37QRWE8
	vWx3LqSQmzVAuOMZylZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itUCa-0003nm-1d; Mon, 20 Jan 2020 10:22:36 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itUCT-0003mo-0g
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 10:22:35 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 27B3EFF808;
 Mon, 20 Jan 2020 10:22:21 +0000 (UTC)
Date: Mon, 20 Jan 2020 11:22:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 4/4] mtd: spinand: Add new Micron SPI NAND devices with
 multiple dies
Message-ID: <20200120112219.36bae01e@xps13>
In-Reply-To: <20200119145432.10405-5-sshivamurthy@micron.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
 <20200119145432.10405-5-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_022229_337831_45009E91 
X-CRM114-Status: GOOD (  15.25  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBTdW4sIDE5IEph
biAyMDIwIDE1OjU0OjMyICswMTAwOgoKPiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAKPiBBZGQgZGV2aWNlIHRhYmxlIGZvciBuZXcgTWljcm9u
IFNQSSBOQU5EIGRldmljZXMsIHdoaWNoIGhhdmUgbXVsdGlwbGUKPiBkaWVzLiBXaGlsZSBhdCBp
dCwgYWRkIHN1cHBvcnQgdG8gc2VsZWN0IHRoZSBkaWUuCgpTYW1lIGNvbW1lbnQgYXMgaW4gMy80
LgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlA
bWljcm9uLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgfCA1MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTAg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNy
b24uYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gaW5kZXggNDVmYzM3YzU4Zjhh
Li4wM2I0ODY4NDMyMTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9u
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+IEBAIC0xOCw2ICsxOCw4
IEBACj4gICNkZWZpbmUgTUlDUk9OX1NUQVRVU19FQ0NfNFRPNl9CSVRGTElQUwkoMyA8PCA0KQo+
ICAjZGVmaW5lIE1JQ1JPTl9TVEFUVVNfRUNDXzdUTzhfQklURkxJUFMJKDUgPDwgNCkKPiAgCj4g
KyNkZWZpbmUgTUlDUk9OX0RJRV9TRUxFQ1RJT05fQklUCTYKPiArCj4gIHN0YXRpYyBTUElOQU5E
X09QX1ZBUklBTlRTKHJlYWRfY2FjaGVfdmFyaWFudHMsCj4gIAkJU1BJTkFORF9QQUdFX1JFQURf
RlJPTV9DQUNIRV9RVUFESU9fT1AoMCwgMiwgTlVMTCwgMCksCj4gIAkJU1BJTkFORF9QQUdFX1JF
QURfRlJPTV9DQUNIRV9YNF9PUCgwLCAxLCBOVUxMLCAwKSwKPiBAQCAtNjQsNiArNjYsMjEgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0X29wcyBtaWNyb25fOF9vb2JsYXlvdXQg
PSB7Cj4gIAkuZnJlZSA9IG1pY3Jvbl84X29vYmxheW91dF9mcmVlLAo+ICB9Owo+ICAKPiArc3Rh
dGljIGludCBtaWNyb25fc2VsZWN0X3RhcmdldChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5h
bmQsCj4gKwkJCQl1bnNpZ25lZCBpbnQgdGFyZ2V0KQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9v
cCBvcCA9IFNQSU5BTkRfU0VUX0ZFQVRVUkVfT1AoMHhkMCwKPiArCQkJCQkJICAgICAgc3BpbmFu
ZC0+c2NyYXRjaGJ1Zik7Cj4gKwo+ICsJLyoKPiArCSAqIEFzIHBlciBkYXRhc2hlZXQsIGRpZSBz
ZWxlY3Rpb24gaXMgZG9uZSBieSB0aGUgNnRoIGJpdCBvZiBEaWUKPiArCSAqIFNlbGVjdCBSZWdp
c3RlciAoQWRkcmVzcyAweEQwKS4KPiArCSAqLwoKSSB3b3VsZCBwdXQgdGhpcyBjb21tZW50IGNs
b3NlIHRvIHRoZSBtYWNybyBkZWZpbml0aW9uLgoKPiArCSpzcGluYW5kLT5zY3JhdGNoYnVmID0g
dGFyZ2V0IDw8IE1JQ1JPTl9ESUVfU0VMRUNUSU9OX0JJVDsKCkVpdGhlciB0YXJnZXQgaXMgb3Ig
b3IgMSBhbmQgeW91IGNhbiB1c2UgdGhlIEJJVCBtYWNybywgb3IgeW91IHN1cHBvc2UKaXQgY2Fu
IGdvIGhpZ2hlciBhbmQgdGhlIF9CSVQgc3VmZml4IGRvZXMgbm90IGZpdC4gX1NISUZUIHdvdWxk
IHdvcmsKYW5kIGNyZWF0aW5nIGEgbWFjcm8gZGlyZWN0bHkgd291bGQgYmUgZXZlbiBiZXR0ZXIu
Cgo+ICsKPiArCXJldHVybiBzcGlfbWVtX2V4ZWNfb3Aoc3BpbmFuZC0+c3BpbWVtLCAmb3ApOwo+
ICt9Cj4gKwoKV2hlcmUgaXMgdGhpcyBmdW5jdGlvbiB1c2VkPwoKPiAgc3RhdGljIGludCBtaWNy
b25fOF9lY2NfZ2V0X3N0YXR1cyhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gIAkJ
CQkgICB1OCBzdGF0dXMpCj4gIHsKPiBAQCAtMTMxLDYgKzE0OCwxNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHNwaW5hbmRfaW5mbyBtaWNyb25fc3BpbmFuZF90YWJsZVtdID0gewo+ICAJCSAgICAg
MCwKPiAgCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbWljcm9uXzhfb29ibGF5b3V0LAo+ICAJCQkJ
ICAgICBtaWNyb25fOF9lY2NfZ2V0X3N0YXR1cykpLAo+ICsJLyogTTc5QSA0R2IgMy4zViAqLwo+
ICsJU1BJTkFORF9JTkZPKCJNVDI5RjRHMDFBREFHRCIsIDB4MzYsCj4gKwkJICAgICBOQU5EX01F
TU9SRygxLCAyMDQ4LCAxMjgsIDY0LCAyMDQ4LCA4MCwgMiwgMSwgMiksCj4gKwkJICAgICBOQU5E
X0VDQ1JFUSg4LCA1MTIpLAo+ICsJCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFk
X2NhY2hlX3ZhcmlhbnRzLAo+ICsJCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKPiAr
CQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiArCQkgICAgIDAsCj4gKwkJICAg
ICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKPiArCQkJCSAgICAgbWljcm9u
XzhfZWNjX2dldF9zdGF0dXMpLAo+ICsJCSAgICAgU1BJTkFORF9TRUxFQ1RfVEFSR0VUKG1pY3Jv
bl9zZWxlY3RfdGFyZ2V0KSksCj4gIAkvKiBNNzBBIDRHYiAzLjNWICovCj4gIAlTUElOQU5EX0lO
Rk8oIk1UMjlGNEcwMUFCQUZEIiwgMHgzNCwKPiAgCQkgICAgIE5BTkRfTUVNT1JHKDEsIDQwOTYs
IDI1NiwgNjQsIDIwNDgsIDQwLCAxLCAxLCAxKSwKPiBAQCAtMTUxLDYgKzE3OSwyOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyBtaWNyb25fc3BpbmFuZF90YWJsZVtdID0gewo+
ICAJCSAgICAgMCwKPiAgCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbWljcm9uXzhfb29ibGF5b3V0
LAo+ICAJCQkJICAgICBtaWNyb25fOF9lY2NfZ2V0X3N0YXR1cykpLAo+ICsJLyogTTcwQSA4R2Ig
My4zViAqLwo+ICsJU1BJTkFORF9JTkZPKCJNVDI5RjhHMDFBREFGRCIsIDB4NDYsCj4gKwkJICAg
ICBOQU5EX01FTU9SRygxLCA0MDk2LCAyNTYsIDY0LCAyMDQ4LCA0MCwgMSwgMSwgMiksCj4gKwkJ
ICAgICBOQU5EX0VDQ1JFUSg4LCA1MTIpLAo+ICsJCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklB
TlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ICsJCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJp
YW50cywKPiArCQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiArCQkgICAgIDAs
Cj4gKwkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKPiArCQkJCSAg
ICAgbWljcm9uXzhfZWNjX2dldF9zdGF0dXMpLAo+ICsJCSAgICAgU1BJTkFORF9TRUxFQ1RfVEFS
R0VUKG1pY3Jvbl9zZWxlY3RfdGFyZ2V0KSksCj4gKwkvKiBNNzBBIDhHYiAxLjhWICovCj4gKwlT
UElOQU5EX0lORk8oIk1UMjlGOEcwMUFEQkZEIiwgMHg0NywKPiArCQkgICAgIE5BTkRfTUVNT1JH
KDEsIDQwOTYsIDI1NiwgNjQsIDIwNDgsIDQwLCAxLCAxLCAyKSwKPiArCQkgICAgIE5BTkRfRUND
UkVRKDgsIDUxMiksCj4gKwkJICAgICBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRfY2Fj
aGVfdmFyaWFudHMsCj4gKwkJCQkJICAgICAgJndyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+ICsJCQkJ
CSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAo+ICsJCSAgICAgMCwKPiArCQkgICAgIFNQ
SU5BTkRfRUNDSU5GTygmbWljcm9uXzhfb29ibGF5b3V0LAo+ICsJCQkJICAgICBtaWNyb25fOF9l
Y2NfZ2V0X3N0YXR1cyksCj4gKwkJICAgICBTUElOQU5EX1NFTEVDVF9UQVJHRVQobWljcm9uX3Nl
bGVjdF90YXJnZXQpKSwKPiAgfTsKPiAgCj4gIHN0YXRpYyBpbnQgbWljcm9uX3NwaW5hbmRfZGV0
ZWN0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKCgoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
