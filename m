Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FA1CCFA00
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Nov 2025 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RCOw8QhkB2Bu2CxBFx+4V54guWmCBRRJGqpRN5gLUA=; b=d304kv/eP423LB
	n7YdFeb7S3W2APr/CWQyo2efYzmbGUdE+Z1eOH6NEClS1bX0kke7QVriFR7Hnh1zRVj19Np8WuWwZ
	3pf3KoxlFhPzOq3moxV1S6s02kEA5T0iP709ql9hX+qC0xyiksObhe38YNS5xr7XkevRuJf5A2Hxw
	Ob1g/0yG0vL1cl4dAaaKcPvfC8mJ78Y9hXJugCVmyVdqpC4m/QkBcSI/RZEJdXV6rdVT3cN/lMAOK
	i8waBCjyYgTeHc9ycqKydk1b+nmiD3D2BgNdlUBUiP3VSNVe5/JivV5XTwgHGIyX6t+1bEhLNqYMZ
	JrQfBsAjnTkWWNiHLgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCOZ-0000000BQGu-2TxZ;
	Tue, 04 Nov 2025 08:28:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCOV-0000000BQFc-2RXl
	for linux-mtd@lists.infradead.org;
	Tue, 04 Nov 2025 08:28:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 951B41A184C;
	Tue,  4 Nov 2025 08:27:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6937E606EF;
	Tue,  4 Nov 2025 08:27:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3101E10B50096;
	Tue,  4 Nov 2025 09:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762244875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+TfhXHUSw3+oJhe7TatHLLAgu2372no2ChD3eKy/l5s=;
	b=EBXHeENpL10W0F4oCmAVTOvzdSsmtfVjnvaAroBm8VttjnVHcjXb/WGl/w75922sMk7AQt
	lHtJfqbXyq9DJ0SqVQhmvCy3LcbEDJcnkCbMZ9nmUZciFDquW9SUtVP1zEsveKzE68tpt7
	wDrrbjJnR1ECFRllShwir2ZobUoR6HwPU9EASh+bjRRC6DHDyWD6BzcaHbLKZNTPsvXuKb
	NLUN5TGAlU+x3zDcd8VH7m9UgcMHPkzolvkaEuytnCzR+H9VYKgxTOUEut6xc4LAQSt1k0
	DOPPzhQ7fW0hEAe9r6Mkvn1yDotU0jYcQTKY/yw0IJ7gdrg06oisVUtR/zqJdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Haotian Zhang <vulab@iscas.ac.cn>,  richard@nod.at,  vigneshr@ti.com,
  piotr.wojtaszczyk@timesys.com,  dmitry.torokhov@gmail.com,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on
 probe error and remove
In-Reply-To: <57f7989d-6f05-4b1b-a31b-4b1dca308ffb@mleia.com> (Vladimir
	Zapolskiy's message of "Mon, 3 Nov 2025 18:21:47 +0200")
References: <20251028094747.1089-1-vulab@iscas.ac.cn>
	<57f7989d-6f05-4b1b-a31b-4b1dca308ffb@mleia.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 04 Nov 2025 09:27:51 +0100
Message-ID: <871pmeb3so.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_002759_889182_163888BE 
X-CRM114-Status: GOOD (  16.06  )
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

SGVsbG8sCgpPbiAwMy8xMS8yMDI1IGF0IDE4OjIxOjQ3ICswMiwgVmxhZGltaXIgWmFwb2xza2l5
IDx2ekBtbGVpYS5jb20+IHdyb3RlOgoKPiBPbiAxMC8yOC8yNSAxMTo0NywgSGFvdGlhbiBaaGFu
ZyB3cm90ZToKPj4gVGhlIGRyaXZlciBjYWxscyBncGlvZF9nZXRfb3B0aW9uYWwoKSBpbiB0aGUg
cHJvYmUgZnVuY3Rpb24gYnV0Cj4+IG5ldmVyIGNhbGxzIGdwaW9kX3B1dCgpIGluIHRoZSByZW1v
dmUgZnVuY3Rpb24gb3IgaW4gdGhlIHByb2JlCj4+IGVycm9yIHBhdGguIFRoaXMgbGVhZHMgdG8g
YSBHUElPIGRlc2NyaXB0b3IgcmVzb3VyY2UgbGVhay4KPj4gVGhlIGxwYzMyeHhfbWxjLmMgZHJp
dmVyIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBoYW5kbGVzIHRoaXMKPj4gY29ycmVjdGx5IGJ5IGNh
bGxpbmcgZ3Bpb2RfcHV0KCkgb24gYm90aCBwYXRocy4KPj4gQWRkIGdwaW9kX3B1dCgpIGluIHRo
ZSByZW1vdmUgZnVuY3Rpb24gYW5kIGluIHRoZSBwcm9iZSBlcnJvciBwYXRoCj4+IHRvIGZpeCB0
aGUgcmVzb3VyY2UgbGVhay4KPj4gRml4ZXM6IDZiOTIzZGIyODY3YyAoIm10ZDogcmF3bmFuZDog
bHBjMzJ4eF9zbGM6IHN3aXRjaCB0byB1c2luZyBncGlvZAo+PiBBUEkiKQo+PiBTaWduZWQtb2Zm
LWJ5OiBIYW90aWFuIFpoYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KPgo+IFRoZSBwcm9ibGVtIGlz
IHdlbGwgaWRlbnRpZmllZCwgdGhhbmsgeW91IGZvciB0aGUgZml4Lgo+Cj4+IC0tLQo+PiAgIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfc2xjLmMgfCAyICsrCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bHBjMzJ4eF9zbGMuYwo+PiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfc2xjLmMKPj4g
aW5kZXggYjU0ZDc2NTQ3ZmZiLi5mZWEzNzA1YTIxMzggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2xwYzMyeHhfc2xjLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bHBjMzJ4eF9zbGMuYwo+PiBAQCAtOTM3LDYgKzkzNyw3IEBAIHN0YXRpYyBpbnQgbHBjMzJ4eF9u
YW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgCWRtYV9yZWxlYXNl
X2NoYW5uZWwoaG9zdC0+ZG1hX2NoYW4pOwo+PiAgIGVuYWJsZV93cDoKPj4gICAJbHBjMzJ4eF93
cF9lbmFibGUoaG9zdCk7Cj4+ICsJZ3Bpb2RfcHV0KGhvc3QtPndwX2dwaW8pOwo+PiAgICAgCXJl
dHVybiByZXM7Cj4+ICAgfQo+PiBAQCAtOTYyLDYgKzk2Myw3IEBAIHN0YXRpYyB2b2lkIGxwYzMy
eHhfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAJd3JpdGVs
KHRtcCwgU0xDX0NUUkwoaG9zdC0+aW9fYmFzZSkpOwo+PiAgICAgCWxwYzMyeHhfd3BfZW5hYmxl
KGhvc3QpOwo+PiArCWdwaW9kX3B1dChob3N0LT53cF9ncGlvKTsKPj4gICB9Cj4+ICAgICBzdGF0
aWMgaW50IGxwYzMyeHhfbmFuZF9yZXN1bWUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
Pgo+IFRoZSBmaXggY2FuIGJlIGdyZWF0bHkgaW1wcm92ZWQgdGhvdWdoLCBJIGtpbmRseSBhc2sg
eW91IHRvIHNlbmQgdjIgYnkgc3dpdGNoaW5nCj4gZnJvbSBncGlvZF9nZXRfb3B0aW9uYWwoKSB0
byByZXNvdXJjZSBtYW5hZ2VkCj4gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoKS4KCkkndmUgYWxy
ZWFkeSBhcHBsaWVkIHRoaXMgZml4LCBob3dldmVyIEkgd2lsbCB3ZWxjb21lIGEgZm9sbG93LXVw
IHBhdGNoLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
