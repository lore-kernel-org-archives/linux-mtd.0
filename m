Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E50C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jun 2022 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMKHmA6EtIMU4BHW6Zzd3E+BGo6dT5Rh/s0r0JIdcpk=; b=lJpmZuCp0HALEz
	oh6TNKRi2PsxbkRBA9OpWcEpkjiRaYk2iOu6JO5auMigKllOSynYK5hkL/S1Bd8mgz81bkQwQKFgM
	v/wV7u/sz5R+00uaI2nR78r9g9Hb0JcEKRMwENYN0MUwKKbIDJz0Fyxyq9DVfLQWFxeHY6554x2Dp
	eR7A4XAPjLJJ9bw/a9wnH2Id+AtrJ7vAS4HHLFTJI5Wj9/4cfu8dSjbsNp4zEitmEypw8sN5cJ67S
	jG4FnilhM0BDiHwp1DGuZlFtzr5KXsDB6QKbbqgYhZM4aF5sI2kXgJnCYjM+GRG7L9iMqwoezZsaZ
	N1X9jJMzZAUddc/uQ1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oJ4-003Vtr-Gz; Fri, 24 Jun 2022 18:45:26 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oJ1-003Vrc-HB
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2022 18:45:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 230D4E0005;
	Fri, 24 Jun 2022 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656096318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OhwUa7ULOa0HAkoYaCvaKGKl4CXee0Jr1SRlZBCA6GU=;
	b=AqLIBi7e553nSlKsJL7LILVqrVlIa0qqg1GGa5OutRkE84hL56a88oOzLGAzb3NedYUTXi
	LwWUHUTp+ZsxZdp0yoCPs3BNJpl+CyuWR++uhRujWHfRG/fTKibTvFj6ZZwFXsCsI99qFm
	oaDIFzgh7qI/9HydonetIdIGRAaWwQQIqM0kgvrmPs0mELz1kh0EuUAgDxLOLvA0dZwNyv
	n57yH6xRonDqkbIwqO6bEUeJHm2HAXE69dgUK6ETXLgil3CnpV1XwV4EJ0LJmGnIcOPwlJ
	aK0ihwhDK6UACef5BLSieKWh4NUs3CPZx34P0zLub+IVEhyTljp5qCHXycT8vg==
Date: Fri, 24 Jun 2022 20:45:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: <vigneshr@ti.com>, <git@amd.com>, <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <amit.kumar-mahapatra@amd.com>, <akumarma@amd.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: arasan: Update NAND bus clock
 instead of system clock
Message-ID: <20220624204515.6b003ef9@xps-13>
In-Reply-To: <20220621085500.1005-2-amit.kumar-mahapatra@xilinx.com>
References: <20220621085500.1005-1-amit.kumar-mahapatra@xilinx.com>
	<20220621085500.1005-2-amit.kumar-mahapatra@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_114523_902900_F5471CB8 
X-CRM114-Status: GOOD (  22.31  )
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

SGkgQW1pdCwKCmFtaXQua3VtYXItbWFoYXBhdHJhQHhpbGlueC5jb20gd3JvdGUgb24gVHVlLCAy
MSBKdW4gMjAyMiAxNDoyNDo1OQorMDUzMDoKCj4gSW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbiB0
aGUgQXJhc2FuIE5BTkQgZHJpdmVyIGlzIHVwZGF0aW5nIHRoZQo+IHN5c3RlbSBjbG9jayhpLmUu
LCBhbmFuZC0+Y2xrKSBpbiBhY2NvcmRhbmNlIHRvIHRoZSB0aW1pbmcgbW9kZXMKPiAoaS5lLiwg
U0RSIG9yIE5WRERSKS4gQnV0IGFzIHBlciB0aGUgQXJhc2FuIE5BTkQgY29udHJvbGxlciBzcGVj
IHRoZQo+IGZsYXNoIGNsb2NrIG9yIHRoZSBOQU5EIGJ1cyBjbG9jayhpLmUuLCBuZmMtPmJ1c19j
bGspLCBuZWVkIHRvIGJlCj4gdXBkYXRlZCBpbnN0ZWFkLiBUaGlzIHBhdGNoIGtlZXBzIHRoZSBz
eXN0ZW0gY2xvY2sgdW5jaGFuZ2VkIGFuZCB1cGRhdGVzCj4gdGhlIE5BTkQgYnVzIGNsb2NrIGFz
IHBlciB0aGUgdGltaW5nIG1vZGVzLgoKVGhpcyBpcyBub3Qgd2hhdCB5b3UgZG8gYmVsb3cuIElm
IHRoZSBjbG9jayB0aGF0IGlzIGNoYW5nZWQgaXMgdGhlCndyb25nIG9uZSwgdGhlbiBqdXN0IGNo
YW5nZSB0aGUgY2xvY2sgdXNlZCBpbiB0aGUgY2xrX3NldF9yYXRlIGNhbGwKaW5zdGVhZCBvZiBj
YWxsaW5nIGNsa19zZXRfcmF0ZSB0d2ljZSBhdCB0aGUgd3JvbmcgbG9jYXRpb24uCi0+c2V0X2lu
dGVyZmFjZSBpcyBkb25lIG9uY2UgcGVyIGNoaXAsIGlmIHlvdSBoYXZlIHR3byBkaWZmZXJlbnQg
Y2hpcHMKb24gdGhlIHNhbWUgc3lzdGVtIHlvdSBtdXN0IGNoYW5nZSB0aGUgY2xvY2sgd2hlbiB5
b3Ugc3dpdGNoIGZyb20gb25lCmNoaXAgdG8gdGhlIG90aGVyLiBZb3VyIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gZGlzcmVzcGVjdHMgdGhhdCwKdW5mb3J0dW5hdGVseS4KCj4gCj4gRml4ZXM6IDE5
N2I4OGZlY2M1MCAoIm10ZDogcmF3bmFuZDogYXJhc2FuOiBBZGQgbmV3IEFyYXNhbiBOQU5EIGNv
bnRyb2xsZXIiKQoKUmVxdWlyZXMgYSBDYzogc3RhYmxlIHRhZwoKPiBTaWduZWQtb2ZmLWJ5OiBB
bWl0IEt1bWFyIE1haGFwYXRyYSA8YW1pdC5rdW1hci1tYWhhcGF0cmFAeGlsaW54LmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgMTYg
KysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2Fu
LW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29u
dHJvbGxlci5jCj4gaW5kZXggNTNiZDEwNzM4NDE4Li40ZjZkYTgyZGQyYjEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTk2OCw2
ICs5NjgsNyBAQCBzdGF0aWMgaW50IGFuZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsIGludCB0YXJnZXQsCj4gIAljb25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAq
c2RyOwo+ICAJY29uc3Qgc3RydWN0IG5hbmRfbnZkZHJfdGltaW5ncyAqbnZkZHI7Cj4gIAl1bnNp
Z25lZCBpbnQgdGNjc19taW4sIGRxc19tb2RlLCBmYXN0X3RjYWQ7Cj4gKwlpbnQgcmV0Owo+ICAK
PiAgCWlmIChuYW5kX2ludGVyZmFjZV9pc19udmRkcihjb25mKSkgewo+ICAJCW52ZGRyID0gbmFu
ZF9nZXRfbnZkZHJfdGltaW5ncyhjb25mKTsKPiBAQCAtMTA0Myw3ICsxMDQ0LDExIEBAIHN0YXRp
YyBpbnQgYW5mY19zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IHRh
cmdldCwKPiAgCQkJCSBEUVNfQlVGRl9TRUxfT1VUKGRxc19tb2RlKTsKPiAgCX0KPiAgCj4gLQlh
bmFuZC0+Y2xrID0gQU5GQ19YTE5YX1NEUl9ERkxUX0NPUkVfQ0xLOwo+ICsJcmV0ID0gY2xrX3Nl
dF9yYXRlKG5mYy0+YnVzX2NsaywgQU5GQ19YTE5YX1NEUl9ERkxUX0NPUkVfQ0xLKTsKPiArCWlm
IChyZXQpIHsKPiArCQlkZXZfZXJyKG5mYy0+ZGV2LCAiRmFpbGVkIHRvIGNoYW5nZSBidXMgY2xv
Y2sgcmF0ZVxuIik7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiAgCj4gIAkvKgo+ICAJICogRHVl
IHRvIGEgaGFyZHdhcmUgYnVnIGluIHRoZSBaeW5xTVAgU29DLCBTRFIgdGltaW5nIG1vZGVzIDAt
MSB3b3JrCj4gQEAgLTEwNTIsOCArMTA1NywxMyBAQCBzdGF0aWMgaW50IGFuZmNfc2V0dXBfaW50
ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCB0YXJnZXQsCj4gIAkgKiA4ME1IeiB3
aGVuIHVzaW5nIFNEUiBtb2RlcyAyLTUgd2l0aCB0aGlzIFNvQy4KPiAgCSAqLwo+ICAJaWYgKG9m
X2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAieGxueCx6eW5xbXAtbmFuZC1jb250cm9sbGVyIikg
JiYKPiAtCSAgICBuYW5kX2ludGVyZmFjZV9pc19zZHIoY29uZikgJiYgY29uZi0+dGltaW5ncy5t
b2RlID49IDIpCj4gLQkJYW5hbmQtPmNsayA9IEFORkNfWExOWF9TRFJfSFNfQ09SRV9DTEs7Cj4g
KwkgICAgbmFuZF9pbnRlcmZhY2VfaXNfc2RyKGNvbmYpICYmIGNvbmYtPnRpbWluZ3MubW9kZSA+
PSAyKSB7Cj4gKwkJcmV0ID0gY2xrX3NldF9yYXRlKG5mYy0+YnVzX2NsaywgQU5GQ19YTE5YX1NE
Ul9IU19DT1JFX0NMSyk7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQlkZXZfZXJyKG5mYy0+ZGV2LCAi
RmFpbGVkIHRvIGNoYW5nZSBidXMgY2xvY2sgcmF0ZVxuIik7Cj4gKwkJCXJldHVybiByZXQ7Cj4g
KwkJfQo+ICsJfQo+ICAKPiAgCXJldHVybiAwOwo+ICB9CgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
