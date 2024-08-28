Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CC3C54E62
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6eMoCglcnOT44nDCxClTz6ucU1T/3hGW/Ll2XdLXws=; b=NEIurZrKq/3xCA
	gGviJMuTdEsrrB/w6y3HkkdpncF6mIJ6Bp7XXJmFpZTVOFuN4wj71UZZOyG6uTI/jjYXPouTRdOmQ
	7hG9ouvBd4C+wpbsb4MrTmzsOxeFy4aeOOOALQypavsnLsjc4/K8j1avHXu9oD+P/bYJr6xNKR8UR
	74wEq1Uya0L/2ZGwuh16XstRrVhHt2e7aIWWgG4QFdivkj41JWEKxqkzQzraU0fT4bnZ24iGxhh2+
	EOaz9S6ntKdGTGOP5pmZH+Wna8sgyvHcY/nL8kG2JEKtNB4B3n03pgDuKtDS4pBDdDBjJQT29tODS
	KfkOG1NrKbWp43qyU+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFMD-0000000Eo6e-02dW;
	Wed, 28 Aug 2024 09:52:53 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFLo-0000000Eo02-48Qm
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 09:52:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27DA0FF806;
	Wed, 28 Aug 2024 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u93DZQ9YeSbzTH4K9ljvJcKN9DOBT6o0pFa3uLJlLhw=;
	b=WCCCHr80HxgXEZxVZI66LCQ1CAvz+9AQL1DYY2AcytB/qULF83X6H7FoNuXdCtIay5dTD4
	M3CiBqbMwnIEkseNlg/U36EK3VqFEj9bf5nWV7EbFIAmAoYmtdWc4qfE5GuFnpE4KwTfxW
	NH0UUEi2ReTGrFZNk+VNoHf78nY7koPO2pSHOmM+x2tXES9SzjviI6YPd46lMtbekIN28w
	PzjTWPkvwz7LC0AFCNOIJ6Yidw1NzyfJTEZyhDNQEXmWkqTgqfbXUHAOz3l8jQ+HZ4K+vs
	rwm5Vwq7KmKCDm1dqv1Xp+xdybD8q618vj3X/I1YsIn3KSNZF/sZv9Qoy+uU3g==
Date: Wed, 28 Aug 2024 11:52:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/1] mtd: spinand: Add flags for the Plane Select bit
Message-ID: <20240828115224.28ab48dc@xps-13>
In-Reply-To: <CAAyq3SbLATwXbDN6icx44cm8-PX+DrUvq2xiYor7bLn4wmfVrw@mail.gmail.com>
References: <20240828062131.1491580-1-linchengming884@gmail.com>
	<20240828062131.1491580-2-linchengming884@gmail.com>
	<20240828094728.583dc7c5@xps-13>
	<CAAyq3SbLATwXbDN6icx44cm8-PX+DrUvq2xiYor7bLn4wmfVrw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_025229_346907_56ECB985 
X-CRM114-Status: GOOD (  18.05  )
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

SGkgQ2hlbmcsCgo+ID4gPiBAQCAtMjYzLDcgKzI2Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3BpbmFuZF9pbmZvIG1hY3Jvbml4X3NwaW5hbmRfdGFibGVbXSA9IHsKPiA+ID4gICAgICAgICAg
ICAgICAgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmd3JpdGVf
Y2FjaGVfdmFyaWFudHMsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCj4gPiA+IC0gICAgICAgICAgICAgICAg
ICBTUElOQU5EX0hBU19RRV9CSVQsCj4gPiA+ICsgICAgICAgICAgICAgICAgICBTUElOQU5EX0hB
U19RRV9CSVQgfCBTUElOQU5EX0hBU19QUF9QTEFORV9TRUxFQ1RfQklULAo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5b3V0LAo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG14MzVsZjFnZTRhYl9lY2NfZ2V0
X3N0YXR1cykpLAo+ID4gPiAgICAgICBTUElOQU5EX0lORk8oIk1YMzVVRjJHMjRBRC1aNEk4IiwK
PiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCBiL2luY2x1ZGUv
bGludXgvbXRkL3NwaW5hbmQuaAo+ID4gPiBpbmRleCA1YzE5ZWFkNjA0OTkuLmNlYzQ1MWU3Yzcx
YyAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4gPiA+ICsr
KyBiL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+ID4gPiBAQCAtMzEyLDYgKzMxMiw4IEBA
IHN0cnVjdCBzcGluYW5kX2VjY19pbmZvIHsKPiA+ID4KPiA+ID4gICNkZWZpbmUgU1BJTkFORF9I
QVNfUUVfQklUICAgICAgICAgICBCSVQoMCkKPiA+ID4gICNkZWZpbmUgU1BJTkFORF9IQVNfQ1Jf
RkVBVF9CSVQgICAgICAgICAgICAgIEJJVCgxKQo+ID4gPiArI2RlZmluZSBTUElOQU5EX0hBU19Q
UF9QTEFORV9TRUxFQ1RfQklUICAgICAgICAgICAgICBCSVQoMikKPiA+ID4gKyNkZWZpbmUgU1BJ
TkFORF9IQVNfUkVBRF9QTEFORV9TRUxFQ1RfQklUICAgICAgICAgICAgQklUKDMpICAKPiA+Cj4g
PiBEbyB5b3UgdGhpbmsgd2UgY2FuIGhhdmUgdGhlIFBQIHBsYW5lIHNlbGVjdCBiaXQgd2l0aG91
dCB0aGUgcmVhZCBwbGFuZQo+ID4gc2VsZWN0IGJpdD8gSSdkIHVzZSBhIHNpbmdsZSBmbGFnIGZv
ciBub3cuICAKPiAKPiBNYWNyb25peCBzZXJpYWwgTkFORCBmbGFzaCB3aXRoIGEgdHdvLXBsYW5l
IHN0cnVjdHVyZSBhbHdheXMgcmVxdWlyZXMKPiB0aGUgaW5zZXJ0aW9uIG9mIHRoZSBQbGFuZSBT
ZWxlY3QgYml0IGluIHRoZSB3cml0ZV90b19jYWNoZSBmdW5jdGlvbi4gSG93ZXZlciwKPiBvbmx5
IHRoZSBNWDM1e1UsRn0yRzE0QUMgYW5kIE1YMzVMRjJHRTRBQiByZXF1aXJlIHRoZSBpbnNlcnRp
b24gb2YgdGhlCj4gUGxhbmUgU2VsZWN0IGJpdCBpbiB0aGUgcmVhZF9mcm9tX2NhY2hlIGZ1bmN0
aW9uLgo+IAo+IEhvd2V2ZXIsIEkgaGF2ZSBvYnNlcnZlZCB0aGF0IGZvciBmbGFzaCByZXF1aXJp
bmcgdGhlIGluc2VydGlvbiBvZiB0aGUKPiBQbGFuZSBTZWxlY3QKPiBiaXQgZHVyaW5nIHRoZSBy
ZWFkX2Zyb21fY2FjaGUgb3BlcmF0aW9uLCB0aGUgRUNDIHN0cmVuZ3RoIGlzIDQuCj4gCj4gQ2Fu
IHdlIHVzZSB0aGUgRUNDIHN0cmVuZ3RoIGluIGNvbmp1bmN0aW9uIHdpdGggdGhlCj4gU1BJTkFO
RF9IQVNfUFBfUExBTkVfU0VMRUNUX0JJVCBmbGFnIHRvIGRldGVybWluZQo+IHdoZXRoZXIgdGhl
IFBsYW5lIFNlbGVjdCBiaXQgbmVlZHMgdG8gYmUgaW5zZXJ0ZWQgZHVyaW5nIHRoZQo+IHJlYWRf
ZnJvbV9jYWNoZSBvcGVyYXRpb24/Cj4gCj4gVGhpcyBtZXRob2QgY2Fubm90IGd1YXJhbnRlZSB0
aGF0IGEgbmV3IGZsYXNoIHdpdGhhIHR3by1wbGFuZQo+IHN0cnVjdHVyZSByZXF1aXJpbmcgdGhl
IGluc2VydGlvbiBvZiB0aGUgUGxhbmUgU2VsZWN0IGJpdCB3aWxsIGhhdmUKPiBhbiBFQ0Mgc3Ry
ZW5ndGggb2YgNC4KPiAKPiBCYXNlZCBvbiB0aGUgYWJvdmUgcG9pbnRzLCBJIHRoaW5rIHdlIG5l
ZWQgdG8gdXNlIHR3byBzZXBhcmF0ZSBmbGFncwo+IHRvIGhhbmRsZSB0aGVzZSByZXF1aXJlbWVu
dHMgZWZmZWN0aXZlbHkuCgpJbmRlZWQsIHBsZWFzZSB1c2UgdHdvIGZsYWdzLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
