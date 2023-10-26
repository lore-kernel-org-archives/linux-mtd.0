Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBEDC25B6B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 06:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pN5MhfhwwfLM2vILeBroqLO0DwSXc2oYV32GYWdQ3Ng=; b=P6huSm7pUhOWtT
	K81fPWSQIoOa8mISFnYz0Ff/vIZ10e6S0cwqI6cxbAZj8iC8uFVUsPCsJ1e/OrLWAh4Y5q1WBFcLE
	o4iR80/t661AupRSv3q9/8fSQtujKvmCE/d9U+S3plWOTNFJT9GblOAQaG6E1/XzavTNjxQk9uKz4
	potuYL5Xbyx/0bCQArvx2m7slmz22ckjH1nkq2oy2DYy/3Jl4tDEOazC6DFEAIIBBD6UwIW1a4hCM
	SlF3Awj9+iY1b3Ug3W2JoTKoKmNEfTpc24XIOoPGuO7F/nnGmjs013LjJVTVR4Pabc9gEqchDDuX1
	aA5oR8aG/M6ly1V5cV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtvp-00DmJN-1c;
	Thu, 26 Oct 2023 06:33:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtvm-00DmIe-3B
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 06:33:24 +0000
Received: from [127.0.0.1] (unknown [154.134.133.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 36086433;
	Thu, 26 Oct 2023 08:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698301997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeGnC9IrmBw8mkTv+WnctTkOWIrVsIUoyRfcpROHfpc=;
	b=SDV+O0fcak4dgCioSUXvAv1krSwaxM0UPF/lImAiBuA+EslSs+a3TM0eokwHIeyCjv6yo/
	nT6VE6AxOThS2xIMajU8/cCTHqfITQo1QTi1KXiNxRtkYW/6tiT6j5ax83dt0/MSXtP+1p
	LxsuK0TQMO8+q2yfNWbZtwF8owZBfWuDMO2kCB9sk+G4veEzTVm/d65EAs44y1RJ5p0eRT
	4cz0bJAzM0FCskh2E8vvJkRCjDvfDg1CUAXtdqvJyyj/U7W0xErcJji4bhMswfH9zk0uRk
	XhXHsm/eAbK30j39hoJkh0Y/+9ErdEPOTbtV0iX9YsEvUdbv8y6hp0KwSJkjDA==
Date: Thu, 26 Oct 2023 09:33:14 +0300
From: Michael Walle <michael@walle.cc>
To: Fabio Estevam <festevam@gmail.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
CC: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
User-Agent: K-9 Mail for Android
In-Reply-To: <CAOMZO5Ba8bo1zAt1-cSieWOKDWYpvSuOqp2RT5ZOGYLE8DHS0w@mail.gmail.com>
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc> <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com> <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc> <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com> <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org> <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com> <4e2de38da5a3e492eac522b9a68141c7@walle.cc> <CAOMZO5A98YSykYr+ddJ=v93isw=4jK_KhBLadSDTuBmn_WbqOQ@mail.gmail.com> <47aec8ad-3a30-4d97-9e3a-870df02f5ad7@linaro.org> <CAOMZO5A0Oi1L20o_D9oT-mRXp-n8pAHkC1-AzhwvQ6jVB+UzxQ@mail.gmail.com> <CAOMZO5Ba8bo1zAt1-cSieWOKDWYpvSuOqp2RT5ZOGYLE8DHS0w@mail.gmail.com>
Message-ID: <935957F7-0B54-4EA1-9505-3790B5AFF4FC@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_233323_175094_02BA1B45 
X-CRM114-Status: GOOD (  15.58  )
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

QW0gMjUuIE9rdG9iZXIgMjAyMyAyMDozNTo0MCBPRVNaIHNjaHJpZWIgRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPjoKPkhpIFR1ZG9yLAo+Cj5PbiBXZWQsIE9jdCAyNSwgMjAyMyBh
dCA4OjU24oCvQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPgo+
PiBJbiB0aGUgbWVhbnRpbWUsIGNvdWxkIHlvdSBwbGVhc2UgY29uc2lkZXIgdGhlIHYyIHByb3Bv
c2FsPwo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMzEwMjQxMzU4MjYu
MjcyOTA4OC0xLWZlc3RldmFtQGdtYWlsLmNvbS9ULyN1Cj4+Cj4+IG10MjVxdTAxZyBpcyB2ZXJ5
IHNpbWlsYXIgdG8gdGhlIGFscmVhZHkgc3VwcG9ydGVkIG10MjVxdTAyZy4KPj4KPj4gSW4gdjIs
IHRoZSAuc2l6ZSBhbmQgLm5vX3NmZHBfZmxhZyBmaWVsZHMgd2VyZSByZW1vdmVkLCB3aGljaCBp
cyBhbgo+PiBpbXByb3ZlbWVudCBvdmVyIG10MjVxdTAyZy4KPj4KPj4gT25seSBOT19DSElQX0VS
QVNFIHN0aWxsIG5lZWRzIHRvIGJlIHBhc3NlZCwgYnV0IHRoYXQgY2FuIGJlIHJlbW92ZWQKPj4g
bGF0ZXIgd2hlbiB0aGUKPj4gbXQyNXF1MDFnX3Bvc3Rfc2ZkcF9maXh1cCgpIGlzIGltcGxlbWVu
dGVkLgo+Pgo+PiBEb2VzIHRoaXMgc291bmQgcmVhc29uYWJsZT8KPgo+SSBoYXZlIGFsc28gdHJp
ZWQgYWRkaW5nIGEgbXQyNXF1MDFnX3Bvc3Rfc2ZkcF9maXh1cCgpLgo+Cj5UaGUgY2hhbmdlcyBi
ZWxvdyBzaG91bGQgYmUgc3BsaXQgaW50byAzIGRpZmZlcmVudCBwYXRjaGVzLCBidXQganVzdAo+
d2FudGVkIHRvIHNoYXJlIHRoZW0gd2l0aCB5b3UgZm9yIGZlZWRiYWNrLgoKVHdvIHBhdGNoZXMu
IG5vPyBvbmUgZm9yIHRoZSBubyBjaGlwIGVyYXNlIGZsYWcgYW5kIG9uZSBmb3IgYWRkaW5nIHRo
ZSBmbGFzaC4gCgpBbmQgSSdkIHByZWZlciB0aGlzIHZlcnNpb24uIAoKPmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj5p
bmRleCAxYzQ0M2ZlNTY4Y2YuLmY4NWVhNTc1MzRiYSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4rKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+QEAgLTI4
NTAsNyArMjg1MCw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5pdF9mbGFncyhzdHJ1Y3Qgc3Bp
X25vciAqbm9yKQo+ICAgICAgICAgICAgICAgICAgICAgICAgbm9yLT5mbGFncyB8PSBTTk9SX0Zf
SEFTX1NSX0JQM19CSVQ2Owo+ICAgICAgICB9Cj4KPi0gICAgICAgaWYgKGZsYWdzICYgTk9fQ0hJ
UF9FUkFTRSkKPisgICAgICAgaWYgKGZsYWdzICYgTk9fQ0hJUF9FUkFTRSB8fCBub3ItPnBhcmFt
cy0+bl9kaWNlID4gMSkKPiAgICAgICAgICAgICAgICBub3ItPmZsYWdzIHw9IFNOT1JfRl9OT19P
UF9DSElQX0VSQVNFOwo+Cj4gICAgICAgIGlmIChmbGFncyAmIFNQSV9OT1JfUldXICYmIG5vci0+
cGFyYW1zLT5uX2JhbmtzID4gMSAmJgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
bWljcm9uLXN0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj5pbmRleCA4OTIw
NTQ3YzEyYmYuLjIxZmVmNDM5ZDVmMSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
bWljcm9uLXN0LmMKPisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMKPkBAIC0x
OTIsNiArMTkyLDIwIEBAIHN0YXRpYyBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgbXQyNXF1NTEyYV9m
aXh1cHMgPSB7Cj4gICAgICAgIC5wb3N0X2JmcHQgPSBtdDI1cXU1MTJhX3Bvc3RfYmZwdF9maXh1
cCwKPiB9Owo+Cj4rc3RhdGljIGludCBtdDI1cXUwMWdfcG9zdF9zZmRwX2ZpeHVwKHN0cnVjdCBz
cGlfbm9yICpub3IpCj4rewo+KyAgICAgICBzdHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0ZXIg
KnBhcmFtcyA9IG5vci0+cGFyYW1zOwo+Kwo+KyAgICAgICAvKiBNVDI1UVUwMUcgZG9lcyBub3Qg
ZGVmaW5lIHRoZSBTQ0NSIGVudHJ5LCBzbyBwYXNzIG5fZGljZQo+bWFudWFsbHkuICAqLwo+KyAg
ICAgICBwYXJhbXMtPm5fZGljZSA9IDI7Cj4rCj4rICAgICAgIHJldHVybiAwOwo+K30KPisKPitz
dGF0aWMgc3RydWN0IHNwaV9ub3JfZml4dXBzIG10MjVxdTAxZ19maXh1cHMgPSB7Cj4rICAgICAg
IC5wb3N0X3NmZHAgPSBtdDI1cXUwMWdfcG9zdF9zZmRwX2ZpeHVwLAo+K307Cj4rCj4gc3RhdGlj
IGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHN0X25vcl9wYXJ0c1tdID0gewo+ICAgICAgICB7Cj4g
ICAgICAgICAgICAgICAgLm5hbWUgPSAibTI1cDA1LW5vbmplZGVjIiwKPkBAIC00MjksNiArNDQz
LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzdF9ub3JfcGFydHNbXSA9IHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBTUElfTk9SX0JQM19TUl9CSVQ2LAo+ICAgICAgICAg
ICAgICAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfUVVBRF9SRUFELAo+ICAg
ICAgICAgICAgICAgIC5tZnJfZmxhZ3MgPSBVU0VfRlNSLAo+KyAgICAgICB9LCB7Cj4rICAgICAg
ICAgICAgICAgLmlkID0gU05PUl9JRCgweDIwLCAweGJiLCAweDIxLCAweDEwLCAweDQ0LCAweDAw
KSwKPisgICAgICAgICAgICAgICAubmFtZSA9ICJtdDI1cXUwMWciLAo+KyAgICAgICAgICAgICAg
IC5tZnJfZmxhZ3MgPSBVU0VfRlNSLAoKb3V0IG9mIGN1cmlvc2l0eS4gZG9lcyBpdCBhbHNvIHdv
cmsgd2l0aG91dCBVU0VfRlNSPyBJJ20gbm90IGltcGx5aW5nIHRvIHJlbW92ZSBpdCwganVzdCB3
YW50IHRvIGdldCBhIGZlZWxpbmcgaWYgdGhpcyAKbmVlZGVkIGF0IGFsbC4gCgotbWljaGFlbAoK
PisgICAgICAgICAgICAgICAuZml4dXBzID0gJm10MjVxdTAxZ19maXh1cHMKPiAgICAgICAgfSwg
ewo+ICAgICAgICAgICAgICAgIC5pZCA9IFNOT1JfSUQoMHgyMCwgMHhiYiwgMHgyMSksCj4gICAg
ICAgICAgICAgICAgLm5hbWUgPSAibjI1cTAwYSIsCj4KPlBsZWFzZSBsZXQgbWUga25vdyB3aGF0
IGlzIHlvdXIgcHJlZmVyZW5jZS4KPgo+VGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
