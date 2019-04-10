Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3560AC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 16:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054EB2082E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 16:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CHAD+K5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054EB2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/K7aJDdv8OP6fUtxcX5Q/4gAnn43LPu+XRnJPS8rq20=; b=CHAD+K5R3Gds7w
	DxWdEbJPV+/gbNDH35ilryK56bvZyOE527suEiOp5hiD230/6kji2hb01qFJMhDTBVRpTJrPjEN7R
	dMVZ4ucKzqWRJoU6MCpJmDqCWlbE2Hret3fob1dcaNo0bcNElsgJgpOwnSHv1suSr33Eat1WkyATh
	riw0llKrSSdS442ImcbIXfdVQiroxKc24UYBXebJZi2uz65gevRq1QdAUiY2CHd4tsLvLWugzlxKr
	v3AdNqFZWlHB7WzNc3+rygMHBRqsavNmsLD1CIr/DgktF8hqxThoTuvFjlL8Npio8UMpzMsSrqq7C
	ewzqblUxdrgQhzkaKQOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEFwC-0000Re-EY; Wed, 10 Apr 2019 16:19:00 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEFw8-0000R1-Ht
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 16:18:58 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 06398100008;
 Wed, 10 Apr 2019 16:18:45 +0000 (UTC)
Date: Wed, 10 Apr 2019 18:18:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH] mtd: nand: Fix build error while
 CONFIG_MTD_NAND_ECC_SW_BCH is set to module
Message-ID: <20190410181843.489a4e33@xps13>
In-Reply-To: <41165c39-da0c-0f15-87f9-4fb588b77dcc@huawei.com>
References: <20190410130747.35692-1-yuehaibing@huawei.com>
 <20190410153920.68267a1a@collabora.com>
 <20190410155856.655122c8@collabora.com>
 <8b020124-4008-6081-c04c-eaefb7875878@huawei.com>
 <20190410162927.17ea678b@collabora.com>
 <41165c39-da0c-0f15-87f9-4fb588b77dcc@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_091856_896194_7A74E6CC 
X-CRM114-Status: GOOD (  18.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, paul.burton@mips.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWXVlSGFpYmluZywKCll1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3JvdGUg
b24gV2VkLCAxMCBBcHIgMjAxOSAyMzowMzoyNAorMDgwMDoKCj4gT24gMjAxOS80LzEwIDIyOjI5
LCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBPbiBXZWQsIDEwIEFwciAyMDE5IDIyOjIyOjE2
ICswODAwCj4gPiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4g
ICAKPiA+PiBPbiAyMDE5LzQvMTAgMjE6NTgsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4+
PiBPbiBXZWQsIDEwIEFwciAyMDE5IDE1OjM5OjI4ICswMjAwCj4gPj4+IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4+PiAgICAgCj4gPj4+
PiBPbiBXZWQsIDEwIEFwciAyMDE5IDIxOjA3OjQ3ICswODAwCj4gPj4+PiBZdWUgSGFpYmluZyA8
eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZToKPiA+Pj4+ICAgIAo+ID4+Pj4+IEZyb206IFl1
ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiA+Pj4+Pgo+ID4+Pj4+IEZpeCBnY2Mg
YnVpbGQgZXJyb3Igd2hpbGUgQ09ORklHX01URF9OQU5EX0VDQ19TV19CQ0gKPiA+Pj4+PiBpcyBz
ZXQgdG8gbW9kdWxlOgo+ID4+Pj4+Cj4gPj4+Pj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YXNlLm86IEluIGZ1bmN0aW9uIGBuYW5kX2NsZWFudXAnOgo+ID4+Pj4+ICgudGV4dCsweGVmNik6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYG5hbmRfYmNoX2ZyZWUnCj4gPj4+Pj4gZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9iYXNlLm86IEluIGZ1bmN0aW9uIGBuYW5kX3NjYW5fdGFpbCc6Cj4g
Pj4+Pj4gbmFuZF9iYXNlLmM6KC50ZXh0KzB4YTEwMSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YG5hbmRfYmNoX2NhbGN1bGF0ZV9lY2MnCj4gPj4+Pj4gbmFuZF9iYXNlLmM6KC50ZXh0KzB4YTEy
MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYG5hbmRfYmNoX2NvcnJlY3RfZGF0YScKPiA+Pj4+
PiBuYW5kX2Jhc2UuYzooLnRleHQrMHhhMjY5KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbmFu
ZF9iY2hfaW5pdCcKPiA+Pj4+Pgo+ID4+Pj4+IENPTkZJR19NVERfTkFORF9FQ0NfU1dfQkNIIHNo
b3VsZCBub3QgYmUgc2V0IHRvIE0sCj4gPj4+Pj4gYmVjYXVzZSBNVERfUkFXX05BTkQgbmVlZCBp
dCB3aGlsZSBsaW5rZWQuCj4gPj4+Pj4KPiA+Pj4+PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8
aHVsa2NpQGh1YXdlaS5jb20+Cj4gPj4+Pj4gRml4ZXM6IDE5M2JkNDAwMjY0NCAoIm10ZDogbmFu
ZDogYWRkIHNvZnR3YXJlIEJDSCBFQ0Mgc3VwcG9ydCIgICAgICAKPiA+Pj4+Cj4gPj4+PiBOb3Bl
LCBpdCdzIG5vdCB0aGlzIG9uZSB0aGF0IGludHJvZHVjZWQgdGhlIHJlZ3Jlc3Npb24uCj4gPj4+
Pgo+ID4+Pj4KPiA+Pj4+ICAgIAo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiA+Pj4+PiAtLS0KPiA+Pj4+PiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvS2NvbmZpZyB8IDIgKy0KPiA+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiA+Pj4+
PiBpbmRleCA2MTVkNzM4Li4wNTAwYzQyIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L0tjb25maWcKPiA+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29u
ZmlnCj4gPj4+Pj4gQEAgLTIyLDcgKzIyLDcgQEAgbWVudWNvbmZpZyBNVERfUkFXX05BTkQKPiA+
Pj4+PiAgaWYgTVREX1JBV19OQU5ECj4gPj4+Pj4gIAo+ID4+Pj4+ICBjb25maWcgTVREX05BTkRf
RUNDX1NXX0JDSAo+ID4+Pj4+IC0JdHJpc3RhdGUgIlN1cHBvcnQgc29mdHdhcmUgQkNIIEVDQyIK
PiA+Pj4+PiArCWJvb2wgIlN1cHBvcnQgc29mdHdhcmUgQkNIIEVDQyIKPiA+Pj4+PiAgCXNlbGVj
dCBCQ0gKPiA+Pj4+PiAgCWRlZmF1bHQgbgo+ID4+Pj4+ICAJaGVscCAgICAgIAo+ID4+Pj4KPiA+
Pj4+IFNob3VsZCBiZSBmaXhlZCB3aXRoIHRoZSBmb2xsb3dpbmcgZGlmZiBzcXVhc2hlZCBpbnRv
Ogo+ID4+Pj4KPiA+Pj4+IDUxZWYxZDBiMjA5NSAoIm10ZDogbmFuZDogQ2xhcmlmeSBLY29uZmln
IGVudHJ5IGZvciBzb2Z0d2FyZSBCQ0ggRUNDIGFsZ29yaXRobSIpCj4gPj4+PiAgICAKPiA+Pj4+
IC0tLT44LS0tICAgICAgCj4gPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvbmFu
ZF9iY2guaCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmRfYmNoLmgKPiA+Pj4+IGluZGV4IGI4MTA2
NjUxZjgwNy4uMDZjZTJiNjU1YzEzIDEwMDY0NAo+ID4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9t
dGQvbmFuZF9iY2guaAo+ID4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbmFuZF9iY2guaAo+
ID4+Pj4gQEAgLTE1LDcgKzE1LDcgQEAgc3RydWN0IG10ZF9pbmZvOwo+ID4+Pj4gIHN0cnVjdCBu
YW5kX2NoaXA7Cj4gPj4+PiAgc3RydWN0IG5hbmRfYmNoX2NvbnRyb2w7Cj4gPj4+PiAgCj4gPj4+
PiAtI2lmIGRlZmluZWQoQ09ORklHX01URF9OQU5EX0VDQ19CQ0gpCj4gPj4+PiArI2lmIGRlZmlu
ZWQoQ09ORklHX01URF9OQU5EX0VDQ19TV19CQ0gpCj4gPj4+PiAgCj4gPj4+PiAgc3RhdGljIGlu
bGluZSBpbnQgbXRkX25hbmRfaGFzX2JjaCh2b2lkKSB7IHJldHVybiAxOyB9Cj4gPj4+PiAgCj4g
Pj4+PiBAQCAtMzksNyArMzksNyBAQCBzdHJ1Y3QgbmFuZF9iY2hfY29udHJvbCAqbmFuZF9iY2hf
aW5pdChzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7Cj4gPj4+PiAgICovCj4gPj4+PiAgdm9pZCBuYW5k
X2JjaF9mcmVlKHN0cnVjdCBuYW5kX2JjaF9jb250cm9sICpuYmMpOwo+ID4+Pj4gIAo+ID4+Pj4g
LSNlbHNlIC8qICFDT05GSUdfTVREX05BTkRfRUNDX0JDSCAqLwo+ID4+Pj4gKyNlbHNlIC8qICFD
T05GSUdfTVREX05BTkRfRUNDX1NXX0JDSCAqLwo+ID4+Pj4gIAo+ID4+Pj4gIHN0YXRpYyBpbmxp
bmUgaW50IG10ZF9uYW5kX2hhc19iY2godm9pZCkgeyByZXR1cm4gMDsgfQo+ID4+Pj4gIAo+ID4+
Pj4gQEAgLTY0LDYgKzY0LDYgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbmFuZF9iY2hfY29udHJv
bCAqbmFuZF9iY2hfaW5pdChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+Pj4+ICAKPiA+Pj4+ICBz
dGF0aWMgaW5saW5lIHZvaWQgbmFuZF9iY2hfZnJlZShzdHJ1Y3QgbmFuZF9iY2hfY29udHJvbCAq
bmJjKSB7fQo+ID4+Pj4gIAo+ID4+Pj4gLSNlbmRpZiAvKiBDT05GSUdfTVREX05BTkRfRUNDX0JD
SCAqLwo+ID4+Pj4gKyNlbmRpZiAvKiBDT05GSUdfTVREX05BTkRfRUNDX1NXX0JDSCAqLwo+ID4+
Pj4gIAo+ID4+Pj4gICNlbmRpZiAvKiBfX01URF9OQU5EX0JDSF9IX18gKi8gICAgCj4gPj4+Cj4g
Pj4+IFNvcnJ5LCBJIGRpZG4ndCBsb29rIGF0IHRoZSByaWdodCBicmFuY2gsIHRoaXMgcGFydCBv
ZiB0aGUgY29kZSB3YXMKPiA+Pj4gY29ycmVjdCwgYnV0IHdlIHN0aWxsIGhhdmUgYSBwcm9ibGVt
IHRvIGV4cHJlc3MgdGhlIFJBV19OQU5EKHkpIC0+Cj4gPj4+IFNXX0JDSCh5KSBkZXBlbmRlbmN5
LiAgICAKPiA+Pgo+ID4+IEl0IHNlZW1zIHRoaXMgZGVwZW5kZW5jeSBpcyBub3QgYWx3YXlzIG5l
ZWQsCj4gPj4KPiA+PiBjYXNlIE1URF9SQVdfTkFORCBzZXQgdG8geSB3b3JrcyB3ZWxsIHdoaWxl
IENPTkZJR19NVERfTkFORF9FQ0NfU1dfQkNIIGlzIG5vdCBzZXQuICAKPiA+IAo+ID4gWWVzLCBJ
IGtub3csIGJ1dCBmb3JjaW5nIG5hbmRfYmNoIHRvIGEgYmUgYSBib29sZWFuIGlzIG5vdCB0aGUg
cmlnaHQKPiA+IHNvbHV0aW9uIGVpdGhlciwgaGVuY2UgbXkgc3VnZ2VzdGlvbiB0byB1c2UgJ2lt
cGx5Jy4gIAoKV2h5IGV4YWN0bHk/IFNXIEJDSCBpcyBnb2luZyB0byBiZSBjb252ZXJ0ZWQgdG8g
dGhlIGdlbmVyaWMgRUNDIGVuZ2luZQphYnN0cmFjdGlvbiBhbmQgSUlSQyB5b3UgdG9sZCBtZSB0
aGF0IGl0IHdvdWxkIG5vdCBiZSBwcm9ibGVtYXRpYyB0bwp0dXJuIGl0IGludG8gYSBib29sZWFu
PwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
