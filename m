Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57345C001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ca+5uqtv0LtKzm6nZ8V0BtWlTLJ8qE2tLQz8w5/H7R4=; b=3qJ3bMN9/CDDiD
	D5VSMk0w58GxS3h/l6/9dSnfP+uzAV7x652B0AZ3+UeeRwkB2e+GMeJ5LLENV6DafSYPqOvkjJyeq
	dXvMhOVluNjIkgiYeFppbU+DbTmP4qGw6e6MJhuV6mc6Ej+9JrdCFLYBgo8UNwV7rYrW2G/ty4/ON
	dRxZj6zJ4VA9OzBzu7LDo+IjSFz9wixgsI4Sch6e29Y3I0kCR1Mz/YFm1YQec9fjqZxIA29qfHjBT
	aWSzbrc3F9jISqwj1gOjU2yTIHLlJHpw30LCy33luXpta1PfAE6DXHAEcmWEg8/N6ZmeZF4fAylrB
	TG1A0reZRL51L4ioQ3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0bk-00HS3Z-12;
	Mon, 07 Aug 2023 13:49:16 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0bh-00HS14-02
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:49:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E5AD4000F;
	Mon,  7 Aug 2023 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691416148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RmG+l8qINODDTiGG771G1Op/k2KxmtMEP1AeQ5xc374=;
	b=eDlXHeO6wXBcjU04Ckj6VJ4rPbcVnhqkgnvved/CP4kfyJngFRbbRMNq0lTkfD3Q+7vdi5
	GUZYu2a2EtH1KjjV5UInu1wpTrDP/Y2LZK3yGYvyzMH+DUDv+dzfw+jWrklmm1iF6L+TuP
	n7v0/5PoNSInUlPYfOOZYF/IQ08zihAso0P8yEJgD+xlFXzod+jWlgXP4NeG6JBoXBM+ul
	k+0tPg/eDwlbrn+hoo1Mw+f5riXo9X2HRDRjdemTruQlkw2u0ccd8sJLN1r4lkIc8BtoU1
	IkD32bgSNPviG/h4ezh2XsRmA3oBzNwxZ/8I0eEr6EmCqbNwCCNk45qR9hWHcA==
Date: Mon, 7 Aug 2023 15:49:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 07/41] mtd: spi-nor: store .n_banks in struct
 spi_nor_flash_parameter
Message-ID: <20230807154906.45aefc2c@xps-13>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-7-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
	<20230807-mtd-flash-info-db-rework-v1-7-3d3d5bef4ba4@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_064913_309995_01533B0C 
X-CRM114-Status: GOOD (  21.52  )
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

SGkgTWljaGFlbCwKCm13YWxsZUBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMDcgQXVnIDIwMjMg
MTU6MjE6MDEgKzAyMDA6Cgo+IEZpcnN0LCBmaXh1cHMgbWlnaHQgd2FudCB0byByZXBsYWNlIHRo
ZSBuX2JhbmtzIHBhcmFtZXRlciwgdGh1cyB3ZSBuZWVkCj4gaXQgaW4gdGhlICh3cml0YWJsZSkg
cGFyYW1ldGVyIHN0cnVjdC4gU2Vjb25kbHksIHRoaXMgd2F5IHdlIGNhbiBoYXZlIGEKPiBkZWZh
dWx0IGluIHRoZSBjb3JlIGFuZCBqdXN0IHNraXAgc2V0dGluZyB0aGUgbl9iYW5rcyBpbiB0aGUg
Zmxhc2hfaW5mbwo+IGRhdGFiYXNlLiBNb3N0IG9mIHRoZSBmbGFzaGVzIGRvZXNuJ3QgaGF2ZSBt
b3JlIHRoYW4gb25lIGJhbmsuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bXdh
bGxlQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgNyAr
KysrLS0tCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oIHwgMiArKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+
IGluZGV4IDEzOGJjMWUwYTY3Yy4uZWE5NGZiMGRhMWU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBA
QCAtMjg2MSw3ICsyODYxLDcgQEAgc3RhdGljIHZvaWQgc3BpX25vcl9pbml0X2ZsYWdzKHN0cnVj
dCBzcGlfbm9yICpub3IpCj4gIAlpZiAoZmxhZ3MgJiBOT19DSElQX0VSQVNFKQo+ICAJCW5vci0+
ZmxhZ3MgfD0gU05PUl9GX05PX09QX0NISVBfRVJBU0U7Cj4gIAo+IC0JaWYgKGZsYWdzICYgU1BJ
X05PUl9SV1cgJiYgbm9yLT5pbmZvLT5uX2JhbmtzID4gMSAmJgo+ICsJaWYgKGZsYWdzICYgU1BJ
X05PUl9SV1cgJiYgbm9yLT5wYXJhbXMtPm5fYmFua3MgPiAxICYmCj4gIAkgICAgIW5vci0+Y29u
dHJvbGxlcl9vcHMpCj4gIAkJbm9yLT5mbGFncyB8PSBTTk9SX0ZfUldXOwo+ICB9Cj4gQEAgLTI5
MjUsOCArMjkyNSw4IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKHN0cnVj
dCBzcGlfbm9yICpub3IpCj4gIAlpZiAobm9yLT5mbGFncyAmIFNOT1JfRl9IQVNfTE9DSyAmJiAh
bm9yLT5wYXJhbXMtPmxvY2tpbmdfb3BzKQo+ICAJCXNwaV9ub3JfaW5pdF9kZWZhdWx0X2xvY2tp
bmdfb3BzKG5vcik7Cj4gIAo+IC0JaWYgKG5vci0+aW5mby0+bl9iYW5rcyA+IDEpCj4gLQkJcGFy
YW1zLT5iYW5rX3NpemUgPSBkaXY2NF91NjQocGFyYW1zLT5zaXplLCBub3ItPmluZm8tPm5fYmFu
a3MpOwo+ICsJaWYgKHBhcmFtcy0+bl9iYW5rcyA+IDEpCj4gKwkJcGFyYW1zLT5iYW5rX3NpemUg
PSBkaXY2NF91NjQocGFyYW1zLT5zaXplLCBwYXJhbXMtPm5fYmFua3MpOwo+ICAKPiAgCXJldHVy
biAwOwo+ICB9Cj4gQEAgLTI5OTYsNiArMjk5Niw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5p
dF9kZWZhdWx0X3BhcmFtcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICAJcGFyYW1zLT5zaXplID0g
aW5mby0+c2l6ZTsKPiAgCXBhcmFtcy0+YmFua19zaXplID0gcGFyYW1zLT5zaXplOwo+ICAJcGFy
YW1zLT5wYWdlX3NpemUgPSBpbmZvLT5wYWdlX3NpemUgPzogU1BJX05PUl9ERUZBVUxUX1BBR0Vf
U0laRTsKPiArCXBhcmFtcy0+bl9iYW5rcyA9IGluZm8tPm5fYmFua3M7Cj4gIAo+ICAJaWYgKCEo
aW5mby0+ZmxhZ3MgJiBTUElfTk9SX05PX0ZSKSkgewo+ICAJCS8qIERlZmF1bHQgdG8gRmFzdCBS
ZWFkIGZvciBEVCBhbmQgbm9uLURUIHBsYXRmb3JtIGRldmljZXMuICovCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmgK
PiBpbmRleCAyNWJjMTgxOTc2MTQuLmZlMWNlMjMyYTZjOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuaAo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oCj4g
QEAgLTM1OCw2ICszNTgsNyBAQCBzdHJ1Y3Qgc3BpX25vcl9vdHAgewo+ICAgKgkJCWluIG9jdGFs
IERUUiBtb2RlLgo+ICAgKiBAcmRzcl9hZGRyX25ieXRlczoJZHVtbXkgYWRkcmVzcyBieXRlcyBu
ZWVkZWQgZm9yIFJlYWQgU3RhdHVzIFJlZ2lzdGVyCj4gICAqCQkJY29tbWFuZCBpbiBvY3RhbCBE
VFIgbW9kZS4KPiArICogQG5fYmFua3M6CQl0aGUgbnVtYmVyIG9mIGJhbmtzLgoKanVzdCAibnVt
YmVyIG9mIGJhbmtzIiB3b3VsZCBtYWtlIGl0LCBidXQgdGhhdCdzIG5pdHBpY2tpbmcuCgo+ICAg
KiBAbl9kaWNlOgkJbnVtYmVyIG9mIGRpY2UgaW4gdGhlIGZsYXNoIG1lbW9yeS4KPiAgICogQHZy
ZWdfb2Zmc2V0Ogl2b2xhdGlsZSByZWdpc3RlciBvZmZzZXQgZm9yIGVhY2ggZGllLgo+ICAgKiBA
aHdjYXBzOgkJZGVzY3JpYmVzIHRoZSByZWFkIGFuZCBwYWdlIHByb2dyYW0gaGFyZHdhcmUKPiBA
QCAtMzk0LDYgKzM5NSw3IEBAIHN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciB7Cj4gIAl1
OAkJCQlhZGRyX21vZGVfbmJ5dGVzOwo+ICAJdTgJCQkJcmRzcl9kdW1teTsKPiAgCXU4CQkJCXJk
c3JfYWRkcl9uYnl0ZXM7Cj4gKwl1OAkJCQluX2JhbmtzOwo+ICAJdTgJCQkJbl9kaWNlOwo+ICAJ
dTMyCQkJCSp2cmVnX29mZnNldDsKPiAgCj4gCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
