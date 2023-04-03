Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7040C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oULOhCp1OBxbdSX/Mg3x3LLGHmDpvF70gvlik4C6MNQ=; b=zFh5XMBtQ8EtAb
	6qy6g4SOLRh1C1NLMbdmFHs/yr6KuapLoO/hQgFlvZ6r83puq4oT5p972tbsge2rYqjq800c/E4QJ
	DNG1YYfyXx/xeb0A5qiL4alw809OpYn42QgGQNeb1660+K6kvlnRPIVnHfhjKXvQKf2EhfoXqPbda
	A0GsocOX5vfTjQE2OOLuYnvaZYp1FRu+TPUrZdy233+xX9zRy23P64QRfT4QfTh4NU5pgeEtJtcOz
	q3WS33cXMoYB7ZCQMtjMIFrRRTN/A4mr1zuu3Yra6ePlAMlJJmgjEi5mDdyCL00N1Y50d2ykeoHQT
	zuNDnDxl1vdtSwdf6QYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMAH-00FmzU-2C;
	Mon, 03 Apr 2023 15:32:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMAE-00FmyB-2S
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 15:32:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A9C0320012;
	Mon,  3 Apr 2023 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680535924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=frn7TonczdUEHXOqGD56TzjMK5iksjqhpLzkVM0SL94=;
	b=J5kLcZ2KgD+JOB1g8N9baQFCSl33yqZM8hn8EOitsOC/PQKnRsPW7WVOtUtUTwEZOqqbbR
	KfBvB7qppteNsVel08rKVY3ltviwlEbQgTVdX4v+CefOiXqYSN8V/JWU/0x+A0ZXwF35b7
	AD+LjvGwVWs2aYi7T9mPWUUjB/+KpYpb0dNKoBNbeh1eG+LE18utq9ErjUADFT1mLOQ7b4
	+2avwi97EzsTUwBQcJuXhX6sJYhntRjgYrY+A8aX4/UqyH0BKDXZ/MY3xSYzmT1ngeWO2h
	6l1Q0KnxHVDiDg/m+QpNbsAkqcAg8lKt4EUfNA12G3PGTIRDDhTOEjyPta221A==
Date: Mon, 3 Apr 2023 17:31:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Jaime Liao
 <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 1/2] mtd: spi-nor: Delay the initialization of
 bank_size
Message-ID: <20230403173158.42426b9d@xps-13>
In-Reply-To: <5c851822-1e14-f002-3224-738e10d478d1@linaro.org>
References: <20230331194620.839899-1-miquel.raynal@bootlin.com>
	<5c851822-1e14-f002-3224-738e10d478d1@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_083211_286682_0F9C0D2F 
X-CRM114-Status: GOOD (  28.95  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAzIEFwciAy
MDIzIDA5OjIzOjI0ICswMTAwOgoKPiBPbiAzLzMxLzIzIDIwOjQ2LCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+ID4gQmFuayBzaXplIGlzIGRlcml2ZWQgZnJvbSB0aGUgY2hpcCdzIHNpemUsIHdoaWNo
IGluCj4gPiBzcGlfbm9yX2luaXRfZGVmYXVsdF9wYXJhbXMoKSBjYW4gc3RpbGwgYmUgemVybyBp
ZiB0aGUgc2l6ZSBpcyBub3QKPiA+IGhhcmRjb2RlZCBpbiBhIHRhYmxlIChlZy4gc2ZkcCBwYXJz
aW5nKS4gV2UgbmVlZCB0byBkZWxheSB0aGUKPiA+IGluaXRpYWxpemF0aW9uIG9mIHRoaXMgZmll
bGQgaW4gdGhlICJsYXRlIiBoZWxwZXJzLgo+ID4gCj4gPiBCYXNlZCBvbiB0aGUgZmFjdCB0aGF0
IFJXVyBjb21wYXRpYmxlIGRldmljZXMgd2lsbCB1c2UgdGhlIGJhbmtfc2l6ZSB0bwo+ID4gZGVy
aXZlIGluIHdoaWNoIGJhbmsgYW4gYWNjZXNzIGlzIG1hZGUsIHdlIGFic29sdXRlbHkgd2FudCB0
byBhdm9pZAo+ID4gZGl2aXNpb25zIGJ5IDAuIFJpZ2h0IG5vdyB0aGVyZSBpcyBubyBzdWNoIG9w
cG9ydHVuaXR5IGJldHdlZW4KPiA+IHNwaV9ub3JfaW5pdF9kZWZhdWx0X3BhcmFtcygpIGFuZCBz
cGlfbm9yX2xhdGVfaW5pdF9wYXJhbXMoKSBidXQgaXQgaXMKPiA+IHByb2JhYmx5IHNhZmVyIHRv
IGVuZm9yY2UgYSBkZWZhdWx0IHZhbHVlIChhc3N1bWluZyAxIGJhbmspIGFzIGVhcmx5IGFzCj4g
PiBwb3NzaWJsZSwganVzdCBpbiBjYXNlIHNvbWUgZGF5IGNvZGUgdXNpbmcgdGhpcyB2YXJpYWJs
ZSBpcyBtb3ZlZAo+ID4gZWFybGllciB0aGFuIGV4cGVjdGVkLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4g
PiBJIG1hZGUgdGhlIGNob2ljZSB0byBrZWVwIGEgZGVmYXVsdCB2YWx1ZSwgdG8gYmUgaG9uZXN0
IHRoaXMgaXMgbm90Cj4gPiBhY3R1YWxseSBuZWVkZWQgdG9kYXksIHNvIGZlZWwgZnJlZSB0byBk
cm9wIHRoZSBsaW5lIGlmIHlvdSBkb24ndCBsaWtlCj4gPiBpdCwgYm90aCBjaG9pY2VzIHNlZW0g
cmVhc29uYWJsZSB0byBtZS4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
IHwgNCArKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4gaW5kZXggOWU2YTA3MzBjZGI4Li5mNDM2Mzk1
Y2E0ODkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+IEBAIC0yODgyLDYgKzI4ODIsOCBAQCBz
dGF0aWMgdm9pZCBzcGlfbm9yX2xhdGVfaW5pdF9wYXJhbXMoc3RydWN0IHNwaV9ub3IgKm5vcikK
PiA+ICAJICovCj4gPiAgCWlmIChub3ItPmZsYWdzICYgU05PUl9GX0hBU19MT0NLICYmICFub3It
PnBhcmFtcy0+bG9ja2luZ19vcHMpCj4gPiAgCQlzcGlfbm9yX2luaXRfZGVmYXVsdF9sb2NraW5n
X29wcyhub3IpOwo+ID4gKwo+ID4gKwlub3ItPnBhcmFtcy0+YmFua19zaXplID0gZGl2NjRfdTY0
KG5vci0+cGFyYW1zLT5zaXplLCBub3ItPmluZm8tPm5fYmFua3MpOwo+ID4gIH0KPiA+ICAKPiA+
ICAvKioKPiA+IEBAIC0yOTQ4LDcgKzI5NTAsNyBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX2luaXRf
ZGVmYXVsdF9wYXJhbXMoc3RydWN0IHNwaV9ub3IgKm5vcikKPiA+ICAJLyogU2V0IFNQSSBOT1Ig
c2l6ZXMuICovCj4gPiAgCXBhcmFtcy0+d3JpdGVzaXplID0gMTsKPiA+ICAJcGFyYW1zLT5zaXpl
ID0gKHU2NClpbmZvLT5zZWN0b3Jfc2l6ZSAqIGluZm8tPm5fc2VjdG9yczsKPiA+IC0JcGFyYW1z
LT5iYW5rX3NpemUgPSBkaXY2NF91NjQocGFyYW1zLT5zaXplLCBpbmZvLT5uX2JhbmtzKTsKPiA+
ICsJcGFyYW1zLT5iYW5rX3NpemUgPSBwYXJhbXMtPnNpemU7ICAKPiAKPiBJJ2xsIGdldCByaWQg
b2YgdGhpcyBsaW5lIGVudGlyZWx5IGFzIHlvdSBvdmVyd3JpdGUgaXQgYW55d2F5IGluCj4gbGF0
ZV9pbml0IGFuZCBpdCdzIG5vdCB1c2VkIGluIGJldHdlZW4uCgpZZXMsIGFzIHNhaWQgYWJvdmUs
IEknbSBmaW5lIHdpdGggYm90aCBhcHByb2FjaGVzLiBTaGFsbCBJIHJlc2VuZCBvcgp3aWxsIHlv
dSBlZGl0IHdoZW4gYXBwbHlpbmc/Cgo+IAo+ID4gIAlwYXJhbXMtPnBhZ2Vfc2l6ZSA9IGluZm8t
PnBhZ2Vfc2l6ZTsKPiA+ICAKPiA+ICAJaWYgKCEoaW5mby0+ZmxhZ3MgJiBTUElfTk9SX05PX0ZS
KSkgeyAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
