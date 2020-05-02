Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7F4C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 19:54:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA7E20731
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 19:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="grLaxID1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA7E20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qEyzz0CYtNJaxIMx6aBqKZq9EDbuM8JYzOEiW9Ef5I=; b=grLaxID1Gj3wCW
	hYudzvYhmBnsX0LPR8qRS3cjgWHkXf2Us687i1lqBR8Js1qMSmrVHcwCD/wKD7nBRy530nDvVy66M
	JrnSiVVjLhnGQkGB1egHf23+QvD2BSofpphtEm1vD8IHeR+KabJvLIrMZ2/eA6JrFU6ZV6WSH5PB7
	hgKLa/KXIF4ClM3CKSWP5mogtmgbXA7v/N31UuvF6YacWYet44B+CGTcon/oQhZu8TU3tZ365atXM
	PmlEOka+YjeqIK9Iulqw9FxPFrKRP7Fku0/a8H67rFf4xLtEztJGrRgfb4UozvFJ4dn8CA/M2iWdf
	cKX2eH+pk6ahtuFI2TlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUyDB-00024E-9O; Sat, 02 May 2020 19:54:09 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUyD7-00023N-Br
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 19:54:07 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D0A1160003;
 Sat,  2 May 2020 19:53:57 +0000 (UTC)
Date: Sat, 2 May 2020 21:53:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: fix calculating partition end address
Message-ID: <20200502215356.2ca6b5dc@xps13>
In-Reply-To: <129f9ab162b62408f0555f73793fc2f1@milecki.pl>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
 <20200309152221.28dc38ab@xps13>
 <e2873d10-2513-8d09-6601-cb542453e10f@milecki.pl>
 <20200309162223.15582d12@xps13> <20200502200401.7dfa5def@xps13>
 <129f9ab162b62408f0555f73793fc2f1@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_125405_677771_30DF839A 
X-CRM114-Status: GOOD (  24.08  )
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
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiB3cm90ZSBvbiBT
YXQsIDAyIE1heSAyMDIwIDIxOjM2OjI0CiswMjAwOgoKPiBPbiAyMDIwLTA1LTAyIDIwOjA0LCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4gd3JvdGUgb24gTW9uLCA5IE1hciAyMDIwCj4gPiAxNjoyMjoyMyArMDEwMDoKPiA+
ICAgCj4gPj4gSGkgUmFmYcWCLCAgCj4gPj4gPj4gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPiB3cm90ZSBvbiBNb24sIDkgTWFyIDIwMjAgMTY6MDg6MTIgIAo+ID4+ICswMTAwOiAg
Cj4gPj4gPj4gPiBPbiAwOS4wMy4yMDIwIDE1OjIyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4g
Pj4gPiA+IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4gd3JvdGUgb24gTW9uLCAw
OSBNYXIgMjAyMCAxNToxOToxMAo+ID4+ID4gPiArMDEwMDoKPiA+PiA+ID4gIAo+ID4+ID4gPj4g
T24gMjAyMC0wMy0wOSAxNTowNCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+ID4gPj4+IFJh
ZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAgOSBNYXIgMjAy
MCAwODo0NDo0NQo+ID4+ID4gPj4+ICswMTAwOiAgCj4gPj4gPiA+Pj4gICAgPj4+PiBGcm9tOiBS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+ICAKPiA+PiA+ID4+Pj4+PiBUaGlzIGZp
eGVzIGNoZWNrIGZvciBwYXJ0aXRpb25zIHRoYXQgZG9uJ3Qgc3RhcnQgYXQgYmVnaW5uaW5nIG9m
IHRoZWlyICAKPiA+PiA+ID4+Pj4gcGFyZW50cy4gTWlzc2luZyBwYXJ0aXRpb24ncyBvZmZzZXQg
aW4gZm9ybXVsYSBjb3VsZCByZXN1bHQgaW4gZm9yY2luZwo+ID4+ID4gPj4+PiByZWFkLW9ubHkg
aW5jb3JyZWN0bHkuICAKPiA+PiA+ID4+Pj4+PiBGaXhlczogNjc1MGY2MWExM2EwICgibXRkOiBp
bXByb3ZlIGNhbGN1bGF0aW5nIHBhcnRpdGlvbiBib3VuZGFyaWVzID4+IHdoZW4gY2hlY2tpbmcg
Zm9yIGFsaWdubWVudCIpICAKPiA+PiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4+ID4gPj4+PiAtLS0KPiA+PiA+ID4+Pj4gICBkcml2
ZXJzL210ZC9tdGRwYXJ0LmMgfCAyICstCj4gPj4gPiA+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pICAKPiA+PiA+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jICAKPiA+PiA+ID4+
Pj4gaW5kZXggNzMyOGMwNjZjNWJhLi5jNjgzYjQzMmNjNWUgMTAwNjQ0Cj4gPj4gPiA+Pj4+IC0t
LSBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4+ID4gPj4+PiArKysgYi9kcml2ZXJzL210ZC9t
dGRwYXJ0LmMKPiA+PiA+ID4+Pj4gQEAgLTUyNCw3ICs1MjQsNyBAQCBzdGF0aWMgc3RydWN0IG10
ZF9wYXJ0ICphbGxvY2F0ZV9wYXJ0aXRpb24oc3RydWN0ID4+IG10ZF9pbmZvICpwYXJlbnQsCj4g
Pj4gPiA+Pj4+ICAgCQkJcGFydC0+bmFtZSk7Cj4gPj4gPiA+Pj4+ICAgCX0gIAo+ID4+ID4gPj4+
Pj4+IC0JdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5tdGQuc2l6
ZTsgIAo+ID4+ID4gPj4+PiArCXRtcCA9IHBhcnRfYWJzb2x1dGVfb2Zmc2V0KHBhcmVudCkgKyBz
bGF2ZS0+b2Zmc2V0ICsgPj4gc2xhdmUtPm10ZC5zaXplOyAgCj4gPj4gPiA+Pj4KPiA+PiA+ID4+
PiBJIHRoaW5rIHlvdSBhcmUgZG9pbmcgdGhlIGNoYW5nZSBhdCB0aGUgd3JvbmcgcGxhY2UsIGlm
IHlvdSB3YW50IHRvCj4gPj4gPiA+Pj4gY2hlY2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3RhcnRz
KiB5b3Ugc2hvdWxkIGRvIGl0IGEgZmV3IGxpbmVzIGFib3ZlLgo+ID4+ID4gPj4+IEJ1dCBJIHRo
aW5rIHRoZSBjaGVjayBzaG91bGQgYmUgaGVyZSBhcyB3ZWxsLCBwcm9iYWJseS4gIAo+ID4+ID4g
Pj4KPiA+PiA+ID4+IFRoZSBjaGVjayB3aGVyZSB0aGUgcGFydGl0aW9uICpzdGFydHMqIGlzIE9L
IGFuZCBJIGRvbid0IG1lYW4gdG8gY2hhbmdlCj4gPj4gPiA+PiBpdC4gVGhlIGJ1ZyBpcyBhYm91
dCBjYWxjdWxhdGluZyBhYnNvbHV0ZSAqZW5kKiBhZGRyZXNzIG9mIHBhcnRpdGlvbi4gIAo+ID4+
ID4gPgo+ID4+ID4gPiBDYW4geW91IGRldGFpbCBhIGxpdHRsZSBiaXQgdGhlbj8gQmVjYXVzZSBJ
IGRvbid0IHNlZSB0aGUgaXNzdWUgYW55bW9yZQo+ID4+ID4gPiBldmVuIHRob3VnaCBJIGFtIGNv
bnZpbmNlZCBzb21ldGhpbmcgaXMgd3JvbmcgaGVyZSA6KSAgCj4gPj4gPgo+ID4+ID4gUGxlYXNl
IGNvbnNpZGVyIGZvbGxvd2luZyBwYXJ0aXRpb25zIGxheW91dDoKPiA+PiA+ICogYmNtNDd4eHNm
bGFzaAo+ID4+ID4g4pSc4pSAIGJvb3QJCTB4MDAwMDAwMDAwMDAwLTB4MDAwMDAwMDQwMDAwCj4g
Pj4gPiDilJTilKwgZmlybXdhcmUJMHgwMDAwMDAwNDAwMDAtMHgwMDAwMDEwMDAwMDAKPiA+PiA+
ICAg4pSc4pSAIGxpbnV4CTB4MDAwMDAwMDAwMDFjLTB4MDAwMDAwMThmODAwCj4gPj4gPiAgIOKU
lOKUrCBjb250YWluZXIJMHgwMDAwMDAxOGY4MDAtMHgwMDAwMDBmYzAwMDAKPiA+PiA+ICAgIOKU
nOKUgCBmb28JMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDA2MzA4MDAKPiA+PiA+ICAgIOKUlOKUgCBi
YXIJMHgwMDAwMDA2MzA4MDAtMHgwMDAwMDBlMzA4MDAgKHNpemU6IDB4ODAwMDAwKQo+ID4+ID4K
PiA+PiA+Cj4gPj4gPiBFeGlzdGluZyAoY29ycmVjdCkgKnN0YXJ0KiBjYWxjdWxhdGlvbjoKPiA+
PiA+IGJhciBzdGFydDogMCArIDB4MDQwMDAwICsgMHgxOGY4MDAgKyAweDYzMDgwMCA9IDB4ODAw
MDAwCj4gPj4gPgo+ID4+ID4gRXhpc3RpbmcgKHdyb25nKSBlbmQgY2FsY3VsYXRpb246Cj4gPj4g
PiBiYXIgZW5kOiAwICsgMHgwNDAwMDAgKyAweDE4ZjgwMCArIDB4ODAwMDAwID0gMHg5Y2Y4MDAK
PiA+PiA+Cj4gPj4gPiBGaXhlZCAoY29ycmVjdCkgZW5kIGNhbGN1bGF0aW9uOgo+ID4+ID4gYmFy
IGVuZDogMCArIDB4MDQwMDAwICsgMHgxOGY4MDAgKyAweDYzMDgwMCArIDB4ODAwMDAwID0gMHgx
MDAwMDAwICAKPiA+PiA+PiBPayBJIGdldCBpdCEgSSB0aGluayBtZW50aW9uaW5nICJwYXJ0aXRp
b25zIHRoYXQgZG9uJ3Qgc3RhcnQgYXQgIAo+ID4+IGJlZ2lubmluZyBvZiB0aGVpciBwYXJlbnRz
IiwgZGVzcGl0ZSBiZWluZyB0cnVlLCB3YXMgbWlzbGVhZGluZyB0byBtZQo+ID4+IGFzIEkgdW5k
ZXJzdG9vZCAibGVhdmluZyBleHRyYSBzcGFjZSB3aXRoIHRoZSBzdGFydCBvZiB0aGVpciBwYXJl
bnQiLiAgCj4gPj4gPj4gSSBzdXBwb3NlIHlvdSBhbHNvIGhhdmUgdGhlIGlzc3VlIHdpdGggImNv
bnRhaW5lciIgdG9vPwo+ID4+ID4+IEFueXdheSwgSSB0aGluayB0aGUgZml4IGlzIGZpbmUuIEEg
YmV0dGVyIGZvcm11bGF0aW9uIGZvciB0aGUgY29tbWl0ICAKPiA+PiBsb2cgd291bGQgYmUgd2Vs
Y29tZSA6KSAobWF5YmUgYWRkaW5nIHRoaXMgZXhhbXBsZSBpcyBhIGdvb2QgaWRlYSEpICAKPiA+
IAo+ID4gSSBkb24ndCByZW1lbWJlciBoYXZpbmcgYXBwbGllZCB0aGlzIGZpeCB5ZXQsIHdvdWxk
IHlvdSBtaW5kIHJlc2VuZGluZwo+ID4gdGhpcyBwYXRjaCB3aXRoIGFuIGVuaGFuY2VkIGNvbW1p
dCBsb2cgKHlvdXIgZXhhbXBsZSB3YXMgYSBnb29kIG9uZSBJCj4gPiB0aGluaykuICAKPiAKPiBJ
dCdzIG5vdCBuZWVkZWQgYW55bW9yZS4gUGxlYXNlIGNoZWNrIGRpc2N1c3Npb24gd2UgZ290Ogo+
IAo+IC0tLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0tLS0KPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBtdGQ6IGZpeCBjYWxjdWxhdGluZyBwYXJ0aXRpb24gZW5kIGFkZHJlc3MKPiBEYXRlOiAy
MDIwLTAzLTI0IDIzOjExCj4gCj4gPiA+IEkgd291bGQgbGlrZSB0byBhcHBseSB5b3VyIGZpeCB0
aGlzIHdlZWssIGRvIHlvdSB0aGluayB5b3UgY2FuIHJlYmFzZQo+ID4gPiBhbmQgcmVzZW5kIHNv
b24/ICAKPiA+IAo+ID4gSXQncyBub3QgbmVlZGVkIGFueW1vcmUgYXMgeW91IGZpeGVkIHRoaXMg
YnVnIGluIHlvdXIgY29tbWl0IHJld29ya2luZwo+ID4gcGFydGl0aW9ucy4gIAo+IAo+IEdyZWF0
IQoKWWVhaCBzb3JyeSBhYm91dCB0aGF0LCBJIGdvdCBjb25mdXNlZCB3aGlsZSBsaXN0aW5nIHJl
bWFpbmluZyBwYXRjaGVzIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
